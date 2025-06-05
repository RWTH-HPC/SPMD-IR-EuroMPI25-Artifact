//===- SPMDOps.td - SPMD dialect ops ----------------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//

#ifndef SPMD_OPS
#define SPMD_OPS

include "SPMDDialect.td"
include "spmd/SPMDTypes.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "mlir/Interfaces/ViewLikeInterface.td" //
include "mlir/Interfaces/ControlFlowInterfaces.td"
// include "mlir/IR/SymbolInterfaces.td" //
include "mlir/Dialect/LLVMIR/LLVMOpBase.td"
// include "mlir/Dialect/LLVMIR/LLVMOpsInterfaces.td"

include "mlir/IR/OpBase.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/IR/Traits.td"

// Op results are not the same for each thread.
def ResultsNonUniform : NativeOpTrait<"ResultsNonUniform">{
  let cppNamespace = "::mlir::spmd";
}

def Collective : NativeOpTrait<"Collective">{
  let cppNamespace = "::mlir::spmd";
}

def P2P : NativeOpTrait<"P2P">{
  let cppNamespace = "::mlir::spmd";
}

def ProcessManagement : NativeOpTrait<"ProcessManagement">{
  let cppNamespace = "::mlir::spmd";
}

def CommManagement : NativeOpTrait<"CommManagement">{
  let cppNamespace = "::mlir::spmd";
}

def DataManagement : NativeOpTrait<"DataManagement">{
  let cppNamespace = "::mlir::spmd";
}

def NonBlockingSync : NativeOpTrait<"NonBlockingSync">{
  let cppNamespace = "::mlir::spmd";
}

def RMA : NativeOpTrait<"RMA">{
  let cppNamespace = "::mlir::spmd";
}

def Sync : NativeOpTrait<"Sync">{
  let cppNamespace = "::mlir::spmd";
}
def Communication : NativeOpTrait<"Communication">{
  let cppNamespace = "::mlir::spmd";
}


