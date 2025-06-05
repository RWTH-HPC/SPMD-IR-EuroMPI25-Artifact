#!/usr/bin/env sh
set -e

RESULTS_DIR=$PWD/cq-results-$(date +"%Y%m%d-%H%M%S")
echo "Results will be stored in ${RESULTS_DIR}."

BENCH_DIR=../evaluation-benchmark-suites

mkdir -p ${RESULTS_DIR}/RRB

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
if [ ! -f "apptainer/rmasanitizer.sif" ]; then
    echo "RMASanitizer container file does not exist. Building..."
    (cd apptainer && apptainer build rmasanitizer.sif Apptainer.rmasanitizer.def)
fi
if [ ! -f "apptainer/must.sif" ]; then
    echo "MUST container file does not exist. Building..."
    (cd apptainer && apptainer build must.sif Apptainer.must.def)
fi

# RRB

## MPI RMA
python util/run_test.py --tools SPMDIR,PARCOACH-static,PARCOACH-dynamic,RMASanitizer-NoOpt -o ${RESULTS_DIR}/RRB/MPIRMA -j 16 ${BENCH_DIR} RRB --rma-model MPIRMA --disciplines conflict,sync,static,dynamic,rma+nonrma

## SHMEM
python util/run_test.py --tools SPMDIR,RMASanitizer-NoOpt -o ${RESULTS_DIR}/RRB/SHMEM -j 16 ${BENCH_DIR} RRB --rma-model SHMEM --disciplines conflict,sync,static,dynamic,rma+nonrma

# NVSHMEM
for model in NVSHMEM-hostInitiated NVSHMEM-gpuInitiated NVSHMEM-hybridInitiated; do
    python util/run_test.py --tools SPMDIR -o ${RESULTS_DIR}/RRB/$model -j 16 ${BENCH_DIR} RRB --rma-model $model --disciplines conflict,sync,static,dynamic,rma+nonrma
done

# MIXED
python util/run_test.py --tools SPMDIR,RMASanitizer-NoOpt -o ${RESULTS_DIR}/RRB/MIXED -j 16 ${BENCH_DIR} RRB --rma-model MIXED --disciplines sync

## MBB
python util/run_test.py --tools SPMDIR,PARCOACH-static,PARCOACH-dynamic,RMASanitizer-NoOpt,MUST-TSan  -o ${RESULTS_DIR}/MBB -j 16 ${BENCH_DIR} MBB --disciplines RMA,P2P,COLL --level 32

sh parse_cq_results.sh ${RESULTS_DIR}