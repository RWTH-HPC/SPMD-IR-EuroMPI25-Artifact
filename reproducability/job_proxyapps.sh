#!/usr/bin/zsh 
#SBATCH --job-name=spmdir-proxy
#SBATCH --output=spmdir_proxy_%j.log
#SBATCH --error=spmdir_proxy_%j.err 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=96
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --exclusive
#SBATCH --partition=c23ms

echo "Starting job at: $(date)"
echo "Hostname: $(hostname)"

ml Python/3.10.4

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

# Run the tests and record the time taken for each
echo $PWD


echo "Proxy app tests..."
time ./run_proxyapps.sh

echo "Job completed at: $(date)"
