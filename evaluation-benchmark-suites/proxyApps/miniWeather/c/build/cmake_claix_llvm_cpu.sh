#!/bin/bash

#ml PnetCDF/1.12.3 cmake CMake/3.29.3
# export SPMDIR_BUILD=""

export TEST_MPI_COMMAND="mpirun -n 1"

./cmake_clean.sh

OLCF_PARALLEL_NETCDF_ROOT="/cvmfs/software.hpc.rwth.de/Linux/RH8/x86_64/intel/sapphirerapids/software/PnetCDF/1.12.3-iimpi-2022b"

CLANGXX=${SPMDIR_BUILD}/bin/clang++
MPIINC=-I${SPMDIR_BUILD}/includesProgramModels/mpi/include

SPMDIR_FLAGS="-O1 -flto -fno-exceptions -g"
SPMDIR_LINKFLAGS="-fuse-ld=lld -Wl,--lto-emit-llvm -o miniWeather.bc"

SPMDVERIFY=${SPMDIR_BUILD}/bin/spmd-verify
SPMDFLAGS="check-dataRace emitSPMDIR time"

cmake -S ".." \
      -DCMAKE_CXX_COMPILER="${CLANGXX}"                                                  \
      -DCXXFLAGS="${SPMDIR_FLAGS} -I${OLCF_PARALLEL_NETCDF_ROOT}/include ${MPIINC}"   \
      -DLDFLAGS="${SPMDIR_LINKFLAGS}" #-L${OLCF_PARALLEL_NETCDF_ROOT}/lib -lpnetcdf" \

make mpi
${SPMDVERIFY} ${SPMDFLAGS} miniWeather.bc
