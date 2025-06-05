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
#SBATCH --account=supp0001

# Disable core dumps
ulimit -c 0

echo "Starting job at: $(date)"
echo "Hostname: $(hostname)"

# Run the tests and record the time taken for each
echo $PWD

echo "Running classification quality tests..."
time ./run_cq_tests.sh

echo "Job completed at: $(date)"
