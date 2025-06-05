//===- spmd-opt.cpp ---------------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
// #include "mlir/InitAllDialects.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Async/IR/Async.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/LLVMIR/NVVMDialect.h"
// #include "mlir/Dialect/Math/IR/Math.h"
// #include "mlir/Dialect/OpenMP/OpenMPDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlow.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/DLTI/DLTI.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/UB/IR/UBOps.h"
// #include "polygeist/Dialect.h"

#include "mlir/Dialect/LLVMIR/Transforms/InlinerInterfaceImpl.h"
#include "mlir/Dialect/Func/Extensions/InlinerExtension.h"
// #include "mlir/InitAllPasses.h"
// #include "mlir/Pass/Pass.h"
// #include "mlir/Pass/PassManager.h"

#include "mlir/Conversion/Passes.h"
#include "mlir/Transforms/Passes.h"


#include "mlir/Tools/mlir-opt/MlirOptMain.h"
// #include "mlir/Support/FileUtilities.h"

// #include "llvm/Support/CommandLine.h"
// #include "llvm/Support/InitLLVM.h"
// #include "llvm/Support/SourceMgr.h"
// #include "llvm/Support/ToolOutputFile.h"

#include "spmd/SPMDDialect.h"
#include "spmd/SPMDPasses.h"
#include <cstdlib>

// TODO: commented out to build without polygeist dependencies
// copied over from polygeist-opt for extending memref 
// using namespace mlir;

// class MemRefInsider
//     : public mlir::MemRefElementTypeInterface::FallbackModel<MemRefInsider> {};

// template <typename T>
// struct PtrElementModel
//     : public mlir::LLVM::PointerElementTypeInterface::ExternalModel<
//           PtrElementModel<T>, T> {};
// copied over from polygeist-opt for extending memref -- end

int main(int argc, char **argv) {
  const char *exitCodeEnvVar = std::getenv("SPMD_IR_EXITCODE");
  int userExitcode = exitCodeEnvVar ? std::atoi(exitCodeEnvVar) : 1;
  // Register possible passes for spmd-opt
  mlir::spmd::registerSPMDPasses();
  // Register possibly standard passes
  mlir::registerCanonicalizer(); 
  mlir::registerCSE(); 
  mlir::registerMem2Reg(); 
  mlir::registerInliner(); 
  mlir::registerLiftControlFlowToSCFPass(); 
  mlir::registerPromoteScfWhilePass(); 

//   mlir::registerReconcileUnrealizedCasts();
// mlir::registerCSEPass();

  // Register dialects that may be part of input to spmd-opt
  mlir::DialectRegistry registry;
  registry.insert<mlir::spmd::SPMDDialect>();
  // "core" dialects
  registry.insert<mlir::arith::ArithDialect>();
  // registry.insert<mlir::func::FuncDialect>();
  registry.insert<mlir::LLVM::LLVMDialect>();
  registry.insert<mlir::memref::MemRefDialect>();
  registry.insert<mlir::scf::SCFDialect>();
  registry.insert<mlir::cf::ControlFlowDialect>();
  registry.insert<mlir::DLTIDialect>(); //needed for the attributed on moduleOp
  registry.insert<mlir::gpu::GPUDialect>(); // needed for nvshmem support
  registry.insert<mlir::NVVM::NVVMDialect>(); // needed for nvshmem support
  registry.insert<mlir::ub::UBDialect>(); //occurs e.g. for proxy apps such as stencil from PRK

  mlir::LLVM::registerInlinerInterface(registry); // needed for nvshmem support (InlineGPULaunchFuncs)
  mlir::func::registerInlinerExtension(registry);  // needed for registerLiftControlFlowToSCFPass?

  // registry.insert<mlir::affine::AffineDialect>();
  // registry.insert<mlir::async::AsyncDialect>();
  // registry.insert<mlir::polygeist::PolygeistDialect>();

  // registry.insert<mlir::omp::OpenMPDialect>();
  // registry.insert<mlir::math::MathDialect>();
  // Add the following to include *all* MLIR Core dialects, or selectively
  // include what you need like above. You only need to register dialects that
  // will be *parsed* by the tool, not the one generated
  // registerAllDialects(registry);


  // copied over from polygeist-opt for extending memref 
  // TODO: commented out to build without polygeist dependencies
  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMFunctionType::attachInterface<MemRefInsider>(*ctx);
  // });
  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMArrayType::attachInterface<MemRefInsider>(*ctx);
  // });
  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMPointerType::attachInterface<MemRefInsider>(*ctx);
  // });
  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMStructType::attachInterface<MemRefInsider>(*ctx);
  // });
  // registry.addExtension(+[](MLIRContext *ctx, memref::MemRefDialect *dialect) {
  //   MemRefType::attachInterface<PtrElementModel<MemRefType>>(*ctx);
  // });

  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMStructType::attachInterface<
  //       PtrElementModel<LLVM::LLVMStructType>>(*ctx);
  // });

  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMPointerType::attachInterface<
  //       PtrElementModel<LLVM::LLVMPointerType>>(*ctx);
  // });

  // registry.addExtension(+[](MLIRContext *ctx, LLVM::LLVMDialect *dialect) {
  //   LLVM::LLVMArrayType::attachInterface<PtrElementModel<LLVM::LLVMArrayType>>(
  //       *ctx);
  // });
  // copied over from polygeist-opt for extending memref -- end


  auto res = mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "SPMD optimizer driver\n", registry));
  return res ? userExitcode : res;
}
