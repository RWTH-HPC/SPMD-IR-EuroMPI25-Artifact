//===- shmemTransformations.h - Convert shmem api calls to spmd dialect - Header -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This declares functions for converting shmem func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "utils.h"

#ifndef SHMEM_TRANSFORMATIONS_H
#define SHMEM_TRANSFORMATIONS_H

#define DEBUG_TYPE "convert-apiCalls-to-spmd"
#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {
  // Entry function for the shmem transformation component that replaces func.CallOps by spmd.ops
  bool convertApiCallSHMEM(LLVM::CallOp &llvmCallOp, int modelGroup);

  // Deletes Function Callees of SHMEM calls replaces by spmd
  void deleteApiCalleesSHMEM(ModuleOp moduleOp);
} // namespace mlir::spmd

#endif // SHMEM_TRANSFORMATIONS_H