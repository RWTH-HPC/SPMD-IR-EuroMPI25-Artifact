//===- SPMDDialect.td - SPMD dialect -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef SPMD_DIALECT
#define SPMD_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// SPMD dialect definition.
//===----------------------------------------------------------------------===//

def SPMD_Dialect : Dialect {
  let name = "spmd";
  let summary = "An MLIR dialect for representing SPMD communication and patterns.";
  let description = [{
      An MLIR dialect for representing SPMD communication and patterns. 
      Thereby, it unifies it can unify multiple programming models.
  }];
  let cppNamespace = "::mlir::spmd";
  let useDefaultTypePrinterParser = 1;
  let extraClassDeclaration = [{
      void registerTypes();
  }];
}


//===----------------------------------------------------------------------===//
// Base SPMD operation definition.
//===----------------------------------------------------------------------===//
// Base class for spmd dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.

class SPMD_Op<string mnemonic, list<Trait> traits = []> :
        Op<SPMD_Dialect, mnemonic, traits>;

#endif // SPMD_DIALECT






