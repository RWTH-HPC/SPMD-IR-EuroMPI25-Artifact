//===- ConvertApiCallsToRma.cpp - SPMD Pass: Add GPU memory related operations -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass ConvertApiCallsToRma which converts rma related api 
// calls of different programming models to the so-called rma dialect.
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDPasses.h"

#include "CACTS/mpiTransformations.h"
#include "CACTS/shmemTransformations.h"
#include "CACTS/nvshmemTransformations.h"
#include "CACTS/ncclTransformations.h"
#include "CACTS/cudaTransformations.h"

#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/Passes.h"
#include "mlir/Pass/PassManager.h"

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CONVERTAPICALLSTOSPMD
#include "spmd/SPMDPasses.h.inc"

namespace {

//pattern to remove non-pure operations by applyPatternsAndFoldGreedily
// remove storeOps if only storeOps operate on the address and not e.g. a load
struct StoreErase : public OpRewritePattern<memref::StoreOp> {
  using OpRewritePattern<memref::StoreOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(memref::StoreOp storeOp,
                                PatternRewriter &rewriter) const final {
    OpBuilder builder(storeOp);
    Value memref = storeOp.getMemref();
    for (Operation *user : memref.getUsers()) {
      if (!isa<memref::StoreOp>(user)) {
        return failure();
      }
    }
    rewriter.eraseOp(storeOp);
    return success();
  }
};

// struct LLVMStoreErase : public OpRewritePattern<LLVM::StoreOp> {
//   using OpRewritePattern<LLVM::StoreOp>::OpRewritePattern;

//   LogicalResult matchAndRewrite(LLVM::StoreOp llvmStoreOp,
//                                 PatternRewriter &rewriter) const final {
//     OpBuilder builder(llvmStoreOp);
//     Value address = llvmStoreOp.getAddr();
//     for (Operation *user : address.getUsers()) {
//       if (!isa<LLVM::StoreOp>(user)) {
//         return failure();
//       }
//     }
//     rewriter.eraseOp(llvmStoreOp);
//     return success();
//   }
// };

// struct LLVMLifetimeStartErase : public OpRewritePattern<LLVM::LifetimeStartOp> {
//   using OpRewritePattern<LLVM::LifetimeStartOp>::OpRewritePattern;

//   LogicalResult matchAndRewrite(LLVM::LifetimeStartOp lifetimeStartOp,
//                                 PatternRewriter &rewriter) const final {
//     OpBuilder builder(lifetimeStartOp);
//     Value ptr = lifetimeStartOp.getPtr();
//     for (Operation *user : ptr.getUsers()) {
//       if (isa<LLVM::LifetimeStartOp>(user) && isa<LLVM::LifetimeEndOp>(user)) {
//         return failure();
//       }
//     }
//     rewriter.eraseOp(lifetimeStartOp);
//     return success();
//   }
// };

// struct LLVMLifetimeEndErase : public OpRewritePattern<LLVM::LifetimeEndOp> {
//   using OpRewritePattern<LLVM::LifetimeEndOp>::OpRewritePattern;

//   LogicalResult matchAndRewrite(LLVM::LifetimeEndOp lifetimeEndOp,
//                                 PatternRewriter &rewriter) const final {
//     OpBuilder builder(lifetimeEndOp);
//     Value ptr = lifetimeEndOp.getPtr();
//     for (Operation *user : ptr.getUsers()) {
//       if (isa<LLVM::LifetimeStartOp>(user) && isa<LLVM::LifetimeEndOp>(user)) {
//         return failure();
//       }
//     }
//     rewriter.eraseOp(lifetimeEndOp);
//     return success();
//   }
// };

struct SwitchOpUnrealizedCasted : public OpRewritePattern<arith::SelectOp> {
  using OpRewritePattern<arith::SelectOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(arith::SelectOp selectOp,
                                PatternRewriter &rewriter) const final {
    OpBuilder builder(selectOp);
    Value trueValue = selectOp.getTrueValue();
    Value falseValue = selectOp.getFalseValue();

    // Check if the operands are unrealized_conversion_casts
    if (auto trueUCastOp = trueValue.getDefiningOp<UnrealizedConversionCastOp>()) {
      if (trueUCastOp->getNumOperands() != 1) {
        return failure();
      }
      trueValue = trueUCastOp.getOperand(0);
    }
    else {
      return failure();
    }
    
    if (auto falseUCast = falseValue.getDefiningOp<UnrealizedConversionCastOp>()) {
      if (falseUCast->getNumOperands() != 1) {
        return failure();
      }
      falseValue = falseUCast.getOperand(0);
    }
    else {
      return failure();
    }

    SmallVector<Operation *> users(selectOp.getResult().getUsers());
    bool allUsersAreCasts = llvm::all_of(users, [](Operation *user) {
      return isa<UnrealizedConversionCastOp>(user);
    });

    if (allUsersAreCasts) {
      // Create a new select operation
      auto newSelectOp = rewriter.create<arith::SelectOp>(selectOp.getLoc(), selectOp.getCondition(), trueValue, falseValue);

      // Replace each UnrealizedConversionCastOp user with the new selectOp result
      for (auto user : users) {
        auto castOp = cast<UnrealizedConversionCastOp>(user);
        rewriter.replaceOp(castOp, newSelectOp.getResult());
      }

      // Erase the old selectOp
      rewriter.eraseOp(selectOp);

      return success();
    }
    else {
      return failure();
    }
  }
};


struct ReplaceSPMDOpOnArithSelectWithSCFIf : public RewritePattern {
  ReplaceSPMDOpOnArithSelectWithSCFIf(MLIRContext *context)
      : RewritePattern(MatchAnyOpTypeTag(), /*benefit=*/1, context) {}

