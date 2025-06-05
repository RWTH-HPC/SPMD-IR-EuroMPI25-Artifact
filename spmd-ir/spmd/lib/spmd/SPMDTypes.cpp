//===- SPMDTypes.cpp - SPMD dialect types -----------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDAttributes.h"
#include "spmd/SPMDDialect.h"
#include "spmd/SPMDTypes.h"

#include "spmd/SPMDDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir::spmd;

#define GET_TYPEDEF_CLASSES
#include "spmd/SPMDTypes.cpp.inc"

void SPMDDialect::registerTypes() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "spmd/SPMDTypes.cpp.inc"
      >();
}
