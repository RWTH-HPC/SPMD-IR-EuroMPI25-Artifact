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

#ifndef UTILS_H
#define UTILS_H

#include "spmd/SPMDOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "llvm/Support/Debug.h"
// #include "polygeist/Ops.h"

namespace mlir::spmd {
bool isArithConstantIntX(Value value, int x);

void replaceUsesFollowingUser(mlir::Value oldValue, mlir::Operation *targetUser, mlir::Value newValue);

Value capsuleValueIntoMemref(Operation *llvmCallOpr, Value &memref, Value oldVal = Value());

void getOriginalCommArg(Value commArg, SmallVector<Value> &origCommArgs, SmallVector<Operation*> &branchLikeOps);

void removeUselessOpChainOfValue(Value val);

void removeUselessOpChainOfValue2(Operation *opr);

void removeMemref(Value memref);

void removeOpChainOfValue2(Value val);

void replaceMemrefByValue(Value memref, Value value, Operation *currentUser = nullptr);

Value getAddress(Value aliasVal, IRMapping &valueMapping);

bool isStaticExecution(Operation *opr);

enum class ExecKind { All, AllBut, Static, Dynamic, One, AllButOne };

ExecKind getExecKind(Operation *opr);

ArrayRef<int32_t> getExecutors(Operation *opr);

} // namespace mlir::spmd

#endif // UTILS_H