  LogicalResult matchAndRewrite(Operation *op, PatternRewriter &rewriter) const override {
    // Check if the operation belongs to the spmd dialect
    if (op->getDialect() != op->getContext()->getLoadedDialect("spmd"))
      return failure();

    // Check if any operand of the spmd op is the result of an arith.select
    for (Value operand : op->getOperands()) {
      auto selectOp = operand.getDefiningOp<arith::SelectOp>();
      if (!selectOp)
        continue;

      // Start rewriting: create an scf.if based on the condition of the selectOp
      rewriter.setInsertionPoint(op);
      auto loc = selectOp.getLoc(); // Use the location of the arith.selectOp
      auto condition = selectOp.getCondition();

      // Create the scf.if operation
      auto ifOp = rewriter.create<scf::IfOp>(
          loc, op->getResultTypes(), condition,
          /*withElseRegion=*/true);

      // Populate the 'then' region
      rewriter.setInsertionPointToStart(&ifOp.getThenRegion().front());
      auto trueOperands = llvm::to_vector<4>(op->getOperands());
      trueOperands[std::distance(op->operand_begin(), llvm::find(op->getOperands(), operand))] = selectOp.getTrueValue();

      auto trueClone = rewriter.clone(*op);
      trueClone->setOperands(trueOperands);
      rewriter.create<scf::YieldOp>(loc, trueClone->getResults());

      // Populate the 'else' region
      rewriter.setInsertionPointToStart(&ifOp.getElseRegion().front());
      auto falseOperands = llvm::to_vector<4>(op->getOperands());
      falseOperands[std::distance(op->operand_begin(), llvm::find(op->getOperands(), operand))] = selectOp.getFalseValue();

      auto falseClone = rewriter.clone(*op);
      falseClone->setOperands(falseOperands);
      rewriter.create<scf::YieldOp>(loc, falseClone->getResults());

      // Replace the original spmd operation with the result of the scf.if
      rewriter.replaceOp(op, ifOp.getResults());
      return success();
    }

    return failure();
  }
};


// struct LLVMMallocErase : public OpRewritePattern<LLVM::CallOp> {
//   using OpRewritePattern<LLVM::CallOp>::OpRewritePattern;

//   LogicalResult matchAndRewrite(LLVM::CallOp llvmCallOp,
//                                 PatternRewriter &rewriter) const final {
//     OpBuilder builder(llvmCallOp);
    
//     std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
//     if (!calleeStrRef.has_value() || *calleeStrRef != "malloc") {
//       return failure();
//     }

//     Value ptr = llvmCallOp.getResult();
//     SmallVector<Operation *> users(ptr.getUsers());
//     for (Operation *user : users) {
//       if (auto llvmCallOp2 = dyn_cast<LLVM::CallOp>(user)) {
//         auto calleeStrRef2 = llvmCallOp2.getCallee();
//         if (!calleeStrRef2.has_value() || *calleeStrRef2 != "free") {
//           return failure();
//         }
//       }
//       else {
//         return failure();
//       }
//     }
//     for (Operation *user : users) {
//         rewriter.eraseOp(user);
//     }
//     rewriter.eraseOp(llvmCallOp);
//     return success();
//   }
// };


void handleCallOp(LLVM::CallOp &llvmCallOp) {
  std::optional<llvm::StringRef> callee = llvmCallOp.getCallee();
  if (!callee) return;
  LLVM_DEBUG(DBGS() << "Currently handling callOp: " << *callee << "\n");
  // Check if the callee is a function that starts with "MPI_", "shmem_", "nccl", "cuda" or "nvshmem"
  if (callee->starts_with("MPI_")) {
    if (convertApiCallMPI(llvmCallOp, /*modelGroup=*/0)) return;
  }
  else if (callee->starts_with("shmem_")) {
    if (convertApiCallSHMEM(llvmCallOp, /*modelGroup=*/1)) return;
  }
  else if (callee->starts_with("nvshmem")) {
    if (convertApiCallNVSHMEM(llvmCallOp, /*modelGroup=*/2)) return;
  }
  else if (callee->starts_with("nccl")) {
    if (convertApiCallNCCL(llvmCallOp, /*modelGroup=*/3)) return;
  }
  else if (callee->starts_with("cuda")) {
    if (convertApiCallCUDA(llvmCallOp, /*modelGroup=*/4)) return;
  }
}

struct ConvertApiCallsToSPMD : impl::ConvertApiCallsToSPMDBase<ConvertApiCallsToSPMD> {
  using ConvertApiCallsToSPMDBase::ConvertApiCallsToSPMDBase;
  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();
    Operation *mainOpr = moduleOp.lookupSymbol("main");  
    if (mainOpr == NULL) {
      LLVM_DEBUG(DBGS() << "Pass failed since no main func exists\n");
      signalPassFailure();
      return;
    }
    OpBuilder opBuilder(moduleOp);

