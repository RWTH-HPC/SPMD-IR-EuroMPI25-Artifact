#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
export VIRTUAL_ENV=/opt/venv
export PATH="$VIRTUAL_ENV/bin:$PATH"

# Activate non-free for CUDA headers
sed -i -e's/ main/ main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources && \

apt-get update \
&& apt-get -y -qq --no-install-recommends install \
        cmake \
        curl \
        binutils-dev \
        make \
        automake \
        autotools-dev \
        autoconf \
        libtool \
        zlib1g \
        zlib1g-dev \
        libatomic1 \
        libfabric-dev \
        libxml2-dev \
        python3 \
        python3-pip \
        python3-venv \
        gfortran \
        gcc \
        g++ \
        git \
        graphviz \
        libgtest-dev \
        ninja-build \
        vim \
        openssh-client \
        gdb \
        wget \
        googletest \
        nvidia-cuda-dev \
        nvidia-cuda-toolkit \
        libpnetcdf-dev \
&& apt-get -yq clean \
&& rm --recursive --force /var/lib/apt/lists/*

# Install OpenMPI
apt-get update \
&& apt-get -y -qq --no-install-recommends install \
openmpi-bin \
libopenmpi-dev \
&& apt-get -yq clean \
&& rm --recursive --force /var/lib/apt/lists/*

# Delete shmem headers from OpenMPI installation that could conflict with OpenSHMEM
rm /usr/lib/x86_64-linux-gnu/openmpi/include/shmem.h && \
rm /usr/lib/x86_64-linux-gnu/openmpi/include/pshmem.h && \
rm /usr/lib/x86_64-linux-gnu/openmpi/include/shmem.fh && \
rm /usr/lib/x86_64-linux-gnu/openmpi/include/shmemx.h && \
rm /usr/lib/x86_64-linux-gnu/openmpi/include/pshmemx.h && \
rm /usr/lib/x86_64-linux-gnu/openmpi/include/shmem-compat.h && \
rm /lib/x86_64-linux-gnu/liboshmem.so*

# Create venv and install Python dependencies
python3 -m venv $VIRTUAL_ENV
echo 'export PATH="$VIRTUAL_ENV/bin:$PATH"' >> $SINGULARITY_ENVIRONMENT
pip3 install --no-input --no-cache-dir --disable-pip-version-check -r /requirements.txt

mkdir -p /externals