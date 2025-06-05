//===- SPMDOps.cpp - SPMD dialect ops ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#include "spmd/SPMDOps.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "spmd/SPMDDialect.h"
// #include "mlir/IR/OpImplementation.h"

#define GET_OP_CLASSES
#include "spmd/SPMDOps.cpp.inc"

using namespace mlir;
using namespace spmd;

void SendOp::getEffects(SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
    auto opr = getOperation();
    // Add a write effect, but not tied to any operand
    effects.emplace_back(MemoryEffects::Write::get());
    // Add a read effect on operand "sendBuf"
    effects.emplace_back(MemoryEffects::Read::get(), &(opr->getOpOperand(1)));
    // Add a read and write effect on optional operand "stream"
    if (opr->getNumOperands() == 7) {
      effects.emplace_back(MemoryEffects::Read::get(), &(opr->getOpOperand(6)));
      effects.emplace_back(MemoryEffects::Write::get(), &(opr->getOpOperand(6)));
    }
}

void SendInitOp::getEffects(SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
  auto opr = getOperation();
  // Add a write effect, but not tied to any operand
  effects.emplace_back(MemoryEffects::Write::get());
  // Add a read effect on operand "sendBuf"
  effects.emplace_back(MemoryEffects::Read::get(), &(opr->getOpOperand(1)));
}

// OpFoldResult SPMD_CommWorldOp::fold(FoldAdaptor adaptor) {
//   return getUsedModelAttr();
// }
// OpFoldResult SPMD_CommNodeOp::fold(FoldAdaptor adaptor) {
//   return getUsedModelAttr();
// }

// OpFoldResult SPMD_ConstDatatypeOp::fold(FoldAdaptor adaptor) {
//   auto context = getContext();
//   return DictionaryAttr::get(context, {
//     NamedAttribute(StringAttr::get(context, "type"), getTypeAttr()),
//     NamedAttribute(StringAttr::get(context, "usedModel"), getUsedModelAttr())
//   });
// }

// OpFoldResult SPMD_ConstOpTypeOp::fold(FoldAdaptor adaptor) {
//   auto context = getContext();
//   return DictionaryAttr::get(context, {
//     NamedAttribute(StringAttr::get(context, "string"), getStringAttr()),
//     NamedAttribute(StringAttr::get(context, "usedModel"), getUsedModelAttr())
//   });
// }

// OpFoldResult SPMD_ConstSignalOpTypeOp::fold(FoldAdaptor adaptor) {
//   auto context = getContext();
//   return DictionaryAttr::get(context, {
//     NamedAttribute(StringAttr::get(context, "string"), getStringAttr()),
//     NamedAttribute(StringAttr::get(context, "usedModel"), getUsedModelAttr())
//   });
// }
// OpFoldResult SPMD_CommSplitOp::fold(FoldAdaptor adaptor) {
//   return getUsedModelAttr();
// }