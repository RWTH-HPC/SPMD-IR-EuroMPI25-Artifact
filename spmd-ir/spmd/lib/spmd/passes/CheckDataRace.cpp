//===- CheckDataRace.cpp - SPMD Pass: Add GPU memory related operations -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass CheckDataRace which checks the given IR for data races.
//
//===----------------------------------------------------------------------===//

#include "mlir/Pass/Pass.h"
#include "spmd/SPMDPasses.h"

#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"

#include <unordered_set>
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/Hashing.h"


#include <stdio.h>
#include "llvm/Support/Debug.h"

#include "CACTS/utils.h"
#include "common.h"


// #include <fstream>
// #include <iostream>

#define DEBUG_TYPE "check-dataRace"
#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CHECKDATARACE
#include "spmd/SPMDPasses.h.inc"

namespace {

using llvm::SmallDenseMap;
using llvm::SmallDenseSet;

static constexpr int MAX_ERROR_COUNT = 100;

// Custom hash function for SmallDenseSet<int32_t>
llvm::hash_code my_hash_value(const SmallDenseSet<int32_t> &set) {
  llvm::hash_code result = llvm::hash_code(0);
  for (int32_t value : set) {
    result = llvm::hash_combine(result, value);
  }
  return result;
}


struct MemoryAccess {
  Operation *user;
  Value origAddr;
  Value alias;
  bool isWrite;
  ExecKind execKind;
  SmallDenseSet<int32_t> ranks;

  MemoryAccess(Operation *user, Value origAddr, Value alias, bool isWrite, ExecKind execKind, SmallDenseSet<int32_t> ranks) 
      : user{user}, origAddr{origAddr}, alias{alias}, isWrite{isWrite}, execKind{execKind}, ranks{ranks} {}

  MemoryAccess() 
      : user{nullptr}, origAddr{}, alias{}, isWrite{false}, execKind{}, ranks{} {}

  bool operator==(const MemoryAccess &other) const {
    return user == other.user &&
            origAddr == other.origAddr &&
            alias == other.alias &&
            isWrite == other.isWrite &&
            execKind == other.execKind &&
            ranks == other.ranks;
  }
};

struct MemoryAccessHash {
  size_t operator()(const MemoryAccess &memAccess) const {
    return llvm::hash_combine(
      std::hash<Operation *>()(memAccess.user),
      hash_value(memAccess.origAddr),
      hash_value(memAccess.alias),
      std::hash<bool>()(memAccess.isWrite),
      std::hash<int>()(static_cast<int>(memAccess.execKind)),
      my_hash_value(memAccess.ranks)
    );
  };
};

struct ErrorInfo {
  Operation *prevOpr;
  Operation *causingOpr;
  Value aliasPrev;
  Value aliasCausing;
  Value origAddr;
  ExecKind execKindPrev;
  ExecKind execKindCausing;
  SmallDenseSet<int32_t> overlapRanks;


  explicit ErrorInfo(Operation *prevOpr, Operation *causingOpr, Value aliasPrev, Value aliasCausing, Value origAddr,
      ExecKind execKindPrev, ExecKind execKindCausing, SmallDenseSet<int32_t> overlapRanks) : prevOpr{prevOpr},
      causingOpr{causingOpr}, aliasPrev{aliasPrev}, aliasCausing{aliasCausing}, origAddr{origAddr},
      execKindPrev{execKindPrev}, execKindCausing{execKindCausing}, overlapRanks{overlapRanks}{}

