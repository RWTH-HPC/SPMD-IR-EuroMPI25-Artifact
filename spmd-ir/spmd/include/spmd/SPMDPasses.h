//===- SPMDPasses.h - SPMD dialect types -------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
#ifndef SPMDPASSES_H
#define SPMDPASSES_H

#include "spmd/SPMDDialect.h"
#include "spmd/SPMDOps.h"
#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
namespace spmd {
/// Generate the code for creating options and passes (default constructors).
#define GEN_PASS_DECL
#include "spmd/SPMDPasses.h.inc"

/// Generate the code for registering passes.
#define GEN_PASS_REGISTRATION
#include "spmd/SPMDPasses.h.inc"
} // namespace spmd
} // namespace mlir

#endif // SPMDPASSES_H
