//===- SPMDPasses.td - SPMD dialect passes -------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef SPMD_PASSES
#define SPMD_PASSES

include "mlir/Pass/PassBase.td"

def CheckDataRace : Pass<"check-dataRace", "ModuleOp"> {
  let summary = "Checks statically if the given IR includes a data race.";
  let description = [{
    This pass checks for data races in the given IR. Optionally, it can output
    the result as a JSON report if the flag `--write-json-report` is set.
  }];
  let dependentDialects = [];
  let statistics = [];

  let options = [
    Option<"writeJsonReport", "write-json-report", "bool", /*default=*/"false",
           "Write the data race report as a JSON file.">
  ];
}


def ConvertApiCallsToSPMD : Pass<"convert-apiCalls-to-spmd", "ModuleOp"> { 
  let summary = "Converts api calls related to collectives of different programming models such as MPI or OpenSHMEM to a so-called SPMD dialect.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["spmd::SPMDDialect", "memref::MemRefDialect", "arith::ArithDialect", "LLVM::LLVMDialect"];
  let statistics = [];
}

def ConvertLLVMToFunc : Pass<"convert-llvm-to-func", "ModuleOp"> { 
  let summary = "Converts funcOps and callOps of the llvm dialect to those of the func dialect";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["func::FuncDialect"]; 
  let options = [];
  let statistics = [];
}

def PrepareLLVMFuncInline : Pass<"prepare-llvm-func-inline", "ModuleOp"> { 
  let summary = "Marks alls llvm funcs as always_inline so that they get inlined with the standard inline pass.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["LLVM::LLVMDialect"]; 
  let options = [];
  let statistics = [];
}

def HandleLLVMUnreachable : Pass<"handle-llvm-unreachable", "ModuleOp"> { 
  let summary = "Convert all llvm.unreachable ops to llvm.return ops (assuming all functions being inlined).";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["LLVM::LLVMDialect"]; 
  let options = [];
  let statistics = [];
}

def DeleteInlinedFuncs : Pass<"delete-inlined-funcs", "ModuleOp"> { 
  let summary = "Erase all llvm.func (in future also func.func) ops that were previously inlined and not needed in the main module.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["LLVM::LLVMDialect"]; 
  let options = [];
  let statistics = [];
}

def ConvertSCFSwitchToIf : Pass<"convert-scf-switch-to-if", "ModuleOp"> { 
  let summary = "Convert all scf.index_switch ops to a chain of scf.if ops.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["scf::SCFDialect"]; 
  let options = [];
  let statistics = [];
}

def ConvertArithSelectToIf : Pass<"convert-arith-select-to-if", "ModuleOp"> { 
  let summary = "Convert all scf.select ops to an scf.if op and insert depending operations.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["scf::SCFDialect"]; 
  let options = [];
  let statistics = [];
}

def SimplifyCmpOps : Pass<"simplify-cmp-ops", "ModuleOp"> { 
  let summary = "If possible, simplify cmp ops represented by additional if ops by cmp ops only.";
  let description = [{
    sample Text
  }];
  let dependentDialects = ["arith::ArithDialect"]; 
  let options = [];
  let statistics = [];
}

def InlineGPULaunchFuncs : Pass<"inline-gpu-launch-funcs", "ModuleOp"> { 
  let summary = "Inlines the gpu functions in gpu module into its calling site at gpu launch func operations and move exteral functions to the main module.";
  let description = [{
    sample Text
  }];
  let dependentDialects = []; 
  let options = [];
  let statistics = [];
}

def MultiValueAnalysis : Pass<"multi-value-analysis", "ModuleOp"> { 
  let summary = "Analyse IR and add attributes specifying multi-valuedness and executor behavior.";
  let description = [{
    sample Text
  }];
  let dependentDialects = [];
  let options = [];
  let statistics = [];
}

def CheckCollectives : Pass<"check-collectives", "ModuleOp"> {
  let summary = "Checks statically if the given IR includes a collective communication error.";
  let description = [{
    This pass checks for collective communication errors in the given IR. Optionally, it can output
    the result as a JSON report if the flag `--write-json-report` is set.
  }];
  let dependentDialects = [];

  let options = [
    Option<"numRanks", "num-ranks", "uint64_t",
           /*default=*/"0",
           "Set number of ranks with which the SPMD program shall be run (default: 0, meaning unspecified)">,
    Option<"writeJsonReport", "write-json-report", "bool", /*default=*/"false",
           "Write the collective communication error report as a JSON file.">
  ];

  let statistics = [];
}


#endif // SPMD_PASSES