  bool operator==(const ErrorInfo &other) const {
    auto locA1 = findLocToShowWrapper(prevOpr->getLoc());
    auto locA2 = findLocToShowWrapper(causingOpr->getLoc());
    auto locB1 = findLocToShowWrapper(other.prevOpr->getLoc());
    auto locB2 = findLocToShowWrapper(other.causingOpr->getLoc());
    return (locA1 == locB1 && locA2 == locB2) ||
           (locA1 == locB2 && locA2 == locB1);
  }
};

struct ErrorInfoHash {
  size_t operator()(const ErrorInfo &errorInfo) const {
    auto loc1 = findLocToShowWrapper(errorInfo.prevOpr->getLoc());
    auto loc2 = findLocToShowWrapper(errorInfo.causingOpr->getLoc());

    auto h1 = hash_value(loc1);
    auto h2 = hash_value(loc2);

    return llvm::hash_combine(std::min(h1, h2), std::max(h1, h2)); // unordered pair
  }
};

struct PathInstance {
  // stores for a req/win handle value the memory addresses that is modified by communication tagged by this req/in object
  SmallDenseMap<Value, SmallDenseSet<Value>> reqMap;
  SmallDenseMap<Value, SmallDenseSet<Value>> winMap; 
  SmallDenseMap<Value, SmallDenseSet<Value>> reqAddressMap;
  // maps memoryAddresses to a map that maps req/win values to a vector of memory accesses accociated with them
  SmallDenseMap<Value, SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>>> accessMap;
  SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>> prevMemAccessesMap;
  IRMapping winReqWinMapping;
  IRMapping valueMapping;
};

bool hasAndIsNonBlocking(Operation *opr) {
  if (auto attr = opr->getAttrOfType<BoolAttr>(StringRef("isBlocking"))) {
    if (attr.getValue() == false) {
      return true;
    }
  }
  return false;
}

bool isRMASyncOp(Operation *opr) {
  return (opr->hasTrait<spmd::RMA>() && opr->hasTrait<spmd::Sync>());
}

bool isMemoryInstruction(Operation *opr) {
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();

    // Check if the type is an LLVM pointer or memref type
    if (isa<LLVM::LLVMPointerType>(type) || isa<MemRefType>(type))
      return true;

  }
  return false;
}

bool hasReqHandleRes(Operation *opr) {
  for (Value result : opr->getResults()) {
    auto type = result.getType();
    if (isa<spmd::ReqType>(type))
      return true;
  }
  return false;
}

Value getReqHandleRes(Operation *opr) {
  for (Value result : opr->getResults()) {
    auto type = result.getType();
    if (isa<spmd::ReqType>(type))
      return result;
  }
  llvm_unreachable("\nNot implemented case of getReqHandleRes\n");
}

bool hasReqHandleArg(Operation *opr) {
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();
    if (isa<spmd::ReqType>(type)){
      return true;
    }
    else if (auto memrefType = dyn_cast<MemRefType>(type)) {
      if (isa<spmd::ReqType>(memrefType.getElementType())) {
        return true;
      }
    }
  }
  return false;
}

Value getReqHandleArg(Operation *opr) {
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();
    if (isa<spmd::ReqType>(type)){
      return operand;
    }
    else if (auto memrefType = dyn_cast<MemRefType>(type)) {
      if (isa<spmd::ReqType>(memrefType.getElementType())) {
        return operand;
      }
    }
  }
  llvm_unreachable("\nNot implemented case of getReqHandleArg\n");
}

Value getWindow(Operation *opr) {
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();
    if (isa<spmd::WinType>(type)) {
      return operand;
    }
  }
  llvm_unreachable("\nNot implemented case of getWindow\n");
}

bool hasWindow(Operation *opr) {
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();
    if (isa<spmd::WinType>(type)) {
      return true;
    }
  }
  return false;
}

bool isNonBlockingSync(Operation *opr) {
  // add all,some,anyWait and possibly testOp functionalities..
  if (opr->hasTrait<spmd::NonBlockingSync>()) {
    return true;
  }
  else {
    return false;
  }
}

std::string valAsString(Value value) {
  std::string res;
  llvm::raw_string_ostream ostream(res);
  OpPrintingFlags flags;
  value.printAsOperand(ostream, flags);
  return res;
}

