# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect_library(MLIRSPMDAnalysis
  ReachingDefinitionAnalysis.cpp
  UniformityAnalysis.cpp
  
  ADDITIONAL_HEADER_DIRS
  ${MLIR_MAIN_INCLUDE_DIR}/spmd/Analysis

  LINK_LIBS PUBLIC
  MLIRPass
  MLIRAnalysis
  MLIRSPMDUtils
  MLIRAffineAnalysis  
)

