module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (git@github.com:ivanradanov/llvm-project.git 872c28cfdf6140fafac11eddbb5895f11bc6f295)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.comdat @__llvm_global_comdat {
    llvm.comdat_selector @_ZN4dim3C2Ejjj any
  }
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0("_Z14nvshmem_kernelPiS_\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private constant @mlir.llvm.nameless_global_1("#loc1 = loc(unknown)\0Amodule attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, \22dlti.endianness\22 = \22little\22>, llvm.data_layout = \22e-i64:64-i128:128-v16:16-v32:32-n16:32:64\22, llvm.target_triple = \22nvptx64-nvidia-cuda\22} {\0A  llvm.func ptx_kernelcc @_Z14nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef} loc(unknown), %arg1: !llvm.ptr {llvm.noundef} loc(unknown)) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    %c1_i32 = arith.constant 1 : i32 loc(#loc1)\0A    %c0_i32 = arith.constant 0 : i32 loc(#loc1)\0A    %c1_i64 = arith.constant 1 : i64 loc(#loc1)\0A    %0 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %1 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %2 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    llvm.store %arg0, %0 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    llvm.store %arg1, %1 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    %3 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.store %c0_i32, %3 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %4 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.store %c1_i32, %4 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %5 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32 loc(#loc1)\0A    llvm.store %5, %2 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    %6 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %7 = arith.cmpi eq, %6, %c0_i32 : i32 loc(#loc1)\0A    cf.cond_br %7, ^bb1, ^bb2 loc(#loc1)\0A  ^bb1:  // pred: ^bb0\0A    %8 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %9 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_int_get_nbi(%8, %9, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> () loc(#loc1)\0A    %10 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %11 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_int_get_nbi(%10, %11, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> () loc(#loc1)\0A    cf.br ^bb2 loc(#loc1)\0A  ^bb2:  // 2 preds: ^bb0, ^bb1\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_my_pe() -> i32 attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_barrier_all() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A} loc(#loc)\0A#loc = loc(\22/home/sw339864/promotion/mlir-research/data-race-detection-benchmark-suite/rmaracebench/nvshmem/gpuInitiated/conflict//007-nvshmem-conflict-getnbi-getnbi-local-yes.cu\22:0:0)\0A\00") {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nv_fatbin"}
  llvm.mlir.global internal constant @__cuda_fatbin_wrapper() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nvFatBinSegment"} : !llvm.struct<(i32, i32, ptr, ptr)> {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 : !llvm.ptr
    %c1_i32 = arith.constant 1 : i32
    %c1180844977_i32 = arith.constant 1180844977 : i32
    %2 = llvm.mlir.undef : !llvm.struct<(i32, i32, ptr, ptr)>
    %3 = llvm.insertvalue %c1180844977_i32, %2[0] : !llvm.struct<(i32, i32, ptr, ptr)> 
    %4 = llvm.insertvalue %c1_i32, %3[1] : !llvm.struct<(i32, i32, ptr, ptr)> 
    %5 = llvm.insertvalue %1, %4[2] : !llvm.struct<(i32, i32, ptr, ptr)> 
    %6 = llvm.insertvalue %0, %5[3] : !llvm.struct<(i32, i32, ptr, ptr)> 
    llvm.return %6 : !llvm.struct<(i32, i32, ptr, ptr)>
  }
  llvm.mlir.global internal @__cuda_gpubin_handle() {addr_space = 0 : i32, alignment = 8 : i64, dso_local} : !llvm.ptr {
    %0 = llvm.mlir.zero : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @_Z29__device_stub__nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    llvm.return
  }
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant 0 : i64
    %0 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %1 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %2 = llvm.mlir.zero : !llvm.ptr
    %c4_i64 = arith.constant 4 : i64
    %3 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c2_i32 = arith.constant 2 : i32
    %c2_i64 = arith.constant 2 : i64
    %c1_i32 = arith.constant 1 : i32
    %c-1_i32 = arith.constant -1 : i32
    %4 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 : !llvm.ptr
    %5 = llvm.mlir.addressof @_Z29__device_stub__nvshmem_kernelPiS_ : !llvm.ptr
    %6 = llvm.mlir.addressof @__cuda_fatbin_wrapper : !llvm.ptr
    %7 = llvm.mlir.addressof @__cuda_gpubin_handle : !llvm.ptr
    %8 = llvm.mlir.addressof @__cuda_module_dtor : !llvm.ptr
    %9 = llvm.mlir.undef : !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %c1_i64 = arith.constant 1 : i64
    %c0_i32 = arith.constant 0 : i32
    %10 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> : () -> !spmd.datatype
    %11 = "spmd.commWorld"() <{usedModel = 2 : i32}> : () -> !spmd.comm
    %12 = "spmd.commNode"() <{usedModel = 2 : i32}> : () -> !spmd.comm
    %13 = llvm.call @__cudaRegisterFatBinary(%6) : (!llvm.ptr) -> !llvm.ptr
    llvm.store %13, %7 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %14 = llvm.call @__cudaRegisterFunction(%13, %5, %4, %4, %c-1_i32, %2, %2, %2, %2, %2) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    llvm.call @__cudaRegisterFatBinaryEnd(%13) : (!llvm.ptr) -> ()
    %15 = llvm.call @atexit(%8) : (!llvm.ptr) -> i32
    %16 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %17 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %18 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %19 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %20 = llvm.alloca %c2_i64 x !llvm.ptr {alignment = 16 : i64} : (i64) -> !llvm.ptr
    %21 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %22 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %23 = llvm.alloca %c1_i32 x !llvm.array<2 x ptr> {alignment = 16 : i64} : (i32) -> !llvm.ptr
    %24 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %25 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %26 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %27 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %28 = "spmd.init"() <{usedModel = 2 : i32}> : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%12) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %29 = llvm.call @cudaSetDevice(%rank) : (i32) -> i32
    %rank_0, %error_1 = "spmd.getRankInComm"(%11) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_2 = "spmd.getSizeOfComm"(%11) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %30 = arith.cmpi ne, %size, %c2_i32 : i32
    scf.if %30 {
      %61 = llvm.call @printf(%3, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
      %62 = "spmd.abort"(%11, %c1_i32) <{usedModel = 2 : i32}> : (!spmd.comm, i32) -> !spmd.error
    }
    %address, %error_3 = "spmd.malloc"(%11, %c4_i64) <{usedModel = 2 : i32}> : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_4, %error_5 = "spmd.malloc"(%11, %c4_i64) <{usedModel = 2 : i32}> : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    llvm.store %address, %23 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %31 = llvm.getelementptr inbounds %23[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %address_4, %31 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %32 = llvm.getelementptr inbounds %24[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %32 {alignment = 4 : i64} : i32, !llvm.ptr
    %33 = llvm.getelementptr inbounds %24[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %33 {alignment = 4 : i64} : i32, !llvm.ptr
    %34 = llvm.getelementptr inbounds %24[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %34 {alignment = 4 : i64} : i32, !llvm.ptr
    %35 = llvm.getelementptr inbounds %25[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %35 {alignment = 4 : i64} : i32, !llvm.ptr
    %36 = llvm.getelementptr inbounds %25[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %36 {alignment = 4 : i64} : i32, !llvm.ptr
    %37 = llvm.getelementptr inbounds %25[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %37 {alignment = 4 : i64} : i32, !llvm.ptr
    %38 = llvm.load %24 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %39 = llvm.load %25 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %40 = llvm.getelementptr inbounds %23[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x ptr>
    llvm.store %38, %26 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %39, %27 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %41 = llvm.load %40 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    %42 = llvm.getelementptr %40[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    %43 = llvm.load %42 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.store %41, %16 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %43, %17 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %16, %20 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %44 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %17, %44 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %9, %18 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %9, %19 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %c0_i32, %41 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %c1_i32, %43 {alignment = 4 : i64} : i32, !llvm.ptr
    %rank_6, %error_7 = "spmd.getRankInComm"(%11) <{usedModel = 2 : i32}> : (!spmd.comm) -> (i32, !spmd.error)
    %45 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %46 = arith.cmpi eq, %rank_6, %c0_i32 : i32
    scf.if %46 {
      %win, %error_8 = "spmd.winCreate"(%11, %41, %c0_i32) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_9 = "spmd.get"(%43, %c1_i64, %10, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %10, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %error_10 = "spmd.get"(%43, %c1_i64, %10, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %10, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    }
    %47 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %48 = "spmd.memcpy"(%21, %address, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %49 = "spmd.memcpy"(%22, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %50 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %51 = llvm.load %22 {alignment = 4 : i64} : !llvm.ptr -> i32
    %52 = llvm.load %21 {alignment = 4 : i64} : !llvm.ptr -> i32
    %53 = llvm.call @printf(%1, %rank_0, %51, %52) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    %54 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> : (i32) -> !spmd.error
    %55 = llvm.load %21 {alignment = 4 : i64} : !llvm.ptr -> i32
    %56 = llvm.load %22 {alignment = 4 : i64} : !llvm.ptr -> i32
    %57 = llvm.call @printf(%0, %rank_0, %55, %56) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    %58 = "spmd.free"(%11, %address) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %59 = "spmd.free"(%11, %address_4) <{usedModel = 2 : i32}> : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %60 = "spmd.finalize"() <{usedModel = 2 : i32}> : () -> !spmd.error
    llvm.return %c0_i32 : i32
  }
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @__cudaRegisterFunction(!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
  llvm.func @__cudaRegisterFatBinary(!llvm.ptr) -> !llvm.ptr
  llvm.func @__cudaRegisterFatBinaryEnd(!llvm.ptr)
  llvm.func @__cudaUnregisterFatBinary(!llvm.ptr)
  llvm.func internal @__cuda_module_dtor() attributes {always_inline, dso_local} {
    %0 = llvm.mlir.addressof @__cuda_gpubin_handle : !llvm.ptr
    %1 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.call @__cudaUnregisterFatBinary(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @atexit(!llvm.ptr) -> i32
}