// takes an operation op and filters memref/llvm Values within op that are being accessed or writtenTo on the origin side
void getMemoryAccesses(Operation *opr, SmallVector<MemoryAccess> *accesses, IRMapping &valueMapping) {
  SmallDenseSet<Value> alreadyStored; //makes sure that we dont store two same memory accesses when we have two same operands in an op
  for (Value operand : opr->getOperands()) {
    auto type = operand.getType();

    // Check if the type is an LLVM pointer or memref type
    if (!(isa<LLVM::LLVMPointerType>(type) || isa<MemRefType>(type)))
      continue;
  
    Value addr = getAddress(operand, valueMapping);

    if (alreadyStored.count(operand)){ //addr already stored / operand already processed 
      continue;
    }
    // Check if the operation implements the MemoryEffectOpInterface
    auto memEffectOp = dyn_cast<mlir::MemoryEffectOpInterface>(opr);
    if (!memEffectOp) {
      ExecKind execKind = getExecKind(opr);
      ArrayRef<int32_t> ranks = getExecutors(opr);
      SmallDenseSet<int32_t> ranksSet(ranks.begin(), ranks.end());
      
      accesses->emplace_back(opr, addr, operand, /*isWrite=*/true, execKind, ranksSet);
      alreadyStored.insert(operand);
      // accesses->emplace_back(opr, operand, getAddress(operand, valueMapping), /*isWrite=*/false);
      continue;
    }

    // Query the memory effects for this specific operand
    // it is important to notice that if two operands are same like %9 and %9 
    // and of them is read and the other write e.g. in spmdrecv op
    // then getting effects for one of them, will retrieve all effects that this op has on this %9 in total
    // and not only for the according operand number. So we dont need to cover this special case.
    SmallVector<mlir::MemoryEffects::EffectInstance> effects;
    memEffectOp.getEffectsOnValue(operand, effects);

    // Flags to track the presence of Write and Read effects
    bool hasWriteEffect = false;
    bool hasReadEffect = false;
    bool isWrite = false;
    // Check if the desired effect is present
    for (const auto &instance : effects) {
      if (isa<MemoryEffects::Write>(*instance.getEffect())) {
        hasWriteEffect = true;
        isWrite = true;
        break; // No need to check further, as Write takes precedence
      }
      else if (isa<MemoryEffects::Read>(*instance.getEffect())) {
        hasReadEffect = true;
      }
    }

    if (hasWriteEffect || hasReadEffect) {
      ExecKind execKind = getExecKind(opr);
      ArrayRef<int32_t> ranks = getExecutors(opr);
      SmallDenseSet<int32_t> ranksSet(ranks.begin(), ranks.end());

      accesses->emplace_back(opr, addr, operand, isWrite, execKind, ranksSet);
      alreadyStored.insert(operand);
    }
  }
}

bool hasAndfindNextStore(Value value, Operation *&nextStoreOpr) {
  for (Operation *user : value.getUsers()) {
    // Check if the user is a memref.store operation
    if (auto storeOp = dyn_cast<memref::StoreOp>(user)) {
      // Check if the value being stored is the one we're interested in
      if (storeOp.getValueToStore() == value) {
        nextStoreOpr = user;
        return true; // Stop after finding the first memref.store
      }
    }
  }
  return false;
}

bool hasAndGetReqMemref(Value reqHandle, Value &memref, IRMapping &valueMapping) {
  if (auto definingOpr = reqHandle.getDefiningOp()) {
    if (isa<memref::LoadOp>(definingOpr)) {
      memref = getAddress(definingOpr->getOperand(0), valueMapping);
      return true;
    }
  }
  if (isa<MemRefType>(reqHandle.getType())) {
    memref = reqHandle;
    return true;
  }
  return false;
}

SmallDenseSet<int32_t> calculateOverlapRanks(const SmallDenseSet<int32_t> &set1, const SmallDenseSet<int32_t> &set2) {
  SmallDenseSet<int32_t> overlap;
  const SmallDenseSet<int32_t> &smallerSet = (set1.size() < set2.size()) ? set1 : set2;
  const SmallDenseSet<int32_t> &largerSet = (set1.size() < set2.size()) ? set2 : set1;
  for (int32_t value : smallerSet) {
    if (largerSet.count(value)) {
      overlap.insert(value);
    }
  }
  return overlap;
}

void addOrUpdateEntries(SmallDenseMap<Value,  SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>>> &accessMap,
    MemoryAccess &memAccess, SmallDenseMap<Value, SmallDenseSet<Value>> &winOrReqMap, Value winOrReq) {
  // Add value to the unordered set for the given key
  auto &valueSet = winOrReqMap[winOrReq]; // This will create an empty set if the key doesn't exist
  valueSet.insert(memAccess.origAddr); // Add the value to the set
  if ((accessMap.count(memAccess.origAddr) == 1) && 
      (accessMap[memAccess.origAddr].count(winOrReq) == 1)) {
    accessMap[memAccess.origAddr][winOrReq].insert(memAccess);
  } else {
    accessMap[memAccess.origAddr][winOrReq] = std::unordered_set<MemoryAccess, MemoryAccessHash>{{memAccess}};
  }
}

