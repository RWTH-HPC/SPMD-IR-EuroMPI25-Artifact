//===- ncclTransformations.cpp - Convert nccl api calls to spmd dialect - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This defines functions for converting nccl func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "ncclTransformations.h"

namespace mlir::spmd {
Value getNewStreamNCCL(Value streamArg, IRMapping& valueMapping, int modelGroup){
  Value newStream;
  Operation *defOpr = streamArg.getDefiningOp();
  if (isa<memref::LoadOp>(defOpr) || isa<LLVM::LoadOp>(defOpr)) {
    Value address = defOpr->getOperand(0);
    if (valueMapping.contains(address)) {
      newStream = valueMapping.lookup(address);
    } 
    else {
      OpBuilder opBuilder(defOpr);
      Operation *allocaOpr = address.getDefiningOp();
      opBuilder.setInsertionPointAfter(allocaOpr);
      newStream = opBuilder.create<spmd::CastStreamOp>(allocaOpr->getLoc(), address, modelGroup).getResult();
      valueMapping.map(address, newStream);
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of non-LoadOp stream usage\n");
  }
  return newStream;
}

Value getNewReduceOpNCCL(Value reduceOpArg, IRMapping& valueMapping, int modelGroup){
  Value newReduceOp;
  if (valueMapping.contains(reduceOpArg)) {
    newReduceOp = valueMapping.lookup(reduceOpArg);
  } 
  else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(reduceOpArg.getDefiningOp())) {
    const int NCCL_SUM = 0;
    OpBuilder opBuilder(constantOp);
    if(IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      if (integerAttr.getInt() == NCCL_SUM) {
        opBuilder.setInsertionPoint(constantOp.getOperation());
        newReduceOp = opBuilder.create<spmd::ConstOpTypeOp>(constantOp->getLoc(), StringRef("SUM"), modelGroup).getResult();
        valueMapping.map(reduceOpArg, newReduceOp);
      }
      else {
        llvm_unreachable("\nNot implemented case of reduceOp replacement - const reduceOp unknown\n");
      }
    }
    else {
      llvm_unreachable("\nNot implemented case of reduceOp replacement\n");
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of non-constant communicator like commWorld\n");
  }
  return newReduceOp;
}

Value getNewDatatypeNCCL(Value datatypeArg, IRMapping& valueMapping, int modelGroup){
  Value newDatatype;
  if (valueMapping.contains(datatypeArg)) {
    newDatatype = valueMapping.lookup(datatypeArg);
  } 
  else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(datatypeArg.getDefiningOp())) {
    const int NCCL_INT = 2;
    OpBuilder opBuilder(constantOp);
    if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      if (integerAttr.getInt() == NCCL_INT) {
        opBuilder.setInsertionPoint(constantOp.getOperation());
        newDatatype = opBuilder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), opBuilder.getI32Type(), modelGroup).getResult();
        valueMapping.map(datatypeArg, newDatatype);
      }
      else {
        llvm_unreachable("\nNot implemented case of datatype replacement - const datatype unknown\n");
      }
    }
    else {
      llvm_unreachable("\nNot implemented case of datatype replacement\n");
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of non-constant communicator like commWorld\n");
  }
  return newDatatype;
}


Value handleSingleCommArgNCCL(Value origCommArg, IRMapping& valueMapping, bool &worldCommCreated, Value &worldComm, int modelGroup){
  Value newComm;
  if (valueMapping.contains(origCommArg)) {
    newComm = valueMapping.lookup(origCommArg);
  } 
  else {
    llvm_unreachable("\nNot implemented case of comm replacement\n");
  }
  return newComm;
}

