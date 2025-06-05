//===- shmemTransformations.cpp - Convert shmem api calls to spmd dialect - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This defines functions for converting shmem func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "shmemTransformations.h"
#include <regex>

namespace mlir::spmd {

// defines all supported types to be later used in regex pattern-matching
#define SHMEM_REGEX_TYPES "char|schar|short|int|long|longlong|prtdiff|uchar|ushort|uint|ulong|ulonglong|int8|int16|int32|int64|uint8|uint16|uint32|uint64|size|float|double|longdouble|complexd|complexf"
#define SHMEM_REGEX_SIZES "8"
#define SHMEM_REDUCE_OPERATIONS "inc|add|and|or|xor"
#define SHMEM_REDUCE_COLL_OPERATIONS "and|or|xor|max|min|sum|prod"


/* ----------------------------------------- Define shmem regexp patterns ----------------------------------------- */
  std::regex shmem_reduce              ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_(" SHMEM_REDUCE_COLL_OPERATIONS ")_reduce$");
  std::regex shmem_put              ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_put(_nbi)?$");
  std::regex shmem_put_signal       ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_put_signal(_nbi)?$");
  std::regex shmem_putmem              ("^shmem(_ctx)?_putmem(_nbi)?$");
  // std::regex shmem_putsize          ("^shmem(_ctx)?_put(" SHMEM_REGEX_SIZES ")(_signal)?(_nbi)?$");
  // std::regex shmem_p                ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_p$");
  // std::regex shmem_iput             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_iput$");
  // std::regex shmem_iputsize         ("^shmem(_ctx)?_iput(" SHMEM_REGEX_SIZES ")$");
  // std::regex atomic_set             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_set$");
  std::regex shmem_get              ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_get(_nbi)?$");
  // std::regex shmem_getsize          ("^shmem(_ctx)?_get(" SHMEM_REGEX_SIZES ")(_nbi)?$");
  // std::regex shmem_getmem           ("^shmem(_ctx)?_getmem(_nbi)?$");
  // std::regex shmem_g                ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_g$");
  // std::regex shmem_iget             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_iget$");
  // std::regex shmem_igetsize         ("^shmem(_ctx)?_iget(" SHMEM_REGEX_SIZES ")$");
  std::regex shmem_atomic_fetch     ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_fetch(_nbi)?$");
  // std::regex shmem_atomic_op        ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_(" SHMEM_REDUCE_OPERATIONS ")$");
  std::regex shmem_atomic_fetch_op  ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_fetch_(" SHMEM_REDUCE_OPERATIONS ")(_nbi)?$");
  std::regex shmem_compare_swap     ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_compare_swap(_nbi)?$");
// std::regex shmem_swap             ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_atomic_swap(_nbi)?$");
  std::regex shmem_wait_until      ("^shmem(_ctx)?_(" SHMEM_REGEX_TYPES ")_put_signal(_nbi)?$");
/* ----------------------------------------- \Define shmem regexp patterns ---------------------------------------- */
  SmallVector<std::regex> shmemRegexs {shmem_reduce, shmem_put, shmem_put_signal, shmem_putmem, shmem_get,
      shmem_atomic_fetch, shmem_atomic_fetch_op, shmem_compare_swap, shmem_wait_until};


Value getNewReduceOpSHMEM(std::string reduceOp, IRMapping& valueMapping, Operation *currentCallOpr, int modelGroup){
  OpBuilder builder(currentCallOpr);
  LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
  builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
  Value newReduceOp = builder.create<spmd::ConstOpTypeOp>(llvmFuncOp->getLoc(), reduceOp, modelGroup).getResult();
  return newReduceOp;
}


Value getNewSignalOpSHMEM(Value signalOpArg, IRMapping& valueMapping, Operation *currentCallOpr, int modelGroup){
  Value newSignalOp;
  if (valueMapping.contains(newSignalOp)) {
    newSignalOp = valueMapping.lookup(signalOpArg);
  } 
  else if (isArithConstantIntX(signalOpArg, 0)) { //SHMEM_SIGNAL_SET case
    OpBuilder builder(currentCallOpr);
    LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
    builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
    newSignalOp = builder.create<spmd::ConstSignalOpTypeOp>(llvmFuncOp->getLoc(), StringRef("SET"), modelGroup).getResult();
  }
  else {
    llvm_unreachable("\nNot implemented case of explicit reduceOp\n");
  }
  return newSignalOp;
}

Value getNewDatatypeSHMEM(Value datatypeArg, IRMapping& valueMapping, int modelGroup, 
    bool datatypeGiven = false, std::string datatype = "", Operation *currentCallOpr = nullptr){
  Value newDatatype;
  OpBuilder builder(currentCallOpr);
  if (datatypeGiven) {
    Type type;
    if (datatype == "char" || datatype == "schar" || datatype == "byte") {
      type = builder.getI8Type();
    }
    else if (datatype == "short") {
      type = builder.getI16Type();
    }
    else if (datatype == "int") {
      type = builder.getI32Type();
    }
    else if (datatype == "long") {
      type = builder.getI64Type();
    }
    else if (datatype == "longlong") {
      type = builder.getI64Type();
    }
    else if (datatype == "prtdiff") {
      type = builder.getI64Type();
    }
    else if (datatype == "uchar") {
      type = builder.getI8Type();
    }
    else if (datatype == "ushort") {
      type = builder.getI16Type();
    }
    else if (datatype == "uint") {
      type = builder.getI32Type();
    }
    else if (datatype == "ulong") {
      type = builder.getI64Type();
    }
    else if (datatype == "ulonglong") {
      type = builder.getI64Type();
    }
    else if (datatype == "int8") {
      type = builder.getI8Type();
    }
    else if (datatype == "int16") {
      type = builder.getI16Type();
    }
    else if (datatype == "int32") {
      type = builder.getI32Type();
    }
    else if (datatype == "int64") {
      type = builder.getI64Type();
    }
    else if (datatype == "uint8") {
      type = builder.getI8Type();
    }
    else if (datatype == "uint16") {
      type = builder.getI16Type();
    }
    else if (datatype == "uint32") {
      type = builder.getI32Type();
    }
    else if (datatype == "uint64") {
      type = builder.getI64Type();
    }
    else if (datatype == "size") {
      type = builder.getI64Type();
    }
    else if (datatype == "float") {
      type = builder.getF32Type();
    }
    else if (datatype == "double") {
      type = builder.getF64Type();
    }
    else if (datatype == "longdouble") {
      type = builder.getF80Type();
    }
    // else if (datatype == "complexd") {
    //   type = builder.getComplexType(builder.getF64Type());
    // }
    // else if (datatype == "complexf") {
    //   type = builder.getComplexType(builder.getF32Type());
    // }
    else {
      llvm_unreachable("\nNot implemented case of explciit datatype\n");
    }
    LLVM::LLVMFuncOp llvmFuncOp = currentCallOpr->getParentOfType<LLVM::LLVMFuncOp>();
    builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
    newDatatype = builder.create<spmd::ConstDatatypeOp>(llvmFuncOp->getLoc(), type, modelGroup).getResult();
  }
  else if (valueMapping.contains(datatypeArg)) {
    newDatatype = valueMapping.lookup(datatypeArg);
  } 
  else {
    llvm_unreachable("\nNot implemented case of datatype replacement\n");
  }
  return newDatatype;
}



Value handleSingleCommArgSHMEM(Value origCommArg, IRMapping& valueMapping, bool &worldCommCreated, Value &worldComm, int modelGroup){
  Value newComm;
  if (valueMapping.contains(origCommArg)) {
    newComm = valueMapping.lookup(origCommArg);
  } 
  else if (auto getGlobalOp = dyn_cast<memref::GetGlobalOp>(origCommArg.getDefiningOp())) {
    OpBuilder builder(getGlobalOp);
    if (getGlobalOp.getName() == "SHMEM_TEAM_WORLD") {
      if (worldCommCreated) {
        newComm = worldComm;
        valueMapping.map(origCommArg, newComm);
      }
      else {
        LLVM::LLVMFuncOp llvmFuncOp = getGlobalOp->getParentOfType<LLVM::LLVMFuncOp>();
        builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
        newComm = builder.create<spmd::CommWorldOp>(llvmFuncOp->getLoc(), modelGroup).getResult();
        valueMapping.map(origCommArg, newComm);
        worldCommCreated = true;
        worldComm = newComm;
      }
    }
    else {
      llvm_unreachable("\nNot implemented case of comm replacement - const comm unknown\n");
    }
  }
  else if (auto addrOfOp = dyn_cast<LLVM::AddressOfOp>(origCommArg.getDefiningOp())) {
    OpBuilder builder(addrOfOp);
    if (addrOfOp.getGlobalName() == "SHMEM_TEAM_WORLD") {
      if (worldCommCreated) {
        newComm = worldComm;
        valueMapping.map(origCommArg, newComm);
      }
      else {
        LLVM::LLVMFuncOp llvmFuncOp = addrOfOp->getParentOfType<LLVM::LLVMFuncOp>();
        builder.setInsertionPointToStart(&(llvmFuncOp.getBody().front()));
        newComm = builder.create<spmd::CommWorldOp>(llvmFuncOp->getLoc(), modelGroup).getResult();
        valueMapping.map(origCommArg, newComm);
        worldCommCreated = true;
        worldComm = newComm;
      }
    }
    else {
      llvm_unreachable("\nNot implemented case of comm replacement - const comm unknown\n");
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of comm replacement\n");
  }
  return newComm;
}

Value convertOldToSPMDCommsSHMEM(SmallVector<Value> origCommArgs, SmallVector<Operation*> branchLikeOps, IRMapping& valueMapping,
      bool &worldCommCreated, Value &worldComm, int modelGroup) {
  Value newCommArg;
  if (origCommArgs.size() == 2) {
    if (auto selectOp = dyn_cast<arith::SelectOp>(branchLikeOps[0])) {
      auto newComm1 = handleSingleCommArgSHMEM(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
      auto newComm2 = handleSingleCommArgSHMEM(origCommArgs[1], valueMapping, worldCommCreated, worldComm, modelGroup);

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
    newCommArg = handleSingleCommArgSHMEM(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
  }
  return newCommArg;
}

Value getNewCommSHMEM(Value commArg, IRMapping& valueMapping, int modelGroup,
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

  newCommArg = convertOldToSPMDCommsSHMEM(origCommArgs, branchLikeOps, valueMapping, worldCommCreated, worldComm, modelGroup);
   
  return newCommArg;
}



// finds the original definition of value winArg and creates a window object there
// if the win already exists -> return that
Value getWinShmem(Value targetBaseAddrArg, Operation *currentCallOpr, IRMapping& valueMapping, int modelGroup) {
  // if (valueMapping.contains(targetBaseAddrArg)) {
  //   return valueMapping.lookup(targetBaseAddrArg);
  // } 
  // else {
    OpBuilder builder(currentCallOpr);
    Location loc = currentCallOpr->getLoc();
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, currentCallOpr);
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
bool convertApiCallSHMEM(LLVM::CallOp &llvmCallOp, int modelGroup) {
  OpBuilder builder(llvmCallOp);
  Location loc = llvmCallOp->getLoc();
  std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
  if (!calleeStrRef.has_value()) {
    return false;
  }
  std::string calleeStr = calleeStrRef->str();

  std::smatch match;
  static IRMapping valueMapping;

  if (calleeStr == "shmem_init") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::InitOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_finalize") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FinalizeOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_my_pe") {
    Value oldRank = llvmCallOp.getResult();
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newRank = builder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup).getResult(0);
    oldRank.replaceAllUsesWith(newRank);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_team_my_pe") {
    Value oldRank = llvmCallOp.getResult();
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newRank = builder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup).getResult(0);
    oldRank.replaceAllUsesWith(newRank);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_n_pes") {
    Value oldSize = llvmCallOp.getResult();
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newSize = builder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup).getResult(0);
    oldSize.replaceAllUsesWith(newSize);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_team_n_pes") {
    Value oldSize = llvmCallOp.getResult();
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newSize = builder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup).getResult(0);
    oldSize.replaceAllUsesWith(newSize);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_team_sync") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // ArrayRef<Type> types(spmd::ErrorType::get(llvmCallOp.getContext()));
    builder.create<spmd::BarrierOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_sync_all") {
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // ArrayRef<Type> types(spmd::ErrorType::get(llvmCallOp.getContext()));
    builder.create<spmd::BarrierOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_int_broadcast" || calleeStr == "shmem_broadcastmem") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);
    Value rootRankArg = llvmCallOp->getOperand(4);

    std::string dataTypeStr;
    if (calleeStr == "shmem_broadcastmem") {
      dataTypeStr = "byte";
    }
    else if (calleeStr == "shmem_int_broadcast") {
      dataTypeStr = "int";
    }
    else {
      llvm_unreachable("\nNot implemented case of broadcast\n");
    }

    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, dataTypeStr, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::BcastOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
       newDatatype, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_reduce)) {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());
    Value newReduceOp = getNewReduceOpSHMEM(match[3].str(), valueMapping, llvmCallOp.getOperation(), modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AllreduceOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       countArg, newDatatype, newReduceOp, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_int_alltoall") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AlltoallOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, countArg, newDatatype,
       recvBufArg, countArg, newDatatype, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_int_collect" || calleeStr == "shmem_int_fcollect") {
    Value commArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value sendBufArg = llvmCallOp->getOperand(2);
    Value countArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, "int", llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AllgatherOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, countArg, newDatatype,
       recvBufArg, countArg, newDatatype, Value(),  /*isBlocking=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_malloc") {
    Value sizeArg = llvmCallOp->getOperand(0);
    Value ptr = llvmCallOp->getResult(0);
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newPtr = builder.create<spmd::MallocOp>(loc, ptr.getType(), builder.getType<spmd::ErrorType>(), newComm, sizeArg, Value(), modelGroup).getResult(0);
    ptr.replaceAllUsesWith(newPtr);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_align") {
    Value alignmentArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value ptr = llvmCallOp->getResult(0);
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newPtr = builder.create<spmd::MallocOp>(loc, ptr.getType(), builder.getType<spmd::ErrorType>(), newComm, sizeArg, alignmentArg, modelGroup).getResult(0);
    ptr.replaceAllUsesWith(newPtr);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_realloc") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::ReallocOp>(loc, ptrArg.getType(), builder.getType<spmd::ErrorType>(), newComm, ptrArg, sizeArg, modelGroup);
    Value ptr = newOp->getResult(0);
    replaceUsesFollowingUser(ptrArg, newOp.getOperation(), ptr);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_free") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FreeOp>(loc, newComm, ptrArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_team_split_strided") {
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

    Value newParentComm = getNewCommSHMEM(parentCommArg, valueMapping, modelGroup);
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value newNewComm = builder.create<spmd::CommSplitStridedOp>(loc, newParentComm, startArg, strideArg,
        sizeArg, configArg, modelGroup).getResult(0);
    valueMapping.map(newCommArg, newNewComm);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_team_destroy") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::CommDestroyOp>(loc, newComm, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_put)) {
    // extract values from original call
    Value targetAddrArg = llvmCallOp->getOperand(0);
    Value originAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::PutOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, countArg, type, oneI64,
        targetRankArg, win, zeroI64, countArg, type, oneI64, /*isBlocking=*/match[3].matched, /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_put_signal)) {
    // extract values from original call
    Value targetAddrArg = llvmCallOp->getOperand(0);
    Value originAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value signalAddrArg = llvmCallOp->getOperand(3);
    Value signalArg = llvmCallOp->getOperand(4);
    Value signalOpArg = llvmCallOp->getOperand(5);
    Value targetRankArg = llvmCallOp->getOperand(6);

    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());

    Value signalWin = getWinShmem(signalAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value newSignalOp = getNewSignalOpSHMEM(signalOpArg, valueMapping, llvmCallOp.getOperation(), modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::PutSignalOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg,
        countArg, type, oneI64, targetRankArg, win, zeroI64, countArg, type, oneI64, 
        signalWin, signalArg, newSignalOp, /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_putmem)) {
    // extract values from original call
    Value targetAddrArg = llvmCallOp->getOperand(0);
    Value originAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, "byte", llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::PutOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, countArg, type, oneI64,
        targetRankArg, win, zeroI64, countArg, type, oneI64, /*isBlocking=*/match[2].matched, /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_get)) {
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value targetAddrArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);

    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::GetOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
        originAddrArg, countArg, type, oneI64, targetRankArg, win, zeroI64, countArg, type, oneI64,
        /*isBlocking=*/match[3].matched, /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_atomic_fetch)) {
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
    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::GetOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
      originAddrArg, oneI64, type, oneI64, targetRankArg, win, zeroI64, oneI64, type, oneI64,
      /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (std::regex_match(calleeStr, match, shmem_atomic_fetch_op)) {
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
    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());

    Value accOp = getNewReduceOpSHMEM(match[3].str(), valueMapping, llvmCallOp.getOperation(), modelGroup);

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
  else if (std::regex_match(calleeStr, match, shmem_compare_swap)) {
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
    Value win = getWinShmem(targetAddrArg, llvmCallOp.getOperation(), valueMapping, modelGroup);
    Value type = getNewDatatypeSHMEM(Value(), valueMapping, modelGroup, true, match[2].str(), llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value zeroI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(0)).getResult();
    builder.create<spmd::CompareAndSwapOp>(loc, originAddrArg, compareAddrArg, resultAddrArg, type, targetRankArg, win,
        zeroI64, /*isBlocking=*/match[3].matched, /*isAtomic=*/true, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_global_exit") {
    Value exitStatusArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommSHMEM(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::AbortOp>(loc, newComm, exitStatusArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_barrier_all") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value zeroI32 = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(0)).getResult();
    builder.create<spmd::FenceOp>(loc, Value(), zeroI32, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_quiet") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FlushAllOp>(loc, Value(), /*isAtomic=*/false, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "shmem_fence") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    builder.create<spmd::FenceOrderingOp>(loc, Value(), modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else {
    return false;
  }
}

void deleteApiCalleesSHMEM(ModuleOp moduleOp) {
  SmallVector<StringRef> shmemCallees {"shmem_init", "shmem_finalize", "shmem_team_n_pes", "shmem_n_pes", "shmem_my_pe", "shmem_malloc",
      "shmem_team_my_pe", "shmem_team_sync", "shmem_sync_all", "shmem_int_broadcast", "shmem_broadcastmem", "shmem_team_destroy",
      "shmem_int_alltoall", "shmem_int_collect", "shmem_int_fcollect", "shmem_team_split_strided", "shmem_alloc", "shmem_realloc", "shmem_free", 
       "shmem_global_exit", "shmem_barrier_all", "shmem_quiet", "shmem_fence", "shmem_align"};
  
  for (StringRef str : shmemCallees) {
    if (Operation *opr = moduleOp.lookupSymbol(str)) {
      opr->erase();
    }
  }

  SmallVector<Operation*, 8> oprsToErase;

  for (auto &op : moduleOp.getBodyRegion().getOps()) {
    if (auto llvmfuncOp = dyn_cast<LLVM::LLVMFuncOp>(&op)) {
      std::string name = llvmfuncOp.getSymName().str();
      for (const auto &pattern: shmemRegexs) {
        if (std::regex_match(name, pattern)) {
          oprsToErase.push_back(&op);
          break;
        }
      }
    }
  }

  // Erase the matched operations
  for (auto *opr : oprsToErase) {
    opr->erase();
  }
}
} // namespace mlir::spmd