//in this alg. we purposely do not support to find all data races, after the first data race, all other data races are just good
// but not target
void updateMaps(Operation *opr, PathInstance &pathInstance, MemoryAccess &memAccess){
  // MemoryAccess prevReqMemAccess = pathInstance.reqAccessMap.at(memAccess.origAddr);
  // bool prevReqAccessGiven = (pathInstance.reqAccessMap.count(memAccess.origAddr) == 1);

  // MemoryAccess prevWinMemAccess = pathInstance.winAccessMap.at(memAccess.origAddr);
  // bool prevReqAccessGiven = (pathInstance.winAccessMap.count(memAccess.origAddr) == 1);

  // if (prevReqAccessGiven ||  && prevMemAccess.execKind != ExecKind::Static && memAccess.execKind == ExecKind::Static){
  //   // imnplicitly means that prevMemAccess is a read
  //   return;
  // }

  // if there was no past access and the current operation performs RMA -> save the currentAccess as reference for alter ops
  if (opr->getDialect()->getNamespace().str() == "spmd"){
    Value win, req;
    if ((opr->hasTrait<spmd::RMA>() && opr->hasTrait<spmd::Communication>())) {
      win = getWindow(opr);
      addOrUpdateEntries(pathInstance.accessMap, memAccess, pathInstance.winMap, win);
    } 
    if (opr->hasTrait<spmd::Communication>() && hasAndIsNonBlocking(opr)) {
      if (hasReqHandleRes(opr)){
        req = getReqHandleRes(opr);
        addOrUpdateEntries(pathInstance.accessMap, memAccess, pathInstance.reqMap, req);
        Operation *nextStoreOpr;
        if (hasAndfindNextStore(req, nextStoreOpr)) {
          Value memref = getAddress(nextStoreOpr->getOperand(1), pathInstance.valueMapping);
          if (pathInstance.reqAddressMap.count(memref) == 1) {
            pathInstance.reqAddressMap[memref].insert(req);
          }
          else {
            pathInstance.reqAddressMap[memref] = SmallDenseSet<Value>{req};
          }
        }
      }   
    }
    if (win && req) {
      pathInstance.winReqWinMapping.map(win, req);
      pathInstance.winReqWinMapping.map(req, win);
    }
  }
}

bool bothStatic(ExecKind prevExecKind, ExecKind currExecKind) {
  return (prevExecKind == ExecKind::Static && currExecKind == ExecKind::Static);
}

bool oneStaticOneAllbut(ExecKind prevExecKind, ExecKind currExecKind) {
  return (prevExecKind == ExecKind::Static && currExecKind == ExecKind::AllBut)
          ||  (prevExecKind == ExecKind::AllBut && currExecKind == ExecKind::Static);
}


