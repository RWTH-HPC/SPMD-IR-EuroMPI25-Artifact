# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect_library(MLIRSPMDCACTS
        mpiTransformations.cpp
        shmemTransformations.cpp
        nvshmemTransformations.cpp
        ncclTransformations.cpp
        cudaTransformations.cpp
        utils.cpp
        )
