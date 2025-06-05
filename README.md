# SPMD-IR EuroMPI 2025 Artifact

This repository contains the **artifact** accompanying the paper:

> **"Extending the SPMD IR for RMA Models and Static Data Race Detection"**
> by *Semih Burak, Simon Schwitanski, Felix Tomski, Jens Domke, and Matthias Müller*
> Submitted at **EuroMPI 2025** ([https://eurompi.org/](https://eurompi.org/))


## Directory Structure

* **[spmd-ir](spmd-ir)**
  Contains all source code related to the SPMD IR project itself, implemented as an MLIR dialect and analysis/transformation passes.

* **[llvm-project](https://github.com/burakSemih/llvm-project/tree/spmd-ir-paper-eurompi-2025)**
  Contains the patched LLVM 20 project, required for the SPMD IR, included as a Git submodule.

* **[evaluation-benchmark-suites](evaluation-benchmark-suites/)**
  Contains the test programs used for evaluation:

  * Micro-benchmark suites: **[MBB](evaluation-benchmark-suites/MBB)**, **[RMARaceBench](evaluation-benchmark-suites/RRB)**
  * Proxy apps: **[Stencil](evaluation-benchmark-suites/proxyApps/PRK)** (MPI and SHMEM versions), **[MiniWeather](evaluation-benchmark-suites/proxyApps/miniWeather)**, and **[TeaLeaf](evaluation-benchmark-suites/proxyApps/TeaLeaf)**

* **[evaluation-results](evaluation-results/)**
  Contains output data and analysis results obtained from running the benchmarks within the Apptainer environment.

* **[reproducibility](reproducibility/)**
  Contains all files related to setting up and using the Apptainer-based experiment environment for reproducing our results.

## Evaluation Results
The evaluation results used to produce the figures and tables in the evaluation chapter (Chapter 5) are provided in the folder [evaluation-results](evaluation-results/).

### Classification Quality Results
The results to produce Table 2 of the paper are based on the result tables in the folder [evaluation-results/cqResults/summaries](evaluation-results/cqResults/summaries). The files contain the individual results of each tool on each test case and a summarized view.

The individual tool outputs (stdout logs, MLIR intermediate files) and used commands are available in [evaluation-results/cqResults/MBB](evaluation-results/cqResults/MBB) and [evaluation-results/cqResults/RRB](evaluation-results/cqResults/RRB) for the benchmarks MBB and RRB, respectively.

### Proxy App Assessment Results

The results for the proxy app analysis with the SPMD IR and PARCOACH are located in the folder [evaluation-results/proxyResults](evaluation-results/proxyAppResults). The folder contains the log files with the timing information used in Table 3 of the paper.

### Software Versions
The following tool versions were used to get the results:
- SPMD IR as delivered in this artifact (with patched LLVM 20)
- RMASanitizer 1.10.0
- MUST 1.11.0
- PARCOACH 2.4.2

The following software was used to run the evaluation infrastructure:
- Apptainer 1.4.2
- Python 3.12.3
- Container environment (see [reproducibility/apptainer](reproducibility/apptainer) for details)
  - Debian 12
  - MPI: MPICH 4.0.2 (as shipped with Debian 12)
  - OpenSHMEM: Sandia SHMEM 1.5.2

## Hardware
The evaluation was performed on a [CLAIX-2023 cluster node](https://hpc.rwth-aachen.de/claix23) consisting of the following configuration:

- 2 x Intel Xeon 8468 Sapphire Rapids (48 cores each), SMT disabled
- 256 GB main memory
- Rocky Linux 9


## Reproducing Results

### Preparing Environment
The evaluation workflow relies on Python scripts which require `pandas` and `numpy`. We recommend creating a virtual environment and installing the requirements as follows:

```bash
cd reproducibility
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Further, building the Apptainer containers requires the LLVM submodule to be checked out. To do so, run

```bash
git submodule update --init --recursive
```

### Build Apptainer Images
To build the Apptainer images (one image will be built for SPMD IR, RMASanitizer, MUST, PARCOACH), run the script `build_apptainer_images.sh`:

```bash
cd reproducibility
./build_apptainer_images.sh
```


### Running Classification Quality Benchmarks
The classification quality benchmarks can be run using the provided shell script [run_cq_tests.sh](reproducibility/run_cq_tests.sh):

```
cd reproducibility
./run_cq_tests.sh
```

The script creates a folder `cq-results-YYYYMMDD-HHMMSS` and runs all the tools on the RRB and MBB test cases. Finally, it parses the results using the script [parse_cq_results.sh](reproducibility/parse_cq_results.sh) and generates a summary table in `cq-results-YYYYMMDD-HHMMSS/summaries`.

The results should be identical to those provided in [evaluation-results/cqResults/summaries](evaluation-results/cqResults/summaries). Note that the results of `PARCOACH-dynamic` flaky (in terms of TP/TN/FP/FN) such that results might slightly differ from run to run.

The script [job_classification_quality.sh](reproducibility/job_classification_quality.sh) can be used as a starting point to run the tests in a Slurm-managed cluster.

### Running Proxy App Assessment
The proxy app assessment can be run using the provided shell script [run_proxyapps.sh](reproducibility/run_proxyapps.sh):

```
cd reproducibility
./run_proxyapps.sh
```

The results will be stored in a folder named `proxy-results-YYYYMMDD-HHMMSS`. Note that the reported performance will slightly differ, depending on the system the tests are run on.

The script [job_proxyapps.sh](reproducibility/job_proxyapps.sh) can be used as a starting point to run the tests in Slurm-managed cluster.
