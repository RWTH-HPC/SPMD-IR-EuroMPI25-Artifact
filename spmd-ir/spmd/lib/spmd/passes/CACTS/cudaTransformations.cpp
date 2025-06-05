//===- shmemTransformations.cpp - Convert shmem api calls to spmd dialect - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This defines functions for converting shmem func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "cudaTransformations.h"

namespace mlir::spmd {

// valueMapping stores already converted and erased Ops values, to reuse them in future conversion of other Ops
bool convertApiCallCUDA(LLVM::CallOp &llvmCallOp, int modelGroup) {
  OpBuilder builder(llvmCallOp);
  Location loc = llvmCallOp->getLoc();
  std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
  if (!calleeStrRef.has_value()) {
    return false;
  }
  std::string calleeStr = calleeStrRef->str();

  static IRMapping valueMapping;

  if (calleeStr == "cudaMemcpy") {
    Value dstArg = llvmCallOp->getOperand(0);
    Value srcArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value kindArg = llvmCallOp->getOperand(3);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::MemcpyOp>(loc, dstArg, srcArg, countArg, kindArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "cudaMemset") {
    Value dstArg = llvmCallOp->getOperand(0);
    Value valueArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::MemsetOp>(loc, dstArg, valueArg, countArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  // else if (calleeStr == "cudaMalloc") {
  //   Value sizeArg = llvmCallOp->getOperand(0);
  //   Value ptrArg = llvmCallOp->getOperand(1);

  //   builder.setInsertionPoint(llvmCallOp.getOperation());
  //   builder.create<spmd::MallocOp>(loc, ptrArg, sizeArg, modelGroup);
  //   llvmCallOp->erase();
  // return true;
  // }
  // else if (calleeStr == "cudaFree") {
  //   Value ptrArg = llvmCallOp->getOperand(0);

  //   builder.setInsertionPoint(llvmCallOp.getOperation());
  //   builder.create<spmd::FreeOp>(loc, ptrArg, modelGroup);
  //   llvmCallOp->erase();
  // return true;
  // }
  // else if (calleeStr == "cudaDeviceSynchronize") {
  //   builder.setInsertionPoint(llvmCallOp.getOperation());
  //   builder.create<spmd::DeviceSynchronizeOp>(loc, modelGroup);
  //   llvmCallOp->erase();
  // return true;
  // }
  else {
    return false;
  }
}

void deleteApiCalleesCUDA(ModuleOp moduleOp) {
  SmallVector<StringRef> cudaCallees {"cudaMemcpy", "cudaMemset", //"cudaMalloc",  "cudaFree", "cudaDeviceSynchronize",
    //"cudaMemcpyAsync", "cudaMemcpy2D", "cudaMemcpy2DAsync",
    //   "cudaMemcpy3D", "cudaMemcpy3DAsync",  "cudaMemsetAsync", 
    //  "cudaMallocManaged", "cudaFreeHost", "cudaHostAlloc", "cudaHostRegister",
    //   "cudaHostUnregister"
     };
  for (StringRef str : cudaCallees) {
    if (Operation *opr = moduleOp.lookupSymbol(str)) {
      opr->erase();
    }
  }
}
} // namespace mlir::spmd