//===- SimplifyControlFlow.cpp - SPMD Pass -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass SimplifyControlFlow which converts all cf.SwitchOps 
// first to scf.IndexSwitchOps and then all scf.IndexSwitchOps to scf.IfOps.
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDPasses.h"

#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CONVERTSCFSWITCHTOIF
#include "spmd/SPMDPasses.h.inc"

namespace {

struct ConvertIndexSwitchToIfPattern : public OpRewritePattern<scf::IndexSwitchOp> {
  using OpRewritePattern<scf::IndexSwitchOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(scf::IndexSwitchOp switchOp, PatternRewriter &rewriter) const override {
    Location loc = switchOp.getLoc();
    Value indexValue = switchOp.getArg();  // The value being switched on

    // Get the cases and the blocks they point to
    auto caseValues = switchOp.getCases();
    auto caseRegions = switchOp.getCaseRegions();
    Block &defaultBlock = switchOp.getDefaultBlock();

    // Determine if the switch has result values
    bool hasResult = !switchOp.getResults().empty();
    SmallVector<Type, 4> resultTypes;
    if (hasResult) {
      resultTypes.append(switchOp.getResultTypes().begin(), switchOp.getResultTypes().end());
    }

    // Get the insertion point where the new operations will go
    rewriter.setInsertionPoint(switchOp);

    // Handle the case where there are no cases, just inline the default block
    if (caseValues.empty()) {
      // Inline the default block
      rewriter.inlineBlockBefore(&defaultBlock, switchOp);

      // If there are result values, replace them with the values yielded by the default block
      if (hasResult) {
        auto terminator = defaultBlock.getTerminator();
        SmallVector<Value, 4> yieldValues(terminator->getOperands());
        rewriter.replaceOp(switchOp, yieldValues);
      } else {
        rewriter.eraseOp(switchOp);
      }
      
      return success();
    }

    // Create the first IfOp for the first case
    auto caseValue0 = rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexType(), rewriter.getIndexAttr(caseValues[0])); 

    Value firstCondition = rewriter.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, indexValue, caseValue0);
    auto ifOp = rewriter.create<scf::IfOp>(loc, resultTypes, firstCondition, /*hasElse=*/true);

    //erase empty yieldOps to avoid duplication together with inserted one from swithOp block
    if (ifOp.getThenRegion().back().mightHaveTerminator()){
      rewriter.eraseOp(ifOp.getThenRegion().back().getTerminator());
    }
    if (caseValues.size() > 1 && ifOp.getElseRegion().back().mightHaveTerminator()) {
      rewriter.eraseOp(ifOp.getElseRegion().back().getTerminator());
    }
    // Inline the first case's region into the then region of the first IfOp
    rewriter.inlineBlockBefore(&caseRegions[0].front(), &ifOp.getThenRegion().back(), ifOp.getThenRegion().back().begin());

    // Start the else chain for the remaining cases
    Block *currentElseBlock = &ifOp.getElseRegion().back();
    rewriter.setInsertionPointToEnd(currentElseBlock);

    // Iterate over remaining cases and create nested IfOps in the else regions
    for (size_t i = 1; i < caseValues.size(); ++i) {
      auto caseValue = rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexType(), rewriter.getIndexAttr(caseValues[i]));
      Value condition = rewriter.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, indexValue, caseValue);
      auto nestedIfOp = rewriter.create<scf::IfOp>(loc, resultTypes, condition, /*hasElse=*/true);

      //erase empty yieldOps to avoid duplication together with inserted one from swithOp block
      if (nestedIfOp.getThenRegion().back().mightHaveTerminator()){
        rewriter.eraseOp(nestedIfOp.getThenRegion().back().getTerminator());
      }
      //erase empty yieldOps to avoid duplication together with inserted one from swithOp block
      if (nestedIfOp.getElseRegion().back().mightHaveTerminator()){
        rewriter.eraseOp(nestedIfOp.getElseRegion().back().getTerminator());
      }
      // Inline the case's region into the then region of the current IfOp
      rewriter.inlineBlockBefore(&caseRegions[i].front(), &nestedIfOp.getThenRegion().back(), nestedIfOp.getThenRegion().back().begin());

      rewriter.setInsertionPointAfter(nestedIfOp);
      if (hasResult) {
        SmallVector<Value> yieldValues(nestedIfOp->getResults().begin(), nestedIfOp->getResults().end());
        rewriter.create<scf::YieldOp>(loc, yieldValues);
      } else {
        rewriter.create<scf::YieldOp>(loc);
      }

      // Move the insertion point to the else region for further nesting
      currentElseBlock = &nestedIfOp.getElseRegion().back();
      rewriter.setInsertionPointToEnd(currentElseBlock);
    }

    //erase empty yieldOps to avoid duplication together with inserted one from swithOp block
    if (currentElseBlock->mightHaveTerminator()){
      rewriter.eraseOp(currentElseBlock->getTerminator());
    }

    // At the last else region, inline the default block if it exists
    rewriter.inlineBlockBefore(&defaultBlock, currentElseBlock, currentElseBlock->begin());

    // Replace the original scf::IndexSwitchOp with the result values from the IfOp chain
    if (hasResult) {
      SmallVector<Value, 4> yieldValues;
      if (auto terminator = currentElseBlock->getTerminator()) {
        yieldValues.append(terminator->getOperands().begin(), terminator->getOperands().end());
      }
      rewriter.replaceOp(switchOp, yieldValues);
    } else {
      rewriter.eraseOp(switchOp);
    }
    
    return success();
  }
};


struct ConvertSCFSwitchToIf : impl::ConvertSCFSwitchToIfBase<ConvertSCFSwitchToIf> {
  using ConvertSCFSwitchToIfBase::ConvertSCFSwitchToIfBase;
  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();
    OpBuilder builder(moduleOp.getContext());
    RewritePatternSet patterns(&getContext());
    // GreedyRewriteConfig config;
    patterns.insert<ConvertIndexSwitchToIfPattern>(&getContext());
    (void)applyPatternsGreedily(moduleOp, std::move(patterns)/*, config*/);
  }
};

} // namespace
} // namespace mlir::spmd