Value convertOldToSPMDCommsNCCL(SmallVector<Value> origCommArgs, SmallVector<Operation*> branchLikeOps, IRMapping& valueMapping,
      bool &worldCommCreated, Value &worldComm, int modelGroup, Value sizeArg) {
  Value newCommArg;
  if (sizeArg && origCommArgs.size() == 1) {
    Operation *definingSizeOpr = sizeArg.getDefiningOp();
    if (isa<spmd::GetSizeOfCommOp>(definingSizeOpr) && isa<spmd::CommWorldOp>(definingSizeOpr->getOperand(0).getDefiningOp())) {
      OpBuilder builder(definingSizeOpr);
      builder.setInsertionPoint(origCommArgs[0].getDefiningOp());
      newCommArg = builder.create<spmd::CommWorldOp>(origCommArgs[0].getDefiningOp()->getLoc(), modelGroup).getResult();
      valueMapping.map(origCommArgs[0], newCommArg);
    }
    else {
      llvm_unreachable("\nNot implemented case of non-commWorld communicator of overarching modelGroup\n");
    }
  }
  else if (origCommArgs.size() == 2) {
    if (auto selectOp = dyn_cast<arith::SelectOp>(branchLikeOps[0])) {
      auto newComm1 = handleSingleCommArgNCCL(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
      auto newComm2 = handleSingleCommArgNCCL(origCommArgs[1], valueMapping, worldCommCreated, worldComm, modelGroup);

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
    newCommArg = handleSingleCommArgNCCL(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
  }
  return newCommArg;
}

Value getNewCommNCCL(Value commArg, IRMapping& valueMapping, int modelGroup,
    Value sizeArg = Value(), bool implicitWorld = false, Operation *currentCallOpr = nullptr){
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

  newCommArg = convertOldToSPMDCommsNCCL(origCommArgs, branchLikeOps, valueMapping, worldCommCreated, worldComm, modelGroup, sizeArg);
   
  return newCommArg;
}

void handleGroupReqs(Operation *callOpr, Value newReq, bool *firstExecutionForGroup, Value *ncclGroupReqMemref, int64_t *ncclGroupNumReqs) {
  OpBuilder opBuilder(newReq.getDefiningOp());
  auto loc = newReq.getLoc();

  if (*firstExecutionForGroup) {
    *firstExecutionForGroup = false;
    auto memrefType = MemRefType::get({ShapedType::kDynamic}, opBuilder.getType<spmd::ReqType>());
    opBuilder.setInsertionPointToStart(&(callOpr->getParentOfType<LLVM::LLVMFuncOp>()->getRegion(0).getBlocks().front()));
    auto allocaOp = opBuilder.create<memref::AllocaOp>(loc, memrefType);
    *ncclGroupReqMemref = allocaOp.getResult();
  }
  opBuilder.setInsertionPoint(callOpr);
  auto index = opBuilder.create<arith::ConstantIndexOp>(loc, *ncclGroupNumReqs).getResult();
  opBuilder.create<memref::StoreOp>(loc, newReq, *ncclGroupReqMemref, index);
  (*ncclGroupNumReqs)++;
}

bool convertApiCallNCCL(LLVM::CallOp &llvmCallOp, int modelGroup) {
  OpBuilder opBuilder(llvmCallOp);
  Location loc = llvmCallOp->getLoc();
  std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
  if (!calleeStrRef.has_value()) {
    return false;
  }
  std::string calleeStr = calleeStrRef->str();

  static IRMapping valueMapping;
  static llvm::DenseMap<Value, bool> commValueToBoolMap;
  static bool ncclGroupStarted = false;
  static bool firstExecutionForGroup = true;
  static Value ncclGroupReqMemref;
  static int64_t ncclGroupNumReqs = 0;

  if (calleeStr == "ncclCommInitRank") {   
    // if id is send by a collective to comm world, then rankArg represents equivalently rank of commworld of both modelGroups
    // Todo: for simplicity we just check if sizeArg stems from a commworld and assume that one process is managing one gpu
    Value commArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    // Value idArg = llvmCallOp->getOperand(2);
    // Value rankArg = llvmCallOp->getOperand(3);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup, sizeArg);

    commValueToBoolMap[newComm] = true;

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    opBuilder.create<spmd::InitOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommInitRankConfig") {   
    // if id is send by a collective to comm world, then rankArg represents equivalently rank of commworld of both modelGroups
    // Todo: for simplicity we just check if sizeArg stems from a commworld and assume that one process is managing one gpu
    Value commArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value configArg = llvmCallOp->getOperand(2);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup, sizeArg);

    bool isBlocking = true;

    if (auto castOp = dyn_cast<memref::CastOp>(configArg.getDefiningOp())) {
      // TODO: commented out to build without polygeist dependencies
      // if (auto mem2Ptr = dyn_cast<polygeist::Memref2PointerOp>(castOp.getOperand().getDefiningOp())) {
      //   Value ptr = mem2Ptr.getResult();
      //   for (Operation *user : ptr.getUsers()){
      //     if (user == castOp) {
      //       break;
      //     }
      //     if (auto gepOp = dyn_cast<LLVM::GEPOp>(user)) {
      //       auto rawConstantIndicesAttr = gepOp->getAttrOfType<ArrayAttr>("rawConstantIndices");
      //       if (rawConstantIndicesAttr) {
      //         if (rawConstantIndicesAttr.size() == 2) {
      //           if (auto secondIndexAttr = rawConstantIndicesAttr[1].dyn_cast<IntegerAttr>()) {
      //             int64_t secondIndex = secondIndexAttr.getInt();
      //             if (secondIndex == 3) {
      //               for (Operation *user2 : gepOp.getResult().getUsers()){
      //                 if (auto storeOpr = dyn_cast<LLVM::StoreOp>(user2)) {
      //                   if (auto constOp = dyn_cast<arith::ConstantOp>(storeOpr.getOperand(0).getDefiningOp())) {
      //                     if (auto intAttr = constOp.getValue().dyn_cast<IntegerAttr>()) {
      //                       if (intAttr.getValue().isZero()) {
      //                         isBlocking = false;
      //                       }
      //                       else {
      //                         isBlocking = true;
      //                       }
      //                     }
      //                   }
      //                 }
      //               }
      //             }
      //           }
      //         }
      //       }
      //     }
      //   }
      // }
    }
    commValueToBoolMap[newComm] = isBlocking;

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    opBuilder.create<spmd::InitOp>(loc, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclGroupStart") {
    ncclGroupStarted = true;
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclGroupEnd") {
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value count = opBuilder.create<arith::ConstantOp>(loc, opBuilder.getI32IntegerAttr(ncclGroupNumReqs)).getResult();

    // Define the memref type that can store 1 element of spmd::StatusType
    auto memrefType = MemRefType::get({ncclGroupNumReqs}, opBuilder.getType<spmd::StatusType>());
    // Create the AllocaOp to allocate the memref
    Value newStatuses = opBuilder.create<memref::AllocaOp>(loc, memrefType).getResult();
    opBuilder.create<spmd::WaitAllOp>(loc, opBuilder.getType<spmd::ErrorType>(), count, ncclGroupReqMemref, newStatuses, modelGroup);

    Operation *allocaOpr = ncclGroupReqMemref.getDefiningOp();
    opBuilder.setInsertionPoint(allocaOpr);
    auto memrefType2 = MemRefType::get({ncclGroupNumReqs}, opBuilder.getType<spmd::ReqType>());
    auto newMemref = opBuilder.create<memref::AllocaOp>(loc, memrefType2).getResult();
    ncclGroupReqMemref.replaceAllUsesWith(newMemref);
    allocaOpr->erase();

    ncclGroupStarted = false;
    firstExecutionForGroup = true;
    ncclGroupNumReqs = 0;

    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclBroadcast") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value rootRankArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value streamArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::BcastOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg,
          recvBufArg, countArg, newDatatype, rootRankArg, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::BcastOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
        countArg, newDatatype, rootRankArg, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclBcast") {
    Value sendRecvBufArg = llvmCallOp->getOperand(0);
    Value countArg = llvmCallOp->getOperand(1);
    Value datatypeArg = llvmCallOp->getOperand(2);
    Value rootRankArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value streamArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::BcastOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendRecvBufArg, sendRecvBufArg,
        countArg, newDatatype, rootRankArg, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::BcastOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendRecvBufArg, sendRecvBufArg,
        countArg, newDatatype, rootRankArg, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclReduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value rootRankArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    Value streamArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewReduceOpNCCL(reduceOpArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::ReduceOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, rootRankArg, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::ReduceOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, rootRankArg, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclAllGather") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value streamArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::AllgatherOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg,  
        countArg, newDatatype, recvBufArg, countArg, newDatatype, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::AllgatherOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg,  
        countArg, newDatatype, recvBufArg, countArg, newDatatype, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclAllReduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value streamArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewReduceOpNCCL(reduceOpArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::AllreduceOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::AllreduceOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclReduceScatter") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value streamArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeNCCL(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewReduceOpNCCL(reduceOpArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::ReduceScatterOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::ReduceScatterOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg, countArg,
        newDatatype, newReduceOp, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclSend") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value destRankArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value streamArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeNCCL(sendTypeArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    //TODO: Use a default tag instead of just 0, although it should be technically the same
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value zero = opBuilder.create<arith::ConstantOp>(loc, opBuilder.getI32IntegerAttr(0)).getResult();

    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::SendOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, sendCountArg,
        newSendType, destRankArg, zero, newStream, /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::SendOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, sendBufArg, sendCountArg,
        newSendType, destRankArg, zero, newStream, /*isBlocking=*/commValueToBoolMap[newComm], /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclRecv") {
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value srcRankArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value streamArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeNCCL(recvTypeArg, valueMapping, modelGroup);
    Value newStream = getNewStreamNCCL(streamArg, valueMapping, modelGroup);

    //TODO: Use a default tag instead of just 0, although it should be technically the same
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value zero = opBuilder.create<arith::ConstantOp>(loc, opBuilder.getI32IntegerAttr(0)).getResult();

    if (ncclGroupStarted){
      Value newReq = opBuilder.create<spmd::RecvOp>(loc, opBuilder.getType<spmd::ReqType>(), opBuilder.getType<spmd::ErrorType>(), newComm, recvBufArg, recvCountArg,
        newRecvType, srcRankArg, zero, newStream, /*isBlocking=*/false, modelGroup).getResult(0);
      handleGroupReqs(llvmCallOp.getOperation(), newReq, &firstExecutionForGroup, &ncclGroupReqMemref, &ncclGroupNumReqs);
    }
    else {
      opBuilder.create<spmd::RecvOp>(loc, Type(), opBuilder.getType<spmd::ErrorType>(), newComm, recvBufArg, recvCountArg,
        newRecvType, srcRankArg, zero, newStream, /*isBlocking=*/commValueToBoolMap[newComm], modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommSplit") {
    Value parentCommArg = llvmCallOp->getOperand(0);
    Value colorArg = llvmCallOp->getOperand(1);
    Value keyArg = llvmCallOp->getOperand(2);
    Value newCommArg = llvmCallOp->getOperand(3);
    Value configArg = llvmCallOp->getOperand(4);

    if (isa<LLVM::ZeroOp>(configArg.getDefiningOp())) {
      configArg = Value();
    }
    else {
      llvm_unreachable("\nNot implemented case of configArg replacement\n");
    }

    if (auto castOp = dyn_cast<memref::CastOp>(newCommArg.getDefiningOp())) {
      newCommArg = castOp->getOperand(0);
    }
    else if (auto llvmAllocaOp = dyn_cast<LLVM::AllocaOp>(newCommArg.getDefiningOp())) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of comm split replacement\n");
    }
    
    Value newParentComm = getNewCommNCCL(parentCommArg, valueMapping, modelGroup);
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value newNewComm = opBuilder.create<spmd::CommSplitOp>(loc, newParentComm, colorArg, keyArg, Value(), modelGroup).getResult(0);
    commValueToBoolMap[newNewComm] = commValueToBoolMap[newParentComm];
    valueMapping.map(newCommArg, newNewComm);
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommDestroy") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    if (isa<spmd::CommWorldOp>(newComm.getDefiningOp())){
      // do nothing, as commworld do not need to be destroyed in the spmd dialect
    }
    else {
      opBuilder.setInsertionPoint(llvmCallOp.getOperation());
      opBuilder.create<spmd::CommDestroyOp>(loc, newComm, modelGroup);
    }
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommUserRank") {
    Value commArg = llvmCallOp->getOperand(0);
    Value rankArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value newRank = opBuilder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup).getResult(0);
    replaceMemrefByValue(rankArg, newRank, llvmCallOp.getOperation());
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommCuDevice") {
    Value commArg = llvmCallOp->getOperand(0);
    Value deviceArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value newDevice = opBuilder.create<spmd::GetDeviceInCommOp>(loc, newComm, modelGroup).getResult(0);
    replaceMemrefByValue(deviceArg, newDevice, llvmCallOp.getOperation());
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclCommCount") {
    Value commArg = llvmCallOp->getOperand(0);
    Value countArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommNCCL(commArg, valueMapping, modelGroup);
    
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value newCount = opBuilder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup).getResult(0);
    replaceMemrefByValue(countArg, newCount, llvmCallOp.getOperation());
    llvmCallOp->erase();
    return true;
  }
  else if (calleeStr == "ncclMemAlloc") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommNCCL(Value(), valueMapping, modelGroup, Value(), true, llvmCallOp.getOperation());
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    Value newPtr = opBuilder.create<spmd::MallocOp>(loc, ptrArg.getType(), opBuilder.getType<spmd::ErrorType>(), newComm, sizeArg, Value(), modelGroup).getResult(0);
    // ptrArg.replaceAllUsesWith(newPtr);
    replaceMemrefByValue(ptrArg, newPtr, llvmCallOp.getOperation());
    llvmCallOp->erase();
    return true;
    // replaceMemrefByValue(ptrArg, newPtr);
  }
  else if (calleeStr == "ncclMemFree") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommNCCL(Value(), valueMapping, modelGroup, Value(), true, llvmCallOp.getOperation());
    opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    opBuilder.create<spmd::FreeOp>(loc, opBuilder.getType<spmd::ErrorType>(), newComm, ptrArg, modelGroup);
    llvmCallOp->erase();
    return true;
  }
  // else if (calleeStr == "ncclCommGetAsyncError") {
    // Value commArg = llvmCallOp->getOperand(0);
    // Value asyncErrorArg = llvmCallOp->getOperand(1);
 
    // Value idx;
    // Value reqArgMemref = getMemref(reqArg, &idx);
    // Value newReqMemref = getNewReqMPI(reqArgMemref, valueMapping, modelGroup);
    // Value idx2;
    // Value statusMemref = getMemref(statusArg, &idx2);
    // Value newStatuses = getNewStatusesMPI(statusMemref, valueMapping, true);

    // opBuilder.setInsertionPoint(llvmCallOp.getOperation());
    // Value countOne = opBuilder.create<arith::ConstantOp>(loc, opBuilder.getI32IntegerAttr(1)).getResult();
    // Value newFlag = opBuilder.create<spmd::TestAllOp>(loc, opBuilder.getI1Type(), opBuilder.getType<spmd::ErrorType>(),
    //     countOne, newReqMemref, newStatuses, modelGroup).getResult(0);
    // Value castedFlag = opBuilder.create<arith::ExtUIOp>(loc, opBuilder.getI32Type(), newFlag).getResult();
    // llvmCallOp->erase();
    // return true;
    // replaceMemrefByValue(asyncErrorArg, castedFlag);
  // }
  else {
    return false;
  }
}

void deleteApiCalleesNCCL(ModuleOp moduleOp) {
  SmallVector<StringRef> mpiCallees {"ncclCommInitRank", "ncclCommInitRankConfig", "ncclCommDestroy", "ncclBcast", "ncclBroadcast",
      "ncclReduce", "ncclCommUserRank", "ncclAllGather", "ncclAllReduce", "ncclReduceScatter", "ncclCommSplit", "ncclCommDestroy",
      "ncclGroupStart", "ncclGroupEnd", "ncclSend", "ncclRecv" , "ncclCommCount", "ncclMemAlloc", "ncclMemFree", "ncclCommCuDevice",
      "ncclCommGetAsyncError"};
  for (StringRef str : mpiCallees) {
    if (Operation *opr = moduleOp.lookupSymbol(str)) {
      opr->erase();
    }
  }
}

} // namespace mlir::spmd