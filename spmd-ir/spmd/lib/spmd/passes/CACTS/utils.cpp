//===- utils.h - CACTS related utilities - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements miscellaneous functionality  useful for the CACTS pass
// and related components that do not fit into one component. 
// Include several headers useful for multiple components.
//
//===----------------------------------------------------------------------===//

#include "utils.h"

#define DEBUG_TYPE "utils"

#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {

  
// Function to replace all uses of 'oldValue' that follow 'targetUser' with 'newValue'.
void replaceUsesFollowingUser(mlir::Value oldValue, mlir::Operation *targetUser, mlir::Value newValue) {
  // Ensure the target user is indeed a user of the old value.
  bool targetUserFound = false;

  // Iterate over all uses of the old value.
  for (auto &use : oldValue.getUses()) {
    // Check if we have found the target user.
    if (use.getOwner() == targetUser) {
      targetUserFound = true;
    }

    // If the target user has been found, replace subsequent uses.
    if (targetUserFound) {
      // Perform the replacement.
      use.set(newValue);
    }
  }
}

bool isArithConstantIntX(Value value, int x) {
  // Check if the defining operation is an arith.constant
  if (auto constOp = value.getDefiningOp<arith::ConstantOp>()) {
      // Get the constant value
      auto attr = constOp.getValue();

      // Check if it's an IntegerAttr
      if (auto intAttr = dyn_cast<IntegerAttr>(attr)) {
          // Compare the integer value to 0
          return intAttr.getValue() == x;
      }

      // Check if it's a FloatAttr
      // if (auto floatAttr = attr.dyn_cast<mlir::FloatAttr>()) {
      //     // Compare the float value to 0.0
      //     return floatAttr.getValue().isZero();
      // }
  }
  return false;
}


Value capsuleValueIntoMemref(Operation *llvmCallOpr, Value &memref, Value oldVal) {
  OpBuilder builder(llvmCallOpr);
  Location loc = llvmCallOpr->getLoc();
  builder.setInsertionPoint(llvmCallOpr);
  Type type = oldVal ? oldVal.getType() : llvmCallOpr->getResult(0).getType();
  MemRefType memRefType = MemRefType::get({1}, type);
  memref = builder.create<memref::AllocaOp>(loc, memRefType).getResult();
  if (oldVal) {
    arith::ConstantIndexOp indexOp = builder.create<arith::ConstantIndexOp>(loc, 0);
    auto index0 = indexOp.getResult();
    builder.create<memref::StoreOp>(loc, oldVal, memref, index0);
    return Value();
  }
  else {
    builder.setInsertionPointAfter(llvmCallOpr);
    arith::ConstantIndexOp indexOp = builder.create<arith::ConstantIndexOp>(loc, 0);
    auto index0 = indexOp.getResult();
    return builder.create<memref::LoadOp>(loc, memref, index0)->getResult(0);
  }
}

bool isStaticExecution(Operation *opr) {
  if (auto attr = opr->getDiscardableAttr("spmd.executionKind")) {
    if (auto stringAttr = dyn_cast<StringAttr>(attr)){
      if (stringAttr.getValue() == "Static"){
        return true;
      }
    }
  }
  return false;
}

ExecKind getExecKind(Operation *opr) {
  ExecKind execKind;
  llvm::StringMap<ExecKind> execKindMap = {
      {"All", ExecKind::All},
      {"AllBut", ExecKind::AllBut},
      {"Static", ExecKind::Static},
      {"Dynamic", ExecKind::Dynamic},
      {"One", ExecKind::One},
      {"AllButOne", ExecKind::AllButOne}
  };

  if (auto attr = opr->getDiscardableAttr(StringRef("spmd.executionKind"))) {
      if (auto stringAttr = dyn_cast<StringAttr>(attr)){
        auto iter = execKindMap.find(stringAttr.getValue());
        if (iter != execKindMap.end()) {
            execKind = iter->second;
            return execKind;
        } else {
            llvm_unreachable("\nExecKind should always be one of these six values!\n");
        }
      }
    } 
  // llvm_unreachable("\nExecKind should always be set for each operation\n");
  // this should only happen when no mv-pass was executed
  return ExecKind::Dynamic;
}

