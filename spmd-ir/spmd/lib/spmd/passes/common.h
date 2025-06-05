//===- utils.h - CACTS related utilities - Header -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements miscellaneous functionality  useful for the CACTS pass
// and related components that do not fit into one component. 
// Include several headers useful for multiple components.
//
//===----------------------------------------------------------------------===//

#ifndef COMMON_H
#define COMMON_H

#include "llvm/Support/Debug.h"
#include "mlir/IR/Location.h"

#include "llvm/ADT/TypeSwitch.h"
// for json writing
#include <filesystem> // C++17
#include "llvm/Support/FileSystem.h" // for real_path
#include "llvm/ADT/SmallString.h"      // for llvm::SmallString
#include "llvm/Support/JSON.h"

namespace mlir::spmd {

Location findLocToShowWrapper(Location loc);

std::string locToString(Location loc);

llvm::json::Object getLocationJson(Location loc);

} // namespace mlir::spmd

#endif // COMMON_H