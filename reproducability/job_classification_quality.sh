#!/usr/bin/zsh 
#SBATCH --job-name=spmdir-cq
#SBATCH --output=spmdir_cq_%j.log
#SBATCH --error=spmdir_cq_%j.err 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=96
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --partition=c23ms

# Disable core dumps
ulimit -c 0

echo "Starting job at: $(date)"
echo "Hostname: $(hostname)"

ml Python

# Build the apptainer images if not already built
echo "Building Apptainer images if they do not exist..."
if [ ! -f "util/apptainer/spmdir.sif" ]; then
    echo "SPMD IR container file does not exist. Building..."
    (cd util/apptainer && apptainer build spmdir.sif Apptainer.spmdir.def)
fi
if [ ! -f "util/apptainer/parcoach.sif" ]; then
    echo "PARCOACH container file does not exist. Building..."
    (cd util/apptainer && apptainer build parcoach.sif Apptainer.parcoach.def)
fi
if [ ! -f "util/apptainer/rmasanitizer.sif" ]; then
    echo "RMASanitizer container file does not exist. Building..."
    (cd util/apptainer && apptainer build rmasanitizer.sif Apptainer.rmasanitizer.def)
fi
if [ ! -f "util/apptainer/must.sif" ]; then
    echo "MUST container file does not exist. Building..."
    (cd util/apptainer && apptainer build must.sif Apptainer.must.def)
fi

# time ./build_apptainer_images.sh

# Run the tests and record the time taken for each
echo $PWD


echo "Running classification quality tests..."
time ./run_tests.sh

echo "Parsing results..."
time ./parse_results.sh

echo "Job completed at: $(date)"
