# Part of RMARaceBench, under BSD-3-Clause License
# See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
# SPDX-License-Identifier: BSD-3-Clause

from enum import Enum
import subprocess
import signal
from abc import ABC, abstractmethod
import json
import multiprocessing as mp
import os
import pandas
import pathlib
from datetime import datetime
from glob import glob
import argparse
import shutil
import re

tools = ['RMASanitizer', 'RMASanitizer-NoOpt', 'MUST-TSan', 'MUST-RMA', 'PARCOACH-dynamic', 'PARCOACH-static', 'SPMDIR']
rmamodels = ['MPIRMA', 'SHMEM', 'NVSHMEM-gpuInitiated', 'NVSHMEM-hostInitiated', 'NVSHMEM-hybridInitiated', 'MIXED']
rbbdisciplines = ['conflict','sync','atomic','hybrid','dynamic','static','rma+nonrma']
mbbdisciplines = ['RMA','COLL','P2P']

apptainer_dir = "apptainer"

tool_capabilties = {
    "PARCOACH-dynamic" : ['MPIRMA'],
    "PARCOACH-static" : ['MPIRMA'],
    "MUST-RMA" : ['MPIRMA'],
    "MUST-TSan": ['MPIRMA'],
    "RMASanitizer" : ['MPIRMA', 'SHMEM', 'GASPI', 'MIXED'],
    "RMASanitizer-NoOpt" : ['MPIRMA', 'SHMEM', 'GASPI', 'MIXED'],
    "SPMDIR" : ['MPIRMA', 'SHMEM', 'MIXED', 'NVSHMEM-gpuInitiated', 'NVSHMEM-hostInitiated', 'NVSHMEM-hybridInitiated']
}

parser = argparse.ArgumentParser(prog="Test Runner",
                                 description="Runs the different data race tests and collects the results.")

parser.add_argument('--tools', dest='tools', default='SPMDIR', help='Select tools that should be tested (comma-separated choice of RMASanitizer, RMASanitizer-NoOpt, MUST-RMA, PARCOACH-dynamic, PARCOACH-static, SPMDIR, default: SPMDIR)', type=lambda s: s.split(','), required=True)
parser.add_argument('-j', '--jobs', dest='jobs', default=1, help='Number of parallel test jobs to run (default: 1)', type=int)
parser.add_argument('-o', '--output-folder', dest='output_folder', default='results-' + datetime.now().strftime("%Y%m%d-%H%M%S"), help='Set output folder, default is results-Ymd-HMS')
parser.add_argument('testspath', help='Path to the test cases root folder.')

# Different parsers for MBB and RRB
subparsers = parser.add_subparsers(dest='benchmark', required=True)

mbb_parser = subparsers.add_parser('MBB', help='MPI Bug Bench tests (see subcommand --help for further information)')
mbb_parser.add_argument('--disciplines', dest='disciplines', default=','.join(mbbdisciplines), help='Select discipline(s) of MBB that should be tested (comma-separated choice of RMA, P2P, COLL, default: all disciplines)', type=lambda s: s.split(','))
mbb_parser.add_argument('--level', dest='level', default=2, help='Select MBB level that should be tested (1-5), default: 2', type=int)
rrb_parser = subparsers.add_parser('RRB', help='RMARaceBench tests (see subcommand --help for further information)')
rrb_parser.add_argument('--disciplines', dest='disciplines', default=','.join(rbbdisciplines), help='Select discipline(s) of RBB that should be tested (comma-separated choice of conflict, sync, atomic, hybrid, misc, default: all disciplines)', type=lambda s: s.split(','))
rrb_parser.add_argument('--rma-model', dest='rma_models', default='MPIRMA', help='Select RMA model(s) that should be tested (comma-separated, , choice of MPIRMA, SHMEM, GASPI, NVSHMEM-gpuInitiated, NVSHMEM-hostInitiated, NVSHMEM-hybridInitiated, default: all models)', type=lambda s: s.split(','))
rrb_parser.add_argument('--local-only', dest='local_only', action='store_true', help='Run only local buffer race tests')


class Result(str, Enum):
    TP = 'TP',
    FP = 'FP',
    TN = 'TN',
    FN = 'FN',
    TO = 'TO',
    CR = 'CR',
    NOSUPPORT = '-'

    def __str__(self) -> str:
        return self.value
    
class RunResult(str, Enum):
    SUCCESS = 'SUCCESS'
    TIMEOUT = 'TIMEOUT',
    CRASH = 'CRASH'

    def __str__(self) -> str:
        return self.value


