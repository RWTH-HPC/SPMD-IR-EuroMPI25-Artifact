# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect_library(MLIRSPMDUtils
  AliasUtils.cpp
  TransformUtils.cpp

  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/spmd/Utils

  LINK_LIBS PUBLIC
  MLIRAnalysis
  MLIRDialect  
  MLIRGPUDialect
  MLIRIR  
  MLIRSPMD
  )