ArrayRef<int32_t> getExecutors(Operation *opr){
  ArrayRef<int32_t> arrayRef{};
  ExecKind execKind = getExecKind(opr);
  if (execKind == ExecKind::Static) {
    if (auto attr2 = opr->getDiscardableAttr(StringRef("spmd.executedBy"))) {
      if (auto arrayAttr = dyn_cast<DenseI32ArrayAttr>(attr2)) {
        arrayRef = arrayAttr.asArrayRef();
      }
    }      
  }
  else if (execKind == ExecKind::AllBut) {
    if (auto attr2 = opr->getDiscardableAttr(StringRef("spmd.executedNotBy"))) {
      if (auto arrayAttr = dyn_cast<DenseI32ArrayAttr>(attr2)) {
        arrayRef = arrayAttr.asArrayRef();
      }
    }     
  }
  return arrayRef;
}

/// Returns the result index of `resultVal` within its defining operation `definingOp`.
unsigned getResultIndex(Operation *definingOp, Value resultVal) {
  for (unsigned i = 0, e = definingOp->getNumResults(); i < e; ++i) {
    if (definingOp->getResult(i) == resultVal)
      return i;
  }
  llvm_unreachable("Value is not a result of the defining operation");
}

Value getAddress(Value aliasVal, IRMapping &valueMapping) {

  Operation *definingOpr = aliasVal.getDefiningOp();
  Value address;

  if (!definingOpr) {
    auto blockArg = dyn_cast<BlockArgument>(aliasVal);
    if (!blockArg)
      return aliasVal;

    // Check if it's a block arg from scf.while's "do" region
    auto whileOp = blockArg.getParentRegion()->getParentOfType<scf::WhileOp>();
    if (!whileOp)
      return aliasVal;

    // Index of the block argument
    unsigned index = blockArg.getArgNumber();

    // Go to the condition region and get the corresponding value passed to scf.condition
    auto &condBlock = whileOp.getBefore().front();
    Operation *condTerminator = condBlock.getTerminator();
    auto condOp = dyn_cast<scf::ConditionOp>(condTerminator);

    Value origin = condOp.getArgs()[index];
    address = getAddress(origin, valueMapping);
  }
  else if (auto whileOp = dyn_cast<scf::WhileOp>(definingOpr)) {
    unsigned index = getResultIndex(definingOpr, aliasVal);

    auto &condBlock = whileOp.getBefore().front();
    Operation *condTerminator = condBlock.getTerminator();
    auto condOp = dyn_cast<scf::ConditionOp>(condTerminator);

    Value origin = condOp.getArgs()[index];
    address = getAddress(origin, valueMapping);
  }
  else if (isa<LLVM::AllocaOp>(definingOpr) || isa<memref::AllocaOp>(definingOpr) || isa<spmd::WinAllocOp>(definingOpr)
      || isa<LLVM::AddressOfOp>(definingOpr) || isa<LLVM::ZeroOp>(definingOpr) || definingOpr->getDialect()->getNamespace().str() == "spmd") {
    return aliasVal;
  }
  else if (auto callOp = dyn_cast<LLVM::CallOp>(definingOpr)) {
    // Get the callee name
    if (auto callee = callOp.getCallee()) {
      // Compare the callee name with "malloc"
      // if (callee->str() == "malloc" || callee->str() == "calloc" || callee->str() == "calloc") {
        return aliasVal;
      // } else {
        // llvm_unreachable("\nNot implemented case of getAddress\n");
      // }
    }
  }
  else if (valueMapping.contains(aliasVal)) {
    return valueMapping.lookup(aliasVal);
  } 
  else if (isa<memref::LoadOp>(definingOpr) || isa<memref::CastOp>(definingOpr) || isa<LLVM::GEPOp>(definingOpr)) {
    address = getAddress(definingOpr->getOperand(0), valueMapping);
  }
  else if (isa<LLVM::LoadOp>(definingOpr)){
    Value prevAddr = definingOpr->getOperand(0);
    if (prevAddr.getDefiningOp<LLVM::LoadOp>()){
      return aliasVal;
    }
    else {
      address = getAddress(prevAddr, valueMapping);
    }
  }
  // else if (isa<arith::SelectOp>(arg.getDefiningOp())) {
  //   argMemref = arg;
  // // do nothing
  // }
  else {
    LLVM_DEBUG(DBGS() << "Not implemented case of getAddress\n");
    address = aliasVal;
    // llvm_unreachable("\nNot implemented case of getAddress\n");
  }

  valueMapping.map(aliasVal, address);

  return address;
}

