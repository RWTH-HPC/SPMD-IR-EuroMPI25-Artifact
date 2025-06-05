//===- SimplifyControlFlow.cpp - SPMD Pass -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass ConvertArithSelectToIf which converts all arith.select ops
// to scf.IfOps.
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDPasses.h"

#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CONVERTARITHSELECTTOIF
#include "spmd/SPMDPasses.h.inc"

namespace {

struct ConvertArithSelectToIfPattern : public OpRewritePattern<arith::SelectOp> {
  using OpRewritePattern<arith::SelectOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(arith::SelectOp selectOp, PatternRewriter &rewriter) const override {
    Value condition = selectOp.getCondition();
    Value trueValue = selectOp.getTrueValue();
    Value falseValue = selectOp.getFalseValue();

    // Gather all operations that use the selectOp result
    SmallVector<Operation *> dependentOps;
    for (Operation *user : selectOp.getResult().getUsers()) {
      dependentOps.push_back(user);
    }

    // if atleast on of the users is a terminator do not convert the selectOp
    for (Operation *op : dependentOps) {
      if (op->hasTrait<OpTrait::IsTerminator>()) {
        return failure();
      }
    }

    // Determine values to be yielded by scf.if
    SmallVector<Type> yieldTypes;
    for (Operation *op : dependentOps) {
      for (Value result : op->getResults()) {
        if (!result.use_empty()) {
          yieldTypes.push_back(result.getType());
        }
      }
    }

    // Create the scf.if operation with results
    auto ifOp = rewriter.create<scf::IfOp>(selectOp.getLoc(), yieldTypes, condition, /*withElseRegion=*/true);

    //erase empty yieldOps to avoid duplication when create one later
    if (ifOp.thenBlock()->mightHaveTerminator()){
      rewriter.eraseOp(ifOp.thenBlock()->getTerminator());
    }
    if (ifOp.elseBlock()->mightHaveTerminator()) {
      rewriter.eraseOp(ifOp.elseBlock()->getTerminator());
    }

    // IRMapping for operand remapping
    IRMapping mapping;

    // Populate the then branch
    rewriter.setInsertionPointToStart(ifOp.thenBlock());
    mapping.map(selectOp.getResult(), trueValue); // Map select result to true value
    SmallVector<Value> thenYieldValues;

    for (Operation *op : dependentOps) {
      Operation *clonedOp = rewriter.clone(*op, mapping);
      for (Value result : clonedOp->getResults()) {
        if (!result.use_empty()) {
          thenYieldValues.push_back(result);
        }
      }
    }
    rewriter.create<scf::YieldOp>(selectOp.getLoc(), thenYieldValues);

    // Populate the else branch
    rewriter.setInsertionPointToStart(ifOp.elseBlock());
    mapping.clear();
    mapping.map(selectOp.getResult(), falseValue); // Map select result to false value
    SmallVector<Value> elseYieldValues;

    for (Operation *op : dependentOps) {
      Operation *clonedOp = rewriter.clone(*op, mapping);
      for (Value result : clonedOp->getResults()) {
        if (!result.use_empty()) {
          elseYieldValues.push_back(result);
        }
      }
    }
    rewriter.create<scf::YieldOp>(selectOp.getLoc(), elseYieldValues);

    // Replace all former return values of the dependent operations with the results of the ifOp
    // The result of each dependent operation in both branches should map to the corresponding scf.if result.
    size_t idx = 0;
    for (Operation *op : dependentOps) {
      for (Value result : op->getResults()) {
        if (!result.use_empty()) {
          result.replaceAllUsesWith(ifOp.getResult(idx));
          idx++;
        }
      }
    }

    // erase dependentOps as they have been already copied and no users
    for (Operation *op : dependentOps) {
      rewriter.eraseOp(op);
    }

    // Erase the original selectOp
    rewriter.eraseOp(selectOp);

    return success();
  }
};


struct ConvertArithSelectToIf : impl::ConvertArithSelectToIfBase<ConvertArithSelectToIf> {
  using ConvertArithSelectToIfBase::ConvertArithSelectToIfBase;
  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();
    OpBuilder builder(moduleOp.getContext());
    RewritePatternSet patterns(&getContext());
    // GreedyRewriteConfig config;
    patterns.insert<ConvertArithSelectToIfPattern>(&getContext());
    (void)applyPatternsGreedily(moduleOp, std::move(patterns)/*, config*/);
  }
};

} // namespace
} // namespace mlir::spmd