def SPMD_InitOp : SPMD_Op<"init", [ProcessManagement]> {
  let arguments = (ins I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_FinalizeOp : SPMD_Op<"finalize", [ProcessManagement]> {
  let arguments = (ins I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GetRankInCommOp : SPMD_Op<"getRankInComm", [ProcessManagement, ResultsNonUniform, Pure]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32Attr : $usedModel);
  let results = (outs I32 : $rank,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GetDeviceInCommOp : SPMD_Op<"getDeviceInComm", [ProcessManagement, ResultsNonUniform, Pure]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32Attr : $usedModel);
  let results = (outs I32 : $device,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GetSizeOfCommOp : SPMD_Op<"getSizeOfComm", [ProcessManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32Attr : $usedModel);
  let results = (outs I32:$size, SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_CommWorldOp : SPMD_Op<"commWorld", [CommManagement, /*ConstantLike,*/ Pure]> {
  let arguments = (ins I32Attr : $usedModel);
  let results = (outs SPMD_CommType: $commWorld);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}

def SPMD_CommNodeOp : SPMD_Op<"commNode", [CommManagement, /*ConstantLike,*/ Pure]> {
  let arguments = (ins I32Attr : $usedModel);
  let results = (outs SPMD_CommType: $commNode);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}


def SPMD_CommSplitStridedOp : SPMD_Op<"commSplitStrided", [CommManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $parentComm,
                       I32 : $start,
                       I32 : $stride,
                       I32 : $size,
                       Optional<SPMD_CommConfigType> : $commConfig,
                      //  Optional<I64> : $commConfigMask, this argument is not practical as shmem has only one field in the config..
                      //  so this mask could be avoided by just passing NULL for the config or the real config when it wants to be used
                       I32Attr : $usedModel);
  let results = (outs SPMD_CommType : $newComm,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_CommDestroyOp : SPMD_Op<"commDestroy", [CommManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_CommSplitOp : SPMD_Op<"commSplit", [CommManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $parentComm,
                       I32 : $color,
                       I32 : $key,
                       Optional<SPMD_CommConfigType> : $commConfig,
                       I32Attr : $usedModel);
  let results = (outs SPMD_CommType : $newComm,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_CommDupOp : SPMD_Op<"commDup", [CommManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $oldComm,
                       I32Attr : $usedModel);
  let results = (outs SPMD_CommType : $newComm,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WaitOp : SPMD_Op<"wait", [NonBlockingSync]> {
  let arguments = (ins Arg<SPMD_ReqType, "", [MemRead, MemWrite]> : $req,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_StatusType> : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WaitAllOp : SPMD_Op<"waitAll", [NonBlockingSync]> {
  let arguments = (ins I32 : $count,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       Res<Optional<MemRefOf<[SPMD_StatusType]>>, "", [MemWrite]> : $statuses,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WaitSomeOp : SPMD_Op<"waitSome", [NonBlockingSync]> {
  let arguments = (ins I32 : $inCount,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       Arg<MemRefOf<[I32]>, "", [MemWrite]> : $indices,
                       Arg<Optional<MemRefOf<[SPMD_StatusType]>>, "", [MemWrite]> : $statuses,
                       I32Attr : $usedModel);
  let results = (outs I32 : $outCount,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WaitAnyOp : SPMD_Op<"waitAny", [NonBlockingSync]> {
  let arguments = (ins I32 : $count,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       I32Attr : $usedModel);
  let results = (outs I32 : $index,
                      Optional<SPMD_StatusType> : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_TestOp : SPMD_Op<"test", [NonBlockingSync]> {
  let arguments = (ins Arg<SPMD_ReqType, "", [MemRead, MemWrite]> : $req,
                       I32Attr : $usedModel);
  let results = (outs I1 : $flag,
                      Optional<SPMD_StatusType> : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_TestAllOp : SPMD_Op<"testAll", [NonBlockingSync]> {
  let arguments = (ins I32 : $count,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       Res<MemRefOf<[SPMD_StatusType]>, "", [MemWrite]> : $statuses,
                       I32Attr : $usedModel);
  let results = (outs I1 : $flag,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_TestSomeOp : SPMD_Op<"testSome", [NonBlockingSync]> {
  let arguments = (ins I32 : $inCount,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       Arg<MemRefOf<[I32]>, "", [MemWrite]> : $indices,
                       Res<MemRefOf<[SPMD_StatusType]>, "", [MemWrite]> : $statuses,
                       I32Attr : $usedModel);
  let results = (outs I32 : $outCount,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_TestAnyOp : SPMD_Op<"testAny", [NonBlockingSync]> {
  let arguments = (ins I32 : $count,
                       Arg<MemRefOf<[SPMD_ReqType]>, "", [MemRead, MemWrite]> : $reqs,
                       I32Attr : $usedModel);
  let results = (outs I32 : $index,
                      I1 : $flag,
                      SPMD_StatusType : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ConstDatatypeOp : SPMD_Op<"constDatatype", [/*ConstantLike,*/ Pure]> {
  let arguments = (ins TypeAttr : $typeAttr,
                       I32Attr : $usedModel);
  let results = (outs SPMD_DatatypeType: $constDatatype);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}

def SPMD_ConstOpTypeOp : SPMD_Op<"constOpType", [/*ConstantLike,*/ Pure]> {
  let arguments = (ins StrAttr : $stringAttr,
                       I32Attr : $usedModel);
  let results = (outs SPMD_OpType: $constOpType);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}

def SPMD_ConstSignalOpTypeOp : SPMD_Op<"constSignalOpType", [/*ConstantLike,*/ Pure]> {
  let arguments = (ins StrAttr : $stringAttr,
                       I32Attr : $usedModel);
  let results = (outs SPMD_SignalOpType: $constSignalOpType);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}

def SPMD_CastStreamOp : SPMD_Op<"castStream", [Pure/*, ViewLikeOpInterface*/]> {
  let arguments = (ins SPMD_AnyAddressLike : $oldStream,
                       I32Attr : $usedModel);
  let results = (outs SPMD_StreamType: $newStream);
  // let regions = ();
  let summary = "";
  let description = [{}];
}

def SPMD_MallocOp : SPMD_Op<"malloc", [DataManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I64 : $size,
                       Optional<I64> : $alignment,
                       I32Attr : $usedModel);
  let results = (outs Res<SPMD_AnyAddressLike, "", [MemAlloc]> : $address,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ReallocOp : SPMD_Op<"realloc", [DataManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "", [MemFree]>:$oldAddress,
                       I64 : $size,
                       I32Attr : $usedModel);
  let results = (outs Res<SPMD_AnyAddressLike, "", [MemAlloc]> : $newAddress,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_FreeOp : SPMD_Op<"free", [DataManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "", [MemFree]>:$address,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

// memory effects specified in SPMDOPS.cpp
// has a write effect, but not tied to any operand
def SPMD_SendOp : SPMD_Op<"send", [P2P, Communication, DeclareOpInterfaceMethods<MemoryEffectsOpInterface>]> {
  let arguments = (ins SPMD_CommType : $comm,
                       SPMD_AnyAddressLike : $sendBuf, //memRead 
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       I32 : $destRank,
                       I32 : $tag,
                       Optional<SPMD_StreamType> : $stream,  // MemWrite, MemRead
                       BoolAttr : $isBlocking,
                       BoolAttr : $isBuffered,
                       BoolAttr : $isReadyMode,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_RecvOp : SPMD_Op<"recv", [P2P, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "",
                          [MemWrite]> : $recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       I32 : $srcRank,
                       I32 : $tag,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]> : $stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      // SPMD_StatusType: status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}


def SPMD_BarrierOp : SPMD_Op<"barrier", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_BcastOp : SPMD_Op<"bcast", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       I32 : $rootRank,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ReduceOp : SPMD_Op<"reduce", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       SPMD_OpType : $reduceOp,
                       I32 : $rootRank,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_AllreduceOp : SPMD_Op<"allreduce", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       SPMD_OpType : $reduceOp,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ReduceScatterOp : SPMD_Op<"reduceScatter", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]> : $sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]> : $recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       SPMD_OpType : $reduceOp,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ScanOp : SPMD_Op<"scan", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       SPMD_OpType : $reduceOp,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ExscanOp : SPMD_Op<"exscan", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       SPMD_OpType : $reduceOp,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ScatterOp : SPMD_Op<"scatter", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                      Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                       I64 : $sendCount,
                       SPMD_DatatypeType : $sendType,
                      Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $recvCount,
                       SPMD_DatatypeType : $recvType,
                       I32 : $rootRank,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GatherOp : SPMD_Op<"gather", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "send buffer",
                             [MemRead]>:$sendBuf,
                       I64 : $sendCount,
                       SPMD_DatatypeType : $sendType,
                       Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $recvCount,
                       SPMD_DatatypeType : $recvType,
                       I32 : $rootRank,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_AllgatherOp : SPMD_Op<"allgather", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "send buffer",
                            [MemRead]>:$sendBuf,
                       I64 : $sendCount,
                       SPMD_DatatypeType : $sendType,
                       Arg<SPMD_AnyAddressLike, "recv buffer",
                             [MemWrite]>:$recvBuf,
                       I64 : $recvCount,
                       SPMD_DatatypeType : $recvType,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_AlltoallOp : SPMD_Op<"alltoall", [Collective, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "send buffer",
                            [MemRead]>:$sendBuf,
                       I64 : $sendCount,
                       SPMD_DatatypeType : $sendType,
                       Arg<SPMD_AnyAddressLike, "recv buffer",
                            [MemWrite]>:$recvBuf,
                       I64 : $recvCount,
                       SPMD_DatatypeType : $recvType,
                       Arg<Optional<SPMD_StreamType>, "stream",
                             [MemWrite, MemRead]>:$stream,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}


def SPMD_AbortOp : SPMD_Op<"abort", [ProcessManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32 : $errorCode,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}



/* ***************************************************************************************************** */
/* ------------------------------------------------ RMA ------------------------------------------------ */
/* ***************************************************************************************************** */

/* ----------------------------------------- Window Management ----------------------------------------- */
// def SPMD_WindowOp : SPMD_Op<"window", [RMA]> {
//   let arguments = (ins BoolAttr : $isAtomic,
//                        I32Attr : $usedModel);
//   let results = (outs SPMD_WinType : $win,
//                       SPMD_ErrorType : $error);
//   let summary = "";
//   let description = [{}];
// }

def SPMD_WinCreateOp : SPMD_Op<"winCreate", [RMA, DataManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "", [MemRead]> : $baseAddress,
                       Optional<I64> : $size,
                       I32 : $dispUnit,
                       I32Attr : $usedModel);
  let results = (outs Res<SPMD_WinType, "", [MemAlloc]> : $win,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WinAllocOp : SPMD_Op<"winAlloc", [RMA, DataManagement]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I64 : $size,
                       I32 : $dispUnit,
                      // Optional<I64> : $num_elems,
                       I32Attr : $usedModel);
  let results = (outs Res<SPMD_AnyAddressLike, "", [MemAlloc]> : $baseAddress,
                      Res<SPMD_WinType, "", [MemAlloc]> : $win,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_WinFreeOp : SPMD_Op<"winFree", [RMA, DataManagement]> {
  let arguments = (ins Arg<SPMD_WinType, "", [MemFree]> : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

/* ------------------------------------------ Synchronisation ------------------------------------------ */
def SPMD_FenceOp : SPMD_Op<"fence", [RMA, Sync]> {
  let arguments = (ins Optional<SPMD_WinType> : $win,
                       I32 : $assert,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_FenceOrderingOp : SPMD_Op<"fenceOrdering", [RMA]> {
  let arguments = (ins Optional<SPMD_WinType> : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_FlushOp : SPMD_Op<"flush", [RMA, Sync]> {
  let arguments = (ins I32 : $rank,
                       SPMD_WinType : $win,
                       BoolAttr : $isLocal,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_FlushAllOp : SPMD_Op<"flushAll", [RMA, Sync]> {
  let arguments = (ins Optional<SPMD_WinType> : $win,
                       BoolAttr : $isLocal,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_ConstLockTypeOp : SPMD_Op<"constLockTypeOp", [/*ConstantLike,*/ Pure]> {
  let arguments = (ins StrAttr : $stringAttr,
                       I32Attr : $usedModel);
  let results = (outs SPMD_LockType: $constLockTypeOp);
  // let regions = ();
  let summary = "";
  let description = [{}];
  // let hasFolder = 1;
}

def SPMD_LockOp : SPMD_Op<"lock", [RMA]> {
  let arguments = (ins I32 : $rank,
                       SPMD_WinType : $win,
                       SPMD_LockType : $lockType,
                       I32 : $assert,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_LockAllOp : SPMD_Op<"lockAll", [RMA]> {
  let arguments = (ins SPMD_WinType : $win,
                       I32 : $assert,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_UnlockOp : SPMD_Op<"unlock", [RMA, Sync]> {
  let arguments = (ins I32 : $rank,
                       SPMD_WinType : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_UnlockAllOp : SPMD_Op<"unlockAll", [RMA, Sync]> {
  let arguments = (ins SPMD_WinType : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

/* ------------------------------------------- Communication ------------------------------------------- */
def SPMD_PutOp : SPMD_Op<"put", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin address", [MemRead]> : $originAddr,
                       I64 : $originCount,
                       SPMD_DatatypeType : $originDatatype,
                       I64 : $originStride,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "target window", [MemWrite]> : $targetWin,
                       I64 : $targetDisp,
                       I64 : $targetCount,
                       SPMD_DatatypeType : $targetDatatype,
                       I64 : $targetStride,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_PutSignalOp : SPMD_Op<"putSignal", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin data address", [MemRead]> : $originAddr,
                       I64 : $originCount,
                       SPMD_DatatypeType : $originDatatype,
                       I64 : $originStride,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "target data window", [MemWrite]> : $targetWin,
                       I64 : $targetDisp,
                       I64 : $targetCount,
                       SPMD_DatatypeType : $targetDatatype,
                       I64 : $targetStride,
                       Arg<SPMD_WinType, "target signal window", [MemWrite]> : $targetSignalWin,
                       I64 : $signal,
                       SPMD_SignalOpType : $signalOp,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GetOp : SPMD_Op<"get", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin address", [MemWrite]> : $originAddr,
                       I64 : $originCount,
                       SPMD_DatatypeType : $originDatatype,
                       I64 : $originStride,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "target window", [MemRead]> : $targetWin,
                       I64 : $targetDisp,
                       I64 : $targetCount,
                       SPMD_DatatypeType : $targetDatatype,
                       I64 : $targetStride,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_AccumulateOp : SPMD_Op<"accumulate", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin address", [MemRead]> : $originAddr,
                       I64 : $originCount,
                       SPMD_DatatypeType : $originDatatype,
                       I64 : $originStride,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "", [MemRead, MemWrite]> : $targetWin,
                       I64 : $targetDisp,
                       I64 : $targetCount,
                       SPMD_DatatypeType : $targetDatatype,
                       I64 : $targetStride,
                       SPMD_OpType : $accOp,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_GetAccumulateOp : SPMD_Op<"getAccumulate", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin address", [MemRead]> : $originAddr,
                       I64 : $originCount,
                       SPMD_DatatypeType : $originDatatype,
                       I64 : $originStride,
                       Arg<SPMD_AnyAddressLike, "result address", [MemWrite]> : $resultAddr,
                       I64 : $resultCount,
                       SPMD_DatatypeType : $resultDatatype,
                       I64 : $resultStride,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "", [MemRead, MemWrite]> : $targetWin,
                       I64 : $targetDisp,
                       I64 : $targetCount,
                       SPMD_DatatypeType : $targetDatatype,
                       I64 : $targetStride,
                       SPMD_OpType : $accOp,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_SwapOp : SPMD_Op<"swap", [RMA, Communication]> {
  let arguments = (ins Arg<AnyMemRef, "origin buffer", [MemRead]> : $originBuf,
                       Arg<AnyMemRef, "result buffer", [MemRead]> : $resultBuf,
                       SPMD_DatatypeType : $datatype,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "", [MemWrite]> : $targetWin,
                       I64 : $targetDisposition,
                       BoolAttr : $isAtomic,
                       BoolAttr: $isNonBlocking,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_CompareAndSwapOp : SPMD_Op<"compareAndSwap", [RMA, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "origin address", [MemRead]> : $originAddr,
                       Arg<SPMD_AnyAddressLike, "compare address", [MemRead]> : $compareAddr,
                       Arg<SPMD_AnyAddressLike, "result address", [MemWrite]> : $resultAddr,
                       SPMD_DatatypeType : $type,
                       I32 : $targetRank,
                       Arg<SPMD_WinType, "", [MemRead,MemWrite]> : $targetWin,
                       I64 : $targetDisposition,
                       BoolAttr: $isBlocking,
                       BoolAttr : $isAtomic,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

/* ***************************************************************************************************** */
/* -------------------------------------------- Device Stuff ------------------------------------------- */
/* ***************************************************************************************************** */

/* ----------------------------------------- Device Memory Management ----------------------------------------- */
// later when not operating anymore on llvm ptrs, we could use gpu dialect instead, it provices similar operations

def SPMD_MemcpyOp : SPMD_Op<"memcpy", [DataManagement]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "", [MemWriteAt<0, FullEffect>]> : $dst,
                       Arg<SPMD_AnyAddressLike, "", [MemReadAt<0, FullEffect>]> : $src,
                       I64 : $count,
                       I32 : $kind,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_MemsetOp : SPMD_Op<"memset", [DataManagement]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "", [MemWriteAt<0, FullEffect>]> : $dst,
                       I32 : $value,
                       I64 : $count,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

/* ***************************************************************************************************** */
/* -------------------------------------------- MPI Specific Stuff ------------------------------------------- */
/* ***************************************************************************************************** */
def SPMD_DimsCreateOp : SPMD_Op<"dimsCreate", [Pure]> {
  let arguments = (ins I32 : $nProc,
                       I32 : $nDims,
                       Arg<SPMD_AnyAddressLike, "", 
                          [MemReadAt<0, FullEffect>, MemWriteAt<0, FullEffect>]> : $dims,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

//TODO: reorder could be set to a custom type that eases static analysis
def SPMD_CartCreateOp: SPMD_Op<"cartCreate", [CommManagement, Pure]> {
  let arguments = (ins SPMD_CommType : $oldComm,
                       I32 : $nDims,
                       Arg<SPMD_AnyAddressLike, "", 
                          [MemReadAt<0, FullEffect>]> : $dims,
                       Arg<SPMD_AnyAddressLike, "", 
                          [MemReadAt<0, FullEffect>]> : $periods,
                       I32 : $reorder,
                       I32Attr : $usedModel);
  let results = (outs SPMD_CommType : $cartComm,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

//TODO: msg could be set to a custom type that eases static analysis
def SPMD_MProbeOp: SPMD_Op<"mProbe", [Pure]> {
  let arguments = (ins SPMD_CommType : $comm,
                       I32 : $srcRank,
                       I32 : $tag,
                       I32Attr : $usedModel);
  let results = (outs Res<SPMD_AnyAddressLike, "", [MemAlloc]> : $msg,
                      Optional<SPMD_StatusType> : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

//TODO: msg could be set to a custom type that eases static analysis
def SPMD_MRecvOp: SPMD_Op<"mRecv", [P2P, Communication]> {
  let arguments = (ins Arg<SPMD_AnyAddressLike, "", [MemWriteAt<0, FullEffect>]> : $recvBuf,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       Arg<SPMD_AnyAddressLike, "", [MemReadAt<0, FullEffect>]> : $msg,
                       BoolAttr : $isBlocking,
                       I32Attr : $usedModel);
  let results = (outs Optional<SPMD_ReqType> : $req,
                      // Optional<SPMD_StatusType> : $status,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

def SPMD_StartOp: SPMD_Op<"start", [P2P, Communication]> {
  let arguments = (ins Arg<SPMD_ReqType, "", [MemRead, MemWrite]> : $req,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

//TODO: partition could be set to a custom type that eases static analysis
def SPMD_PReadyOp: SPMD_Op<"pReady", [P2P, Communication]> {
  let arguments = (ins I32 : $partition,
                       Arg<SPMD_ReqType, "", [MemRead, MemWrite]> : $req,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}


// memory effects specified in SPMDOPS.cpp
// has a write effect, but not tied to any operand
def SPMD_SendInitOp : SPMD_Op<"sendInit", [P2P, Communication, DeclareOpInterfaceMethods<MemoryEffectsOpInterface>]> {
  let arguments = (ins SPMD_CommType : $comm,
                       SPMD_AnyAddressLike : $sendBuf, //memRead 
                       Optional<I32> : $partitions,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       I32 : $destRank,
                       I32 : $tag,
                      //  Optional<SPMD_StreamType> : $stream,  // MemWrite, MemRead
                       BoolAttr : $isBlocking,
                       BoolAttr : $isBuffered,
                       BoolAttr : $isReadyMode,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ReqType : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}



def SPMD_RecvInitOp : SPMD_Op<"recvInit", [P2P, Communication]> {
  let arguments = (ins SPMD_CommType : $comm,
                       Arg<SPMD_AnyAddressLike, "",
                          [MemWrite]> : $recvBuf,
                       Optional<I32> : $partitions,
                       I64 : $dataCount,
                       SPMD_DatatypeType : $datatype,
                       I32 : $srcRank,
                       I32 : $tag,
                      //  Optional<SPMD_StreamType> : $stream,  // MemWrite, MemRead
                       BoolAttr : $isBlocking,
                      //  BoolAttr : $isBuffered,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ReqType : $req,
                      SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}

//Todo: Incorporate Groups as typed values, and all other group ops
def SPMD_WinStartOp : SPMD_Op<"winStart", [RMA]> {
  let arguments = (ins I32 : $group,
                       I32 : $assert,
                       SPMD_WinType : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}


def SPMD_WinCompleteOp : SPMD_Op<"winComplete", [RMA, Sync]> {
  let arguments = (ins SPMD_WinType : $win,
                       I32Attr : $usedModel);
  let results = (outs SPMD_ErrorType : $error);
  let summary = "";
  let description = [{}];
}


// utility
def SPMD_CastSPMDErrorToI32Op : SPMD_Op<"castSPMDErrorToI32", [Pure]> {
  let summary = "Casts !spmd.error to i32";
  let description = [{
    Casts an SPMD error type to a plain i32.
    Useful when lowering SPMD-specific return values to standard integer codes
    (like MPI_SUCCESS).
  }];

  let arguments = (ins SPMD_ErrorType : $error);
  let results = (outs I32 : $result);
}

#endif // SPMD_OPS
