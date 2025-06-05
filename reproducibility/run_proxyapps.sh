#!/usr/bin/env sh
set -e

RESULTS_DIR=$PWD/proxy-results-$(date +"%Y%m%d-%H%M%S")
APPTAINER_DIR=$PWD/util/apptainer
echo "Results will be stored in ${RESULTS_DIR}."

mkdir -p $RESULTS_DIR/SPMDIR
mkdir -p $RESULTS_DIR/PARCOACH

run_spmdir() {
    apptainer run --cleanenv $APPTAINER_DIR/spmdir.sif bash -c "$1"
}

run_parcoach() {
    apptainer run --cleanenv $APPTAINER_DIR/parcoach.sif bash -c "$1"
}

# Check if SPMDIR container exists
if [ ! -f "$APPTAINER_DIR/spmdir.sif" ]; then
    echo "PARCOACH container file does not exist. Please run build_apptainer_images.sh first."
    exit 1
fi

# Check if PARCOACH container exists
if [ ! -f "$APPTAINER_DIR/parcoach.sif" ]; then
    echo "SPMD IR container file does not exist. Please run build_apptainer_images.sh first."
    exit 1
fi

# SPMDIR Stencil
for model in MPIRMA SHMEM; do
    run_spmdir "cd proxyApps/PRK/${model}/Stencil && make clean && make stencil" 2>&1 | tee $RESULTS_DIR/SPMDIR/Stencil_${model}.log
done

# PARCOACH MPI RMA Stencil
run_parcoach "cd proxyApps/PRK/MPIRMA/Stencil && make clean && make stencil MPICC=mpicc CLINKER=llvm-link LINKFLAGS= LIBS= SPMDVERIFY=parcoach SPMDFLAGS='--check=rma'" 2>&1 | tee $RESULTS_DIR/PARCOACH/Stencil_MPIRMA.log

# miniweather
run_spmdir "cd proxyApps/miniWeather/c/build && sh cmake_claix_llvm_cpu.sh" 2>&1 | tee $RESULTS_DIR/SPMDIR/miniWeather.log

# TeaLeaf
run_spmdir "cd proxyApps/TeaLeaf && sh build.sh" 2>&1 | tee $RESULTS_DIR/SPMDIR/TeaLeaf.log




