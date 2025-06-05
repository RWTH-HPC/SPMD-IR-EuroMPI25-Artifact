# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect(SPMDOps spmd)
add_mlir_doc(SPMDDialect SPMDDialect SPMD/ -gen-dialect-doc)
add_mlir_doc(SPMDOps SPMDOps SPMD/ -gen-op-doc)

set(LLVM_TARGET_DEFINITIONS SPMDTypes.td)
mlir_tablegen(SPMDTypes.h.inc -gen-typedef-decls)
mlir_tablegen(SPMDTypes.cpp.inc -gen-typedef-defs)
add_public_tablegen_target(MLIRSPMDTypesIncGen)

set(LLVM_TARGET_DEFINITIONS SPMDAttributes.td)
mlir_tablegen(SPMDEnums.h.inc -gen-enum-decls)
mlir_tablegen(SPMDEnums.cpp.inc -gen-enum-defs)
mlir_tablegen(SPMDAttributes.h.inc -gen-attrdef-decls)
mlir_tablegen(SPMDAttributes.cpp.inc -gen-attrdef-defs)
add_public_tablegen_target(MLIRSPMDAttributesIncGen)

set(LLVM_TARGET_DEFINITIONS SPMDPasses.td)
mlir_tablegen(SPMDPasses.h.inc --gen-pass-decls -name SPMD)
add_public_tablegen_target(MLIRSPMDPassesIncGen)
add_mlir_doc(Passes SPMDPasses ./ -gen-pass-doc)
