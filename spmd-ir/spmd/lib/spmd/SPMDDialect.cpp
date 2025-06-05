//===- SPMDDialect.cpp - SPMD dialect ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDDialect.h"
#include "mlir/IR/DialectImplementation.h"
#include "spmd/SPMDOps.h"

using namespace mlir;
using namespace mlir::spmd;

#include "spmd/SPMDOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// SPMD dialect.
//===----------------------------------------------------------------------===//

void SPMDDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "spmd/SPMDOps.cpp.inc"
      >();
  registerTypes();
}

