#!/usr/bin/env bash

# module load cmake
TIME=$(date +%Y-%m-%d_%H-%M-%S)
APPNAME=tealeaf-serial
CLANGXX=${SPMDIR_BUILD}/bin/clang++
MPIINC=-I${SPMDIR_BUILD}/includesProgramModels/mpi/include

SPMDIR_COMPILEFLAGS="-O1 -flto -fno-exceptions -g"
SPMDIR_LINKFLAGS="-fuse-ld=lld -Wl,--lto-emit-llvm"

SPMDVERIFY=${SPMDIR_BUILD}/bin/spmd-verify
SPMDFLAGS="check-dataRace emitSPMDIR time disableMV"

CXX_EXTRA_FLAGS=${SPMDIR_COMPILEFLAGS}
# configure the build, build type defaults to Release
# The -DMODEL flag is required
cmake -Bbuild -H. -DMODEL=serial -DENABLE_MPI=ON \
    -DCMAKE_CXX_COMPILER="${CLANGXX}" \
    -DCXX_EXTRA_FLAGS="${SPMDIR_COMPILEFLAGS} ${MPIINC}" \
    -DCXX_EXTRA_LINK_FLAGS="${SPMDIR_COMPILEFLAGS} ${SPMDIR_LINKFLAGS}" \
    -DALTERNATIVE_BIN_NAME="${APPNAME}.bc" #\
    # -DMPI_HOME="${SPMDIR_BUILD}/includesProgramModels/mpi/"

cmake --build build
cd build
echo "------------------------------------------------------------------------"
echo "Running SPMD verification on ${APPNAME}.bc with flags: ${SPMDFLAGS}"
set -e
${SPMDVERIFY} ${SPMDFLAGS} ${APPNAME}.bc
set +e
cd ..

    # -DCXXFLAGS="${SPMDIR_COMPILEFLAGS}  ${MPIINC}" \
    # -DLDFLAGS="${SPMDIR_LINKFLAGS}" #<model specific flags prefixed with -D...>