//===- nvshmemTransformations.h - Convert shmem api calls to spmd dialect - Header -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This declares functions for converting nvshmem func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "utils.h"

#ifndef NVSHMEM_TRANSFORMATIONS_H
#define NVSHMEM_TRANSFORMATIONS_H

#define DEBUG_TYPE "convert-apiCalls-to-spmd"
#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {
  // Entry function for the nvshmem transformation component that replaces func.CallOps by spmd.ops
  bool convertApiCallNVSHMEM(LLVM::CallOp &llvmCallOp, int modelGroup);

  // Deletes Function Callees of NVSHMEM calls replaces by spmd
  void deleteApiCalleesNVSHMEM(ModuleOp moduleOp);
} // namespace mlir::spmd

#endif // NVSHMEM_TRANSFORMATIONS_H