void getOriginalCommArg(Value commArg, SmallVector<Value> &origCommArgs, SmallVector<Operation*> &branchLikeOps) {
  Operation *defOpr = commArg.getDefiningOp();
  if (auto loadOp = dyn_cast<LLVM::LoadOp>(defOpr)) {
    getOriginalCommArg(loadOp.getAddr(), origCommArgs, branchLikeOps);
  } 
  else if (memref::LoadOp loadOp = dyn_cast<memref::LoadOp>(defOpr)) {
    getOriginalCommArg(loadOp.getMemRef(), origCommArgs, branchLikeOps);
  }
  else if (auto selectOp = dyn_cast<arith::SelectOp>(defOpr)) {
    branchLikeOps.push_back(defOpr);
    getOriginalCommArg(selectOp.getTrueValue(), origCommArgs, branchLikeOps);
    getOriginalCommArg(selectOp.getFalseValue(), origCommArgs, branchLikeOps);
    
  }
  else if (isa<LLVM::AddressOfOp>(defOpr) || isa<LLVM::AllocaOp>(defOpr) || isa<arith::ConstantOp>(defOpr)) {
    origCommArgs.push_back(commArg);
    return;
  }
  else {
    llvm_unreachable("\nNot implemented case of getOriginalCommArg!\n");
  }
}

int getIndex(Operation *opr) {
  if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(opr)) {
    if (IntegerAttr intAttr = constantOp->getAttrOfType<IntegerAttr>(StringRef("value"))) {
      return intAttr.getInt();
    }
    else {
      llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
    }
  }
  else {
    //accessed memrefs are statically not derivable => replacement not possible
    llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
  }
}

// one of vectors need to be traversed reversed
bool sameIndices(SmallVector<int> &memrefSubViewIndices, SmallVector<int> &loadIndices) {
  size_t size1 = memrefSubViewIndices.size();
  size_t size2 = loadIndices.size();
  if (size1 != size2) {
    return false;
  }
  if (size2 == 0) {
    return true;
  }
  int j = size2-1;
  for (size_t i=0; i<size1;i++) {
    if (memrefSubViewIndices[i] != loadIndices[j]){
      return false;
    }
    j--;
  }
  return true;
}

