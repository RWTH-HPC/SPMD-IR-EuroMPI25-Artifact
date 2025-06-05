//===- Traits.h - Trait Declaration for MLIR DLTI dialect -------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_SPMD_TRAITS_H
#define MLIR_SPMD_TRAITS_H

#include "mlir/IR/OpDefinition.h"

namespace mlir::spmd {
/// This class adds a property indicating that the operation yields non-uniform
/// results.
template <typename ConcreteType>
class ResultsNonUniform : public mlir::OpTrait::TraitBase<ConcreteType, ResultsNonUniform> {};

// categorizes spmd operations into collective communication ones
template <typename ConcreteType>
class Collective : public mlir::OpTrait::TraitBase<ConcreteType, Collective> {};


// categorizes spmd operations into P2P communication ones
template <typename ConcreteType>
class P2P : public mlir::OpTrait::TraitBase<ConcreteType, P2P> {};

// categorizes spmd operations into P2P communication ones
template <typename ConcreteType>
class ProcessManagement : public mlir::OpTrait::TraitBase<ConcreteType, ProcessManagement> {};

// categorizes spmd operations into Comm Management ones
template <typename ConcreteType>
class CommManagement : public mlir::OpTrait::TraitBase<ConcreteType, CommManagement> {};

// categorizes spmd operations into Data Management ones
template <typename ConcreteType>
class DataManagement : public mlir::OpTrait::TraitBase<ConcreteType, DataManagement> {};

// categorizes spmd operations into Non-Blocking Synch. ones
template <typename ConcreteType>
class NonBlockingSync : public mlir::OpTrait::TraitBase<ConcreteType, NonBlockingSync> {};

// categorizes spmd operations into RMA ones
template <typename ConcreteType>
class RMA : public mlir::OpTrait::TraitBase<ConcreteType, RMA> {};

// categorizes spmd operations into Communication ones
template <typename ConcreteType>
class Communication : public mlir::OpTrait::TraitBase<ConcreteType, Communication> {};

// categorizes spmd operations into Sync ones
template <typename ConcreteType>
class Sync : public mlir::OpTrait::TraitBase<ConcreteType, Sync> {};

}
#endif // MLIR_SPMD_TRAITS_H
