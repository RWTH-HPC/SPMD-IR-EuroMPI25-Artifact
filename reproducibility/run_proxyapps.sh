#!/usr/bin/env sh
set -e

RESULTS_DIR=$PWD/proxy-results-$(date +"%Y%m%d-%H%M%S")
APPTAINER_DIR=$PWD/apptainer
echo "Results will be stored in ${RESULTS_DIR}."

mkdir -p $RESULTS_DIR/SPMDIR
mkdir -p $RESULTS_DIR/PARCOACH

run_spmdir() {
    apptainer run --cleanenv $APPTAINER_DIR/spmdir.sif bash -c "$1"
}

run_parcoach() {
    apptainer run --cleanenv $APPTAINER_DIR/parcoach.sif bash -c "$1"
}

# Build the apptainer images if not already built
echo "Building Apptainer images if they do not exist..."
if [ ! -f "apptainer/spmdir.sif" ]; then
    echo "SPMD IR container file does not exist. Building..."
    (cd apptainer && apptainer build spmdir.sif Apptainer.spmdir.def)
fi
if [ ! -f "apptainer/parcoach.sif" ]; then
    echo "PARCOACH container file does not exist. Building..."
    (cd apptainer && apptainer build parcoach.sif Apptainer.parcoach.def)
fi

# SPMDIR Stencil
for model in MPIRMA SHMEM; do
    run_spmdir "cd ../evaluation-benchmark-suites/proxyApps/PRK/${model}/Stencil && make clean && time-wrapper make stencil" 2>&1 | tee $RESULTS_DIR/SPMDIR/Stencil_${model}.log
done

# PARCOACH MPI RMA Stencil
run_parcoach "cd ../evaluation-benchmark-suites/proxyApps/PRK/MPIRMA/Stencil && make clean && time-wrapper make stencil MPICC=mpicc CLINKER=llvm-link LINKFLAGS= LIBS= SPMDVERIFY='@time-wrapper parcoach' SPMDFLAGS='--check=rma'" 2>&1 | tee $RESULTS_DIR/PARCOACH/Stencil_MPIRMA.log

# miniweather
run_spmdir "cd ../evaluation-benchmark-suites/proxyApps/miniWeather/c/build && time-wrapper sh cmake_claix_llvm_cpu.sh" 2>&1 | tee $RESULTS_DIR/SPMDIR/miniWeather.log

# TeaLeaf
run_spmdir "cd ../evaluation-benchmark-suites/proxyApps/TeaLeaf && time-wrapper sh build.sh" 2>&1 | tee $RESULTS_DIR/SPMDIR/TeaLeaf.log