void replaceMemrefByValue(Value refArg, Value value, Operation *currentUser) {
  Operation *definingOpr = refArg.getDefiningOp();
  OpBuilder builder(currentUser);
  bool indicesGiven = false;
  // SmallVector<int> memrefSubViewIndices;
  ArrayRef<int32_t> gepConstIndices;

  //find orignal adress if it is different to orignalArg
  Value address;
  if (isa<memref::CastOp>(definingOpr)) {
    address = definingOpr->getOperand(0);
  }
  else if (isa<LLVM::AllocaOp>(definingOpr) || isa<LLVM::AddressOfOp>(definingOpr)) {
    address = refArg;
  }
  else if (auto callOp = dyn_cast<LLVM::CallOp>(definingOpr)) {
    auto callee = callOp.getCallee();
    if (callee.has_value() && *callee == "malloc") {
      address = refArg;
    }
    else {
      llvm_unreachable("\nNot implemented case of unkown external call op\n");
    }
  }
  else if (auto gepOp = dyn_cast<LLVM::GEPOp>(definingOpr)) {
    if (gepOp.getDynamicIndices().empty() == false){
      llvm_unreachable("\nNot implemented case of dynamic indices in a GepOp\n");
    }
    gepConstIndices = gepOp.getRawConstantIndices();
    indicesGiven = true;
    address = refArg;
  }
  else if (auto loadOp = dyn_cast<LLVM::LoadOp>(definingOpr)) {
    address = loadOp.getOperand();
  }
  else if (isa<UnrealizedConversionCastOp>(definingOpr)) {
    address = definingOpr->getOperand(0);
  }
  // TODO: commented out to build without polygeist dependencies
  // else if (auto p2mOp = dyn_cast<polygeist::Pointer2MemrefOp>(definingOpr)) {
  //   if (auto m2pOp = dyn_cast<polygeist::Memref2PointerOp>(p2mOp.getOperand().getDefiningOp())){
  //     address = m2pOp->getOperand(0);
  //   }
  //   else {
  //     llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
  //   }
  //   address = definingOpr->getOperand(0);
  // }
  // TODO: commented out to build without polygeist dependencies
  // else if (isa<polygeist::SubIndexOp>(definingOpr)) {
  //   indicesGiven = true;
  //   memrefSubViewIndices.push_back(getIndex(definingOpr->getOperand(1).getDefiningOp()));
  //   while (Operation *upperDefiningOpr = definingOpr->getOperand(0).getDefiningOp()) {
  //     if (isa<polygeist::SubIndexOp>(upperDefiningOpr) == false){
  //       definingOpr = upperDefiningOpr;
  //       break;
  //     }
  //     memrefSubViewIndices.push_back(getIndex(upperDefiningOpr->getOperand(1).getDefiningOp()));
  //     definingOpr = upperDefiningOpr;
  //   }
  //   if (isa<memref::LoadOp>(definingOpr) == false) {
  //     llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
  //   }
  //   address = definingOpr->getResult(0);
  // }
  else {
    llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
  }

  SmallVector<Operation *> users(address.getUsers());

  for (auto user : users) {
    DominanceInfo dom;
    if (dom.dominates(currentUser, user) == false) {
      // if the user is not dominated by the current user, we can not replace it
      continue;
    }
    if (isa<memref::LoadOp>(user) || isa<LLVM::LoadOp>(user)) {
      // if (indicesGiven && isa<memref::LoadOp>(user)) {
      //   auto loadOp = cast<memref::LoadOp>(user);
      //   SmallVector<int> loadIndices;
      //   auto indexOperands = loadOp.getIndices();
      //   for (auto index : indexOperands) {
      //     loadIndices.push_back(getIndex(index.getDefiningOp()));
      //   }
      //   if (sameIndices(memrefSubViewIndices, loadIndices)) {
      //     Value result = loadOp.getResult();
      //     result.replaceAllUsesWith(value);
      //     // loadOp->erase();
      //   }
      // }
      // else {
        Operation *loadOpr = user;
        Value result = loadOpr->getResult(0);
        result.replaceAllUsesWith(value);
        // loadOp->erase();
      // }
    }
    else if (auto gepOp = dyn_cast<LLVM::GEPOp>(user)) {
      if (indicesGiven && gepConstIndices.equals(gepOp.getRawConstantIndices())) {
        Value result = user->getResult(0);
        result.replaceAllUsesWith(value);
      }
    }
    // case for unitialized array. Ignore it, as it will be deleted anyways if the memref is not read anymore after this store
    // todo: we could ignore any storeOp except the undefOp storing as it this would be regarded as best practice
    else if (isa<LLVM::UndefOp>(user->getOperand(0).getDefiningOp())) { 
      // user->erase();
    }
    // TODO: commented out to build without polygeist dependencies
    else if (isa<memref::CastOp>(user) /*|| isa<polygeist::SubIndexOp>(user)*/) {
      for (auto user2 : user->getResult(0).getUsers()){
        if (auto llvmCallOp = dyn_cast<LLVM::CallOp>(user2)) {
           // case of an indirect user that is a non mpi function call, we dont know what happens over there
          // if the function is statically available we should continue the replacement there, if its a statically 
          //unavailable function we should put the value back into a memref and use this for this user
          if (auto callee = llvmCallOp.getCallee()) {
            if (callee->starts_with(StringRef("MPI_")) || 
                callee->starts_with(StringRef("shmem_")) || callee->starts_with(StringRef("nccl"))) {
              // will be handled during mpi to spmd transformation later in this procedure
            }
            else {
              llvm_unreachable("\nNot implemented case of replacing memrefs by values\n"); 
            }
          }

        }
        // TODO: commented out to build without polygeist dependencies
        // else if (isa<polygeist::SubIndexOp>(user2)) {
        //   //do nothing
        // }
        else {
          llvm_unreachable("\nNot implemented case of replacing memrefs by values\n"); 
        }
      }
    }
    //both before and after e.g. a getRankOp it is bad practice to store something else in memref, but it can be done in theory
    // thus we ignore it
    else if (isa<memref::StoreOp>(user) || isa<LLVM::StoreOp>(user)) {
      //do nothing
    }
    else if (isa<LLVM::LifetimeEndOp>(user) ) {
      //do nothing
      // user->erase();
      // if () {
        
      // }
      // else {
      //   llvm_unreachable("\nAbout to replace a pointer that has prior uses.\n");
      // }
    }
    else if (auto callOp = dyn_cast<LLVM::CallOp>(user)) {
      auto callee = callOp.getCallee();
      if (callee.has_value() && *callee == "free") {
        // do nothing
      }
      else if (callee.has_value() && (callee->starts_with(StringRef("MPI_"))  
                || callee->starts_with(StringRef("shmem_")) || callee->starts_with(StringRef("nccl")) 
                || callee->starts_with(StringRef("nvshmem")) )) {
        builder.setInsertionPoint(callOp);
        // Only insert the cast if the types don't match
        if (address.getType() != value.getType()) {
          auto ucastOp = builder.create<UnrealizedConversionCastOp>(callOp.getLoc(), address.getType(), value);
          callOp->replaceUsesOfWith(address, ucastOp.getResult(0));
        } 
        else {
          callOp->replaceUsesOfWith(address, value);
        }
      }
      else {
        llvm_unreachable("\nNot implemented case of unkown external call op\n");
      }
    }
    else if (auto selectOp = dyn_cast<arith::SelectOp>(user)) {
    //   Value cond = selectOp.getCondition();
    //   Value trueValue = selectOp.getTrueValue();
    //   Value falseValue = selectOp.getFalseValue();

    //   // Determine which value to replace
    //   bool replaceTrueValue = (trueValue == address);
    //   bool replaceFalseValue = (falseValue == address);

    //   // Convert the memref value if necessary
    //   Type targetType = replaceTrueValue ? trueValue.getType() : falseValue.getType();
    //   if (value.getType() != targetType) {
    //     if (value.getType().isa<MemRefType>()) {
    //       OpBuilder builder(selectOp);
    //       builder.setInsertionPoint(selectOp);
    //       auto memrefType = value.getType().cast<MemRefType>();
    //       auto llvmPtrType = LLVM::LLVMPointerType::get(memrefType.getElementType(), 0);
    //       value = builder.create<memref::CastOp>(selectOp.getLoc(), llvmPtrType, value);
    //     }
    //     else {
    //       llvm_unreachable("\nNot implemented case of selectOp handler\n");
    //     }
    //   }

    //   // Create the new arith::SelectOp with the updated operand
    //   OpBuilder builder(selectOp);
    //   builder.setInsertionPoint(selectOp);
    //   Value newTrueValue = replaceTrueValue ? value : trueValue;
    //   Value newFalseValue = replaceFalseValue ? value : falseValue;
    //   auto newSelectOp = builder.create<arith::SelectOp>(selectOp.getLoc(), cond, newTrueValue, newFalseValue);

    //   // Replace the old select operation

  // Define the memref type and the target llvm.ptr type

      builder.setInsertionPoint(selectOp);
      auto ucastOp = builder.create<UnrealizedConversionCastOp>(selectOp.getLoc(), address.getType(), value);
      selectOp->replaceUsesOfWith(address, ucastOp.getResult(0));
    //   selectOp.erase();
    }
    else if (isa<UnrealizedConversionCastOp>(user) || isa<LLVM::LifetimeStartOp>(user) || isa<LLVM::LifetimeEndOp>(user)) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of replacing memrefs by values\n");
    }
  }
}
} // namespace mlir::spmd