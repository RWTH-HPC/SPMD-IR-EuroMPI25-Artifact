//===- SPMDAttributes.td - SPMD dialect attributes -------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef SPMD_ATTRIBUTES
#define SPMD_ATTRIBUTES

include "mlir/IR/AttrTypeBase.td"
include "mlir/IR/EnumAttr.td"
include "spmd/SPMDDialect.td"

//===----------------------------------------------------------------------===//
// SPMD type definitions
//===----------------------------------------------------------------------===//

class SPMD_Attribute<string attrName, string attrMnemonic, list<Trait> traits = []>
    : TypeDef<SPMD_Dialect, attrName, traits> {
  let mnemonic = attrMnemonic;
}

//def SPMD_CustomType : SPMD_Type<"Custom", "custom"> {
//    let summary = "SPMD custom type";
//    let description = "Custom type in SPMD dialect";
//    let parameters = (ins StringRefParameter<"the custom value">:$value);
//    let assemblyFormat = "`<` $value `>`";
//}

// def SPMD_DatatypeAttr : I64EnumAttr<
//     "ExecutorType", "",
//     [
//       I32EnumAttrCase<"INT", 0, "dynamic">,
//       I32EnumAttrCase<"static", 1, "dynamic">,

//     ]> {
//   let cppNamespace = "::mlir::arith";
// }

// def SPMD_ExecutorKindAttr : I32EnumAttr<
//     "ExecutorKind", "The kind of execution of an operation",
//     [
//       I32EnumAttrCase<"All", 0, "all">,
//       I32EnumAttrCase<"Dynamic", 1, "dynamic">,
//       I32EnumAttrCase<"Static", 2, "static">,
//       I32EnumAttrCase<"One", 3, "one">,
//     ]> {
//   let cppNamespace = "::mlir::spmd";
// }

#endif // SPMD_ATTRIBUTES