void checkError(SmallDenseMap<Value,  SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>>> &accessMap,
    SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>> &prevMemAccessesMap, MemoryAccess &memAccess,
    std::unordered_set<ErrorInfo, ErrorInfoHash> &errorInfos){
    // check if there has been an access to the memory region memAccess is accessing
  bool prevAccessGiven = (accessMap.count(memAccess.origAddr) == 1);
  // check if the past access was a write and save the operation for later
  if (prevAccessGiven) {
    prevMemAccessesMap = accessMap.at(memAccess.origAddr);
    for (const auto &entry : prevMemAccessesMap) {
      // const Value &key = entry.first; //req or win value
      const std::unordered_set<MemoryAccess, MemoryAccessHash> &prevMemAccesses = entry.second;
      for (const auto &prevMemAccess : prevMemAccesses) {
        // print an error if the previous or current access are writing to the origin memory
        if (prevMemAccess.isWrite || memAccess.isWrite) {
          if (bothStatic(prevMemAccess.execKind, memAccess.execKind)) {
            SmallDenseSet<int32_t> overlap = calculateOverlapRanks(prevMemAccess.ranks, memAccess.ranks);
            if (!overlap.empty()) {
              errorInfos.insert(ErrorInfo(prevMemAccess.user, memAccess.user, prevMemAccess.alias, memAccess.alias,
                  memAccess.origAddr, prevMemAccess.execKind, memAccess.execKind, overlap));
            } 
          }
          else if(oneStaticOneAllbut(prevMemAccess.execKind, memAccess.execKind)) {
            SmallDenseSet<int32_t> overlap = calculateOverlapRanks(prevMemAccess.ranks, memAccess.ranks);
            // having an overlap means that the one rank included in the set is the one that executes on of the memAcceses
            if (overlap.empty()) {
              errorInfos.insert(ErrorInfo(prevMemAccess.user, memAccess.user, prevMemAccess.alias, memAccess.alias,
                  memAccess.origAddr, prevMemAccess.execKind, memAccess.execKind, overlap));
            } 
          }
          else {
            errorInfos.insert(ErrorInfo(prevMemAccess.user, memAccess.user, prevMemAccess.alias, memAccess.alias,
                memAccess.origAddr, prevMemAccess.execKind, memAccess.execKind, SmallDenseSet<int32_t>{}));
          }
        }
      }
    }
  }
}

void resetAccesses(SmallDenseMap<Value, SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>>> &accessMap, 
      SmallDenseMap<Value, SmallDenseSet<Value>> &winOrReqMap, const Value &winOrReq) {
  const auto &addresses = winOrReqMap[winOrReq];
  for (const auto &addr : addresses) {
    accessMap[addr].erase(winOrReq);
    if (accessMap[addr].empty()) {
      accessMap.erase(addr);
    }
  }
  winOrReqMap.erase(winOrReq);
}

void possiblyResetAccessesOpposite(SmallDenseMap<Value, SmallDenseMap<Value, std::unordered_set<MemoryAccess, MemoryAccessHash>>> &accessMap, 
      SmallDenseMap<Value, SmallDenseSet<Value>> &winOrReqMap, IRMapping &winReqWinMapping, const Value &given) {
  if (winReqWinMapping.contains(given)) {
    Value opposite = winReqWinMapping.lookup(given);
    resetAccesses(accessMap, winOrReqMap, opposite);
    winReqWinMapping.erase(given);
    winReqWinMapping.erase(opposite);
  }
}

// std::string stringifyExecKind(ExecKind kind) {
//   switch (kind) {
//     case ExecKind::Store: return "store";
//     case ExecKind::Load: return "load";
//     case ExecKind::Put: return "MPI_Put";
//     case ExecKind::Get: return "MPI_Get";
//     default: return "unknown";
//   }
// }

void dumpErrorsToJson(const std::unordered_set<ErrorInfo, ErrorInfoHash> &errorInfos,
                      const std::string &outputFilePath) {
  llvm::json::Array messages;

 std::string actualPath = outputFilePath;

  if (actualPath.empty()) {
    std::filesystem::path cwd = std::filesystem::current_path();
    actualPath = (cwd / "local_data_race_report.json").string();  // OK: assigned to local var
  }

  for (const auto &err : errorInfos) {
    // Apply wrapper to get best location
    mlir::Location loc1 = findLocToShowWrapper(err.prevOpr->getLoc());
    mlir::Location loc2 = findLocToShowWrapper(err.causingOpr->getLoc());

    llvm::json::Array references;
    references.push_back(getLocationJson(loc1));
    references.push_back(getLocationJson(loc2));

    // Define error type string
    std::string typeStr = "Local Data Race";
    // if (err.execKindCausing == ExecKind::Put && err.execKindPrev == ExecKind::Store)
    //   typeStr = "Local Data Race - Local write";
    // else if (err.execKindCausing == ExecKind::Get)
    //   typeStr = "Remote Read Conflict";
    // else if (err.execKindCausing == ExecKind::Put)
    //   typeStr = "Remote Write Conflict";

    // Compose message string
    std::ostringstream oss;
    oss << "Found " << err.prevOpr->getName().stripDialect().str()
        << " operation/call at " << locToString(loc1)
        << " which is in conflict with " << err.causingOpr->getName().stripDialect().str()
        << " operation/call at " << locToString(loc2)
        << " before release";



    // Create the message object
    llvm::json::Object msg{
        {"error_id", ""},
        {"type", typeStr},
        {"text", oss.str()},
        {"references", std::move(references)}
    };

    messages.push_back(std::move(msg));
  }

  // Wrap the top-level structure
  llvm::json::Object full{
      {"messages", std::move(messages)}
  };

  // Write to file
  std::error_code ec;
  llvm::raw_fd_ostream outFile(actualPath, ec);
  if (ec) {
    llvm::errs() << "Failed to open output file: " << ec.message() << "\n";
    return;
  }

  outFile << llvm::formatv("{0:2}", llvm::json::Value(std::move(full))) << "\n";
}


