# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect_library(MLIRSPMD
        SPMDTypes.cpp
        SPMDDialect.cpp
        SPMDOps.cpp
        SPMDAttributes.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/spmd

        DEPENDS
        MLIRSPMDOpsIncGen
        MLIRSPMDAttributesIncGen
        MLIRSPMDTypesIncGen
        MLIRSPMDPassesIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        MLIRInferTypeOpInterface
        MLIRFuncDialect
        )
add_subdirectory(passes)
add_subdirectory(Analysis)
add_subdirectory(Utils)
