//===- ReachingDefinitionAnalysis.cpp - Reaching Defs Analysis ------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//
// Mostly a copy from the work in sycl-mlir https://github.com/intel/llvm/tree/sycl-mlir/mlir-sycl
//
//===----------------------------------------------------------------------===//

#include "spmd/Analysis/ReachingDefinitionAnalysis.h"
#include "mlir/Analysis/AliasAnalysis.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/TypeSwitch.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include <memory>

#define DEBUG_TYPE "reaching-definition-analysis"

using namespace mlir;
using namespace mlir::dataflow;

namespace mlir {
namespace spmd {

//===----------------------------------------------------------------------===//
// Definition
//===----------------------------------------------------------------------===//

raw_ostream &operator<<(raw_ostream &os, const Definition &def) {
  if (def.isOperation())
    os << *def.getOperation();
  if (def.isInitialDefinition())
    os << "<initial>";
  return os;
}

bool Definition::operator==(const Definition &other) const {
  if (isOperation() && other.isOperation())
    return getOperation() == other.getOperation();
  return (isInitialDefinition() && other.isInitialDefinition());
}

bool Definition::operator<(const Definition &other) const {
  if (isOperation() && other.isOperation())
    return getOperation() < other.getOperation();
  if (isInitialDefinition() && other.isInitialDefinition())
    return false;
  return isInitialDefinition();
}

//===----------------------------------------------------------------------===//
// ReachingDefinition
//===----------------------------------------------------------------------===//

raw_ostream &operator<<(raw_ostream &os, const ReachingDefinition &lastDef) {
  if (lastDef.valueToModifiers.empty() &&
      lastDef.valueToPotentialModifiers.empty())
    return os.indent(4) << "<empty>";

  using ModifiersTy = ReachingDefinition::ModifiersTy;
  auto printMap = [&os](const DenseMap<Value, ModifiersTy> &map,
                        StringRef title) {
    for (const auto &entry : map) {
      const Value &val = entry.first;
      const ModifiersTy &valModifiers = entry.second;

      os.indent(4) << "val: " << val << "\n";
      os.indent(6) << title << "\n";
      if (valModifiers.empty())
        os.indent(8) << "<none>\n";
      else {
        for (const Definition &def : valModifiers)
          os.indent(8) << def << "\n";
      }
    }
  };

  printMap(lastDef.valueToModifiers, "mods:");
  printMap(lastDef.valueToPotentialModifiers, "pMods:");
  return os;
}

ChangeResult ReachingDefinition::join(const AbstractDenseLattice &lattice) {
  ChangeResult result = ChangeResult::NoChange;
  const auto &otherReachingDef =
      static_cast<const ReachingDefinition &>(lattice);

  auto join = [&result](DenseMap<Value, ModifiersTy> &currentMap,
                        const DenseMap<Value, ModifiersTy> &otherMap) {
    for (const auto &entry : otherMap) {
      Value val = entry.first;
      const ModifiersTy &newModifiers = entry.second;

      ModifiersTy &currentModifiers = currentMap[val];
      const std::size_t size = currentModifiers.size();
      currentModifiers.insert(newModifiers.begin(), newModifiers.end());
      if (currentModifiers.size() != size)
        result |= ChangeResult::Change;
    }
  };

  join(valueToModifiers, otherReachingDef.valueToModifiers);
  join(valueToPotentialModifiers, otherReachingDef.valueToPotentialModifiers);
  return result;
}

ChangeResult ReachingDefinition::reset() {
  if (valueToModifiers.empty() && valueToPotentialModifiers.empty())
    return ChangeResult::NoChange;

  valueToModifiers.clear();
  valueToPotentialModifiers.clear();
  return ChangeResult::Change;
}

ChangeResult ReachingDefinition::setModifier(Value val, Definition def) {
  // Set the new modifier and clear out all previous definitions.
  ReachingDefinition::ModifiersTy &mods = valueToModifiers[val];
  mods.clear();
  mods.insert(def);
  valueToPotentialModifiers[val].clear();
  return ChangeResult::Change;
}

ChangeResult ReachingDefinition::removeModifiers(Value val) {
  if (!valueToModifiers.contains(val))
    return ChangeResult::NoChange;
  if (!valueToModifiers[val].empty()) {
    valueToModifiers[val].clear();
    return ChangeResult::Change;
  }
  return ChangeResult::NoChange;
}

ChangeResult ReachingDefinition::addPotentialModifier(Value val,
                                                      Definition def) {
  return (valueToPotentialModifiers[val].insert(def).second)
             ? ChangeResult::Change
             : ChangeResult::NoChange;
}

ChangeResult ReachingDefinition::removePotentialModifiers(Value val) {
  if (!valueToPotentialModifiers.contains(val))
    return ChangeResult::NoChange;
  if (!valueToPotentialModifiers[val].empty()) {
    valueToPotentialModifiers[val].clear();
    return ChangeResult::Change;
  }
  return ChangeResult::NoChange;
}

std::optional<ReachingDefinition::ModifiersTy>
ReachingDefinition::getModifiers(Value val, DataFlowSolver &solver) const {
  Value underlyingVal =
      UnderlyingValueAnalysis::getMostUnderlyingValue(val, [&](Value val) {
        return solver.lookupState<UnderlyingValueLattice>(val);
      });
  if (underlyingVal)
    val = underlyingVal;

  if (valueToModifiers.contains(val))
    return valueToModifiers.at(val);
  return std::nullopt;
}

std::optional<ReachingDefinition::ModifiersTy>
ReachingDefinition::getPotentialModifiers(Value val,
                                          DataFlowSolver &solver) const {
  Value underlyingVal =
      UnderlyingValueAnalysis::getMostUnderlyingValue(val, [&](Value val) {
        return solver.lookupState<UnderlyingValueLattice>(val);
      });
  if (underlyingVal)
    val = underlyingVal;

  if (valueToPotentialModifiers.contains(val))
    return valueToPotentialModifiers.at(val);
  return std::nullopt;
}

std::optional<Definition>
ReachingDefinition::getUniqueDefinition(unsigned opIndex, Operation *op,
                                        DataFlowSolver &solver) {
  const ReachingDefinition *reachingDef =
      solver.lookupState<ReachingDefinition>(solver.getProgramPointBefore(op));
  if (!reachingDef)
    return std::nullopt;

  Value operand = op->getOperand(opIndex);
  std::optional<ModifiersTy> mods = reachingDef->getModifiers(operand, solver);
  std::optional<ModifiersTy> pMods =
      reachingDef->getPotentialModifiers(operand, solver);

  // If there are potential modifiers then there is no unique modifier.
  if (pMods.has_value() && !pMods->empty())
    return std::nullopt;

  if (!mods.has_value() || mods->size() != 1)
    return std::nullopt;

  return *mods->begin();
}

//===----------------------------------------------------------------------===//
// ReachingDefinitionAnalysis
//===----------------------------------------------------------------------===//

void ReachingDefinitionAnalysis::setToEntryState(ReachingDefinition *lattice) {
  /// Set the initial state (nothing is known about reaching definitions).

  // Upon creating a new reaching definition at the start of a function, each
  // memory argument is set to have an unknown initial value.
  if (ProgramPoint *p = dyn_cast<ProgramPoint *>(lattice->getAnchor())) {
    if (auto *block = p->getBlock()) {
      if (block->isEntryBlock()) {
        if (auto funcOp = dyn_cast<FunctionOpInterface>(block->getParentOp())) {
          for (Value arg : funcOp.getArguments()) {
            if (isa<MemRefType, LLVM::LLVMPointerType>(arg.getType())) {
              ChangeResult modified = lattice->setModifier(arg, Definition());
              propagateIfChanged(lattice, modified);
              assert(modified == ChangeResult::Change);
            }
          }
        }
      }
    }
  }
}

LogicalResult ReachingDefinitionAnalysis::visitOperation(
    Operation *op, const ReachingDefinition &before,
    ReachingDefinition *after) {
  LLVM_DEBUG(llvm::dbgs() << "Visit: " << *op << "\n");

  // Upon entering a function we need to create the alias oracle for the
  // current function and transfer the input state.
  if (auto funcOp = dyn_cast<FunctionOpInterface>(op)) {
    aliasOracles[funcOp] = std::make_unique<AliasOracle>(funcOp, aliasAnalysis);
    ChangeResult result = after->join(before);
    propagateIfChanged(after, result);
    LLVM_DEBUG({
      if (result == ChangeResult::Change) {
        llvm::dbgs().indent(2) << "Updated ReachingDef:\n";
        llvm::dbgs() << *after;
      }
    });
    return success();
  }

  // If an operation has unknown memory effects assume we can't deduce
  // anything about reaching definitions.
  auto memoryEffectOp = dyn_cast<MemoryEffectOpInterface>(op);
  if (!memoryEffectOp) {
    LLVM_DEBUG(llvm::dbgs() << "Operation has unknown side effects\n");
    setToEntryState(after);
    return success();
  }

  // Retrieve the alias oracle for the function this operation belongs to.
  auto funcOp = op->getParentOfType<FunctionOpInterface>();
  if (!funcOp) {
    LLVM_DEBUG(llvm::dbgs()
               << "Will not analyze operations not in a function\n");
    setToEntryState(after);
    return success();
  }
  AliasOracle &aliasOracle = *aliasOracles[funcOp];

  // Analyze the operation's memory effects.
  SmallVector<MemoryEffects::EffectInstance> effects;
  memoryEffectOp.getEffects(effects);

  ChangeResult result = after->join(before);
  for (const auto &effect : effects) {
    Value val = effect.getValue();
    if (!val) {
      // Memory effect on anything other than a value: conservatively assume we
      // can't deduce anything about reaching definitions.
      LLVM_DEBUG(llvm::dbgs() << "Memory Effect on non-values found\n");
      propagateIfChanged(after, after->reset());
      return success();      
    }

    val = UnderlyingValueAnalysis::getMostUnderlyingValue(val, [&](Value val) {
      return getOrCreateFor<UnderlyingValueLattice>(getProgramPointBefore(op), val);
    });
    if (!val)
      return success();

    LLVM_DEBUG(llvm::dbgs() << "Found underlying value: " << val << "\n");

    // Read operations do not modify the reaching definitions state.
    if (isa<MemoryEffects::Read>(effect.getEffect()))
      continue;

    TypeSwitch<MemoryEffects::Effect *>(effect.getEffect())
        .Case<MemoryEffects::Allocate>([&](auto) {
          // An allocate operation creates a definition for the current value.
          result |= after->setModifier(val, Definition(op));
        })
        .Case<MemoryEffects::Write>([&](auto) {
          // A write operation updates the definition of the current value
          // and the definition of its definitely aliased values. It also
          // updates the potential definitions of values that may alias the
          // current value.
          result |= after->setModifier(val, Definition(op));
          for (Value aliasedVal : aliasOracle.getMustAlias(val))
            result |= after->setModifier(aliasedVal, Definition(op));
          for (Value aliasedVal : aliasOracle.getMayAlias(val))
            result |= after->addPotentialModifier(aliasedVal, Definition(op));
        })
        .Case<MemoryEffects::Free>([&](auto) {
          // A deallocate operation kills reaching definitions of the
          // current value and of its definitely aliased values. It also
          // kills the potential definitions of values that may alias the
          // current value.
          result |= after->removeModifiers(val);
          result |= after->removePotentialModifiers(val);
          for (Value aliasedVal : aliasOracle.getMustAlias(val))
            result |= after->removeModifiers(aliasedVal);
          for (Value aliasedVal : aliasOracle.getMayAlias(val))
            result |= after->removePotentialModifiers(aliasedVal);
        });
  }

  propagateIfChanged(after, result);

  LLVM_DEBUG({
    if (result == ChangeResult::Change) {
      llvm::dbgs().indent(2) << "Updated ReachingDef:\n";
      llvm::dbgs() << *after;
    }
  });
  return success();
}

//===----------------------------------------------------------------------===//
// UnderlyingValue
//===----------------------------------------------------------------------===//

raw_ostream &operator<<(raw_ostream &os, const UnderlyingValue &underlyingVal) {
  return os << underlyingVal.val;
}

//===----------------------------------------------------------------------===//
// UnderlyingValueAnalysis
//===----------------------------------------------------------------------===//

Value UnderlyingValueAnalysis::getMostUnderlyingValue(
    Value value,
    function_ref<const UnderlyingValueLattice *(Value)> getUnderlyingValueFn) {
  const UnderlyingValueLattice *lattice;
  do {
    lattice = getUnderlyingValueFn(value);
    if (!lattice || lattice->getValue().isUninitialized())
      return {};

    Value underlyingValue = lattice->getValue().get();
    if (underlyingValue == value)
      break;

    value = underlyingValue;
  } while (true);

  return value;
}

} // namespace spmd
} // namespace mlir
