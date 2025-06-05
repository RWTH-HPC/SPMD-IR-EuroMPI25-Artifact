#!/usr/bin/env bash
set -e

# Install OpenSHMEM
wget https://github.com/Sandia-OpenSHMEM/SOS/archive/refs/tags/v1.5.2.tar.gz -O SOS-1.5.2.tar.gz && \
        tar -xf SOS-1.5.2.tar.gz && \
        cd SOS-1.5.2 && \
        ./autogen.sh && \
        CC=mpicc CXX=mpicxx ./configure --prefix=/usr --with-ofi=/usr --enable-pmi-mpi --disable-cxx --disable-fortran --enable-error-checking --enable-profiling=yes && \
        make -j$(nproc) install