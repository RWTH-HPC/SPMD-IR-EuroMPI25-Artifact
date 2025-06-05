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
#define GEN_PASS_DEF_SIMPLIFYCMPOPS
#include "spmd/SPMDPasses.h.inc"

namespace {


struct SimplifyIfToLogicalOrPattern : public OpRewritePattern<arith::CmpIOp> {
  using OpRewritePattern::OpRewritePattern;

  LogicalResult matchAndRewrite(arith::CmpIOp cmpOp,
                                      PatternRewriter &rewriter) const override {
    // Ensure the `cmpOp` result has a single use in an `scf.if`.
    if (!cmpOp->hasOneUse())
      return rewriter.notifyMatchFailure(cmpOp, "CmpIOp must have exactly one use");

    auto ifOp = dyn_cast<scf::IfOp>(*cmpOp->user_begin());
    if (!ifOp || ifOp.getNumResults() != 1 || !ifOp->hasOneUse())
      return rewriter.notifyMatchFailure(cmpOp, "CmpIOp must be used by a valid scf.if");

    // Verify the structure of the `scf.if`.
    auto thenYield = dyn_cast<scf::YieldOp>(ifOp.thenBlock()->getTerminator());
    auto elseYield = dyn_cast<scf::YieldOp>(ifOp.elseBlock()->getTerminator());
    if (!thenYield || !elseYield)
      return rewriter.notifyMatchFailure(ifOp, "Missing scf.yield operations");

    // Ensure the then block yields constant 0
    if (thenYield.getOperands().size() != 1)
      return rewriter.notifyMatchFailure(ifOp, "Then block does not yield exactly one value");

    if (auto thenConstantOp = thenYield.getOperand(0).getDefiningOp<arith::ConstantOp>()) {
      if (auto intAttr = dyn_cast<IntegerAttr>(thenConstantOp.getValue())) {
        if (intAttr.getInt() != 0) {
          return rewriter.notifyMatchFailure(ifOp, "Then block does not yield constant 0");
        }
      }
      else {
        return rewriter.notifyMatchFailure(ifOp, "Constant is of non-integer type");
      }
    }
    else {
      return rewriter.notifyMatchFailure(ifOp, "Then block yields non-constant");
    }

    Operation *elseDefiningOp = elseYield->getOperand(0).getDefiningOp();
    auto elseCmpOp = dyn_cast<arith::CmpIOp>(elseDefiningOp);

    if (!elseCmpOp) {
      // Check if it is an arith.extui operation
      auto extuiOp = dyn_cast<arith::ExtUIOp>(elseDefiningOp);
      if (extuiOp) {
        // Check if the operand of extui is a CmpIOp
        elseCmpOp = extuiOp.getIn().getDefiningOp<arith::CmpIOp>();
      }
    }
    if (!elseCmpOp)
      return rewriter.notifyMatchFailure(ifOp, "Else region is not a valid comparison or extended comparison");

    // Check if the comparison in the else region is `ne`
    if (elseCmpOp.getPredicate() != arith::CmpIPredicate::ne)
      return rewriter.notifyMatchFailure(ifOp, "Else comparison must be `ne`");

    // Extract rank and constants from the `arith.cmpi` operations.
    Value rank1, rank2, const1, const2;
    if (!matchRankAndConstant(cmpOp.getLhs(), cmpOp.getRhs(), rank1, const1) &&
        !matchRankAndConstant(cmpOp.getRhs(), cmpOp.getLhs(), rank1, const1))
      return rewriter.notifyMatchFailure(cmpOp, "CmpIOp does not match a valid rank/constant pattern");

    if (!matchRankAndConstant(elseCmpOp.getLhs(), elseCmpOp.getRhs(), rank2, const2) &&
        !matchRankAndConstant(elseCmpOp.getRhs(), elseCmpOp.getLhs(), rank2, const2))
      return rewriter.notifyMatchFailure(elseCmpOp, "Else CmpIOp does not match a valid rank/constant pattern");

    if (rank1 != rank2)
      return rewriter.notifyMatchFailure(cmpOp, "Comparisons reference different rank values");

    // Checks ops following the if Op
    auto negCmpOp = dyn_cast<arith::CmpIOp>(*ifOp->user_begin());
    Value usedValue = ifOp->getResult(0);
    if (!negCmpOp) {
      auto castOp = dyn_cast<arith::IndexCastUIOp>(*ifOp->user_begin());
      if (castOp) {
        if (!castOp->hasOneUse()) {
          return rewriter.notifyMatchFailure(castOp, "castOp must must have exactly one use");
        }
        negCmpOp = dyn_cast<arith::CmpIOp>(*castOp->user_begin());
        usedValue = castOp.getOut();
      }
    }
    if (!negCmpOp)
      return rewriter.notifyMatchFailure(ifOp, "IfOps result must be used by a cmp op or first by indexCastUI then cmp op");

    // Check if the comparison in the else region is `ne`
    if (negCmpOp.getPredicate() != arith::CmpIPredicate::eq)
      return rewriter.notifyMatchFailure(negCmpOp, "negCmpOp comparison must be `eq`");

    Value zeroConst;
    if (negCmpOp.getLhs() == usedValue){
      zeroConst = negCmpOp.getRhs();
    }
    else {
      zeroConst = negCmpOp.getLhs();
    }


    if (auto zeroConstOp = zeroConst.getDefiningOp<arith::ConstantOp>()) {
      if (auto intAttr = dyn_cast<IntegerAttr>(zeroConstOp.getValue())) {
        if (intAttr.getInt() != 0) {
          return rewriter.notifyMatchFailure(ifOp, "Op does not compare with zero");
        }
      }
      else {
        return rewriter.notifyMatchFailure(ifOp, "Constant is of non-integer type");
      }
    }
    else {
      return rewriter.notifyMatchFailure(ifOp, "Op compares with a non-constant");
    }

    // Create a combined OR condition.
    rewriter.setInsertionPoint(ifOp);
    auto orOp = rewriter.create<arith::OrIOp>(
        ifOp.getLoc(),
        rewriter.create<arith::CmpIOp>(cmpOp.getLoc(), arith::CmpIPredicate::eq, rank1, const1),
        rewriter.create<arith::CmpIOp>(elseCmpOp.getLoc(), arith::CmpIPredicate::eq, rank2, const2));

    // Replace the original `scf.if` with the combined condition.
    rewriter.replaceOp(negCmpOp, orOp.getOperation());
    return success();
  }

private:
  // Helper function to match a possibly non-constant and constant operand pairs.
  bool matchRankAndConstant(Value lhs, Value rhs, Value &mayNonConstant,
                            Value &constant) const {
    if (auto constOp = rhs.getDefiningOp<arith::ConstantOp>()) {
      mayNonConstant = lhs;
      constant = constOp.getResult();
      return true;
    }
    return false;
  }
};


struct SimplifyCmpOps : impl::SimplifyCmpOpsBase<SimplifyCmpOps> {
  using SimplifyCmpOpsBase::SimplifyCmpOpsBase;
  void runOnOperation() override {
    RewritePatternSet patterns(&getContext());
    patterns.add<SimplifyIfToLogicalOrPattern>(&getContext());
    (void)applyPatternsGreedily(getOperation(), std::move(patterns));
  }
};

} // namespace
} // namespace mlir::spmd
