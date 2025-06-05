//===- nvshmemTransformations.cpp - Convert shmem api calls to spmd dialect - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This defines functions for converting nvshmem func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "nvshmemTransformations.h"
#include <regex>

namespace mlir::spmd {

// defines all supported types to be later used in regex pattern-matching
#define NVSHMEM_REGEX_TYPES "int|byte|uint"
#define NVSHMEM_REGEX_SIZES "8"
#define NVSHMEM_REDUCE_OPERATIONS "inc|add|and|or|xor"



/* ----------------------------------------- Define nvshmem regexp patterns ----------------------------------------- */
  std::regex nvshmem_put              ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_put(_nbi)?$");
  std::regex nvshmem_put_signal       ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_put_signal(_nbi)?$");
  // std::regex shmem_putsize          ("^shmem(_ctx)?_put(" SHMEM_REGEX_SIZES ")(_signal)?(_nbi)?$");
  // std::regex shmem_putmem           ("^shmem(_ctx)?_putmem(_signal)?(_nbi)?$");
  // std::regex shmem_p                ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_p$");
  // std::regex shmem_iput             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_iput$");
  // std::regex shmem_iputsize         ("^shmem(_ctx)?_iput(" SHMEM_REGEX_SIZES ")$");
  // std::regex atomic_set             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_set$");
  std::regex nvshmem_get              ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_get(_nbi)?$");
  // std::regex shmem_getsize          ("^shmem(_ctx)?_get(" SHMEM_REGEX_SIZES ")(_nbi)?$");
  // std::regex shmem_getmem           ("^shmem(_ctx)?_getmem(_nbi)?$");
  // std::regex shmem_g                ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_g$");
  // std::regex shmem_iget             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_iget$");
  // std::regex shmem_igetsize         ("^shmem(_ctx)?_iget(" SHMEM_REGEX_SIZES ")$");
  std::regex nvshmem_atomic_fetch     ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_atomic_fetch(_nbi)?$");
  // std::regex shmem_atomic_op        ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_(" SHMEM_REDUCE_OPERATIONS ")$");
  std::regex nvshmem_atomic_fetch_op  ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_atomic_fetch_(" NVSHMEM_REDUCE_OPERATIONS ")(_nbi)?$");
  std::regex nvshmem_compare_swap     ("^nvshmem(_ctx)?_(" NVSHMEM_REGEX_TYPES ")_atomic_compare_swap(_nbi)?$");
// std::regex shmem_swap             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_swap(_nbi)?$");
/* ----------------------------------------- \Define nvshmem regexp patterns ---------------------------------------- */
  SmallVector<std::regex> nvshmemRegexs {nvshmem_put, nvshmem_put_signal, nvshmem_get, nvshmem_atomic_fetch, nvshmem_atomic_fetch_op, nvshmem_compare_swap};




Value getNewReduceOpNVSHMEM(std::string reduceOp, IRMapping& valueMapping, Operation *currentCallOpr, int modelGroup){
  Value newReduceOp;
  static bool sumCreated = false;
  static Value sumReduceOp;
  static bool incCreated = false;
  static Value incReduceOp;
  if (reduceOp == "sum") {
    if (sumCreated) {
      return sumReduceOp;
    }
    else {
      OpBuilder builder(currentCallOpr);
      LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
      builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
      newReduceOp = builder.create<spmd::ConstOpTypeOp>(llvmFuncOp->getLoc(), StringRef("SUM"), modelGroup).getResult();
      sumCreated = true;
      sumReduceOp = newReduceOp;
    }
  }
  else if (reduceOp == "inc") {
    if (incCreated) {
      return incReduceOp;
    }
    else {
      OpBuilder builder(currentCallOpr);
      LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
      builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
      newReduceOp = builder.create<spmd::ConstOpTypeOp>(llvmFuncOp->getLoc(), StringRef("INC"), modelGroup).getResult();
      incCreated = true;
      incReduceOp = newReduceOp;
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of explicit reduceOp\n");
  }
  return newReduceOp;
}


Value getNewSignalOpNVSHMEM(Value signalOpArg, IRMapping& valueMapping, Operation *currentCallOpr, int modelGroup){
  Value newSignalOp;
  if (valueMapping.contains(newSignalOp)) {
    newSignalOp = valueMapping.lookup(signalOpArg);
  } 
  else if (isArithConstantIntX(signalOpArg, 9)) { //SHMEM_SIGNAL_SET case
    OpBuilder builder(currentCallOpr);
    LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
    builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
    newSignalOp = builder.create<spmd::ConstSignalOpTypeOp>(llvmFuncOp->getLoc(), StringRef("SET"), modelGroup).getResult();
  }
  else {
    llvm_unreachable("\nNot implemented case of getNewSignalOp\n");
  }
  return newSignalOp;
}

Value getNewDatatypeNVSHMEM(Value datatypeArg, IRMapping& valueMapping, int modelGroup, 
    bool datatypeGiven = false, std::string datatype = "", Operation *currentCallOpr = nullptr){
  Value newDatatype;
  static bool intCreated = false;
  static Value intDatatype;
  static bool byteCreated = false;
  static Value byteDatatype;
  if (datatypeGiven) {
    if (datatype == "int") {
      if (intCreated) {
        return intDatatype;
      }
      else {
        OpBuilder builder(currentCallOpr);
        LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
        builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
        newDatatype = builder.create<spmd::ConstDatatypeOp>(llvmFuncOp->getLoc(), builder.getI32Type(), modelGroup).getResult();
        intCreated = true;
        intDatatype = newDatatype;
      }
    }
    else if (datatype == "byte") {
      if (byteCreated) {
        return byteDatatype;
      }
      else {
        OpBuilder builder(currentCallOpr);
        LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
        builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
        newDatatype = builder.create<spmd::ConstDatatypeOp>(llvmFuncOp->getLoc(), builder.getI8Type(), modelGroup).getResult();
        byteCreated = true;
        byteDatatype = newDatatype;
      }
    }
    else {
       llvm_unreachable("\nNot implemented case of explicit datatype\n");
    }
  }
  else if (valueMapping.contains(datatypeArg)) {
    newDatatype = valueMapping.lookup(datatypeArg);
  } 
  else {
    llvm_unreachable("\nNot implemented case of datatype replacement\n");
  }
  return newDatatype;
}



Value handleSingleCommArgNVSHMEM(Value origCommArg, IRMapping& valueMapping, bool &worldCommCreated, Value &worldComm, int modelGroup){
  Value newComm;
  if (valueMapping.contains(origCommArg)) {
    newComm = valueMapping.lookup(origCommArg);
  } 
  // else if (auto getGlobalOp = dyn_cast<memref::GetGlobalOp>(origCommArg.getDefiningOp())) {
  //   OpBuilder builder(getGlobalOp);
  //   if (getGlobalOp.getName() == "NVSHMEM_TEAM_WORLD") {
  //     if (worldCommCreated) {
  //       newComm = worldComm;
  //       valueMapping.map(origCommArg, newComm);
  //     }
  //     else {
  //       LLVM::LLVMFuncOp llvmFuncOp = getGlobalOp->getParentOfType<LLVM::LLVMFuncOp>();
  //       builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
  //       newComm = builder.create<spmd::CommWorldOp>(llvmFuncOp->getLoc(), modelGroup).getResult();
  //       valueMapping.map(origCommArg, newComm);
  //       worldCommCreated = true;
  //       worldComm = newComm;
  //     }
  //   }
  //   else {
  //     llvm_unreachable("\nNot implemented case of comm replacement - const comm unknown\n");
  //   }
  // }
  // else if (auto addrOfOp = dyn_cast<LLVM::AddressOfOp>(origCommArg.getDefiningOp())) {
  //   OpBuilder builder(addrOfOp);
  //   if (addrOfOp.getGlobalName() == "NVSHMEM_TEAM_WORLD") {
  //     if (worldCommCreated) {
  //       newComm = worldComm;
  //       valueMapping.map(origCommArg, newComm);
  //     }
  //     else {
  //       LLVM::LLVMFuncOp llvmFuncOp = addrOfOp->getParentOfType<LLVM::LLVMFuncOp>();
  //       builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
  //       newComm = builder.create<spmd::CommWorldOp>(llvmFuncOp->getLoc(), modelGroup).getResult();
  //       valueMapping.map(origCommArg, newComm);
  //       worldCommCreated = true;
  //       worldComm = newComm;
  //     }
  //   }
  //   else {
  //     llvm_unreachable("\nNot implemented case of comm replacement - const comm unknown\n");
  //   }
  // }
  else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(origCommArg.getDefiningOp())) {
    const int NVSHMEM_TEAM_WORLD = 0;
    const int NVSHMEMX_TEAM_NODE = 2;
    OpBuilder builder(constantOp);
    if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      if (integerAttr.getInt() == NVSHMEM_TEAM_WORLD) {
        builder.setInsertionPoint(constantOp.getOperation());
        newComm = builder.create<spmd::CommWorldOp>(constantOp->getLoc(), modelGroup).getResult();
        valueMapping.map(origCommArg, newComm);
        worldCommCreated = true;
        worldComm = newComm;
        return newComm;
      }
      else if (integerAttr.getInt() == NVSHMEMX_TEAM_NODE) {
        builder.setInsertionPoint(constantOp.getOperation());
        newComm = builder.create<spmd::CommNodeOp>(constantOp->getLoc(), modelGroup).getResult();
        valueMapping.map(origCommArg, newComm);
        return newComm;
      }
      else {
        llvm_unreachable("\nNot implemented case of comm replacement - const comm unknown\n");
      }
    }
    else {
      llvm_unreachable("\nNot implemented case of comm replacement\n");
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of comm replacement\n");
  }
  return newComm;
}

Value convertOldToSPMDCommsNVSHMEM(SmallVector<Value> origCommArgs, SmallVector<Operation*> branchLikeOps, IRMapping& valueMapping,
      bool &worldCommCreated, Value &worldComm, int modelGroup) {
  Value newCommArg;
  if (origCommArgs.size() == 2) {
    if (auto selectOp = dyn_cast<arith::SelectOp>(branchLikeOps[0])) {
      auto newComm1 = handleSingleCommArgNVSHMEM(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
      auto newComm2 = handleSingleCommArgNVSHMEM(origCommArgs[1], valueMapping, worldCommCreated, worldComm, modelGroup);

      OpBuilder builder(selectOp);
      builder.setInsertionPoint(selectOp);
      newCommArg = builder.create<arith::SelectOp>(selectOp->getLoc(), builder.getType<spmd::CommType>(), selectOp.getCondition(), newComm1, newComm2).getResult();

    }
    else {
      llvm_unreachable("\nNot implemented case of convertOldToSPMDComms!\n");
    }
  }
  else if (origCommArgs.size() > 2) {
    llvm_unreachable("\nNot implemented case of convertOldToSPMDComms!\n");
  }
  else {
    newCommArg = handleSingleCommArgNVSHMEM(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
  }
  return newCommArg;
}

Value getNewCommNVSHMEM(Value commArg, IRMapping& valueMapping, int modelGroup,
    bool implicitWorld = false, Operation *currentCallOpr = nullptr){
  Value newCommArg;
  static bool worldCommCreated = false;
  static Value worldComm;
  if (implicitWorld) {
    if (worldCommCreated) {
      return worldComm;
    }
    else {
      OpBuilder builder(currentCallOpr);
      LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
      builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
      worldComm = builder.create<spmd::CommWorldOp>(llvmFuncOp->getLoc(), modelGroup).getResult();
      worldCommCreated = true;
      return worldComm;
    }
  }
  SmallVector<Value> origCommArgs;
  SmallVector<Operation*> branchLikeOps;
  getOriginalCommArg(commArg, origCommArgs, branchLikeOps);

  newCommArg = convertOldToSPMDCommsNVSHMEM(origCommArgs, branchLikeOps, valueMapping, worldCommCreated, worldComm, modelGroup);
   
  return newCommArg;
}


// finds the original definition of value winArg and creates a window object there
// if the win already exists -> return that
Value getWinNvshmem(Value targetBaseAddrArg, Operation *currentCallOpr, IRMapping& valueMapping, int modelGroup) {
  // if (valueMapping.contains(targetBaseAddrArg)) {
  //   return valueMapping.lookup(targetBaseAddrArg);
  // } 
  // else {
    OpBuilder builder(currentCallOpr);
    Location loc = currentCallOpr->getLoc();
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, currentCallOpr);
    builder.setInsertionPoint(currentCallOpr);
    Value zeroI32 = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(0)).getResult();
    auto winCreateOp = builder.create<spmd::WinCreateOp>(loc, builder.getType<spmd::WinType>(), 
        builder.getType<spmd::ErrorType>(), newComm, targetBaseAddrArg, Value(), zeroI32, modelGroup);
    Value newWin =  winCreateOp.getResult(0);

    // valueMapping.map(targetBaseAddrArg, newWin);
    return newWin;
  // } 
}

// creates a memref that holds the input value
// returns input, if it already is a memref
// Value createMemRefFromValue(Value input, Value index0) {
//   if (!(input.getType().isa<mlir::MemRefType>())) {
//     Value res;
//     OpBuilder opBuilder(input.getDefiningOp()->getNextNode());
//     MemRefType memRefType = MemRefType::get({1}, input.getType());
//     res = opBuilder.create<memref::AllocOp>(input.getLoc(), memRefType);
//     opBuilder.create<memref::StoreOp>(input.getLoc(), input, res, index0);
//     return res;;
//   } else {
//     return input;
//   }
// }


// valueMapping stores already converted and erased Ops values, to reuse them in future conversion of other Ops
bool convertApiCallNVSHMEM(LLVM::CallOp &llvmCallOp, int modelGroup) {
  OpBuilder builder(llvmCallOp);
  Location loc = llvmCallOp->getLoc();
  std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
  if (!calleeStrRef.has_value()) {
    return false;
  }
  std::string calleeStr = calleeStrRef->str();

  std::smatch match;
  static IRMapping valueMapping;

  if (calleeStr == "nvshmem_init") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::InitOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_finalize") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FinalizeOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_my_pe") {
    Value oldRank = llvmCallOp.getResult();
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newRank = builder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup).getResult(0);
    oldRank.replaceAllUsesWith(newRank);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_team_my_pe") {
    Value oldRank = llvmCallOp.getResult();
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newRank = builder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup).getResult(0);
    oldRank.replaceAllUsesWith(newRank);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_n_pes") {
    Value oldSize = llvmCallOp.getResult();
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newSize = builder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup).getResult(0);
    oldSize.replaceAllUsesWith(newSize);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_team_n_pes") {
    Value oldSize = llvmCallOp.getResult();
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newSize = builder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup).getResult(0);
    oldSize.replaceAllUsesWith(newSize);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_team_sync") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // ArrayRef<Type> types(spmd::ErrorType::get(llvmCallOp.getContext()));
    builder.create<spmd::BarrierOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_sync_all") {
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // ArrayRef<Type> types(spmd::ErrorType::get(llvmCallOp.getContext()));
    builder.create<spmd::BarrierOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_int_broadcast") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);
    Value rootRankArg = llvmCallOp->getOperand(4);

    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNVSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::BcastOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
       newDatatype, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_broadcastmem") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);
    Value rootRankArg = llvmCallOp->getOperand(4);

    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNVSHMEM(Value(), valueMapping, modelGroup, true, "byte", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::BcastOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
       newDatatype, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_int_sum_reduce") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNVSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    Value newReduceOp = getNewReduceOpNVSHMEM("sum", valueMapping, llvmCallOp.getOperation(), modelGroup);
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AllreduceOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       countArg, newDatatype, newReduceOp, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_int_alltoall") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNVSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AlltoallOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, countArg, newDatatype,
       recvBufArg, countArg, newDatatype, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_int_collect" || calleeStr == "nvshmem_int_fcollect") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNVSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AllgatherOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, countArg, newDatatype,
       recvBufArg, countArg, newDatatype, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_malloc") {
    Value sizeArg = llvmCallOp->getOperand(0);
    Value ptr = llvmCallOp->getResult(0);
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newPtr = builder.create<spmd::MallocOp>(loc, ptr.getType(), builder.getType<spmd::ErrorType>(), newComm, sizeArg, Value(), modelGroup).getResult(0);
    ptr.replaceAllUsesWith(newPtr);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_realloc") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::ReallocOp>(loc, ptrArg.getType(), builder.getType<spmd::ErrorType>(), newComm, ptrArg, sizeArg, modelGroup);
    Value ptr = newOp->getResult(0);
    replaceUsesFollowingUser(ptrArg, newOp.getOperation(), ptr);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_free") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FreeOp>(loc, builder.getType<spmd::ErrorType>(), newComm, ptrArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_team_split_strided") {
    Value parentCommArg = llvmCallOp->getOperand(0);
    Value startArg = llvmCallOp->getOperand(1);
    Value strideArg = llvmCallOp->getOperand(2);
    Value sizeArg = llvmCallOp->getOperand(3);
    Value configArg = llvmCallOp->getOperand(4);
    // Value configMaskArg = llvmCallOp->getOperand(5);
    Value newCommArg = llvmCallOp->getOperand(6);

    // TODO: commented out to build without polygeist dependencies
    // if (isa<polygeist::Pointer2MemrefOp>(configArg.getDefiningOp()) && 
    //     isa<LLVM::ZeroOp>(configArg.getDefiningOp()->getOperand(0).getDefiningOp())) {
    //   configArg = Value();
    // }
    // else {
    //   llvm_unreachable("\nNot implemented case of configArg replacement\n");
    // }

    if (auto castOp = dyn_cast<memref::CastOp>(newCommArg.getDefiningOp())) {
      newCommArg = castOp->getOperand(0);
    }
    else if (auto llvmAllocaOp = dyn_cast<LLVM::AllocaOp>(newCommArg.getDefiningOp())) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of non-constant communicator like commWorld\n");
    }

    if (dyn_cast<LLVM::ZeroOp>(configArg.getDefiningOp())) {
      configArg = Value();
    }

    Value newParentComm = getNewCommNVSHMEM(parentCommArg, valueMapping, modelGroup);
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newNewComm = builder.create<spmd::CommSplitStridedOp>(loc, newParentComm, startArg, strideArg,
        sizeArg, configArg, modelGroup).getResult(0);
    valueMapping.map(newCommArg, newNewComm);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_team_destroy") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::CommDestroyOp>(loc, newComm, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_put)) {
    // extract values from original call
    Value targetAddrArg = llvmCallOp->getOperand(0);
    Value originAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::PutOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, countArg, type, oneI64,
        targetRankArg, win, zeroI64, countArg, type, oneI64, /*isBlocking=*/match[3].matched, /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_put_signal)) {
    // extract values from original call
    Value targetAddrArg = llvmCallOp->getOperand(0);
    Value originAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value signalAddrArg = llvmCallOp->getOperand(3);
    Value signalArg = llvmCallOp->getOperand(4);
    Value signalOpArg = llvmCallOp->getOperand(5);
    Value targetRankArg = llvmCallOp->getOperand(6);

    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());

    Value signalWin = getWinNvshmem(signalAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value newSignalOp = getNewSignalOpNVSHMEM(signalOpArg, valueMapping, llvmCallOp.getOperation(), modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::PutSignalOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg,
        countArg, type, oneI64, targetRankArg, win, zeroI64, countArg, type, oneI64, 
        signalWin, signalArg, newSignalOp, /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_get)) {
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value targetAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);

    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::GetOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
        originAddrArg, countArg, type, oneI64, targetRankArg, win, zeroI64, countArg, type, oneI64,
        /*isBlocking=*/match[3].matched, /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_atomic_fetch)) {
    Value originAddrArg, targetAddrArg, targetRankArg;
    if (!match[3].matched) {
      targetAddrArg = llvmCallOp->getOperand(0);
      targetRankArg = llvmCallOp->getOperand(1);
      auto newOriginValue = capsuleValueIntoMemref(llvmCallOp.getOperation(), originAddrArg); 
      llvmCallOp.getResult().replaceAllUsesWith(newOriginValue);
    } else {
      originAddrArg = llvmCallOp->getOperand(0);
      targetAddrArg = llvmCallOp->getOperand(1);
      targetRankArg = llvmCallOp->getOperand(2);
    }
    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::GetOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
      originAddrArg, oneI64, type, oneI64, targetRankArg, win, zeroI64, oneI64, type, oneI64,
      /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_atomic_fetch_op)) {
    Value resultAddrArg, originAddrArg, targetAddrArg, targetRankArg, valueArg;
    if (!match[4].matched) {
      targetAddrArg = llvmCallOp->getOperand(0);
      if (match[3].str() == "inc") {
        targetRankArg = llvmCallOp->getOperand(1);
      }
      else {
        valueArg = llvmCallOp->getOperand(1);
        targetRankArg = llvmCallOp->getOperand(2);
      }
      auto newOriginValue = capsuleValueIntoMemref(llvmCallOp.getOperation(), resultAddrArg); 
      llvmCallOp.getResult().replaceAllUsesWith(newOriginValue);
    } else {
        resultAddrArg = llvmCallOp->getOperand(0);
        targetAddrArg = llvmCallOp->getOperand(1);
      if (match[3].str() == "inc") {
        targetRankArg = llvmCallOp->getOperand(2);
      }
      else {
        valueArg = llvmCallOp->getOperand(2);
        targetRankArg = llvmCallOp->getOperand(3);
      }
    }
    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());

    Value accOp = getNewReduceOpNVSHMEM(match[3].str(), valueMapping, llvmCallOp.getOperation(), modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    originAddrArg = builder.create<LLVM::ZeroOp>(loc, builder.getType<LLVM::LLVMPointerType>()).getResult();

    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::GetAccumulateOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, oneI64, type, oneI64, 
      resultAddrArg, oneI64, type, oneI64, targetRankArg, win,
      zeroI64, oneI64, type, oneI64, accOp,
      /*isBlocking=*/match[4].matched, /*isAtomic=*/true, modelGroup);

    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, nvshmem_compare_swap)) {
    Value originAddrArg, targetAddrArg, resultAddrArg, compareAddrArg, targetRankArg, compareArg, originArg;
    if (!match[3].matched) {
      targetAddrArg = llvmCallOp->getOperand(0);
      compareArg = llvmCallOp->getOperand(1);
      originArg = llvmCallOp->getOperand(2);
      targetRankArg = llvmCallOp->getOperand(3);

      Value newResultValue = capsuleValueIntoMemref(llvmCallOp.getOperation(), resultAddrArg);
      llvmCallOp.getResult().replaceAllUsesWith(newResultValue);
    } else {
      resultAddrArg = llvmCallOp->getOperand(0);
      targetAddrArg = llvmCallOp->getOperand(1);
      compareArg = llvmCallOp->getOperand(2);
      originArg = llvmCallOp->getOperand(3);
      targetRankArg = llvmCallOp->getOperand(4);
    }
    capsuleValueIntoMemref(llvmCallOp.getOperation(), originAddrArg, originArg);
    capsuleValueIntoMemref(llvmCallOp.getOperation(), compareAddrArg, compareArg); 
    Value win = getWinNvshmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeNVSHMEM(Value(), valueMapping, 0, true, match[2].str(), llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::CompareAndSwapOp>(loc, originAddrArg, compareAddrArg, resultAddrArg, type, targetRankArg, win,
        zeroI64, /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_global_exit") {
    Value exitStatusArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNVSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AbortOp>(loc, newComm, exitStatusArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_barrier_all") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value zeroI32 = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(0)).getResult();
    builder.create<spmd::FenceOp>(loc, Value(), zeroI32, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "nvshmem_quiet") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FlushAllOp>(loc, Value(), /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else {
    return false;
  }
}

void deleteApiCalleesNVSHMEM(ModuleOp moduleOp) {
  SmallVector<StringRef> shmemCallees {"nvshmem_init", "nvshmem_finalize", "nvshmem_team_n_pes", "nvshmem_n_pes", "nvshmem_my_pe",
      "nvshmem_team_my_pe", "nvshmem_team_sync", "nvshmem_sync_all", "nvshmem_global_exit", "nvshmem_malloc", "nvshmem_barrier_all", "nvshmem_quiet",
      "nvshmem_int_broadcast", "nvshmem_broadcastmem", "nvshmem_int_sum_reduce", "shmem_team_destroy",
      "nvshmem_int_alltoall", "nvshmem_int_collect", "nvshmem_int_fcollect", "nvshmem_team_split_strided", 
      "nvshmem_alloc", "nvshmem_realloc", "nvshmem_free", "nvshmem_int_atomic_compare_swap_nbi", 
      "nvshmem_int_put_nbi", "nvshmem_int_get_nbi", "nvshmem_int_put_signal_nbi", "nvshmem_int_atomic_fetch_nbi", "nvshmem_int_atomic_fetch_inc_nbi",
      
    };
  for (StringRef str : shmemCallees) {
    if (Operation *opr = moduleOp.lookupSymbol(str)) {
      opr->erase();
    }
  }
}
} // namespace mlir::spmd