class Test:
    def __init__(self, filename):
        self.filename = filename
        self.basename = os.path.basename(filename)
        with open(self.filename, 'r') as f:
            # read out JSON from test case
            source = f.read()
            # RMARaceBench test case
            if 'RMARaceBench' in source:
                # search number of processes
                m = re.search(r'#define PROC_NUM (\d+)', source)
                if m is None:
                    raise Exception("Could not find number of processes in " + filename)
                self.nprocs = m.group(1)

                self.has_race = False if "no.c" in self.filename else True
                self.race_loc1 = -1
                self.race_loc2 = -1
                if self.has_race: # find race locations
                    for line_no, line in enumerate(source.splitlines(), 1):
                        if "// CONFLICT-SAME-LINE" in line:
                            self.race_loc1 = self.race_loc2 = line_no + 1 # conflict is in next line
                        elif "// CONFLICT" in line:
                            if self.race_loc1 == -1:
                                self.race_loc1 = line_no + 1 # conflict is in next line
                            elif self.race_loc2 == -1:
                                self.race_loc2 = line_no + 1 # conflict is in next line
                            else:
                                Exception("ERROR: Found more race conflicts than expected in " + filename)

            # MBB test case
            elif 'MPI Bug Bench' in source:
                self.has_race = False if "Correct" in self.filename else True
                # search number of processes
                m = re.search(r'mpirun -np (\d+)', source)
                if m is None:
                    raise Exception("Could not find number of processes in " + filename)
                self.nprocs = m.group(1)
                # check for MBI error markers
                self.race_loc1 = -1
                self.race_loc2 = -1
                if self.has_race: # find race locations
                    for line_no, line in enumerate(source.splitlines(), 1):
                        if "/*MBBERROR_BEGIN*/" in line:
                            if self.race_loc1 == -1:
                                self.race_loc1 = line_no
                            elif self.race_loc2 == -1:
                                self.race_loc2 = line_no
                            else:
                                Exception("ERROR: Found more race conflicts than expected in " + filename)
            else:
                raise Exception("Unknown test case: ", filename)
            

            if self.has_race and (self.race_loc1 == -1 or self.race_loc2 == -1):
                raise Exception(f"Could not locate races for test case {filename}, race_loc1 = {self.race_loc1}, race_loc2 = {self.race_loc2}")



class RunTest(ABC):
    def __init__(self, test: Test, out_folder: str, command_launcher: str = ''):
        self.test = test
        self.out_folder = out_folder
        pathlib.Path(self.out_folder).mkdir(parents=True, exist_ok=True)
        # copy source file to output folder
        self.source_file = os.path.join(self.out_folder, self.test.basename)
        shutil.copy(self.test.filename, self.source_file)
        # helpful to prepend any command with container launchers (e.g., apptainer)
        self.command_launcher = command_launcher
        self.cmd_out = open(os.path.join(self.out_folder, self.test.basename+'.cmd'), 'w')
        self.stdout  = open(os.path.join(self.out_folder, self.test.basename+'.stdout'), 'w')
        

    def __del__(self):
        self.cmd_out.close()
        self.stdout.close()

    @abstractmethod
    def run(self):
        pass

    def write_stdout(self, stdout: str):
        self.stdout.write(self.output)
        self.stdout.flush()

    def run_command(self, command: str, timeout = 120, envmod = {}, cwd=None):
        result = RunResult.SUCCESS
        command = (self.command_launcher + ' ' + command).strip()
        self.cmd_out.write(command + '\n')
        self.cmd_out.flush()
        env = os.environ.copy()
        for var in envmod:
            env[var] = envmod[var]
        # Create process in own process group to allow killing all child processes
        p = subprocess.Popen(command.split(), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env, cwd=cwd, preexec_fn=os.setsid)
        out = ''
        try:
            p.wait(timeout=timeout)
            out, _ = p.communicate()
        except subprocess.TimeoutExpired:
            result = RunResult.TIMEOUT
            # Kill process group to ensure all child processes are terminated
            # This is necessary because some tools (e.g., MUST) spawn child processes that do not terminate on their own.
            os.killpg(p.pid, signal.SIGTERM)
            try:
                out, _ = p.communicate(timeout=5)  # Try to get output before killing the process
            except subprocess.TimeoutExpired:
                os.killpg(p.pid, signal.SIGKILL)  # Forcefully kill the process if it does not terminate
                out, _ = p.communicate()  # Final try to get output after killing

            return (out.decode(), result)

        if p.returncode != 0:
            # print(f"Command returncode was {p.returncode}: ", end='')
            # print(command)
            result = RunResult.CRASH

        try:
            return (out.decode(), result)
        except UnicodeDecodeError as e:
            return ('decoding error', result)

    def parse(self, race_string, race1_test='', race2_test=''):
        if self.runresult == RunResult.TIMEOUT:
            return Result.TO
        if self.test.has_race:
            if race_string in self.output:
                if race1_test not in self.output:
                    print("Could not find " + race1_test)
                    return Result.FN
                if race2_test not in self.output:
                    print("Could not find " + race2_test)
                    return Result.FN
                return Result.TP
            else:
                return Result.FN
        else:
            if not race_string in self.output:
                return Result.TN
            else:
                return Result.FP


