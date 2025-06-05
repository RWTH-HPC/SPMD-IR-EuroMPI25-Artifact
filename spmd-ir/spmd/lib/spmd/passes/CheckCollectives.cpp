//===- CheckCollectives.cpp - SPMD Pass: Add GPU memory related operations -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements the pass Checkcollectives which analyses the IR 
//  and decides whether a collective commmunication error is given.
//
//===----------------------------------------------------------------------===//

#include "mlir/Pass/Pass.h"
#include "spmd/SPMDPasses.h"
#include "spmd/SPMDOps.h"
#include "spmd/SPMDAttributes.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/IRMapping.h"
#include "llvm/Support/Debug.h"
#include "CACTS/utils.h"
#include "common.h"

#define DEBUG_TYPE "check-collectives"

#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {
// Define Base Class and Default Constructor for main Class
#define GEN_PASS_DEF_CHECKCOLLECTIVES
#include "spmd/SPMDPasses.h.inc"

namespace {

struct CollectiveOpKey {
  OperationName name;
  bool isBlocking;

  bool operator==(const CollectiveOpKey &other) const {
    return name == other.name && isBlocking == other.isBlocking;
  }
};

struct CollectiveOpKeyHash {
  size_t operator()(const CollectiveOpKey &key) const {
    size_t h1 = hash_value(key.name); 
    size_t h2 = std::hash<bool>()(key.isBlocking);
    return llvm::hash_combine(h1, h2); // combine the two
  }
};
  

using CollectivesOrderType = std::unordered_map<CollectiveOpKey, SmallVector<SmallVector<Operation*>>, CollectiveOpKeyHash>;


bool isMV(Operation *opr) {
  if (BoolAttr attr = opr->getAttrOfType<BoolAttr>("spmd.isMultiValued")){
    return attr.getValue();
  }
  //return as true if the attribute is not set
  // this is the case for all operations when no MV analysis is done
  return true;
} 

struct ErrorInfo {
  // SmallVector<int> involvedRanks;
  SmallVector<Operation*> conflictOprs;
  SmallVector<Operation*> causingOprs; //in particular ifOps

