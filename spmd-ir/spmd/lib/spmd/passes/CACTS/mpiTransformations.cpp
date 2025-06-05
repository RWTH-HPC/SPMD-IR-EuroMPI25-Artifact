//===- mpiTransformations.cpp - Convert mpi api calls to spmd dialect - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This defines functions for converting mpi func call operations to the spmd dialect
//
//===----------------------------------------------------------------------===//

#include "mpiTransformations.h"

namespace mlir::spmd {

  Value getNewOpTypeMPI(Value reduceOpArg, IRMapping& valueMapping, int modelGroup){
    Value newReduceOp;
    if (valueMapping.contains(reduceOpArg)) {
      newReduceOp = valueMapping.lookup(reduceOpArg);
    } 
    else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(reduceOpArg.getDefiningOp())) {
      const int MPI_MAX     = 1476395009;
      const int MPI_MIN     = 1476395010;
      const int MPI_SUM     = 1476395011;
      const int MPI_PROD    = 1476395012;
      const int MPI_LAND    = 1476395013;
      const int MPI_BAND    = 1476395014;
      const int MPI_LOR     = 1476395015;
      const int MPI_BOR     = 1476395016;
      const int MPI_LXOR    = 1476395017;
      const int MPI_BXOR    = 1476395018;
      const int MPI_MINLOC  = 1476395019;
      const int MPI_MAXLOC  = 1476395020;
      const int MPI_REPLACE = 1476395021;
      const int MPI_NO_OP   = 1476395022;
      const int MPIX_EQUAL  = 1476395023;
  
      OpBuilder builder(constantOp);
      builder.setInsertionPoint(constantOp.getOperation());
  
      if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
        int opVal = integerAttr.getInt();
        StringRef opName;
  
        switch (opVal) {
          case MPI_MAX:     opName = "MAX"; break;
          case MPI_MIN:     opName = "MIN"; break;
          case MPI_SUM:     opName = "SUM"; break;
          case MPI_PROD:    opName = "PROD"; break;
          case MPI_LAND:    opName = "LAND"; break;
          case MPI_BAND:    opName = "BAND"; break;
          case MPI_LOR:     opName = "LOR"; break;
          case MPI_BOR:     opName = "BOR"; break;
          case MPI_LXOR:    opName = "LXOR"; break;
          case MPI_BXOR:    opName = "BXOR"; break;
          case MPI_MINLOC:  opName = "MINLOC"; break;
          case MPI_MAXLOC:  opName = "MAXLOC"; break;
          case MPI_REPLACE: opName = "REPLACE"; break;
          case MPI_NO_OP:   opName = "NO_OP"; break;
          case MPIX_EQUAL:  opName = "EQUAL"; break;
          default:
            llvm_unreachable("\nNot implemented case of reduceOp replacement - const reduceOp unknown\n");
        }
  
        newReduceOp = builder.create<spmd::ConstOpTypeOp>(constantOp->getLoc(), opName, modelGroup).getResult();
      } else {
        llvm_unreachable("\nNot implemented case of reduceOp replacement\n");
      }
  
      valueMapping.map(reduceOpArg, newReduceOp);
    } 
    else {
      llvm_unreachable("\nNot implemented case of reduceOp replacement\n");
    }
  
    return newReduceOp;
  }
  

Value getNewLockTypeMPI(Value lockTypeArg, IRMapping& valueMapping, int modelGroup){
  Value newLockType;
  if (valueMapping.contains(lockTypeArg)) {
    newLockType = valueMapping.lookup(lockTypeArg);
  } 
  else if (auto constantOp = dyn_cast<arith::ConstantOp>(lockTypeArg.getDefiningOp())) {
    const int MPI_LOCK_EXCLUSIVE = 234;
    const int MPI_LOCK_SHARED = 235;

    OpBuilder builder(constantOp);
    if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      if (integerAttr.getInt() == MPI_LOCK_EXCLUSIVE) {
        builder.setInsertionPoint(constantOp.getOperation());
        newLockType = builder.create<spmd::ConstLockTypeOp>(constantOp->getLoc(), StringRef("EXCLUSIVE"), modelGroup).getResult();
        valueMapping.map(lockTypeArg, newLockType);
      }
      else if (integerAttr.getInt() == MPI_LOCK_SHARED) {
        builder.setInsertionPoint(constantOp.getOperation());
        newLockType = builder.create<spmd::ConstLockTypeOp>(constantOp->getLoc(), StringRef("SHARED"), modelGroup).getResult();
        valueMapping.map(lockTypeArg, newLockType);
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
  return newLockType;
}



Value getNewDatatypeMPI(Value datatypeArg, IRMapping& valueMapping, int modelGroup){
  Value newDatatype;
  if (valueMapping.contains(datatypeArg)) {
    newDatatype = valueMapping.lookup(datatypeArg);
  } 
  else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(datatypeArg.getDefiningOp())) {
    const int MPI_INT = 1275069445;
    const int MPI_BYTE = 1275068685;
    const int MPI_DOUBLE = 1275070475;
    const int MPI_CHAR = 1275068673;
    const int MPI_UNSIGNED_CHAR = 1275068674;
    const int MPI_SHORT = 1275068931;
    const int MPI_FLOAT = 1275069450;
    const int MPI_C_BOOL = 1275068735;
    
    const int MPI_UNSIGNED = 1275069446;
    const int MPI_UNSIGNED_LONG = 1275070472;
    const int MPI_LONG = 1275070471;
    const int MPI_DOUBLE_INT = -1946157055;
    const int MPI_2_INT = 1275070486;
    const int MPI_FLOAT_INT = -1946157056;
    const int MPI_UNSIGNED_LONG_LONG = 1275070489;
    const int MPI_LONG_DOUBLE = 1275072524;
    const int MPI_LONG_LONG_INT = 1275070473;
    
    const int MPI_UINT64_T = 1275070526;

  
    OpBuilder builder(constantOp);
    if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      builder.setInsertionPoint(constantOp.getOperation());
      if (integerAttr.getInt() == MPI_C_BOOL) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI1Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_CHAR || integerAttr.getInt() == MPI_UNSIGNED_CHAR) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI8Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_SHORT) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI16Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_INT || integerAttr.getInt() == MPI_UNSIGNED) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI32Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_UNSIGNED_LONG || integerAttr.getInt() == MPI_UNSIGNED_LONG_LONG
          || integerAttr.getInt() == MPI_LONG || integerAttr.getInt() == MPI_LONG_LONG_INT || integerAttr.getInt() == MPI_UINT64_T) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI64Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_BYTE) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getI8Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_FLOAT) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getF32Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_DOUBLE) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getF64Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_LONG_DOUBLE) {
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), builder.getF128Type(), modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_DOUBLE_INT) {
        auto tupleType = builder.getTupleType({builder.getF64Type(), builder.getI32Type()});
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), tupleType, modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_FLOAT_INT) {
        auto tupleType = builder.getTupleType({builder.getF32Type(), builder.getI32Type()});
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), tupleType, modelGroup).getResult();
      }
      else if (integerAttr.getInt() == MPI_2_INT) {
        auto tupleType = builder.getTupleType({builder.getI32Type(), builder.getI32Type()});
        newDatatype = builder.create<spmd::ConstDatatypeOp>(constantOp->getLoc(), tupleType, modelGroup).getResult();
      }
      else {
        llvm_unreachable("\nNot implemented case of datatype replacement - const datatype unknown\n");
      }
      valueMapping.map(datatypeArg, newDatatype);
    }
    else {
      llvm_unreachable("\nNot implemented case of datatype replacement\n");
    }
  }
  else {
    llvm_unreachable("\nNot implemented case of datatype replacement\n");
  }
  return newDatatype;
}