class RunTestFactory:
    @classmethod
    def createTest(self, test: Test, prefix: str, tool: str, category: str):
        if tool == 'MPIRMA':
            return RunMPITest(test, os.path.join(prefix, tool, category))
        elif tool == 'SHMEM':
            return RunSHMEMTest(test, os.path.join(prefix, tool, category))
        elif tool == 'GASPI':
            return RunGASPITest(test, os.path.join(prefix, tool, category))
        elif tool == 'MUST-RMA':
            return RunMUSTTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/mustrma.sif")
        elif tool == 'MUST-TSan':
            return RunMUSTTSanTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/must.sif")
        elif tool == 'RMASanitizer':
            return RunRMASanitizerTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/rmasanitizer.sif")
        elif tool == 'RMASanitizer-NoOpt':
            return RunRMASanitizerNoOptTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/rmasanitizer.sif")
        elif tool == 'PARCOACH-static':
            return RunParcoachStaticTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/parcoach.sif")
        elif tool == 'PARCOACH-dynamic':
            return RunParcoachDynamicTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/parcoach.sif")
        elif tool == 'SPMDIR':
            return RunSPMDIRTest(test, os.path.join(prefix, tool, category), f"apptainer run --cleanenv --bind /work/rwth1282 {apptainer_dir}/spmdir.sif")
        else:
            raise Exception("Unknown test tool: ", tool)


class RunMPITest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe'
        command = f"mpicc -fopenmp {self.source_file} -o {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Compilation failed")
            return

        command = f"mpirun -np {self.test.nprocs} {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Run failed")
            return

    def parse(self):
        return self.runresult


class RunSHMEMTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe'
        command = f"oshcc -fopenmp {self.source_file} -o {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Compilation failed")
            return

        command = f"mpirun -np {self.test.nprocs} {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Run failed")
            return

    def parse(self):
        return self.runresult

class RunGASPITest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe'
        command = f"mpicc -fopenmp -I/home/ss540294/software/gpi/include /usr/lib64/libGPI2.so -Wl,-rpath=/usr/lib64 {self.source_file} -o {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Compilation failed")
            return


        command = f"mpirun -np {self.test.nprocs} {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

        if self.runresult != RunResult.SUCCESS:
            print("Run failed")
            return

    def parse(self):
        return self.runresult

class RunMUSTTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe-must'
        command = f"/opt/must/bin/must-cc -fopenmp -g -ldl {self.source_file} -o {binary_out}"
        self.run_command(command)
        # Create unique tmp dir per test (which is cleaned afterwards)
        tmp_dir, _ = self.run_command("mktemp -d")
        command = f"/opt/must/bin/mustrun -np {self.test.nprocs} --must:temp {tmp_dir} --must:clean --must:output stdout --must:distributed --must:nodl --must:tsan --must:rma {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

    def parse(self):
        if self.test.has_race:
            return super().parse('data race', f'{self.test.basename}:{self.test.race_loc1}', f'{self.test.basename}:{self.test.race_loc2}')
        else:
            return super().parse('data race')
        

class RunRMASanitizerTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe-must'
        command = f"/opt/rmasanitizer/bin/must-cc -g --optimizations ALX1000,CLUSTER -fopenmp -lsma {self.source_file} -o {binary_out}"
        self.run_command(command)
        # Create unique tmp dir per test (which is cleaned afterwards)
        tmp_dir, _ = self.run_command("mktemp -d")
        command = f"/opt/rmasanitizer/bin/mustrun -np {self.test.nprocs} --must:temp {tmp_dir} --must:clean --must:output stdout --must:distributed --must:nodl --must:tsan --must:rma {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

    def parse(self):
        if self.test.has_race:
            return super().parse('Local buffer data race', f'{self.test.basename}:{self.test.race_loc1}', f'{self.test.basename}:{self.test.race_loc2}')
        else:
            return super().parse('Local buffer data race')


class RunRMASanitizerNoOptTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe-must'
        command = f"/opt/rmasanitizer/bin/must-cc -g -fopenmp -lsma {self.source_file} -o {binary_out}"
        self.run_command(command)
        # Create unique tmp dir per test (which is cleaned afterwards)
        tmp_dir, _ = self.run_command("mktemp -d")
        command = f"/opt/rmasanitizer/bin/mustrun -np {self.test.nprocs} --must:temp {tmp_dir} --must:clean --must:output stdout --must:distributed --must:nodl --must:tsan --must:rma {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

    def parse(self):
        if self.test.has_race:
            return super().parse('Local buffer data race', f'{self.test.basename}:{self.test.race_loc1}', f'{self.test.basename}:{self.test.race_loc2}')
        else:
            return super().parse('Local buffer data race')

class RunMUSTTSanTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}.exe-must'
        command = f"mpicc -fsanitize=thread -g -fopenmp {self.source_file} -o {binary_out}"
        self.output, _ = self.run_command(command)
        self.write_stdout(self.output)
        # Create unique tmp dir per test (which is cleaned afterwards)
        tmp_dir, _ = self.run_command("mktemp -d")
        command = f"/opt/must/bin/mustrun -np {self.test.nprocs} --must:temp {tmp_dir} --must:clean --must:output stdout --must:distributed --must:nodl --must:tsan {binary_out}"
        self.output, self.runresult = self.run_command(command)
        self.write_stdout(self.output)

    def parse(self):
        if self.test.has_race:
            return super().parse('data race', f'{self.test.basename}:{self.test.race_loc1}', f'{self.test.basename}:{self.test.race_loc2}')
        else:
            return super().parse('data race')


class RunParcoachStaticTest(RunTest):
    def run(self):
        # Static analysis only can detect local buffer races
        if 'remote' in self.test.basename:
            return
        
        binary_out = f'{self.source_file}'
        self.run_command(f"mpicc -fopenmp -O0 -g -S -emit-llvm {self.source_file} -o {binary_out}.ll")
        self.output, self.runresult = self.run_command(f"parcoach -S --check=rma {binary_out}.ll -o {binary_out}-instrumented.ll")
        self.write_stdout(self.output)

    def parse(self):
        if 'remote' in self.test.basename:
            return Result.NOSUPPORT

        if self.test.has_race:
            return super().parse('LocalConcurrency detected', f'LINE {self.test.race_loc1}', f'LINE {self.test.race_loc2}')
        else:
            return super().parse('LocalConcurrency detected')
            


class RunParcoachDynamicTest(RunTest):
    def run(self):
        binary_out = f'{self.source_file}'
        self.run_command(f"mpicc -fopenmp -O0 -g -S -emit-llvm {self.source_file} -o {binary_out}.ll")
        self.run_command(f"parcoach -S --check=rma {binary_out}.ll -o {binary_out}-instrumented.ll")
        self.run_command(f"mpicc -fopenmp -O0 -g {binary_out}-instrumented.ll -o {binary_out}-instrumented.exe -Wl,-rpath=/opt/parcoach/lib /opt/parcoach/lib/libParcoachCollDynamic_MPI_C.so /opt/parcoach/lib/libParcoachRMADynamic_MPI_C.so")

        command = f"mpirun -np {self.test.nprocs} {binary_out}-instrumented.exe"
        self.output = "timeout"
        for i in range(10): # need multiple retries since PARCOACH-dynamic sometimes just hangs
            ret, self.runresult = self.run_command(command, timeout=5)
            if self.runresult != RunResult.TIMEOUT:
                self.output = ret
                self.write_stdout(self.output)
                break
            else:
                print("PARCOACH TIMEOUT, retry")
        

    def parse(self):
        if self.test.has_race:
            return super().parse('Error when inserting memory access', f'{os.path.basename(self.test.basename)}:{self.test.race_loc1}', f'{os.path.basename(self.test.basename)}:{self.test.race_loc2}')
        else:
            return super().parse('Error when inserting memory access')
        


class RunSPMDIRTest(RunTest):
    def run(self):
        # Static analysis only can detect local buffer races
        if 'remote' in self.test.basename:
            return RunResult.SUCCESS
        
        self.output, self.runresult = self.run_command(f"spmd-verify check-dataRace emitSPMDIR {self.source_file}", envmod={'APPTAINERENV_SPMD_IR_EXITCODE': '0'}) #cwd=os.path.dirname(self.source_file))
        if self.runresult != RunResult.SUCCESS:
            print("Failed with the following output:")
            print(self.output)
        self.write_stdout(self.output)

        return self.runresult

    def parse(self):
        if 'remote' in self.test.basename:
            return Result.NOSUPPORT

        if self.test.has_race:
            return super().parse('(Data Race)', f'{self.test.basename}:{self.test.race_loc1}', f'{self.test.basename}:{self.test.race_loc2}')
        else:
            return super().parse('(Data Race)')
        