void printErrorInfos(std::unordered_set<ErrorInfo, ErrorInfoHash> &errorInfos){
  fprintf(stderr, "\n\n--------------------------------------------------------------------------------------------------------------\n");
  fprintf(stderr, "Static Verification of Data Races:\n");
  fprintf(stderr, "--------------------------------------------------------------------------------------------------------------\n\n");
  
  size_t counter = 0;
  if (errorInfos.size() > 0) {
    for (const auto& errorInfo : errorInfos) {
      if (counter >= MAX_ERROR_COUNT)
        break;
      errorInfo.causingOpr->emitWarning(errorInfo.causingOpr->getName().stripDialect().str() +  
          " operation/call may access the same memory as the previous operation without proper synch. (Data Race)");
      fprintf(stderr, "\n\nPrevious operation:\n\n");

      errorInfo.prevOpr->emitWarning(errorInfo.prevOpr->getName().stripDialect().str() +  
          " operation/call");

      fprintf(stderr, "\n\nWith the alias values:\n");
      fprintf(stderr, "Causing Access on: %s\n", valAsString(errorInfo.aliasCausing).c_str());
      fprintf(stderr, "Previous Access on: %s\n", valAsString(errorInfo.aliasPrev).c_str());

      fprintf(stderr, "\n\nOn the orignal value:\n");
      fprintf(stderr, "Operand: %s\n", valAsString(errorInfo.origAddr).c_str());

      if (errorInfo.origAddr.getDefiningOp()) {
        fprintf(stderr, "\n\nDefined by:\n");
        errorInfo.origAddr.getDefiningOp()->emitWarning(errorInfo.origAddr.getDefiningOp()->getName().stripDialect().str() + "");
      }
      fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n\n");
      counter++;
    }
    fprintf(stderr, "\n\n");
    if (counter >= MAX_ERROR_COUNT) {
      fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n");
      fprintf(stderr, "Too many errors/warnings to emit! Aborted.");
      fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n\n\n");
    }
  } 
  else {
    fprintf(stderr, "No Data Race Found\n");
    fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n");
    fprintf(stderr, "\n\n");
  }
}

void handleMemoryOpr(Operation *opr, PathInstance &pathInstance, std::unordered_set<ErrorInfo, ErrorInfoHash> &errorInfos) {
  // check for data races if the current operation alters memory
  if (isMemoryInstruction(opr)) {
    // hold all Values that are being accessed, written to in the current Operation *opr
    SmallVector<MemoryAccess> memAccesses;
    // extract the Values for accessed/writtenTo
    getMemoryAccesses(opr, &memAccesses, pathInstance.valueMapping);
    // iterate through all accessed memRef Values
    for (auto &memAccess : memAccesses) {
      checkError(pathInstance.accessMap, pathInstance.prevMemAccessesMap, memAccess, errorInfos);
      updateMaps(opr, pathInstance, memAccess);
    }
  }
  // delete all accesses to the window that is being unlocked
  if (isRMASyncOp(opr)) {
    if (hasWindow(opr)) {
      Value win = getWindow(opr);
      resetAccesses(pathInstance.accessMap, pathInstance.winMap, win);
      possiblyResetAccessesOpposite(pathInstance.accessMap, pathInstance.reqMap, pathInstance.winReqWinMapping, win);
    }
    else {
      for (const auto &entry : pathInstance.winMap) {
        const auto &win = entry.first;
        const auto &addresses = entry.second;
        for (const auto &addr : addresses) {
          pathInstance.accessMap[addr].erase(win);
        }
        possiblyResetAccessesOpposite(pathInstance.accessMap, pathInstance.reqMap, pathInstance.winReqWinMapping, win);
      }
      pathInstance.winMap.clear();
    }
  }
  if (isNonBlockingSync(opr)) {
    if (hasReqHandleArg(opr)) {
      Value req = getReqHandleArg(opr);
      SmallDenseSet<Value> reqs{req};
      Value reqMemref;
      if (hasAndGetReqMemref(req, reqMemref, pathInstance.valueMapping)){
        //if it is not contained this might mean that in the current path
        // there is only the wait but not the req creating op
        if (pathInstance.reqAddressMap.count(reqMemref) == 1) { 
          reqs = pathInstance.reqAddressMap[reqMemref];
        }
      }
      for (const auto &r : reqs) {
          resetAccesses(pathInstance.accessMap, pathInstance.reqMap, r);
          possiblyResetAccessesOpposite(pathInstance.accessMap, pathInstance.winMap, pathInstance.winReqWinMapping, r);
      }
    } 
  }
}

