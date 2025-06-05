//===- SPMDAttributes.h - SPMD dialect attributes -------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef SPMDATTRIBUTES_H
#define SPMDATTRIBUTES_H

#include "mlir/IR/BuiltinAttributes.h"

#include "spmd/SPMDEnums.h.inc"
#define GET_ATTRDEF_CLASSES
#include "spmd/SPMDAttributes.h.inc"

#endif // SPMDATTRIBUTES_H