Value handleSingleCommArgMPI(Value origCommArg, IRMapping& valueMapping, bool &worldCommCreated, Value &worldComm, int modelGroup){
  Value newComm;
  if (valueMapping.contains(origCommArg)) {
    newComm = valueMapping.lookup(origCommArg);
  } 
  else if (arith::ConstantOp constantOp = dyn_cast<arith::ConstantOp>(origCommArg.getDefiningOp())) {
    const int MPI_COMM_WORLD = 1140850688;
    OpBuilder builder(constantOp);
    if (IntegerAttr integerAttr = dyn_cast<IntegerAttr>(constantOp.getValueAttr())) {
      if (integerAttr.getInt() == MPI_COMM_WORLD) {
        builder.setInsertionPoint(constantOp.getOperation());
        newComm = builder.create<spmd::CommWorldOp>(constantOp->getLoc(), modelGroup).getResult();
        valueMapping.map(origCommArg, newComm);
        worldCommCreated = true;
        worldComm = newComm;
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
    llvm_unreachable("\nNot implemented case of non-constant communicator like commWorld\n");
  }
  return newComm;
}

Value convertOldToSPMDCommsMPI(SmallVector<Value> origCommArgs, SmallVector<Operation*> branchLikeOps, IRMapping& valueMapping,
      bool &worldCommCreated, Value &worldComm, int modelGroup) {
  Value newCommArg;
  if (origCommArgs.size() == 2) {
    if (auto selectOp = dyn_cast<arith::SelectOp>(branchLikeOps[0])) {
      auto newComm1 = handleSingleCommArgMPI(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
      auto newComm2 = handleSingleCommArgMPI(origCommArgs[1], valueMapping, worldCommCreated, worldComm, modelGroup);

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
    newCommArg = handleSingleCommArgMPI(origCommArgs[0], valueMapping, worldCommCreated, worldComm, modelGroup);
  }
  return newCommArg;
}

Value getNewWinMPI(Value winArgAddr, IRMapping &winMapping){
  Value newWinArg;
  if (winMapping.contains(winArgAddr)) {
    newWinArg = winMapping.lookup(winArgAddr);
  } 
  else {
    llvm_unreachable("\nNot implemented case of unknown winArg\n");
  }
  return newWinArg;
}



Value getNewCommMPI(Value commArg, IRMapping& valueMapping, int modelGroup,
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

  newCommArg = convertOldToSPMDCommsMPI(origCommArgs, branchLikeOps, valueMapping, worldCommCreated, worldComm, modelGroup);
   
  return newCommArg;
}

Value getNewStatusesMPI(Value statusMemref, IRMapping& valueMapping, bool isSingle, Value reqMemref = Value()) {
  Value newStatuses;
  OpBuilder builder(statusMemref.getDefiningOp());
  auto loc = statusMemref.getLoc();
  if (valueMapping.contains(statusMemref)) {
    newStatuses = valueMapping.lookup(statusMemref);
  } 
  if (isSingle){
    // Define the memref type that can store 1 element of spmd::StatusType
    auto memrefType = MemRefType::get({1}, builder.getType<spmd::StatusType>());
    // Create the AllocaOp to allocate the memref
    newStatuses = builder.create<memref::AllocaOp>(loc, memrefType).getResult();

    valueMapping.map(statusMemref, newStatuses);
  }
  else {
    // Define the memref type that can store arbitrarily many element sof spmd::StatusType
    auto memrefType = MemRefType::get({cast<MemRefType>(reqMemref.getType()).getShape()[0]}, builder.getType<spmd::StatusType>());
    // Create the AllocaOp to allocate the memref
    newStatuses = builder.create<memref::AllocaOp>(loc, memrefType).getResult();

    valueMapping.map(statusMemref, newStatuses);
  }
  return newStatuses;
}

Value getNewReqMPI(Value reqArgAddress, IRMapping &reqMapping, int modelGroup){
  Value newReq;

  if (reqMapping.contains(reqArgAddress)) {
    newReq = reqMapping.lookup(reqArgAddress);
  } 
  else if (isa<arith::SelectOp>(reqArgAddress.getDefiningOp())) {
    newReq = reqArgAddress;
  // do nothing
  }
  else {
    llvm_unreachable("\nNot implemented case of getting req\n");
  }

  return newReq;
}

// Value getMemref(Value &arg, Value *idx) {
//   Value argMemref;
//   if (auto castOp = dyn_cast<memref::CastOp>(arg.getDefiningOp())) {
//     argMemref = castOp->getOperand(0);
//   }
//   else if (auto llvmAllocaOp = dyn_cast<LLVM::AllocaOp>(arg.getDefiningOp())) {
//     argMemref = arg;
//   // do nothing
//   }
//   // TODO: commented out to build without polygeist dependencies
//   // else if (auto subIdxOp = dyn_cast<polygeist::SubIndexOp>(arg.getDefiningOp())) {
//   //   argMemref = subIdxOp->getOperand(0);
//   //   *idx = subIdxOp->getOperand(1);
//   // }
//   else if (isa<arith::SelectOp>(arg.getDefiningOp())) {
//     argMemref = arg;
//   // do nothing
//   }
//   else {
//     llvm_unreachable("\nNot implemented case of getMemref\n");
//   }
//   return argMemref;
// }

// Value setNewReqMemref(IRMapping &valueMapping, Value idx, Value reqArgAddress, Value newReq, Operation *newOpr) {
//   Value newReqAdress;
//   Operation *oldMemrefOpr = reqArgAddress.getDefiningOp();
//   OpBuilder builder(oldMemrefOpr);
//   if (valueMapping.contains(reqArgAddress)) {
//     newReqAdress = valueMapping.lookup(reqArgAddress);
//   } 
//   else {
//     auto loc = oldMemrefOpr->getLoc();
//     builder.setInsertionPoint(oldMemrefOpr);
//     Type reqType = builder.getType<spmd::ReqType>();
//     // if (isa<MemRefType>(reqArgAddress.getType())) {
//     // Define the memref type that can store 1 element of spmd::ReqType
//     // auto memrefType = MemRefType::get({1}, reqType);
//     // Create the AllocaOp to allocate the memref
//     auto allocaOp = builder.create<memref::AllocaOp>(loc, memrefType);
//     newReqAdress = allocaOp.getResult();
//     // }
//     // else if (isa<LLVM::LLVMPointerType>(reqArgAddress.getType())){
//     //   auto ptrType = builder.getType<LLVM::LLVMPointerType>();
//     //   Value one = builder.create<LLVM::ConstantOp>(loc, builder.getI64Type(), builder.getIntegerAttr(builder.getI64Type(), 1));
//     //   auto allocaOp = builder.create<LLVM::AllocaOp>(loc, ptrType, reqType, one, /*alignment=*/0);
//     //   newReqAdress = allocaOp.getResult();
//     // } 
//     // else {
//     //   llvm_unreachable("\nNot implemented case for setNewReqMemref\n");
//     // }
//     valueMapping.map(reqArgAddress, newReqAdress);
//   }
  
//   builder.setInsertionPointAfter(newOpr);
//   auto loc2 = newOpr->getLoc();
//   // Store the new Req value into the allocated memref
//   if (!idx){
//     idx = builder.create<arith::ConstantIndexOp>(loc2, 0).getResult();
//     builder.setInsertionPointAfterValue(idx);
//   }
//   // if (isa<MemRefType>(reqArgAddress.getType())) {
//     builder.create<memref::StoreOp>(loc2, newReq, newReqAdress, idx);
//   // }
//   // else if (isa<LLVM::LLVMPointerType>(reqArgAddress.getType())){
//   //   builder.create<LLVM::StoreOp>(loc2, newReq, newReqAdress);
//   // } 
//   // else {
//   //   llvm_unreachable("\nNot implemented case for setNewReqMemref\n");
//   // }
//   return newReqAdress;
// }


void createWaitAll(Value reqArgMemref, Value req1, Value req2, mlir::Location loc, int modelGroup) {
  OpBuilder builder(reqArgMemref.getDefiningOp());
  auto reqArgMemrefLoc = reqArgMemref.getLoc(); 
  builder.setInsertionPoint(reqArgMemref.getDefiningOp());
  // Define the memref type that can store 2 elements of spmd::ReqType
  auto memrefType = MemRefType::get({2}, builder.getType<spmd::ReqType>());

  // Create the AllocaOp to allocate the memref
  auto allocaOp = builder.create<memref::AllocaOp>(reqArgMemrefLoc, memrefType);
  Value newReqMemref = allocaOp.getResult();

  auto zeroIndex = builder.create<arith::ConstantIndexOp>(loc, 0).getResult();
  auto oneIndex = builder.create<arith::ConstantIndexOp>(loc, 1).getResult();

  builder.setInsertionPointAfterValue(req2);
  builder.create<memref::StoreOp>(loc, req2, allocaOp, oneIndex);
  builder.create<memref::StoreOp>(loc, req1, allocaOp, zeroIndex);


  for (Operation *user : reqArgMemref.getUsers()) {
    if (auto castOp = dyn_cast<memref::CastOp>(user)){
      for(Operation *user2 : castOp.getResult().getUsers()) {
        if (auto llvmCallOp2 = dyn_cast<LLVM::CallOp>(user2)) {
          std::optional<llvm::StringRef> calleeStrRef2 = llvmCallOp2.getCallee();
          if (*calleeStrRef2 == "MPI_Wait") {
            // Value statusArg = llvmCallOp->getOperand(1);
            builder.setInsertionPoint(llvmCallOp2.getOperation());

            // Todo: here now 2 instead of 1 status is generated, this needs to be handled if the status is used in the program
            // Define the memref type that can store 2 elements of spmd::StatusType
            auto memrefType = MemRefType::get({2}, builder.getType<spmd::StatusType>());
            // Create the AllocaOp to allocate the memref
            Value newStatuses = builder.create<memref::AllocaOp>(loc, memrefType).getResult();
            Value countTwo = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(2)).getResult();
            builder.create<spmd::WaitAllOp>(llvmCallOp2->getLoc(), builder.getType<spmd::ErrorType>(), countTwo, newReqMemref, newStatuses, modelGroup);
            llvmCallOp2->erase();
            // replaceMemrefByValue(statusArg, newStatus);
          }
        }
      } 
    }
  }   
}


// bool canBeRemoved(){
//           const int MPI_DATATYPE_NULL = 201326592;
//     if (isa<LLVM::ZeroOp>(originAddrArg.getDefiningOp()) && )


// }

bool isStatusIgnore(Value statusArg) {
  // Check if the operation is an LLVM `inttoptr`
  auto intToPtrOp = statusArg.getDefiningOp<LLVM::IntToPtrOp>();
  if (!intToPtrOp)
    return false;

  // Get the operand of the `inttoptr` operation
  Value operand = intToPtrOp.getOperand();

  // Check if the operand is defined by an `arith.constant` operation
  auto constantOp = operand.getDefiningOp<mlir::arith::ConstantOp>();
  if (!constantOp)
    return false;

  // Check if the constant value is `1` and its type is `i64`
  auto intAttr = dyn_cast<mlir::IntegerAttr>(constantOp.getValue());
  if (!intAttr || intAttr.getValue() != 1)
    return false;

  // if (!intAttr.getType().isSignlessInteger(64))
  //   return false;

  return true;
}

//return 0 as default value
long getIdx(Value reqArg) {
  auto defOpr = reqArg.getDefiningOp();
  if(!defOpr)
    return 0;

  if (isa<LLVM::AllocaOp>(defOpr)){
    return 0;
  }
  else if(auto gepOp = dyn_cast<LLVM::GEPOp>(defOpr)){
    // Get offset element type and byte size
    auto elemType = gepOp.getElemType();
    int64_t offsetSize = 0;
    if (auto intType = dyn_cast<IntegerType>(elemType)) {
      offsetSize = intType.getWidth() / 8;
    } 
    else {
      return 0;
    }

  // Step 2: Get base pointer and trace it back
  Value base = gepOp.getBase();
  auto allocaOp = base.getDefiningOp<LLVM::AllocaOp>();
  if (!allocaOp)
    return 0;

  // Step 3: Check that array size is 1
  auto arraySize = allocaOp.getArraySize();
  int64_t arraySizeInt = 0;
  // Check if the index is a constant integer
  if (auto constOp = arraySize.getDefiningOp<LLVM::ConstantOp>()) {
    // We expect a constant integer value 
    if (auto intAttr = dyn_cast<IntegerAttr>(constOp.getValue())) {
      arraySizeInt = intAttr.getInt();
    } 
    else {
      return 0; // Not a valid integer constant
    }
  } 
  else {
    return 0;
  }

  if (arraySizeInt != 1)
    return 0;

  // Step 4: Get array element type and its byte size
  auto allocatedType = allocaOp.getElemType();
  auto arrayType = dyn_cast<LLVM::LLVMArrayType>(allocatedType);
  if (!arrayType)
    return 0;

  int32_t arrayElemSize = 0;
  if (auto intType = dyn_cast<IntegerType>(arrayType.getElementType())) {
    arrayElemSize = intType.getWidth() / 8;
  } else {
    return 0;
  }

  // Step 5: Get GEP index (must be constant)
  if (gepOp.getDynamicIndices().size() != 0) 
    return 0;

  auto indices = gepOp.getRawConstantIndices();
  if (indices.size() != 1)
    return 0;

  // Extract the index
  int32_t gepOffset = indices[0] * offsetSize;

  // Step 6: Compare offset
  if (gepOffset % arrayElemSize != 0)
    return 0;

  long elementIndex = gepOffset / arrayElemSize;

  // Return the index or do whatever you need
  return elementIndex;

  return 0;

  }
  else {
    return 0;
  }
}

// reqMapping stores the mapping from old req values to new req values
void wrapReqIntoMemref(Operation *llvmCallOpr, Value reqArg, Value newReq, IRMapping &addressMapping, IRMapping &reqMapping) {
  OpBuilder builder(llvmCallOpr);
  Value oldReqAddr = getAddress(reqArg, addressMapping);
  auto oldDefOpr = oldReqAddr.getDefiningOp();
  if (!oldDefOpr) 
    llvm_unreachable("\nNot implemented case of wrapReqIntoMemref\n");
  Value memref = reqMapping.lookupOrNull(oldReqAddr);
  if (!memref) {
    Location loc = oldDefOpr->getLoc();
    builder.setInsertionPoint(oldDefOpr);
    Type type = newReq.getType();
    // val is a Value representing something like %146
    long numElems = 1;
    if (auto *defOpr = oldReqAddr.getDefiningOp()) {
      if (auto allocaOp = dyn_cast<LLVM::AllocaOp>(defOpr)) {
        // You can now inspect the allocated type:
        // Type allocatedType = allocaOp.getType();  // this is a ptr type
        Type elementType = allocaOp.getElemType();  // this is the element, e.g., !llvm.array<2 x i32>
        if (auto arrayType = dyn_cast<LLVM::LLVMArrayType>(elementType)) {
          numElems = arrayType.getNumElements();
          // llvm::outs() << "Element type: " << arrayType.getElementType() << "\n";
        }
      }
    }
    MemRefType memRefType = MemRefType::get({numElems}, type);
    Value newMemref = builder.create<memref::AllocaOp>(loc, memRefType).getResult();
    reqMapping.map(oldReqAddr, newMemref);
    memref = newMemref;
  }

  //need to implement a check for the case that a memref for the same previous req value is already created
  // if I just create anoteher one, this could lead to a problem
  // I can do this by either tagging the oldReqAddrOp once I create a memref for it
  // or I can check if the oldReqAddrOp is already in the valueMapping map or similar structure maybe storing it here statically

  builder.setInsertionPoint(llvmCallOpr);
  Location loc = llvmCallOpr->getLoc();
  long idx = getIdx(reqArg); // return 0 if not possible
  arith::ConstantIndexOp indexOp = builder.create<arith::ConstantIndexOp>(loc, idx);
  auto index = indexOp.getResult();
  builder.create<memref::StoreOp>(loc, newReq, memref, index);
}

Value unwrapReqFromMemref(Operation *llvmCallOpr, Value memref) {
  OpBuilder builder(llvmCallOpr);
  Location loc = llvmCallOpr->getLoc();
  builder.setInsertionPoint(llvmCallOpr);
  arith::ConstantIndexOp indexOp = builder.create<arith::ConstantIndexOp>(loc, 0);
  auto index0 = indexOp.getResult();
  return builder.create<memref::LoadOp>(loc, memref, index0)->getResult(0);
}

bool isInPlace(Value sendBuf) {
  // Check if the operation is an LLVM `inttoptr`
  auto intToPtrOp = sendBuf.getDefiningOp<LLVM::IntToPtrOp>();
  if (!intToPtrOp)
    return false;

  // Get the operand of the `inttoptr` operation
  Value operand = intToPtrOp.getOperand();

  // Check if the operand is defined by an `arith.constant` operation
  auto constantOp = operand.getDefiningOp<mlir::arith::ConstantOp>();
  if (!constantOp)
    return false;

  // Check if the constant value is `-1` and its type is `i64`
  auto intAttr = dyn_cast<mlir::IntegerAttr>(constantOp.getValue());
  if (!intAttr || intAttr.getValue() != -1)
    return false;

  // if (!intAttr.getType().isSignlessInteger(64))
  //   return false;

  return true;
}

void handleErrorCode(Operation *llvmCallOpr, Value newError){
  OpBuilder builder(llvmCallOpr);
  Location loc = llvmCallOpr->getLoc();
  // Replace all uses of the old call error code with the new error code
  Value oldError = llvmCallOpr->getResult(0);
  Value newErrorI32 = builder.create<spmd::CastSPMDErrorToI32Op>(loc, builder.getI32Type(), newError);
  oldError.replaceAllUsesWith(newErrorI32);
}

// valueMapping stores already converted and erased Ops values, to reuse them in future conversion of other Ops
bool convertApiCallMPI(LLVM::CallOp &llvmCallOp, int modelGroup) {
  OpBuilder builder(llvmCallOp);
  Location loc = llvmCallOp->getLoc();
  std::optional<llvm::StringRef> calleeStrRef = llvmCallOp.getCallee();
  if (!calleeStrRef.has_value()) {
    return false;
  }

  static IRMapping valueMapping;
  static IRMapping reqMapping;
  static IRMapping winMapping;

  if (*calleeStrRef == "MPI_Init") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::InitOp>(loc, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Finalize") {
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::FinalizeOp>(loc, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Abort") {
    Value commArg = llvmCallOp->getOperand(0);
    Value errorCodeArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::AbortOp>(loc, newComm, errorCodeArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Comm_rank") {
    Value commArg = llvmCallOp->getOperand(0);
    Value rankArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::GetRankInCommOp>(loc, newComm, modelGroup);
    Value newRank = newOp.getResult(0);
    replaceMemrefByValue(rankArg, newRank, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Comm_size") {
    Value commArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::GetSizeOfCommOp>(loc, newComm, modelGroup);
    Value newSize = newOp.getResult(0);
    replaceMemrefByValue(sizeArg, newSize, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Barrier") {
    Value commArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::BarrierOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Ibarrier") {
    Value commArg = llvmCallOp->getOperand(0);
    Value reqArg = llvmCallOp->getOperand(1);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::BarrierOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
        newComm, /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Bcast") {
    Value sendRecvBufArg = llvmCallOp->getOperand(0);
    Value countArg = llvmCallOp->getOperand(1);
    Value datatypeArg = llvmCallOp->getOperand(2);
    Value rootRankArg = llvmCallOp->getOperand(3);

    Value commArg = llvmCallOp->getOperand(4);
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::BcastOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendRecvBufArg, sendRecvBufArg, castedCount, newDatatype, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Ibcast") {
    Value sendRecvBufArg = llvmCallOp->getOperand(0);
    Value countArg = llvmCallOp->getOperand(1);
    Value datatypeArg = llvmCallOp->getOperand(2);
    Value rootRankArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value reqArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::BcastOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendRecvBufArg,
      sendRecvBufArg, castedCount, newDatatype, rootRankArg, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Gather") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value rootRankArg = llvmCallOp->getOperand(6);
    Value commArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::GatherOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Igather") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value rootRankArg = llvmCallOp->getOperand(6);
    Value commArg = llvmCallOp->getOperand(7);
    Value reqArg = llvmCallOp->getOperand(8);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::GatherOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, rootRankArg, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Allgather") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::AllgatherOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Iallgather") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    Value reqArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::AllgatherOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Alltoall") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::AlltoallOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Ialltoall") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    Value reqArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::AlltoallOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);

    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Reduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value rootRankArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ReduceOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Ireduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value rootRankArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    Value reqArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ReduceOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, rootRankArg, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Allreduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::AllreduceOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Iallreduce") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::AllreduceOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Scan") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ScanOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Iscan") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ScanOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Exscan") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ExscanOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Iexscan") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ExscanOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Scatter") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value rootRankArg = llvmCallOp->getOperand(6);
    Value commArg = llvmCallOp->getOperand(7);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::ScatterOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, rootRankArg, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Iscatter") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value recvBufArg = llvmCallOp->getOperand(3);
    Value recvCountArg = llvmCallOp->getOperand(4);
    Value recvTypeArg = llvmCallOp->getOperand(5);
    Value rootRankArg = llvmCallOp->getOperand(6);
    Value commArg = llvmCallOp->getOperand(7);
    Value reqArg = llvmCallOp->getOperand(8);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    if (isInPlace(sendBufArg)) {
      sendBufArg = recvBufArg;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::ScatterOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, recvBufArg, castedRecvCount, newRecvType, rootRankArg, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Reduce_scatter_block") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ReduceScatterOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Ireduce_scatter_block") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value recvBufArg = llvmCallOp->getOperand(1);
    Value countArg = llvmCallOp->getOperand(2);
    Value datatypeArg = llvmCallOp->getOperand(3);
    Value reduceOpArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newDatatype = getNewDatatypeMPI(datatypeArg, valueMapping, modelGroup);
    Value newReduceOp = getNewOpTypeMPI(reduceOpArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    auto newOp = builder.create<spmd::ReduceScatterOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, recvBufArg,
       castedCount, newDatatype, newReduceOp, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }

  else if (*calleeStrRef == "MPI_Sendrecv") {
    llvm_unreachable("MPI_Sendrecv is not supported yet, implementation is deprecated");
    // Value sendBufArg = llvmCallOp->getOperand(0);
    // Value sendCountArg = llvmCallOp->getOperand(1);
    // Value sendTypeArg = llvmCallOp->getOperand(2);
    // Value destRankArg = llvmCallOp->getOperand(3);
    // Value sendTagArg = llvmCallOp->getOperand(4);
    // Value recvBufArg = llvmCallOp->getOperand(5);
    // Value recvCountArg = llvmCallOp->getOperand(6);
    // Value recvTypeArg = llvmCallOp->getOperand(7);
    // Value srcRankArg = llvmCallOp->getOperand(8);
    // Value recvTagArg = llvmCallOp->getOperand(9);
    // Value commArg = llvmCallOp->getOperand(10);
    // // Value statusArg = llvmCallOp->getOperand(11);

    // Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    // Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    // Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    // builder.setInsertionPoint(llvmCallOp.getOperation());
    // Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    // Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    // Value req1 = builder.create<spmd::SendOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
    //    newSendType, destRankArg, sendTagArg, Value(), /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup).getResult(0);
    // Value req2 = builder.create<spmd::RecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, recvBufArg, castedRecvCount,
    //    newRecvType, srcRankArg, recvTagArg, Value(), /*isBlocking=*/false, modelGroup).getResult(0);
    // // Define the memref type that can store 2 elements of spmd::ReqType
    // auto memrefType = MemRefType::get({2}, builder.getType<spmd::ReqType>());
    // // Create the AllocaOp to allocate the memref
    // auto reqArgMemref = builder.create<memref::AllocaOp>(loc, memrefType).getResult();
    // auto zeroIndex = builder.create<arith::ConstantIndexOp>(loc, 0).getResult();
    // auto oneIndex = builder.create<arith::ConstantIndexOp>(loc, 1).getResult();
    // // Store the values into the allocated memref
    // builder.create<memref::StoreOp>(loc, req1, reqArgMemref, zeroIndex);
    // builder.create<memref::StoreOp>(loc, req2, reqArgMemref, oneIndex);
    // // Todo: here now 2 instead of 1 status is generated, this needs to be handled if the status is used in the program
    // // Define the memref type that can store 2 elements of spmd::StatusType
    // auto memrefType2 = MemRefType::get({2}, builder.getType<spmd::StatusType>());
    // // Create the AllocaOp to allocate the memref
    // Value newStatuses = builder.create<memref::AllocaOp>(loc, memrefType2).getResult();
    // Value countTwo = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(2)).getResult();
    // auto newOp = builder.create<spmd::WaitAllOp>(loc, builder.getType<spmd::ErrorType>(), countTwo, reqArgMemref, newStatuses, modelGroup);
    // handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    // llvmCallOp->erase();
    // return true;
  }
  else if (*calleeStrRef == "MPI_Isendrecv") {
    llvm_unreachable("MPI_Isendrecv is not supported yet, implementation is deprecated");
    // Value sendBufArg = llvmCallOp->getOperand(0);
    // Value sendCountArg = llvmCallOp->getOperand(1);
    // Value sendTypeArg = llvmCallOp->getOperand(2);
    // Value destRankArg = llvmCallOp->getOperand(3);
    // Value sendTagArg = llvmCallOp->getOperand(4);
    // Value recvBufArg = llvmCallOp->getOperand(5);
    // Value recvCountArg = llvmCallOp->getOperand(6);
    // Value recvTypeArg = llvmCallOp->getOperand(7);
    // Value srcRankArg = llvmCallOp->getOperand(8);
    // Value recvTagArg = llvmCallOp->getOperand(9);
    // Value commArg = llvmCallOp->getOperand(10);
    // Value reqArg = llvmCallOp->getOperand(11);

    // Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    // Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);
    // Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);
    // Value idx;
    // Value reqArgMemref = reqMapping.lookup(reqArg, &idx);

    // builder.setInsertionPoint(llvmCallOp.getOperation());
    // Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    // Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    // Value req1 = builder.create<spmd::SendOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
    //    newSendType, destRankArg, sendTagArg, Value(), /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup).getResult(0);
    // Value req2 = builder.create<spmd::RecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, recvBufArg, castedRecvCount,
    //    newRecvType, srcRankArg, recvTagArg, Value(), /*isBlocking=*/false, modelGroup).getResult(0);
    // createWaitAll(reqArgMemref, req1, req2, loc, modelGroup);
    // // handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    // llvmCallOp->erase();
    // return true;
  }
  else if (*calleeStrRef == "MPI_Sendrecv_replace") {
    llvm_unreachable("MPI_Sendrecv_replace is not supported yet, implementation is deprecated");
    // Value bufArg = llvmCallOp->getOperand(0);
    // Value countArg = llvmCallOp->getOperand(1);
    // Value typeArg = llvmCallOp->getOperand(2);
    // Value destRankArg = llvmCallOp->getOperand(3);
    // Value sendTagArg = llvmCallOp->getOperand(4);
    // Value srcRankArg = llvmCallOp->getOperand(5);
    // Value recvTagArg = llvmCallOp->getOperand(6);
    // Value commArg = llvmCallOp->getOperand(7);
    // // Value statusArg = llvmCallOp->getOperand(8);

    // Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    // Value newType = getNewDatatypeMPI(typeArg, valueMapping, modelGroup);

    // builder.setInsertionPoint(llvmCallOp.getOperation());
    // Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    // Value req1 = builder.create<spmd::SendOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, bufArg, castedCount,
    //    newType, destRankArg, sendTagArg, Value(), /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup).getResult(0);
    // Value req2 = builder.create<spmd::RecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, bufArg, castedCount,
    //    newType, srcRankArg, recvTagArg, Value(), /*isBlocking=*/false, modelGroup).getResult(0);
    // // Define the memref type that can store 2 elements of spmd::ReqType
    // auto memrefType = MemRefType::get({2}, builder.getType<spmd::ReqType>());
    // // Create the AllocaOp to allocate the memref
    // auto reqArgMemref = builder.create<memref::AllocaOp>(loc, memrefType).getResult();
    // auto zeroIndex = builder.create<arith::ConstantIndexOp>(loc, 0).getResult();
    // auto oneIndex = builder.create<arith::ConstantIndexOp>(loc, 1).getResult();
    // // Store the values into the allocated memref
    // builder.create<memref::StoreOp>(loc, req1, reqArgMemref, zeroIndex);
    // builder.create<memref::StoreOp>(loc, req2, reqArgMemref, oneIndex);
    // // Todo: here now 2 instead of 1 status is generated, this needs to be handled if the status is used in the program
    // // Define the memref type that can store 2 elements of spmd::StatusType
    // auto memrefType2 = MemRefType::get({2}, builder.getType<spmd::StatusType>());
    // // Create the AllocaOp to allocate the memref
    // Value newStatuses = builder.create<memref::AllocaOp>(loc, memrefType2).getResult();
    // Value countTwo = builder.create<arith::ConstantOp>(loc, builder.getI32IntegerAttr(2)).getResult();
    // builder.create<spmd::WaitAllOp>(loc, builder.getType<spmd::ErrorType>(), countTwo, reqArgMemref, newStatuses, modelGroup);
    // // handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    // llvmCallOp->erase();
    // return true;
  }
  else if (*calleeStrRef == "MPI_Isendrecv_replace") {
    llvm_unreachable("MPI_Isendrecv_replace is not supported yet, implementation is deprecated");
    // Value bufArg = llvmCallOp->getOperand(0);
    // Value countArg = llvmCallOp->getOperand(1);
    // Value typeArg = llvmCallOp->getOperand(2);
    // Value destRankArg = llvmCallOp->getOperand(3);
    // Value sendTagArg = llvmCallOp->getOperand(4);
    // Value srcRankArg = llvmCallOp->getOperand(5);
    // Value recvTagArg = llvmCallOp->getOperand(6);
    // Value commArg = llvmCallOp->getOperand(7);
    // Value reqArg = llvmCallOp->getOperand(8);

    // Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    // Value newType = getNewDatatypeMPI(typeArg, valueMapping, modelGroup);
    // Value idx;
    // Value reqArgMemref = regMapping.lookup(reqArg);

    // builder.setInsertionPoint(llvmCallOp.getOperation());
    // Value castedCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), countArg).getResult();
    // Value req1 = builder.create<spmd::SendOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, bufArg, castedCount,
    //    newType, destRankArg, sendTagArg, Value(), /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup).getResult(0);
    // Value req2 = builder.create<spmd::RecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, bufArg, castedCount,
    //    newType, srcRankArg, recvTagArg, Value(), /*isBlocking=*/false, modelGroup).getResult(0);

    // createWaitAll(reqArgMemref, req1, req2, loc, modelGroup);
    // // handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    // llvmCallOp->erase();
    // return true;
  }
  else if (*calleeStrRef == "MPI_Send" || *calleeStrRef == "MPI_Ssend" || *calleeStrRef == "MPI_Bsend" ||
           *calleeStrRef == "MPI_Rsend") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value destRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);

    bool isBuffered = false;
    if (*calleeStrRef == "MPI_Bsend") {
      isBuffered = true;
    }
    bool isReadyMode = false;
    if (*calleeStrRef == "MPI_Rsend") {
      isReadyMode = true;
    }
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    auto newOp = builder.create<spmd::SendOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, destRankArg, tagArg, Value(), /*isBlocking=*/true, isBuffered, isReadyMode, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Isend" || *calleeStrRef == "MPI_Issend" || *calleeStrRef == "MPI_Ibsend" ||
           *calleeStrRef == "MPI_Irsend") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value destRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);

    bool isBuffered = false;
    if (*calleeStrRef == "MPI_Ibsend") {
      isBuffered = true;
    }
    bool isReadyMode = false;
    if (*calleeStrRef == "MPI_Irsend") {
      isReadyMode = true;
    }
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    auto newOp = builder.create<spmd::SendOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, sendBufArg, castedSendCount,
       newSendType, destRankArg, tagArg, Value(), /*isBlocking=*/false, isBuffered, isReadyMode, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Recv") {
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value srcRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::RecvOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newComm, recvBufArg, castedRecvCount,
       newRecvType, srcRankArg, tagArg, Value(), /*isBlocking=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Irecv") {
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value srcRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::RecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), newComm, recvBufArg, castedRecvCount,
       newRecvType, srcRankArg, tagArg, Value(), /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Wait") {
    Value reqArg = llvmCallOp->getOperand(0);
    Value statusArg = llvmCallOp->getOperand(1);
    Value newReqMemref = getNewReqMPI(getAddress(reqArg, valueMapping), reqMapping, modelGroup);
    Value newReq = unwrapReqFromMemref(llvmCallOp.getOperation(), newReqMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());

    spmd::WaitOp newOp;
    if (isStatusIgnore(statusArg)){
      newOp = builder.create<spmd::WaitOp>(loc, Type(), builder.getType<spmd::ErrorType>(), newReq, modelGroup);
    }
    else {
      newOp = builder.create<spmd::WaitOp>(loc, builder.getType<spmd::StatusType>(), builder.getType<spmd::ErrorType>(), newReq, modelGroup);
      Value newStatus = newOp.getResult(0);
      replaceMemrefByValue(statusArg, newStatus, llvmCallOp.getOperation());
    }
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Waitall") {
    Value countArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value statusesArg = llvmCallOp->getOperand(2);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    spmd::WaitAllOp newOp;
    if (isStatusIgnore(statusesArg)){
      newOp = builder.create<spmd::WaitAllOp>(loc, builder.getType<spmd::ErrorType>(), countArg, newReqsMemref, Value(), modelGroup);
    }
    else {
      Value statusMemref = getAddress(statusesArg, valueMapping);
      Value newStatuses = getNewStatusesMPI(statusMemref, valueMapping, false, newReqsMemref);
      newOp = builder.create<spmd::WaitAllOp>(loc, builder.getType<spmd::ErrorType>(), countArg, newReqsMemref, newStatuses, modelGroup);
    }
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Waitsome") {
    Value inCountArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value outCountArg = llvmCallOp->getOperand(2);
    Value indicesArg = llvmCallOp->getOperand(3);
    Value statusesArg = llvmCallOp->getOperand(4);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    spmd::WaitSomeOp newOp;
    if (isStatusIgnore(statusesArg)){
      newOp = builder.create<spmd::WaitSomeOp>(loc, builder.getI32Type(), builder.getType<spmd::ErrorType>(),
          inCountArg, newReqsMemref, indicesArg, Value(), modelGroup);
    }
    else {
      Value statusMemref = getAddress(statusesArg, valueMapping);
      Value newStatuses = getNewStatusesMPI(statusMemref, valueMapping, false, newReqsMemref);
      newOp = builder.create<spmd::WaitSomeOp>(loc, builder.getI32Type(), builder.getType<spmd::ErrorType>(),
          inCountArg, newReqsMemref, indicesArg, newStatuses, modelGroup);
    }
    Value outCount = newOp.getResult(0);
    replaceMemrefByValue(outCountArg, outCount, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Waitany") {
    Value countArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value idxArg = llvmCallOp->getOperand(2);
    Value statusArg = llvmCallOp->getOperand(3);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    spmd::WaitAnyOp newOp;
    if (isStatusIgnore(statusArg)){
      newOp = builder.create<spmd::WaitAnyOp>(loc, builder.getI32Type(), Type(),
          builder.getType<spmd::ErrorType>(), countArg, newReqsMemref, modelGroup);
    }
    else {
      newOp = builder.create<spmd::WaitAnyOp>(loc, builder.getI32Type(), builder.getType<spmd::StatusType>(),
          builder.getType<spmd::ErrorType>(), countArg, newReqsMemref, modelGroup);
      Value status = newOp.getResult(1);
      replaceMemrefByValue(statusArg, status, llvmCallOp.getOperation());
    }
    
    Value index = newOp.getResult(0);
    replaceMemrefByValue(idxArg, index, llvmCallOp.getOperation());
    
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Comm_split") {
    Value parentCommArg = llvmCallOp->getOperand(0);
    Value colorArg = llvmCallOp->getOperand(1);
    Value keyArg = llvmCallOp->getOperand(2);
    Value newCommArg = llvmCallOp->getOperand(3);

    if (auto castOp = dyn_cast<memref::CastOp>(newCommArg.getDefiningOp())) {
      newCommArg = castOp->getOperand(0);
    }
    else if (isa<LLVM::AllocaOp>(newCommArg.getDefiningOp())) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of comm split replacement\n");
    }
    
    // special case of a comm_split as a dup of world_comm
    if (isa<arith::ConstantOp>(colorArg.getDefiningOp()) && isa<spmd::GetRankInCommOp>(keyArg.getDefiningOp()) 
        && isa<spmd::CommWorldOp>(keyArg.getDefiningOp()->getOperand(0).getDefiningOp())){
      builder.setInsertionPoint(llvmCallOp.getOperation());
      Value commWorld = builder.create<spmd::CommWorldOp>(llvmCallOp->getLoc(), modelGroup).getResult();
      valueMapping.map(newCommArg, commWorld);
    }
    else {
      Value newParentComm = getNewCommMPI(parentCommArg, valueMapping, modelGroup);
      builder.setInsertionPoint(llvmCallOp.getOperation());
      auto newOp = builder.create<spmd::CommSplitOp>(loc, newParentComm, colorArg, keyArg, Value(), modelGroup);
      Value newNewComm = newOp.getResult(0);
      valueMapping.map(newCommArg, newNewComm);
      handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    }
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Comm_dup") {
    Value oldCommArg = llvmCallOp->getOperand(0);
    Value newCommArg = llvmCallOp->getOperand(1);

    if (auto castOp = dyn_cast<memref::CastOp>(newCommArg.getDefiningOp())) {
      newCommArg = castOp->getOperand(0);
    }
    else if (isa<LLVM::AllocaOp>(newCommArg.getDefiningOp())) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of comm split replacement\n");
    }

    Value newOldComm = getNewCommMPI(oldCommArg, valueMapping, modelGroup);
    // special case of a comm_dup as a dup of world_comm
    // if (isa<spmd::CommWorldOp>(keyArg.getDefiningOp()->getOperand(0).getDefiningOp())){
    //   builder.setInsertionPoint(llvmCallOp.getOperation());
    //   Value commWorld = builder.create<spmd::CommWorldOp>(llvmCallOp->getLoc(), modelGroup).getResult();
    //   valueMapping.map(newCommArg, commWorld);
    // }
    // else {
      builder.setInsertionPoint(llvmCallOp.getOperation());
      auto newOp = builder.create<spmd::CommDupOp>(loc, newOldComm, modelGroup);
      Value newNewComm = newOp.getResult(0);
      valueMapping.map(newCommArg, newNewComm);
    // }
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Comm_free") {
    Value commArg = llvmCallOp->getOperand(0);

    if (memref::CastOp castOp = dyn_cast<memref::CastOp>(commArg.getDefiningOp())) {
      commArg = castOp->getOperand(0);
    }
    else if (auto llvmAllocaOp = dyn_cast<LLVM::AllocaOp>(commArg.getDefiningOp())) {
      // do nothing
    }
    else {
      llvm_unreachable("\nNot implemented case of comm split replacement\n");
    }
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::CommDestroyOp>(loc, newComm, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Alloc_mem") {
    Value sizeArg = llvmCallOp->getOperand(0);
    // Value infoArg = llvmCallOp->getOperand(1);
    Value ptrArg = llvmCallOp->getOperand(2);
    Value newComm = getNewCommMPI(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::MallocOp>(loc, ptrArg.getType(), builder.getType<spmd::ErrorType>(),
        newComm, sizeArg, Value(), modelGroup);
    Value newPtr = newOp.getResult(0);
    // ptrArg.replaceAllUsesWith(newPtr);
    replaceMemrefByValue(ptrArg, newPtr, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Free_mem") {
    Value ptrArg = llvmCallOp->getOperand(0);
    Value newComm = getNewCommMPI(Value(), valueMapping, modelGroup, true, llvmCallOp.getOperation());
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::FreeOp>(loc, builder.getType<spmd::ErrorType>(), newComm, ptrArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Test") {
    Value reqArg = llvmCallOp->getOperand(0);
    Value flagArg = llvmCallOp->getOperand(1);
    Value statusArg = llvmCallOp->getOperand(2);

    Value newReqMemref = getNewReqMPI(getAddress(reqArg, valueMapping), reqMapping, modelGroup);
    Value newReq = unwrapReqFromMemref(llvmCallOp.getOperation(), newReqMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::TestOp>(loc, builder.getI1Type(), builder.getType<spmd::StatusType>(), builder.getType<spmd::ErrorType>(), newReq, modelGroup);
    Value newFlag = newOp.getResult(0);
    Value newStatus = newOp.getResult(1);
    Value castedFlag = builder.create<arith::ExtUIOp>(loc, builder.getI32Type(), newFlag).getResult();
    replaceMemrefByValue(flagArg, castedFlag, llvmCallOp.getOperation());
    replaceMemrefByValue(statusArg, newStatus, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Testall") {
    Value countArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value flagArg = llvmCallOp->getOperand(2);
    Value statusesArg = llvmCallOp->getOperand(3);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);
    Value statusMemref = getAddress(statusesArg, valueMapping);
    Value newStatuses = getNewStatusesMPI(statusMemref, valueMapping, false, newReqsMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::TestAllOp>(loc,  builder.getI1Type(), builder.getType<spmd::ErrorType>(),
        countArg, newReqsMemref, newStatuses, modelGroup);
    Value newFlag = newOp.getResult(0);
    Value castedFlag = builder.create<arith::ExtUIOp>(loc, builder.getI32Type(), newFlag).getResult();
    replaceMemrefByValue(flagArg, castedFlag, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Testsome") {
    Value inCountArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value outCountArg = llvmCallOp->getOperand(2);
    Value indicesArg = llvmCallOp->getOperand(3);
    Value statusesArg = llvmCallOp->getOperand(4);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);
    Value statusMemref = getAddress(statusesArg, valueMapping);
    Value newStatuses = getNewStatusesMPI(statusMemref, valueMapping, false, newReqsMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::TestSomeOp>(loc, builder.getI32Type(), builder.getType<spmd::ErrorType>(),
        inCountArg, newReqsMemref, indicesArg, newStatuses, modelGroup);
    Value outCount = newOp.getResult(0);
    replaceMemrefByValue(outCountArg, outCount, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Testany") {
    Value countArg = llvmCallOp->getOperand(0);
    Value reqsArg = llvmCallOp->getOperand(1);
    Value idxArg = llvmCallOp->getOperand(2);
    Value flagArg = llvmCallOp->getOperand(3);
    Value statusArg = llvmCallOp->getOperand(4);

    Value newReqsMemref = getNewReqMPI(getAddress(reqsArg, valueMapping), reqMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::TestAnyOp>(loc, builder.getI32Type(), builder.getI1Type(), builder.getType<spmd::StatusType>(),
        builder.getType<spmd::ErrorType>(), countArg, newReqsMemref, modelGroup);
    Value index = newOp.getResult(0);
    Value flag = newOp.getResult(1);
    Value status = newOp.getResult(2);
    Value castedFlag = builder.create<arith::ExtUIOp>(loc, builder.getI32Type(), flag).getResult();
    
    replaceMemrefByValue(idxArg, index, llvmCallOp.getOperation());
    replaceMemrefByValue(flagArg, castedFlag, llvmCallOp.getOperation());
    replaceMemrefByValue(statusArg, status, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Request_free") {
    llvmCallOp->erase();
    return true;
  } 
  else if (*calleeStrRef == "MPI_Win_allocate") {
    // extract values from original call
    Value sizeArg = llvmCallOp->getOperand(0);
    Value dispUnitArg = llvmCallOp->getOperand(1);
    // Value infoArg = llvmCallOp->getOperand(2);
    Value commArg = llvmCallOp->getOperand(3);
    Value ptrArg = llvmCallOp->getOperand(4);
    Value winArg = llvmCallOp->getOperand(5);

    // transform values if necessary
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::WinAllocOp>(loc, ptrArg.getType(), builder.getType<spmd::WinType>(), 
        builder.getType<spmd::ErrorType>(), newComm, sizeArg, dispUnitArg, modelGroup);
    Value newPtr = newOp.getResult(0);
    Value newWin =  newOp.getResult(1);
    // replace former reference like objects by value-uses
    replaceMemrefByValue(ptrArg, newPtr, llvmCallOp.getOperation());
    // replaceMemrefByValue(winArg, newWin, llvmCallOp.getOperation());
    winMapping.map(getAddress(winArg, valueMapping), newWin);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  } 
  else if (*calleeStrRef == "MPI_Win_create") {
    // extract values from original call
    Value baseAddrArg = llvmCallOp->getOperand(0);
    Value sizeArg = llvmCallOp->getOperand(1);
    Value dispUnitArg = llvmCallOp->getOperand(2);
    // Value infoArg = llvmCallOp->getOperand(3);
    Value commArg = llvmCallOp->getOperand(4);
    Value winArg = llvmCallOp->getOperand(5);

    // transform values if necessary
    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::WinCreateOp>(loc, builder.getType<spmd::WinType>(), 
        builder.getType<spmd::ErrorType>(), newComm, baseAddrArg, sizeArg, dispUnitArg, modelGroup);
    Value newWin = newOp.getResult(0);
    // replace former reference like objects by value-uses
    // replaceMemrefByValue(winArg, newWin, llvmCallOp.getOperation());
    winMapping.map(getAddress(winArg, valueMapping), newWin);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  } 
  else if (*calleeStrRef == "MPI_Win_fence") {
    Value assertArg = llvmCallOp->getOperand(0);
    Value winArg = llvmCallOp->getOperand(1);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::FenceOp>(loc, newWin, assertArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_free") {
    Value winArg = llvmCallOp->getOperand(0);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);
    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::WinFreeOp>(loc, newWin, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Put" || *calleeStrRef == "MPI_Get" ) {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value targetDispArg = llvmCallOp->getOperand(4);
    Value targetCountArg = llvmCallOp->getOperand(5);
    Value targetTypeArg = llvmCallOp->getOperand(6);
    Value winArg = llvmCallOp->getOperand(7);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
    Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
    Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
    Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    // create new operation
    Operation *newOp;
    if (*calleeStrRef == "MPI_Put"){
      newOp = builder.create<spmd::PutOp>(loc, Type(), builder.getType<spmd::ErrorType>(), 
          originAddrArg, originCount, originTypeNew, oneI64, targetRankArg, newWin,
          targetDispArg, targetCount, targetTypeNew, oneI64, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup).getOperation();
    } else {
      newOp = builder.create<spmd::GetOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
        originAddrArg, originCount, originTypeNew, oneI64, targetRankArg, newWin,
        targetDispArg, targetCount, targetTypeNew, oneI64, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup).getOperation();
    }
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Rput" || *calleeStrRef == "MPI_Rget" ) {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value targetDispArg = llvmCallOp->getOperand(4);
    Value targetCountArg = llvmCallOp->getOperand(5);
    Value targetTypeArg = llvmCallOp->getOperand(6);
    Value winArg = llvmCallOp->getOperand(7);
    Value reqArg = llvmCallOp->getOperand(8);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
    Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
    Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
    Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    // create new operation
    Operation *newOp;
    if (*calleeStrRef == "MPI_Rput"){
      newOp = builder.create<spmd::PutOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
          originAddrArg, originCount, originTypeNew, oneI64, targetRankArg, newWin,
          targetDispArg, targetCount, targetTypeNew, oneI64, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup).getOperation();
    } else {
      newOp = builder.create<spmd::GetOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
          originAddrArg, originCount, originTypeNew, oneI64, targetRankArg, newWin,
          targetDispArg, targetCount, targetTypeNew, oneI64, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup).getOperation();
    }
    Value newReq = newOp->getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Accumulate") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value targetDispArg = llvmCallOp->getOperand(4);
    Value targetCountArg = llvmCallOp->getOperand(5);
    Value targetTypeArg = llvmCallOp->getOperand(6);
    Value accOpArg = llvmCallOp->getOperand(7);
    Value winArg = llvmCallOp->getOperand(8);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
    Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
    Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
    Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
    Value newAccOpArg = getNewOpTypeMPI(accOpArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    // create new operation
    auto newOp = builder.create<spmd::AccumulateOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, originCount, originTypeNew, oneI64, targetRankArg, newWin,
          targetDispArg, targetCount, targetTypeNew, oneI64, newAccOpArg, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Raccumulate") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value targetDispArg = llvmCallOp->getOperand(4);
    Value targetCountArg = llvmCallOp->getOperand(5);
    Value targetTypeArg = llvmCallOp->getOperand(6);
    Value accOpArg = llvmCallOp->getOperand(7);
    Value winArg = llvmCallOp->getOperand(8);
    Value reqArg = llvmCallOp->getOperand(9);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
    Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
    Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
    Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
    Value newAccOpArg = getNewOpTypeMPI(accOpArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    // create new operation
    auto newOp = builder.create<spmd::AccumulateOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), originAddrArg,
        originCount, originTypeNew, oneI64, targetRankArg, newWin, targetDispArg, targetCount, targetTypeNew,
        oneI64, newAccOpArg, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Get_accumulate") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value resultAddrArg = llvmCallOp->getOperand(3);
    Value resultCountArg = llvmCallOp->getOperand(4);
    Value resultTypeArg = llvmCallOp->getOperand(5);
    Value targetRankArg = llvmCallOp->getOperand(6);
    Value targetDispArg = llvmCallOp->getOperand(7);
    Value targetCountArg = llvmCallOp->getOperand(8);
    Value targetTypeArg = llvmCallOp->getOperand(9);
    Value accOpArg = llvmCallOp->getOperand(10);
    Value winArg = llvmCallOp->getOperand(11);
    

    //handle static case of no-op and datatype_null
    // if (canBeRemoved()) {
    //   lvmCallOp->erase();
    // }
    // else {
      builder.setInsertionPoint(llvmCallOp.getOperation());
      // transform values if necessary
      Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
      Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
      Value resultCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), resultCountArg).getResult();
      Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
      Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
      Value resultTypeNew = getNewDatatypeMPI(resultTypeArg, valueMapping, modelGroup);
      Value newAccOpArg = getNewOpTypeMPI(accOpArg, valueMapping, modelGroup);
      Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

      builder.setInsertionPoint(llvmCallOp.getOperation());
      Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
      // create new operation
      auto newOp = builder.create<spmd::GetAccumulateOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, originCount,
        originTypeNew, oneI64, resultAddrArg, resultCount, resultTypeNew, oneI64, targetRankArg, newWin,
        targetDispArg, targetCount, targetTypeNew, oneI64, newAccOpArg, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
      handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
      llvmCallOp->erase();
      return true;
    // }
  }
  else if (*calleeStrRef == "MPI_Rget_accumulate") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value originCountArg = llvmCallOp->getOperand(1);
    Value originTypeArg = llvmCallOp->getOperand(2);
    Value resultAddrArg = llvmCallOp->getOperand(3);
    Value resultCountArg = llvmCallOp->getOperand(4);
    Value resultTypeArg = llvmCallOp->getOperand(5);
    Value targetRankArg = llvmCallOp->getOperand(6);
    Value targetDispArg = llvmCallOp->getOperand(7);
    Value targetCountArg = llvmCallOp->getOperand(8);
    Value targetTypeArg = llvmCallOp->getOperand(9);
    Value accOpArg = llvmCallOp->getOperand(10);
    Value winArg = llvmCallOp->getOperand(11);
    Value reqArg = llvmCallOp->getOperand(12);
    

    //handle static case of no-op and datatype_null
    // if (canBeRemoved()) {
    //   lvmCallOp->erase();
    // }
    // else {
      builder.setInsertionPoint(llvmCallOp.getOperation());
      // transform values if necessary
      Value originCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), originCountArg).getResult();
      Value targetCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), targetCountArg).getResult();
      Value resultCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), resultCountArg).getResult();
      Value originTypeNew = getNewDatatypeMPI(originTypeArg, valueMapping, modelGroup);
      Value targetTypeNew = getNewDatatypeMPI(targetTypeArg, valueMapping, modelGroup);
      Value resultTypeNew = getNewDatatypeMPI(resultTypeArg, valueMapping, modelGroup);
      Value newAccOpArg = getNewOpTypeMPI(accOpArg, valueMapping, modelGroup);
      Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

      builder.setInsertionPoint(llvmCallOp.getOperation());
      Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
      // create new operation
      auto newOp = builder.create<spmd::GetAccumulateOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(), 
        originAddrArg, originCount, originTypeNew, oneI64, 
        resultAddrArg, resultCount, resultTypeNew, oneI64, targetRankArg, newWin,
        targetDispArg, targetCount, targetTypeNew, oneI64, newAccOpArg, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
      Value newReq = newOp.getResult(0);

      wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
      //valueMapping.map(reqArg, wrappingMemref);
      handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
      llvmCallOp->erase();
      return true;
    // }
  }
  else if (*calleeStrRef == "MPI_Fetch_and_op") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value resultAddrArg = llvmCallOp->getOperand(1);
    Value typeArg = llvmCallOp->getOperand(2);
    Value targetRankArg = llvmCallOp->getOperand(3);
    Value targetDispArg = llvmCallOp->getOperand(4);
    Value accOpArg = llvmCallOp->getOperand(5);
    Value winArg = llvmCallOp->getOperand(6);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value typeNew = getNewDatatypeMPI(typeArg, valueMapping, modelGroup);
    Value newAccOpArg = getNewOpTypeMPI(accOpArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value oneI64 = builder.create<arith::ConstantOp>(loc, builder.getI64IntegerAttr(1)).getResult();
    // create new operation
    auto newOp = builder.create<spmd::GetAccumulateOp>(loc, Type(), builder.getType<spmd::ErrorType>(), originAddrArg, oneI64, typeNew, oneI64, 
      resultAddrArg, oneI64, typeNew, oneI64, targetRankArg, newWin,
      targetDispArg, oneI64, typeNew, oneI64, newAccOpArg, /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Compare_and_swap") {
    // extract values from original call
    Value originAddrArg = llvmCallOp->getOperand(0);
    Value compareAddrArg = llvmCallOp->getOperand(1);
    Value resultAddrArg = llvmCallOp->getOperand(2);
    Value typeArg = llvmCallOp->getOperand(3);
    Value targetRankArg = llvmCallOp->getOperand(4);
    Value targetDispArg = llvmCallOp->getOperand(5);
    Value winArg = llvmCallOp->getOperand(6);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value typeNew = getNewDatatypeMPI(typeArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::CompareAndSwapOp>(loc, originAddrArg, compareAddrArg, 
        resultAddrArg, typeNew, targetRankArg, newWin, targetDispArg,  /*isBlocking=*/false, /*isAtomic=*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_lock") {
    // extract values from original call
    Value lockTypeArg = llvmCallOp->getOperand(0);
    Value rankArg = llvmCallOp->getOperand(1);
    Value assertArg = llvmCallOp->getOperand(2);
    Value winArg = llvmCallOp->getOperand(3);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    // transform values if necessary
    Value lockTypeNew = getNewLockTypeMPI(lockTypeArg, valueMapping, modelGroup);
    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::LockOp>(loc, rankArg, newWin, lockTypeNew, assertArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_lock_all") {
    // extract values from original call
    Value assertArg = llvmCallOp->getOperand(0);
    Value winArg = llvmCallOp->getOperand(1);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::LockAllOp>(loc, newWin, assertArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_unlock") {
    // extract values from original call
    Value rankArg = llvmCallOp->getOperand(0);
    Value winArg = llvmCallOp->getOperand(1);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::UnlockOp>(loc, rankArg, newWin, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_unlock_all") {
    // extract values from original call
    Value winArg = llvmCallOp->getOperand(0);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::UnlockAllOp>(loc, newWin, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_flush") {
    // extract values from original call
    Value rankArg = llvmCallOp->getOperand(0);
    Value winArg = llvmCallOp->getOperand(1);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::FlushOp>(loc, rankArg, newWin, /*isLocal==*/false, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_flush_local") {
    // extract values from original call
    Value rankArg = llvmCallOp->getOperand(0);
    Value winArg = llvmCallOp->getOperand(1);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::FlushOp>(loc, rankArg, newWin, /*isLocal==*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_flush_all") {
    // extract values from original call
    Value winArg = llvmCallOp->getOperand(0);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::FlushAllOp>(loc, newWin, /*isLocal==*/false, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
else if (*calleeStrRef == "MPI_Win_flush_local_all") {
    // extract values from original call
    Value winArg = llvmCallOp->getOperand(0);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::FlushAllOp>(loc, newWin, /*isLocal==*/true, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Dims_create") {
    // extract values from original call
    Value nProcArg = llvmCallOp->getOperand(0);
    Value nDimsArg = llvmCallOp->getOperand(1);
    Value dimsArg = llvmCallOp->getOperand(2);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::DimsCreateOp>(loc, nProcArg, nDimsArg, dimsArg, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Cart_create") {
    // extract values from original call
    Value oldCommArg = llvmCallOp->getOperand(0);
    Value nDimsArg = llvmCallOp->getOperand(1);
    Value dimsArg = llvmCallOp->getOperand(2);
    Value periodsArg = llvmCallOp->getOperand(3);
    Value reorderArg = llvmCallOp->getOperand(4);
    Value cartCommArg = llvmCallOp->getOperand(5);

    Value newOldComm = getNewCommMPI(oldCommArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    auto newOp = builder.create<spmd::CartCreateOp>(loc, newOldComm, nDimsArg, dimsArg, periodsArg, reorderArg, modelGroup);
    Value newCartCommArg = newOp.getResult(0);
    valueMapping.map(cartCommArg, newCartCommArg);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Mprobe") {
    // extract values from original call
    Value srcRankArg = llvmCallOp->getOperand(0);
    Value tagArg = llvmCallOp->getOperand(1);
    Value commArg = llvmCallOp->getOperand(2);
    Value msgArg = llvmCallOp->getOperand(3);
    Value statusArg = llvmCallOp->getOperand(4);

    Value newCommArg = getNewCommMPI(commArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    // create new operation
    if (isStatusIgnore(statusArg)){
      auto mProbeOp = builder.create<spmd::MProbeOp>(loc, msgArg.getType(), Type(), builder.getType<spmd::ErrorType>(),
          newCommArg, srcRankArg, tagArg, modelGroup);
      Value newMsg = mProbeOp.getResult(0);
      replaceMemrefByValue(msgArg, newMsg, llvmCallOp.getOperation());
    }
    else {
      auto mProbeOp = builder.create<spmd::MProbeOp>(loc, msgArg.getType(), builder.getType<spmd::StatusType>(),
          builder.getType<spmd::ErrorType>(), newCommArg, srcRankArg, tagArg, modelGroup);
      Value newMsg = mProbeOp.getResult(0);
      Value newStatus = mProbeOp.getResult(1);
      replaceMemrefByValue(msgArg, newMsg, llvmCallOp.getOperation());
      replaceMemrefByValue(statusArg, newStatus, llvmCallOp.getOperation());
    }
    // handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Mrecv") {
    // extract values from original call
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value msgArg = llvmCallOp->getOperand(3);
    // Value statusArg = llvmCallOp->getOperand(4);

    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    // create new operation
    // if (isStatusIgnore(statusArg)){
    auto newOp = builder.create<spmd::MRecvOp>(loc, Type(), builder.getType<spmd::ErrorType>(),
        recvBufArg, castedRecvCount, newRecvType, msgArg, /*isBlocking=*/true, modelGroup);
    // }
    // else {
    //   Value newStatus = builder.create<spmd::MRecvOp>(loc, Type(), builder.getType<spmd::StatusType>(),
    //      builder.getType<spmd::ErrorType>(), recvBufArg, castedRecvCount, newRecvType, msgArg, /*isBlocking=*/true, modelGroup).getResult(0);
    //   replaceMemrefByValue(statusArg, newStatus, llvmCallOp.getOperation());
    // }
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Imrecv") {
    // extract values from original call
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value msgArg = llvmCallOp->getOperand(3);
    Value reqArg = llvmCallOp->getOperand(4);

    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);
    
    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    // create new operation
    auto newOp = builder.create<spmd::MRecvOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
        recvBufArg, castedRecvCount, newRecvType, msgArg, /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Start") {
    Value reqArg = llvmCallOp->getOperand(0);
    Value newReqMemref = getNewReqMPI(getAddress(reqArg, valueMapping), reqMapping, modelGroup);
    Value newReq = unwrapReqFromMemref(llvmCallOp.getOperation(), newReqMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::StartOp>(loc, builder.getType<spmd::ErrorType>(), newReq, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Pready") {
    Value partitionArg = llvmCallOp->getOperand(0);
    Value reqArg = llvmCallOp->getOperand(1);
    
    Value newReqMemref = getNewReqMPI(getAddress(reqArg, valueMapping), reqMapping, modelGroup);
    Value newReq = unwrapReqFromMemref(llvmCallOp.getOperation(), newReqMemref);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::PReadyOp>(loc, builder.getType<spmd::ErrorType>(), partitionArg, newReq, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Psend_init") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value partitionsArg = llvmCallOp->getOperand(1);
    Value sendCountArg = llvmCallOp->getOperand(2);
    Value sendTypeArg = llvmCallOp->getOperand(3);
    Value destRankArg = llvmCallOp->getOperand(4);
    Value tagArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    // Value infoArg = llvmCallOp->getOperand(7);
    Value reqArg = llvmCallOp->getOperand(8);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    auto newOp = builder.create<spmd::SendInitOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
       newComm, sendBufArg, partitionsArg, castedSendCount,
       newSendType, destRankArg, tagArg, /*isBlocking=*/false, /*isBuffered=*/false, /*isReadyMode=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    // Value newReqMemref = setNewReqMemref(valueMapping, idx, reqArgAddress, newReq, newOp.getOperation());
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    // replaceMemrefByValue(reqArg, newReq, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Send_init" || *calleeStrRef == "MPI_Ssend_init"
        || *calleeStrRef == "MPI_Bsend_init" || *calleeStrRef == "MPI_Rsend_init") {
    Value sendBufArg = llvmCallOp->getOperand(0);
    Value sendCountArg = llvmCallOp->getOperand(1);
    Value sendTypeArg = llvmCallOp->getOperand(2);
    Value destRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newSendType = getNewDatatypeMPI(sendTypeArg, valueMapping, modelGroup);

    bool isBuffered = false;
    if (*calleeStrRef == "MPI_Bsend_init") {
      isBuffered = true;
    }

    bool isReadyMode = false;
    if (*calleeStrRef == "MPI_Rsend_init") {
      isReadyMode = true;
    }

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedSendCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), sendCountArg).getResult();
    auto newOp = builder.create<spmd::SendInitOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
       newComm, sendBufArg, Value(), castedSendCount,
       newSendType, destRankArg, tagArg, /*isBlocking=*/false, isBuffered, isReadyMode, modelGroup);
    Value newReq = newOp.getResult(0);
    // Value newReqMemref = setNewReqMemref(valueMapping, idx, reqArgAddress, newReq, newOp.getOperation());
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    // replaceMemrefByValue(reqArg, newReq, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Precv_init") {
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value partitionsArg = llvmCallOp->getOperand(1);
    Value recvCountArg = llvmCallOp->getOperand(2);
    Value recvTypeArg = llvmCallOp->getOperand(3);
    Value srcRankArg = llvmCallOp->getOperand(4);
    Value tagArg = llvmCallOp->getOperand(5);
    Value commArg = llvmCallOp->getOperand(6);
    // Value infoArg = llvmCallOp->getOperand(7);
    Value reqArg = llvmCallOp->getOperand(8);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::RecvInitOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
       newComm, recvBufArg, partitionsArg, castedRecvCount,
       newRecvType, srcRankArg, tagArg, /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    // Value newReqMemref = setNewReqMemref(valueMapping, idx, reqArgAddress, newReq, newOp.getOperation());
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    // replaceMemrefByValue(reqArg, newReq, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Recv_init") {
    Value recvBufArg = llvmCallOp->getOperand(0);
    Value recvCountArg = llvmCallOp->getOperand(1);
    Value recvTypeArg = llvmCallOp->getOperand(2);
    Value srcRankArg = llvmCallOp->getOperand(3);
    Value tagArg = llvmCallOp->getOperand(4);
    Value commArg = llvmCallOp->getOperand(5);
    Value reqArg = llvmCallOp->getOperand(6);

    Value newComm = getNewCommMPI(commArg, valueMapping, modelGroup);
    Value newRecvType = getNewDatatypeMPI(recvTypeArg, valueMapping, modelGroup);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    Value castedRecvCount = builder.create<arith::ExtUIOp>(loc, builder.getI64Type(), recvCountArg).getResult();
    auto newOp = builder.create<spmd::RecvInitOp>(loc, builder.getType<spmd::ReqType>(), builder.getType<spmd::ErrorType>(),
       newComm, recvBufArg, Value(), castedRecvCount,
       newRecvType, srcRankArg, tagArg, /*isBlocking=*/false, modelGroup);
    Value newReq = newOp.getResult(0);
    // Value newReqMemref = setNewReqMemref(valueMapping, idx, reqArgAddress, newReq, newOp.getOperation());
    wrapReqIntoMemref(llvmCallOp.getOperation(), reqArg, newReq, valueMapping, reqMapping);
    //valueMapping.map(reqArg, wrappingMemref);
    // replaceMemrefByValue(reqArg, newReq, llvmCallOp.getOperation());
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_start") {
    Value groupArg = llvmCallOp->getOperand(0);
    Value assertArg = llvmCallOp->getOperand(1);
    Value winArg = llvmCallOp->getOperand(2);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::WinStartOp>(loc, groupArg, assertArg, newWin, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else if (*calleeStrRef == "MPI_Win_complete") {
    Value winArg = llvmCallOp->getOperand(0);

    Value newWin = getNewWinMPI(getAddress(winArg, valueMapping), winMapping);

    builder.setInsertionPoint(llvmCallOp.getOperation());
    auto newOp = builder.create<spmd::WinCompleteOp>(loc, newWin, modelGroup);
    handleErrorCode(llvmCallOp.getOperation(), newOp->getResult(newOp->getNumResults()-1));
    llvmCallOp->erase();
    return true;
  }
  else {
    return false;
  }
}



void deleteApiCalleesMPI(ModuleOp moduleOp) {
  SmallVector<StringRef> mpiCallees {"MPI_Init", "MPI_Finalize", "MPI_Abort", "MPI_Comm_size", "MPI_Comm_rank", "MPI_Wait", "MPI_Comm_split", "MPI_Comm_free",
      "MPI_Barrier", "MPI_Ibarrier", "MPI_Bcast", "MPI_Ibcast", "MPI_Reduce", "MPI_Ireduce", "MPI_Reduce_scatter_block", "MPI_Ireduce_scatter_block", "MPI_Allreduce", "MPI_Iallreduce", "MPI_Scatter", "MPI_Iscatter", 
      "MPI_Gather", "MPI_Igather", "MPI_Allgather", "MPI_Iallgather", "MPI_Alltoall", "MPI_Ialltoall", "MPI_Sendrecv", "MPI_Isendrecv", "MPI_Sendrecv_replace",
      "MPI_Isendrecv_replace", "MPI_Send", "MPI_Ssend", "MPI_Bsend", "MPI_Issend", "MPI_Ibsend", "MPI_Isend", "MPI_Recv", "MPI_Irecv",
      "MPI_Scan", "MPI_Iscan", "MPI_Exscan", "MPI_Iexscan", "MPI_Waitall", "MPI_Waitsome", "MPI_Waitany", "MPI_Alloc_mem", "MPI_Free_mem",
      "MPI_Test", "MPI_Testall", "MPI_Testany", "MPI_Testsome", "MPI_Request_free", "MPI_Win_allocate", "MPI_Win_fence", "MPI_Win_free", 
      "MPI_Put", "MPI_Get", "MPI_Accumulate", "MPI_Get_accumulate", "MPI_Fetch_and_op", "MPI_Compare_and_swap", "MPI_Win_lock", "MPI_Win_unlock",
      "MPI_Win_flush", "MPI_Win_flush_local", "MPI_Win_flush_all", "MPI_Win_flush_local_all", "MPI_Win_lock_all", "MPI_Win_unlock_all",
      "MPI_Rget", "MPI_Rput", "MPI_Win_create", "MPI_Raccumulate", "MPI_Rget_accumulate", "MPI_Comm_dup", "MPI_Cart_create", "MPI_Dims_create",
      "MPI_Mprobe", "MPI_Mrecv", "MPI_Imrecv", "MPI_Psend_init", "MPI_Send_init", "MPI_Pready", "MPI_Start", "MPI_Precv_init", "MPI_Recv_init",
      "MPI_Rsend", "MPI_Rsend_init", "MPI_Bsend_init", "MPI_Ssend_init", "MPI_Irsend", "MPI_Win_start", "MPI_Win_complete"};
  for (StringRef str : mpiCallees) {
    if (Operation *opr = moduleOp.lookupSymbol(str)) {
      opr->erase();
    }
  }
}
} // namespace mlir::spmd