// Function for merging path instances (union of both)
PathInstance mergePathInstances(const PathInstance &a, const PathInstance &b) {
  PathInstance result = a; // Start with a copy of `a`
  // Maximize information in the result by creating a union of the two instances
  // Merge reqMap
  for (const auto &[key, valuesB] : b.reqMap) {
    auto &valuesR = result.reqMap[key];
    valuesR.insert(valuesB.begin(), valuesB.end());
  }

  // Merge winMap
  for (const auto &[key, valuesB] : b.winMap) {
    auto &valuesR = result.winMap[key];
    valuesR.insert(valuesB.begin(), valuesB.end());
  }

  // Merge reqAddressMap
  for (const auto &[key, valuesB] : b.reqAddressMap) {
    auto &valuesR = result.reqAddressMap[key];
    valuesR.insert(valuesB.begin(), valuesB.end());
  }

  // Merge accessMap
  for (const auto &[memAddr, innerMapB] : b.accessMap) {
    auto &innerMapR = result.accessMap[memAddr];
    for (auto &[tag, accessesB] : innerMapB) {
      auto &accessesR = innerMapR[tag];
      accessesR.insert(accessesB.begin(), accessesB.end());
    }
  }

  // Merge prevMemAccessesMap
  for (const auto &[memAddr, accessesB] : b.prevMemAccessesMap) {
    auto &accessesR = result.prevMemAccessesMap[memAddr];
    accessesR.insert(accessesB.begin(), accessesB.end());
  }

  //(IRMappings are merged conservatively: if a already has a mapping, keep it; otherwise add from b.)
  // Merge winReqWinMapping
  for (const auto &[from, to] : b.winReqWinMapping.getValueMap()) {
    if (!result.winReqWinMapping.contains(from))
      result.winReqWinMapping.map(from, to);
  }

  // Merge valueMapping 
  for (const auto &[from, to] : b.valueMapping.getValueMap()) {
    if (!result.valueMapping.contains(from))
      result.valueMapping.map(from, to);
  }

  return result;
}

