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

# Run the tests and record the time taken for each
echo $PWD


echo "Proxy app tests..."
time ./run_proxyapps.sh

echo "Job completed at: $(date)"