    // if (usedModel=="mpi" || usedModel=="shmem" || usedModel=="nccl") {
    //   RewritePatternSet patterns(&getContext());
    //   GreedyRewriteConfig config;
    //   // todo inline all func calls if e.g. polygeist did not already
    //   patterns.insert<MemrefErase, FuncErase>(&getContext());
    //   (void)applyPatternsAndFoldGreedily(moduleOp, std::move(patterns), config);
    // }

    LLVM_DEBUG(DBGS() << "API Call Conversions" << "\n");
    mainOpr->walk([&](LLVM::CallOp llvmCallOp) {
      handleCallOp(llvmCallOp);
    });

    // the following is only included to support proxy apps that have insignificant functions that cant be inlined (e.g. vararg using functions (e.g. @die in TeaLeaf))
    LLVM_DEBUG(DBGS() << "API Call Conversion outside the main" << "\n");
    moduleOp->walk([&](LLVM::LLVMFuncOp funcOp) {
      if (funcOp.getOperation() == mainOpr)
        return; // skip main

      funcOp.walk([&](LLVM::CallOp llvmCallOp) {
        handleCallOp(llvmCallOp);
      });
    });


    LLVM_DEBUG(DBGS() << "delete API calls" << "\n");
    deleteApiCalleesMPI(moduleOp);
    deleteApiCalleesSHMEM(moduleOp);
    deleteApiCalleesNVSHMEM(moduleOp);
    deleteApiCalleesNCCL(moduleOp);
    deleteApiCalleesCUDA(moduleOp);


    RewritePatternSet patterns(&getContext());
    GreedyRewriteConfig config;

    //TODO: above conversion functions could be rewritten as patterns, useful for complex cases
    patterns.insert<SwitchOpUnrealizedCasted,
        ReplaceSPMDOpOnArithSelectWithSCFIf>(&getContext()); //LLVMMallocErase, LLVMLifetimeStartErase, LLVMLifetimeEndErase,
    (void)applyPatternsGreedily(moduleOp, std::move(patterns), config);

    // Create a pass manager to run the canonicalizer pass
    PassManager pm(moduleOp.getContext());
    pm.addPass(createCanonicalizerPass());
    // pm.addPass(createReconcileUnrealizedCastsPass());
    // pm.addPass(createCanonicalizerPass());
    // Run the pass manager on the current function
    if (failed(pm.run(moduleOp))) {
      signalPassFailure();
    }
  }
};

} // namespace
} // namespace mlir::spmd