def run_tool_test(test: Test, prefix: str, tool: str, category: str | None = None):
    if category is None:
        category = 'none'
    mt = RunTestFactory.createTest(test, prefix, tool, category)
    if mt.run() != RunResult.CRASH:
        print(f'{test.basename:60}' + mt.parse())
        return test.basename, mt.parse()
    else:
        print(f'{test.basename:60}CRASH')
        return test.basename, Result.CR



def results_append(results_dict, results, name, discipline):
    for testname, result in results:
        if testname not in results_dict.keys():
            results_dict[testname] = {}
        results_dict[testname]['discipline'] = discipline
        results_dict[testname][name] = result


if __name__ == '__main__':
    args = parser.parse_args()

    for tool in args.tools:
        if tool not in tools:
            raise Exception(f"Tool {tool} not supported, please select one or more of {tools}")
    
    if args.benchmark == 'MBB':
        for discipline in args.disciplines:
            if discipline not in mbbdisciplines:
                raise Exception(f"Discipline {discipline} not supported, please select one or more of {mbbdisciplines}")
    elif args.benchmark == 'RRB':
        for discipline in args.disciplines:
            if discipline not in rbbdisciplines:
                raise Exception(f"Discipline {discipline} not supported, please select one or more of {rbbdisciplines}")
        # Sanity check capabilities of tools
        abort = False
        for tool in args.tools:
            for rma_model in args.rma_models:
                if rma_model not in tool_capabilties[tool]:
                    print(f"Tool {tool} does not support RMA model {rma_model}, tests cannot be executed")
                    abort = True
        # At least one tool does not support at least one RMA model
        if abort:
            exit(1)
    else:
        raise Exception(f"Benchmark {args.benchmark} not supported, please select MBB or RRB")
        

    csvfile = open('results.csv', 'w', newline='')

    pool = mp.Pool(processes=args.jobs)
    results_dict = {}

    # Tool runs
    if not os.path.exists(args.output_folder):
        os.mkdir(args.output_folder)
    else:
        print(f"Output folder {args.output_folder} already exists, please delete it first.")
        exit(1)

    if 'MBB' in args.benchmark:
        glob_string = ''
        tests_map = {}
        for discipline in args.disciplines:
            tests = [Test(f) for f in sorted(glob(f'{args.testspath}/MBB/level{args.level}/{discipline}/*.c'))]
            tests_map[discipline] = tests
        for tool in args.tools:
            print(f"=== {tool} ===")
            for discipline, tests in tests_map.items():
                print(f"=== {discipline}  ===")
                results = pool.starmap(run_tool_test, [(t, args.output_folder, tool, discipline) for t in tests])
                results_append(results_dict, results, tool, discipline)
    elif args.benchmark == 'RRB':
        # Parse tests first for sanity check
        tests_map = {}
        for rmamodel in args.rma_models:
            for discipline in args.disciplines:
                if "NVSHMEM" in rmamodel:
                    # hack to convert "NVSHMEM-gpuInitiated" to "NVSHMEM/gpuInitiated"
                    rmamodel = rmamodel.replace("-", '/')
                testfiles = [test for ext in ['c', 'cu', 'cpp'] for test in glob(f"{args.testspath}/RRB/{rmamodel}/{discipline}/*.{ext}") ]
                testfiles.sort()
                tests_map[rmamodel, discipline] = [Test(f) for f in testfiles]

        # Run tools
        for tool in args.tools:
            print(f"=== {tool} ===")
            for (rmamodel, discipline), tests in tests_map.items():
                print(f"=== {rmamodel} - {discipline}  ===")
                # Skip remote race tests if local_only is set
                if args.local_only:
                    tests = [t for t in tests if 'local' in t.filename]
                results = pool.starmap(run_tool_test, [(t, args.output_folder, tool, discipline) for t in tests])
                results_append(results_dict, results, tool, discipline)
    else:
        parser.print_help()
        exit(1)

    pool.close()

    df = pandas.DataFrame.from_dict(results_dict, orient='index')
    df.to_csv(os.path.join(args.output_folder, 'results.csv'))