module attributes {dlti.dl_spec = #dlti.dl_spec<i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (git@github.com:ivanradanov/llvm-project.git 872c28cfdf6140fafac11eddbb5895f11bc6f295)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant 0 : i64
    %0 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %1 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %c1_i64 = arith.constant 1 : i64
    %c4_i64 = arith.constant 4 : i64
    %2 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %3 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> : () -> !spmd.datatype
    %4 = "spmd.commWorld"() <{usedModel = 2 : i32}> : () -> !spmd.comm
    %5 = "spmd.commNode"() <{usedModel = 2 : i32}> : () -> !spmd.comm
    %6 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %8 = "spmd.init"() <{usedModel = 2 : i32}> : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%5) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %9 = llvm.call @cudaSetDevice(%rank) : (i32) -> i32
    %rank_0, %error_1 = "spmd.getRankInComm"(%4) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_2 = "spmd.getSizeOfComm"(%4) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %10 = arith.cmpi ne, %size, %c2_i32 : i32
    scf.if %10 {
      %28 = llvm.call @printf(%2, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
      %29 = "spmd.abort"(%4, %c1_i32) <{usedModel = 2 : i32}> : (!spmd.comm, i32) -> !spmd.error
    }
    %address, %error_3 = "spmd.malloc"(%4, %c4_i64) <{usedModel = 2 : i32}> : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_4, %error_5 = "spmd.malloc"(%4, %c4_i64) <{usedModel = 2 : i32}> : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %11 = "spmd.memset"(%address, %c0_i32, %c4_i64) <{usedModel = 4 : i32}> : (!llvm.ptr, i32, i64) -> !spmd.error
    %12 = "spmd.memset"(%address_4, %c1_i32, %c4_i64) <{usedModel = 4 : i32}> : (!llvm.ptr, i32, i64) -> !spmd.error
    %13 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %14 = arith.cmpi eq, %rank_0, %c0_i32 : i32
    scf.if %14 {
      %win, %error_6 = "spmd.winCreate"(%4, %address, %c0_i32) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_7 = "spmd.get"(%address_4, %c1_i64, %3, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %3, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %error_8 = "spmd.get"(%address_4, %c1_i64, %3, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %3, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    }
    %15 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %16 = "spmd.memcpy"(%6, %address, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %17 = "spmd.memcpy"(%7, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %18 = llvm.load %7 {alignment = 4 : i64} : !llvm.ptr -> i32
    %19 = llvm.load %6 {alignment = 4 : i64} : !llvm.ptr -> i32
    %20 = llvm.call @printf(%1, %rank_0, %18, %19) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    %21 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %22 = llvm.load %6 {alignment = 4 : i64} : !llvm.ptr -> i32
    %23 = llvm.load %7 {alignment = 4 : i64} : !llvm.ptr -> i32
    %24 = llvm.call @printf(%0, %rank_0, %22, %23) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    %25 = "spmd.free"(%4, %address) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %26 = "spmd.free"(%4, %address_4) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %27 = "spmd.finalize"() <{usedModel = 2 : i32}> : () -> !spmd.error
    llvm.return %c0_i32 : i32
  }
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

