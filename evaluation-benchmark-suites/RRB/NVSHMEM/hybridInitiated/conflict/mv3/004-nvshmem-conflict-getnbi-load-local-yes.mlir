module attributes {dlti.dl_spec = #dlti.dl_spec<f64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (git@github.com:ivanradanov/llvm-project.git 872c28cfdf6140fafac11eddbb5895f11bc6f295)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.comdat @__llvm_global_comdat {
    llvm.comdat_selector @_ZN4dim3C2Ejjj any {spmd.executionKind = "All"}
  } {spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("localbuf is %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.2"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.3"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0("_Z14nvshmem_kernelPiS_\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_1("_Z33nvshmem_barrier_all_kernelWrapperv\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private constant @mlir.llvm.nameless_global_2("#loc1 = loc(unknown)\0Amodule attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, \22dlti.endianness\22 = \22little\22>, llvm.data_layout = \22e-i64:64-i128:128-v16:16-v32:32-n16:32:64\22, llvm.target_triple = \22nvptx64-nvidia-cuda\22} {\0A  llvm.func ptx_kernelcc @_Z14nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef} loc(unknown), %arg1: !llvm.ptr {llvm.noundef} loc(unknown)) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    %c1_i32 = arith.constant 1 : i32 loc(#loc1)\0A    %c0_i32 = arith.constant 0 : i32 loc(#loc1)\0A    %c1_i64 = arith.constant 1 : i64 loc(#loc1)\0A    %0 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %1 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %2 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    llvm.store %arg0, %0 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    llvm.store %arg1, %1 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    %3 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32 loc(#loc1)\0A    llvm.store %3, %2 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %4 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %5 = arith.cmpi eq, %4, %c0_i32 : i32 loc(#loc1)\0A    cf.cond_br %5, ^bb1, ^bb2 loc(#loc1)\0A  ^bb1:  // pred: ^bb0\0A    %6 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %7 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_int_get_nbi(%6, %7, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> () loc(#loc1)\0A    cf.br ^bb2 loc(#loc1)\0A  ^bb2:  // 2 preds: ^bb0, ^bb1\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_my_pe() -> i32 attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func ptx_kernelcc @_Z33nvshmem_barrier_all_kernelWrapperv() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_barrier_all() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A} loc(#loc)\0A#loc = loc(\22/home/sw339864/promotion/mlir-research/data-race-detection-benchmark-suite/rmaracebench/nvshmem/hybridInitiated/conflict//004-nvshmem-conflict-getnbi-load-local-yes.cu\22:0:0)\0A\00") {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nv_fatbin", spmd.executionKind = "All"}
  llvm.mlir.global internal constant @__cuda_fatbin_wrapper() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nvFatBinSegment", spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> {
    %0 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_2 {spmd.executionKind = "All"} : !llvm.ptr
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c1180844977_i32 = arith.constant {spmd.executionKind = "All"} 1180844977 : i32
    %2 = llvm.mlir.undef {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)>
    %3 = llvm.insertvalue %c1180844977_i32, %2[0] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %4 = llvm.insertvalue %c1_i32, %3[1] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %5 = llvm.insertvalue %1, %4[2] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %6 = llvm.insertvalue %0, %5[3] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    llvm.return {spmd.executionKind = "All"} %6 : !llvm.struct<(i32, i32, ptr, ptr)>
  }
  llvm.mlir.global internal @__cuda_gpubin_handle() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, spmd.executionKind = "All"} : !llvm.ptr {
    %0 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %0 : !llvm.ptr
  }
  llvm.func @_Z29__device_stub__nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    llvm.return {spmd.executionKind = "All"}
  }
  llvm.func @_Z48__device_stub__nvshmem_barrier_all_kernelWrapperv() attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    llvm.return {spmd.executionKind = "All"}
  }
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %0 = llvm.mlir.addressof @".str.3" {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.addressof @".str.2" {spmd.executionKind = "All"} : !llvm.ptr
    %2 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %3 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    %c4_i64 = arith.constant {spmd.executionKind = "All"} 4 : i64
    %4 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c2_i64 = arith.constant {spmd.executionKind = "All"} 2 : i64
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %5 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 {spmd.executionKind = "All"} : !llvm.ptr
    %6 = llvm.mlir.addressof @_Z48__device_stub__nvshmem_barrier_all_kernelWrapperv {spmd.executionKind = "All"} : !llvm.ptr
    %c-1_i32 = arith.constant {spmd.executionKind = "All"} -1 : i32
    %7 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 {spmd.executionKind = "All"} : !llvm.ptr
    %8 = llvm.mlir.addressof @_Z29__device_stub__nvshmem_kernelPiS_ {spmd.executionKind = "All"} : !llvm.ptr
    %9 = llvm.mlir.addressof @__cuda_fatbin_wrapper {spmd.executionKind = "All"} : !llvm.ptr
    %10 = llvm.mlir.addressof @__cuda_gpubin_handle {spmd.executionKind = "All"} : !llvm.ptr
    %11 = llvm.mlir.addressof @__cuda_module_dtor {spmd.executionKind = "All"} : !llvm.ptr
    %12 = llvm.mlir.undef {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %13 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %14 = "spmd.commWorld"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %15 = "spmd.commNode"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %16 = llvm.call @__cudaRegisterFatBinary(%9) {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr
    llvm.store %16, %10 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    %17 = llvm.call @__cudaRegisterFunction(%16, %8, %7, %7, %c-1_i32, %3, %3, %3, %3, %3) {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %18 = llvm.call @__cudaRegisterFunction(%16, %6, %5, %5, %c-1_i32, %3, %3, %3, %3, %3) {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    llvm.call @__cudaRegisterFatBinaryEnd(%16) {spmd.executionKind = "All"} : (!llvm.ptr) -> ()
    %19 = llvm.call @atexit(%11) {spmd.executionKind = "All"} : (!llvm.ptr) -> i32
    %20 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %21 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %22 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %23 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %24 = llvm.alloca %c2_i64 x !llvm.ptr {alignment = 16 : i64, spmd.executionKind = "All"} : (i64) -> !llvm.ptr
    %25 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %26 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %27 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %28 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %29 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %30 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %31 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %32 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %33 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %34 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %35 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %36 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %37 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %38 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %39 = "spmd.init"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%15) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %40 = llvm.call @cudaSetDevice(%rank) {spmd.executionKind = "All"} : (i32) -> i32
    %rank_0, %error_1 = "spmd.getRankInComm"(%14) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_2 = "spmd.getSizeOfComm"(%14) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %41 = arith.cmpi ne, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    scf.if %41 {
      %75 = llvm.call @printf(%4, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %76 = "spmd.abort"(%14, %c1_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %address, %error_3 = "spmd.malloc"(%14, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_4, %error_5 = "spmd.malloc"(%14, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %42 = llvm.getelementptr inbounds %31[0, 0] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %42 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %31[0, 1] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %43 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %44 = llvm.getelementptr inbounds %31[0, 2] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %44 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %45 = llvm.getelementptr inbounds %32[0, 0] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %45 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %46 = llvm.getelementptr inbounds %32[0, 1] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %46 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %47 = llvm.getelementptr inbounds %32[0, 2] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %47 {alignment = 4 : i64, spmd.executionKind = "All"} : i32, !llvm.ptr
    %48 = "spmd.memset"(%address, %c0_i32, %c4_i64) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, i32, i64) -> !spmd.error
    %49 = "spmd.memset"(%address_4, %c1_i32, %c4_i64) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, i32, i64) -> !spmd.error
    %50 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %51 = llvm.load %31 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %52 = llvm.load %32 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %51, %33 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %52, %34 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %12, %27 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %12, %28 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %53 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %54 = llvm.load %31 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %55 = llvm.load %32 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %54, %35 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %55, %36 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %address, %20 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    llvm.store %address_4, %21 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    llvm.store %20, %24 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    %56 = llvm.getelementptr %24[1] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %21, %56 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    llvm.store %12, %22 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %12, %23 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %rank_6, %error_7 = "spmd.getRankInComm"(%14) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %57 = arith.cmpi eq, %rank_6, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %57 {
      %win, %error_8 = "spmd.winCreate"(%14, %address, %c0_i32) <{usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_9 = "spmd.get"(%address_4, %c1_i64, %13, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %13, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %58 = arith.cmpi eq, %rank_0, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %58 {
      %75 = "spmd.memcpy"(%30, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
      %76 = llvm.load %30 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : !llvm.ptr -> i32
      %77 = llvm.call @printf(%2, %76) vararg(!llvm.func<i32 (ptr, ...)>) {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i32) -> i32
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %59 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %60 = llvm.load %31 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %61 = llvm.load %32 {spmd.executionKind = "All"} : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %60, %37 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %61, %38 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %12, %25 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %12, %26 {spmd.executionKind = "All"} : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %62 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %63 = "spmd.memcpy"(%29, %address, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %64 = "spmd.memcpy"(%30, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %65 = llvm.load %30 {alignment = 4 : i64, spmd.executionKind = "All"} : !llvm.ptr -> i32
    %66 = llvm.load %29 {alignment = 4 : i64, spmd.executionKind = "All"} : !llvm.ptr -> i32
    %67 = llvm.call @printf(%1, %rank_0, %65, %66) vararg(!llvm.func<i32 (ptr, ...)>) {spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %68 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %69 = llvm.load %29 {alignment = 4 : i64, spmd.executionKind = "All"} : !llvm.ptr -> i32
    %70 = llvm.load %30 {alignment = 4 : i64, spmd.executionKind = "All"} : !llvm.ptr -> i32
    %71 = llvm.call @printf(%0, %rank_0, %69, %70) vararg(!llvm.func<i32 (ptr, ...)>) {spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %72 = "spmd.free"(%14, %address) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %73 = "spmd.free"(%14, %address_4) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %74 = "spmd.finalize"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @__cudaRegisterFunction(!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32 attributes {spmd.executionKind = "All"}
  llvm.func @__cudaRegisterFatBinary(!llvm.ptr) -> !llvm.ptr attributes {spmd.executionKind = "All"}
  llvm.func @__cudaRegisterFatBinaryEnd(!llvm.ptr) attributes {spmd.executionKind = "All"}
  llvm.func @__cudaUnregisterFatBinary(!llvm.ptr) attributes {spmd.executionKind = "All"}
  llvm.func internal @__cuda_module_dtor() attributes {always_inline, dso_local, spmd.executionKind = "All"} {
    %0 = llvm.mlir.addressof @__cuda_gpubin_handle {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.load %0 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr -> !llvm.ptr
    llvm.call @__cudaUnregisterFatBinary(%1) {spmd.executionKind = "All"} : (!llvm.ptr) -> ()
    llvm.return {spmd.executionKind = "All"}
  }
  llvm.func @atexit(!llvm.ptr) -> i32 attributes {spmd.executionKind = "All"}
}