  ErrorInfo(SmallVector<Operation*> &oprs1, SmallVector<Operation*> &oprs2) 
      : conflictOprs{oprs1}, causingOprs{oprs2} {}
};

bool getIsBlocking(Operation *opr) {
  auto attr = opr->getAttrOfType<BoolAttr>("isBlocking");
  if(attr == nullptr) {
    return true; // default value
  }
  return attr.getValue();
}

bool isSearchedComm(Operation *opr, Value &comm) {
  for (Value operand : opr->getOperands()) {
    if (isa<spmd::CommType>(operand.getType())){
      return opr->getOperand(0) == comm;
    }
  }
  llvm_unreachable("\nShould not happen in isSearchedComm\n");
}

void increaseCounterofExecutors(ArrayRef<int32_t> &executors, SmallVector<size_t> &executionOrderCounter, uint64_t numRanks) {
  for (auto executor : executors) {
    assert(executor >= 0 && "This should be ensured by mv-analysis pass");
    if (static_cast<uint64_t>(executor) < numRanks) { // If this is not the case, then it can be ignored as it would be not executed in a run with numRanks
      executionOrderCounter[executor]++;
    }
  }
}

void increaseCounterOfAll(SmallVector<size_t> &executionOrderCounter) {
  for (auto& counter : executionOrderCounter) {
    counter++;
  }
}

void increaseContainerSizesIfNeeded(CollectivesOrderType &collectivesOrder, size_t executionOrderCounter) {
  // Iterate through containers in collectivesOrder
  for (auto &[_, container] : collectivesOrder) {
    // If the container size is smaller than executionOrderCounter, add empty vectors
    if (container.size() <= executionOrderCounter) {
      // Resize to ensure it can accommodate up to executionOrderCounter
      container.resize(executionOrderCounter + 1); // Add empty inner vectors
    }
  }
}

void updateCollectivesOrderForExecutors(CollectivesOrderType &collectivesOrder, ArrayRef<int32_t> &executors,
    SmallVector<size_t> &executionOrderCounter, uint64_t numRanks, Operation *opr) {
  OperationName opName = opr->getName();
  bool isBlocking = getIsBlocking(opr);
  CollectiveOpKey key{opName, isBlocking};
  for (int32_t executor : executors) {
    if (static_cast<uint64_t>(executor) < numRanks) {
      size_t counter = executionOrderCounter[executor];
      auto &container = collectivesOrder[key];
      increaseContainerSizesIfNeeded(collectivesOrder, counter);
      container[counter].push_back(opr);
    }
  }
}

void updateCollectivesOrderForAll(CollectivesOrderType &collectivesOrder,
    SmallVector<size_t> &executionOrderCounter, Operation *opr) {
  OperationName opName = opr->getName();
  bool isBlocking = getIsBlocking(opr);
  CollectiveOpKey key{opName, isBlocking};
  for (auto counter : executionOrderCounter) {
    auto &container = collectivesOrder[key];
    increaseContainerSizesIfNeeded(collectivesOrder, counter);
    container[counter].push_back(opr);
  }
}

void handleCollectiveType(Operation *opr, CollectivesOrderType &collectivesOrder,
    SmallVector<size_t> &executionOrderCounter, uint64_t numRanks) {
if (numRanks > 0 && isStaticExecution(opr)) {
  auto executors = getExecutors(opr);
  updateCollectivesOrderForExecutors(collectivesOrder, executors, executionOrderCounter, numRanks, opr);
  increaseCounterofExecutors(executors, executionOrderCounter, numRanks);
}
else {
  updateCollectivesOrderForAll(collectivesOrder, executionOrderCounter, opr);
  increaseCounterOfAll(executionOrderCounter);
}
}


void elementWiseMaximum(llvm::SmallVector<size_t>& vec1, const llvm::SmallVector<size_t>& vec2) {
  if (vec2.size() > vec1.size()) {
    vec1.resize(vec2.size(), 0); // Resize vec1 and initialize new elements to 0
  } 

  for (size_t i = 0; i < vec2.size(); i++) {
    vec1[i] = std::max(vec1[i], vec2[i]);
  }
}


void iterateForCollectives(Region &toBeIteratedRegion, CollectivesOrderType &collectivesOrder,
    SmallVector<size_t> &executionOrderCounter, Value &comm, uint64_t numRanks) {
  for (auto &oprRef : toBeIteratedRegion.getOps()) {
    Operation *opr = &oprRef;

    if(opr->hasTrait<spmd::Collective>() && isSearchedComm(opr, comm)) {
      handleCollectiveType(opr, collectivesOrder, executionOrderCounter, numRanks);
      continue;
    }
    else if (auto ifOp = dyn_cast<scf::IfOp>(opr)){
      SmallVector<size_t> executionOrderCounterCopy(executionOrderCounter);
      iterateForCollectives(ifOp.getThenRegion(), collectivesOrder, executionOrderCounter, comm, numRanks);
      if (ifOp.getElseRegion().empty() == false) {
        iterateForCollectives(ifOp.getElseRegion(), collectivesOrder, executionOrderCounterCopy, comm, numRanks);
        elementWiseMaximum(executionOrderCounter, executionOrderCounterCopy);
      }
    }
    else if (auto forOp = dyn_cast<scf::ForOp>(opr)){
      iterateForCollectives(forOp.getRegion(), collectivesOrder, executionOrderCounter, comm, numRanks);
    }
    else if (auto whileOp = dyn_cast<scf::WhileOp>(opr)) {
      iterateForCollectives(whileOp.getBefore(), collectivesOrder, executionOrderCounter, comm, numRanks);
      iterateForCollectives(whileOp.getAfter(), collectivesOrder, executionOrderCounter, comm, numRanks);
    }
    else if (auto switchOp = dyn_cast<scf::IndexSwitchOp>(opr)) {    
      for (Region &caseRegion : switchOp.getCaseRegions()) {
        SmallVector<size_t> caseCounter(executionOrderCounter);
        iterateForCollectives(caseRegion, collectivesOrder, caseCounter, comm, numRanks);
        elementWiseMaximum(executionOrderCounter, caseCounter);
      }
    
      // Optional: handle the default case (if present)
      if (!switchOp.getDefaultRegion().empty()) {
        SmallVector<size_t> defaultCounter(executionOrderCounter);
        iterateForCollectives(switchOp.getDefaultRegion(), collectivesOrder, defaultCounter, comm, numRanks);
        elementWiseMaximum(executionOrderCounter, defaultCounter);
      }
    }
    else if (isa<BranchOpInterface>(opr)){
      llvm_unreachable("\nNot implemented case of an branch op interface\n");
    }
  }
}

SmallVector<Operation*> getEnclosingOps(Operation *opr) {
  SmallVector<Operation*> pdf;
  Operation* parentOpr = opr;
  while((parentOpr = parentOpr->getParentOp())) {
    if (isa<RegionBranchOpInterface>(parentOpr)) {
      pdf.push_back(parentOpr);
    }
  }
  std::reverse(pdf.begin(), pdf.end());
  return pdf;
}


uint64_t checkIfContainsOneOfCollectives(Region &toBeIteratedRegion, 
    SmallVector<Operation*> filteredFusedPDFs, SmallVector<Operation*> collectives) {
  int64_t result = 0;
  toBeIteratedRegion.walk([&](Operation *opr) { 
    if (collectives[0]->getName () == opr->getName() && std::find(collectives.begin(), collectives.end(), opr) != collectives.end()) {
      result = std::max(result, cast<IntegerAttr>(opr->template getAttrOfType<IntegerAttr>("numberOfExecution")).getInt());
    }
  });
  return result;
}

bool isPDFP(Operation *ifOrSwitchOpr, SmallVector<Operation*> filteredFusedPDFs, SmallVector<Operation*> collectives) {
  if (auto ifOp = dyn_cast<scf::IfOp>(ifOrSwitchOpr)) {
    uint64_t thenBranch = checkIfContainsOneOfCollectives(ifOp.getThenRegion(), filteredFusedPDFs, collectives);
    uint64_t elseBranch = 0;
    if (ifOp.getElseRegion().empty() == false) {
      elseBranch = checkIfContainsOneOfCollectives(ifOp.getElseRegion(), filteredFusedPDFs, collectives);
    }
    // both branches include one of collective, both not containing can not happen,
    // otherwise they would be not in the preliminary PDFList
    return thenBranch != elseBranch;
  }
  else if (auto switchOp = dyn_cast<scf::IndexSwitchOp>(ifOrSwitchOpr)) {
    // Use the default region as the reference
    uint64_t referenceValue = checkIfContainsOneOfCollectives(switchOp.getDefaultRegion(), filteredFusedPDFs, collectives);

    // Iterate over the case regions and check against the reference value
    for (Region &caseRegion : switchOp.getCaseRegions()) {
      uint64_t caseValue = checkIfContainsOneOfCollectives(caseRegion, filteredFusedPDFs, collectives);
      if (caseValue != referenceValue) {
        return true;  // If any case region differs, return true
      }
    }

    // If all case regions match the default region, return false
    return false;
  }
  else {
    llvm_unreachable("\nNot implemented case of an ifOp or switchOp\n");
  }

}

//check if one of both lists start same as the other
bool checkIfStartsSame(SmallVector<Operation*> &originalSubList, SmallVector<Operation*> &subList) {
  size_t subListSize = subList.size();
  size_t originalSubListSize = originalSubList.size();
  size_t smallerSize = std::min(subListSize, originalSubListSize);
  for (size_t j=0; j<smallerSize; j++) {
    if (subList[j] != originalSubList[j]) {
      return false;
    }
  }
  return true;
}

//check if fusedIfOpsLists includes a list starting same as originalSubList
// if there is one, then the index of the respective sublist will be stored in foundIdx
bool checkIfIncluded(size_t *foundIdx, SmallVector<Operation*> &originalSubList,
      SmallVector<SmallVector<Operation*>> &fusedIfOpsLists) {
  for (size_t i=0; i<fusedIfOpsLists.size(); i++) { 
    auto &subList = fusedIfOpsLists[i];
    if (checkIfStartsSame(originalSubList, subList)) {
      *foundIdx = i;
      return true;
    }  
  }
  return false;
}

bool calculateNumIterations(scf::ForOp forOp, int64_t *numIterations) {
    // Check if lower bound, upper bound, and step are constant
    auto lowerBoundOp = forOp.getLowerBound().getDefiningOp<arith::ConstantOp>();
    auto upperBoundOp = forOp.getUpperBound().getDefiningOp<arith::ConstantOp>();
    auto stepOp = forOp.getStep().getDefiningOp<arith::ConstantOp>();

    if (!lowerBoundOp || !upperBoundOp || !stepOp) {
        return false; // Indicating that the number of iterations cannot be determined statically
    }

    // Extract constant values
    int64_t lowerBound = cast<IntegerAttr>(lowerBoundOp.getValue()).getInt();
    int64_t upperBound = cast<IntegerAttr>(upperBoundOp.getValue()).getInt();
    int64_t step = cast<IntegerAttr>(stepOp.getValue()).getInt();

    // Calculate the number of iterations
    if (step == 0) {
        llvm::errs() << "Step value is zero, which is invalid.\n";
        return false; // Indicating an error
    }

    *numIterations = (upperBound - lowerBound + step - 1) / step; // Ceiling of division
    return true;
}

SmallVector<Operation*> getPDFP(SmallVector<Operation*> collectives, uint64_t numRanks) {
  //Statically available executing ranks and numRanks Extension
  //if the number of ranks for execution is given, check if each rank is executing the operation, provided that the executing ranks are statically known
  if (numRanks != 0){
    SmallVector<bool> executedBy(numRanks, false);
    for (Operation* opr : collectives) {
      if (isStaticExecution(opr)) {
        auto executors = getExecutors(opr);
        for (auto executor : executors) {
          if (static_cast<uint64_t>(executor) < numRanks){
            executedBy[executor] = true;
          }
        }
      }
    }
    if (std::find(executedBy.begin(), executedBy.end(), false) == executedBy.end()) {
      return SmallVector<Operation*>();
    }
  }

  SmallVector<SmallVector<Operation*>> enclosingOpsPerCollective;
  for (Operation* opr : collectives) {
    enclosingOpsPerCollective.push_back(getEnclosingOps(opr));
  }

  // Loop Execution Count Extensions
  for (size_t i = 0; i < collectives.size(); i++) {
    if (enclosingOpsPerCollective[i].empty()) {
      continue;
    }
    Operation* opr = collectives[i];
    OpBuilder builder(opr);
    //set default number of execution
    int64_t numIterations = 1;
    size_t numEnclosingOps = enclosingOpsPerCollective[i].size();
    for (size_t j = 0; j<numEnclosingOps;j++) {
      //only regard loops that are directly including the collective without an ifOp in-between
      if (isa<scf::IfOp>(enclosingOpsPerCollective[i][numEnclosingOps-j-1]) || isa<scf::IndexSwitchOp>(enclosingOpsPerCollective[i][numEnclosingOps-j-1])) {
        // ifOp or switchOp is not enclosing the collective, so break
        break;
      }
      else if (auto forOp = dyn_cast<scf::ForOp>(enclosingOpsPerCollective[i][numEnclosingOps-j-1])) {
        int64_t loopCount;
        if (calculateNumIterations(forOp, &loopCount)) {
          numIterations *= loopCount;
          enclosingOpsPerCollective[i].pop_back();
        }
      }
      else if (isa<scf::WhileOp>(enclosingOpsPerCollective[i][numEnclosingOps-j-1])) {
        //do nothing
      }
      else {
        llvm_unreachable("\nEnclosingOp should be one of regionBranchInterface of SCF\n");
      }
    }
    opr->setDiscardableAttr(StringRef("numberOfExecution"), builder.getI64IntegerAttr(numIterations)); 
  }

  //calculate those scf chains that enclose the collectives but do not include duplicates
  // TODO: this should be in theory inpossible, since if there is a collective at [A,B] there can no be at [A,B,C]
  // if given [A,B] and [A,B,C], [A,B,D] keep [A,B,C] and [A,B,D]
  SmallVector<SmallVector <Operation*>> fusedOpsLists;
  for (auto &originalSubList : enclosingOpsPerCollective) {
    // if no ifOpr etc, enlosing the colletive, is present, then skip it
    // todo: this should be not possible
    if (originalSubList.empty()) {
      continue;
    }
    size_t foundIdx;
    bool found = checkIfIncluded(&foundIdx, originalSubList, fusedOpsLists);

    if (found == false) {
      fusedOpsLists.push_back(originalSubList);
    }
    else {
      if (originalSubList.size() > fusedOpsLists[foundIdx].size()) {
        fusedOpsLists[foundIdx] = originalSubList;
      }
    }
  } 

  //only include those enclosing ops that are MV, meaning skip first branchOps that are SV
  SmallVector<SmallVector <Operation*>> filteredFusedOpsLists;
  for (auto &subList : fusedOpsLists) {
    size_t subListSize = subList.size();
    for (size_t j=0; j<subListSize; j++) { 
      Operation *opr = subList[j];
      if (isMV(opr)) {
        filteredFusedOpsLists.emplace_back(subList.begin()+j, subList.end());
        break;
      }
    }
  }

  SmallVector<Operation*> PDFP;
  SmallVector<Operation*> checkedIfAndSwitchOprs;
  for (auto &subList : filteredFusedOpsLists) {
    for (Operation *opr : subList) {
      if (isa<scf::IfOp>(opr) || isa<scf::IndexSwitchOp>(opr)) {
        // since filteredFusedOpsLists can still have [A,B,C] and [A,B,D], to avoid extra work only check one ifOp or SwitchOp (here A) once
        if (std::find(checkedIfAndSwitchOprs.begin(), checkedIfAndSwitchOprs.end(), opr) == checkedIfAndSwitchOprs.end()) { //not found
          if (isPDFP(opr, subList, collectives)) {
            PDFP.push_back(opr);
            break;
          }
          checkedIfAndSwitchOprs.push_back(opr);
        }
      }
      else {
        // conditionals like forOps or whileOps are regarded if a static analysis was not possible
        if (std::find(PDFP.begin(), PDFP.end(), opr) == PDFP.end()) { //not found 
          PDFP.push_back(opr);
          checkedIfAndSwitchOprs.push_back(opr);
          break;
        }
      }
    }
    //only take the last branchLikeOp with an unmatched execution
    // if (tmpList.empty() == false) {
    //   PDFP.push_back(tmpList.back());
    // }
  }

  return PDFP;
}

void checkErrors(CollectivesOrderType &collectivesOrder, SmallVector<ErrorInfo> &errorInfos, uint64_t numRanks) {
  for (auto& [_, container] : collectivesOrder) {
    for (auto& oprs : container) {
      if (oprs.empty()) {
        continue;
      }
      SmallVector<Operation*> PDFP = getPDFP(oprs, numRanks);
      if (PDFP.size() > 0) {
        errorInfos.emplace_back(oprs, PDFP);
      }
    }
  }
}

SmallVector<Value> getComms(Operation *mainOpr){
  SmallVector<Value> comms;
  mainOpr->walk([&](Operation *opr) {
    for (Value result : opr->getResults()) {
      if (isa<spmd::CommType>(result.getType()))
      comms.push_back(result);
    }
  });
  return comms;
}

void dumpErrorsToJson(const SmallVector<ErrorInfo> &errorInfos,
                      const std::string &outputFilePath) {
  llvm::json::Array messages;

  std::string actualPath = outputFilePath;
  if (actualPath.empty()) {
    std::filesystem::path cwd = std::filesystem::current_path();
    actualPath = (cwd / "collective_mismatch_report.json").string();
  }

  for (const auto &err : errorInfos) {
    llvm::json::Array references;

    // Collect locations of conflict operations
    for (auto *op : err.conflictOprs) {
      mlir::Location loc = findLocToShowWrapper(op->getLoc());
      references.push_back(getLocationJson(loc));
    }

    // Collect locations of causing (e.g. ifOps) operations
    // for (auto *op : err.causingOprs) {
    //   mlir::Location loc = findLocToShowWrapper(op->getLoc());
    //   references.push_back(getLocationJson(loc));
    // }

    // Create a textual description
    std::ostringstream oss;
    oss << "Detected conflict involving " << err.conflictOprs.size()
        << " operation(s) and " << err.causingOprs.size() << " causing if-operation(s).";

    // Create the message object
    llvm::json::Object msg{
        {"error_id", ""},  // Could add hash if needed
        {"type", "Collective Mismatch"},
        {"text", oss.str()},
        {"references", std::move(references)}
    };

    messages.push_back(std::move(msg));
  }

  // Wrap the full structure
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


void printErrorInfos(SmallVector<ErrorInfo> &errorInfos) {
  fprintf(stderr, "\n\n--------------------------------------------------------------------------------------------------------------\n");
  fprintf(stderr, "Static Verification of Collective Communication:");
  fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n\n");

  if (!errorInfos.empty()) {
    for (const auto &errorInfo : errorInfos) {
      for (size_t i = 0; i < errorInfo.conflictOprs.size(); i++) {
        errorInfo.conflictOprs[i]->emitWarning(errorInfo.conflictOprs[i]->getName().stripDialect().str() +  
            " operation/call may not be called by all processes in communicator/team (Call Ordering Error)");
        
        if (i + 1 < errorInfo.conflictOprs.size()) {
          fprintf(stderr, "\n\nand\n\n");
        }
      }

      fprintf(stderr, "\n----------------\n");
      fprintf(stderr, "\nProbably due to the conditionals:");
      fprintf(stderr, "\n--------\n");

      for (size_t i = 0; i < errorInfo.causingOprs.size(); i++) {
        errorInfo.causingOprs[i]->emitRemark(llvm::Twine("probable causing conditional number ") + llvm::Twine(i));
        
        if ((i+1) < errorInfo.causingOprs.size()) {
          fprintf(stderr, "\n\nand\n\n");
        }
      }

      fprintf(stderr, "\n--------------------------------------------------------------------------------------------------------------\n\n");
    }
    fprintf(stderr, "\n\n");
  } else {
    fprintf(stderr, "No Collective Communication Error Found");
    fprintf(stderr, "\n\n--------------------------------------------------------------------------------------------------------------\n");
    fprintf(stderr, "\n\n");
  }
}

// assume that all comm worlds are of same size and proper rank management is done by user
void unifyCommWorlds(SmallVector<Value> &comms) {
  Value firstCommWorld;
  bool firstCommWorldFound = false;
  for (Value comm : comms) {
    if (isa<spmd::CommWorldOp>(comm.getDefiningOp())) {
      if (firstCommWorldFound == false) {
        firstCommWorldFound = true;
        firstCommWorld = comm;
      }
      else {
        comm.replaceAllUsesWith(firstCommWorld);
      }
    }
  }
}

struct CheckCollectives : impl::CheckCollectivesBase<CheckCollectives> {
  using CheckCollectivesBase::CheckCollectivesBase;
  void runOnOperation() override {
    ModuleOp moduleOp = getOperation();
    Operation *mainOpr = moduleOp.lookupSymbol("main");  
    if (mainOpr == NULL) {
      LLVM_DEBUG(DBGS() << "Pass failed since no main func exists\n");
      signalPassFailure();
      return;
    }

    SmallVector<ErrorInfo> errorInfos;
    SmallVector<Value> comms = getComms(mainOpr);
    unifyCommWorlds(comms);
    for (Value &comm : comms) {
      CollectivesOrderType collectivesOrder;
      SmallVector<size_t> executionOrderCounter;

      executionOrderCounter.push_back(0);
      if (numRanks > 0) {
        executionOrderCounter.resize(numRanks);
        std::fill(executionOrderCounter.begin() + 1, executionOrderCounter.end(), 0);
      }

      iterateForCollectives(mainOpr->getRegion(0), collectivesOrder, executionOrderCounter, comm, numRanks);
      checkErrors(collectivesOrder, errorInfos, numRanks);
    }

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
