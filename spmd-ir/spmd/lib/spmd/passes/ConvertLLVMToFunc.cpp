//===- ConvertLLVMToFunc.cpp - SPMD Pass -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass ConvertLLVMToFunc which converts 
// funcOps and callOps of the llvm dialect to those of the func dialect.
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDPasses.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
// #include "mlir/Dialect/Func/IR/FuncOps.h"

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CONVERTLLVMTOFUNC
#include "spmd/SPMDPasses.h.inc"

namespace {

struct ConvertLLVMToFunc : impl::ConvertLLVMToFuncBase<ConvertLLVMToFunc> {
  using ConvertLLVMToFuncBase::ConvertLLVMToFuncBase;
  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();
    OpBuilder builder(moduleOp.getContext());

    // Traverse the module and convert all llvm.call ops to func.call ops
    moduleOp.walk([&](LLVM::CallOp llvmCallOp) {
      // Retrieve the callee function
      auto calleeAttr = dyn_cast<SymbolRefAttr>(llvmCallOp.getCalleeAttr());
      // Look up the callee function in the module
      LLVM::LLVMFuncOp calleeLLVMFuncOp = moduleOp.lookupSymbol<LLVM::LLVMFuncOp>(calleeAttr);
      // Handle vararg accepting funcs (since not supported by func dialect, skip those)
      if (calleeLLVMFuncOp.isVarArg()) {
        return;
      }

      builder.setInsertionPoint(llvmCallOp);
      // Create a corresponding func.call operation
      auto funcCallOp = builder.create<func::CallOp>(
          llvmCallOp.getLoc(),
          llvmCallOp.getCalleeAttr(),
          llvmCallOp.getResultTypes(),
          llvmCallOp.getOperands()
      );
      // Replace the old llvm.call with the new func.call
      llvmCallOp.replaceAllUsesWith(funcCallOp.getResults());
      llvmCallOp.erase();
    });

    // Traverse the module and convert all llvm.func ops to func.func ops
    moduleOp.walk([&](LLVM::LLVMFuncOp llvmFuncOp) {
      // Handle varargs (since not supported by func dialect, skip those)
      if (llvmFuncOp.isVarArg()) {
        return;
      }
      
      builder.setInsertionPoint(llvmFuncOp);
      // Create a corresponding func.func operation
      auto funcType = builder.getFunctionType(llvmFuncOp.getArgumentTypes(), llvmFuncOp.getResultTypes());
      auto funcOp = builder.create<func::FuncOp>(llvmFuncOp.getLoc(), llvmFuncOp.getName(), funcType);
      // TODO: Transfer attributes
      // for (auto attr : llvmFuncOp->getAttrs()) {
      //   funcOp->setAttr(attr.getName(), attr.getValue());
      // }
      // Set the visibility to private to avoid the public visibility error
      funcOp.setVisibility(SymbolTable::Visibility::Private);
      // Check if the last operation is an llvm.return
      if (llvmFuncOp->getNumRegions() == 1 && llvmFuncOp.getBody().hasOneBlock()) {
        if (auto *lastOp = &(llvmFuncOp.getBody().front().back())) {
          if (auto llvmReturnOp = dyn_cast<LLVM::ReturnOp>(lastOp)) {
            // Convert llvm.return to func.return
            builder.setInsertionPoint(llvmReturnOp);
            builder.create<func::ReturnOp>(llvmReturnOp.getLoc(), llvmReturnOp.getOperands());
            llvmReturnOp.erase();
          }
        }
      }

      // Move the body of the llvm.func to func.func
      if (!llvmFuncOp.empty()) {
        funcOp.getBody().takeBody(llvmFuncOp.getBody());
      }

      // Remove the old llvm.func
      llvmFuncOp.erase();
    });
  }
};

} // namespace
} // namespace mlir::spmd