// Function to traverse a block and collect pathInstance info and errorInfos
PathInstance walkBlock(Block &block, PathInstance pathInstance, std::unordered_set<ErrorInfo, ErrorInfoHash> &errorInfos) {
  if (errorInfos.size() > MAX_ERROR_COUNT) {
    return pathInstance; // If we already found an error, we can stop traversing
  }
  for (auto &op : block) {
    if (auto ifOp = dyn_cast<scf::IfOp>(op)) {
      PathInstance thenResult = pathInstance; // Default if THEN is empty
      // Traverse the THEN region
      if (!ifOp.getThenRegion().empty()) {
        thenResult = walkBlock(ifOp.getThenRegion().front(), pathInstance, errorInfos);
      }
      // Traverse the ELSE region
      if (!ifOp.getElseRegion().empty()) {
        // If the ELSE region is not empty, we can traverse it
        PathInstance elseResult = walkBlock(ifOp.getElseRegion().front(), pathInstance, errorInfos);
        // Merge the states (union of the results)
        pathInstance = mergePathInstances(thenResult, elseResult);
      }
      else {
        // If the ELSE region is empty, we can just use the THEN result
        pathInstance = thenResult;
      }
    }
    else if (auto forOp = dyn_cast<scf::ForOp>(op)) {
      // Simulate first iteration
      PathInstance firstIter = walkBlock(forOp.getRegion().front(), pathInstance, errorInfos);

      // Simulate second iteration using the result of the first
      PathInstance secondIter = walkBlock(forOp.getRegion().front(), firstIter, errorInfos);

      // Merge: path before the loop + after two iterations
      pathInstance = mergePathInstances(pathInstance, secondIter);
    }
    else if (auto whileOp = dyn_cast<scf::WhileOp>(op)) {
      // Walk the before region (loop condition)
      PathInstance condPath = walkBlock(whileOp.getBefore().front(), pathInstance, errorInfos);
    
      // Simulate first iteration of the body
      PathInstance firstIter = walkBlock(whileOp.getAfter().front(), condPath, errorInfos);

      // Walk 2nd time the before region (loop condition)
      PathInstance condPath2 = walkBlock(whileOp.getBefore().front(), firstIter, errorInfos);
    
      // Simulate second iteration
      PathInstance secondIter = walkBlock(whileOp.getAfter().front(), condPath2, errorInfos);
    
      // Merge: path before loop + after two iterations
      pathInstance = mergePathInstances(condPath, secondIter);
    }
    else if (auto switchOp = dyn_cast<scf::IndexSwitchOp>(op)) {
      // List to collect all branch results
      SmallVector<PathInstance, 6> casePaths;
    
      // Traverse each case region
      for (auto &caseRegion : switchOp.getCaseRegions()) {
        PathInstance caseResult = walkBlock(caseRegion.front(), pathInstance, errorInfos);
        casePaths.push_back(caseResult);
      }
    
      // Traverse default case (if present)
      Region &defaultRegion = switchOp.getDefaultRegion();
      if (!defaultRegion.empty()) {
        PathInstance defaultResult = walkBlock(defaultRegion.front(), pathInstance, errorInfos);
        casePaths.push_back(defaultResult);
      }
    
      // Merge all case paths into one PathInstance
      PathInstance merged = casePaths.front();
      for (size_t i = 1; i < casePaths.size(); ++i) {
        merged = mergePathInstances(merged, casePaths[i]);
      }
      pathInstance = merged;
      
    }
    else if (op.getNumRegions() > 0) {
      llvm_unreachable("\nwalkBlock\n");
      // If there are regions (e.g., loops), traverse them as well
      // for (Region &region : opr->getRegions()) {
      //   for (Block &nestedBlock : region) {
      //     PathInstance &newPI = walkBlock(nestedBlock, pathInstance, errorInfos);
      //     pathInstance = mergePathInstances(pathInstance, newPI);
      //   }
      // }
    }
    else {
      // If the operation has no regions, we can check for memory accesses
      handleMemoryOpr(&op, pathInstance, errorInfos);
    }
  }
  return pathInstance;
}

struct CheckDataRace : impl::CheckDataRaceBase<CheckDataRace> {
  using CheckDataRaceBase::CheckDataRaceBase;

  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();

    Operation *mainOpr = moduleOp.lookupSymbol("main");  
    if (mainOpr == NULL) {
      LLVM_DEBUG(DBGS() << "Pass failed since no main func exists\n");
      signalPassFailure();
      return;
    }

    PathInstance initialPI;
    std::unordered_set<ErrorInfo, ErrorInfoHash> errorInfos;
    // Traverse through function body (block)
    walkBlock(mainOpr->getRegion(0).front(), initialPI, errorInfos);

    if (errorInfos.size() > 0)
      signalPassFailure();

    if (writeJsonReport) { // Generate and emit the JSON here.
      LLVM_DEBUG(DBGS() << "Writing data race report in JSON format.\n");
      dumpErrorsToJson(errorInfos, "");
    }
    else {
      LLVM_DEBUG(DBGS() << "Writing data race report to stderr.\n");
      printErrorInfos(errorInfos);
    }
  }
  
};

} // namespace
} // namespace mlir::spmd
