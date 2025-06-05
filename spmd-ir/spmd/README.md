<!--
SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University

SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
-->

# SPMD

## Directory Structure
- tried to resemble https://mlir.llvm.org/docs/Tutorials/CreatingADialect/ and structure of https://github.com/llvm/Polygeist


## How to Build - Monolithic Build
0. Load environment (`ml CUDA/12.4.0` additionally needed for NVIDIA GPU support).
```
ml purge
ml GCCcore/.11.3.0
ml Clang/15.0.5
ml CMake/3.24.3
ml Ninja/1.10.2
```

1. clone the project by (the "--recursive" is optional for the benchmarksuite submodules):
```
git clone --recursive git@git-ce.rwth-aachen.de:semih-burak/spmd.git
```

Also optional, use "git submodule update --remote" to update the benchmark suites to their newest state

Currently, we use https://github.com/burakSemih/llvm-project/tree/spmd-ir-paper-eurompi-2025 as llvm project (and the recursive submodule is not setup, please clone the repository manually).

2. To build LLVM, MLIR and SPMD run
```sh
mkdir build && cd build
cmake -G Ninja ../llvm-project/llvm \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
    -DLLVM_ENABLE_PROJECTS="mlir;clang;openmp;polly;lld" \
    -DLLVM_EXTERNAL_PROJECTS=spmd-dialect \
    -DLLVM_EXTERNAL_SPMD_DIALECT_SOURCE_DIR=/PATH/TO/THIS/SPMD-REPO \
    -DLLVM_ENABLE_DUMP=ON
cmake --build .
```


You can add `-DLLVM_FORCE_ENABLE_STATS=ON \` and  `-DLLVM_ENABLE_ASSERTIONS=ON \` if you want statistics and "assertion" support in LLVM or MLIR. The same result can also be achieved by switching the built type.

`lld` is used for linking in combinations with proxy apps that consist of multiple targets, if you don't want to use lld later on, e.g. only for micro-benchmarks, disable it.

`-DLLVM_ENABLE_DUMP=ON` is needed for release build only to cicumvent an issue in polly project.

For NVIDIA GPU support, replace `-DLLVM_TARGETS_TO_BUILD=host \` with `-DMLIR_ENABLE_CUDA_RUNNER=1 \`. Further, replace `CUDA_DRIVER_LIBRARY:XY` and `CUDA_RUNTIME_LIBRARY:ZY` with `CUDA_DRIVER_LIBRARY:FILEPATH=/usr/lib64/libcuda.so` and `CUDA_RUNTIME_LIBRARY:FILEPATH=/usr/lib64/libcuda.so` after the first cmake command and before `cmake --build .` if cmake could not find the correct shared object file and chose instead a stub file.

Consider using `-DLLVM_ENABLE_LIBEDIT=OFF \` to make building on backend of a cluster possible.

Currently, google-tests are not executed in the build process automatically. When whished to run tests, execute (within in build directory):
```sh
cd tools/spmd-dialect
ctest
```

To launch the tests in addition while building use instead the last command:
```sh
cmake --build . --target check-spmd
```
(This setup assumes that you build the project as part of a monolithic LLVM build via the `LLVM_EXTERNAL_PROJECTS` mechanism.)

## License
For open source projects, say how it is licensed.
