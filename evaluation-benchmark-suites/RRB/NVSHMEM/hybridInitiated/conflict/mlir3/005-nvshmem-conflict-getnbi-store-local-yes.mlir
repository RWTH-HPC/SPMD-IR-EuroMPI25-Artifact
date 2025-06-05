module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (git@github.com:ivanradanov/llvm-project.git 872c28cfdf6140fafac11eddbb5895f11bc6f295)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "sm_89"]], target_cpu = "sm_89", target_features = #llvm.target_features<["+ptx84", "+sm_89"]>}
  llvm.comdat @__llvm_global_comdat {
    llvm.comdat_selector @_ZN4dim3C2Ejjj any
  }
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0("_Z14nvshmem_kernelPiS_\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_1("_Z33nvshmem_barrier_all_kernelWrapperv\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private constant @mlir.llvm.nameless_global_2("#loc1 = loc(unknown)\0Amodule attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, \22dlti.endianness\22 = \22little\22>, llvm.data_layout = \22e-i64:64-i128:128-v16:16-v32:32-n16:32:64\22, llvm.target_triple = \22nvptx64-nvidia-cuda\22} {\0A  llvm.func ptx_kernelcc @_Z14nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef} loc(unknown), %arg1: !llvm.ptr {llvm.noundef} loc(unknown)) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    %c1_i32 = arith.constant 1 : i32 loc(#loc1)\0A    %c0_i32 = arith.constant 0 : i32 loc(#loc1)\0A    %c1_i64 = arith.constant 1 : i64 loc(#loc1)\0A    %0 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %1 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %2 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    llvm.store %arg0, %0 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    llvm.store %arg1, %1 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    %3 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32 loc(#loc1)\0A    llvm.store %3, %2 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %4 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %5 = arith.cmpi eq, %4, %c0_i32 : i32 loc(#loc1)\0A    cf.cond_br %5, ^bb1, ^bb2 loc(#loc1)\0A  ^bb1:  // pred: ^bb0\0A    %6 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %7 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_int_get_nbi(%6, %7, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> () loc(#loc1)\0A    cf.br ^bb2 loc(#loc1)\0A  ^bb2:  // 2 preds: ^bb0, ^bb1\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_my_pe() -> i32 attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func ptx_kernelcc @_Z33nvshmem_barrier_all_kernelWrapperv() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_barrier_all() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A} loc(#loc)\0A#loc = loc(\22/home/sw339864/promotion/mlir-research/data-race-detection-benchmark-suite/rmaracebench/nvshmem/hybridInitiated/conflict//005-nvshmem-conflict-getnbi-store-local-yes.cu\22:0:0)\0A\00") {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nv_fatbin"}
  llvm.mlir.global internal constant @__cuda_fatbin_wrapper() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nvFatBinSegment"} : !llvm.struct<(i32, i32, ptr, ptr)> {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_2 : !llvm.ptr
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
  llvm.func @_Z48__device_stub__nvshmem_barrier_all_kernelWrapperv() attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    llvm.return
  }
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i32 = arith.constant 0 : i32
    %c1_i64 = arith.constant 1 : i64
    %0 = llvm.mlir.undef : !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %1 = llvm.mlir.addressof @__cuda_module_dtor : !llvm.ptr
    %2 = llvm.mlir.addressof @__cuda_gpubin_handle : !llvm.ptr
    %3 = llvm.mlir.addressof @__cuda_fatbin_wrapper : !llvm.ptr
    %4 = llvm.mlir.addressof @_Z29__device_stub__nvshmem_kernelPiS_ : !llvm.ptr
    %5 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 : !llvm.ptr
    %c-1_i32 = arith.constant -1 : i32
    %6 = llvm.mlir.addressof @_Z48__device_stub__nvshmem_barrier_all_kernelWrapperv : !llvm.ptr
    %7 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 : !llvm.ptr
    %c1_i32 = arith.constant 1 : i32
    %c2_i64 = arith.constant 2 : i64
    %c2_i32 = arith.constant 2 : i32
    %8 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c4_i64 = arith.constant 4 : i64
    %9 = llvm.mlir.zero : !llvm.ptr
    %c42_i32 = arith.constant 42 : i32
    %10 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %11 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %12 = llvm.call @__cudaRegisterFatBinary(%3) : (!llvm.ptr) -> !llvm.ptr
    llvm.store %12, %2 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %13 = llvm.call @__cudaRegisterFunction(%12, %4, %5, %5, %c-1_i32, %9, %9, %9, %9, %9) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %14 = llvm.call @__cudaRegisterFunction(%12, %6, %7, %7, %c-1_i32, %9, %9, %9, %9, %9) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    llvm.call @__cudaRegisterFatBinaryEnd(%12) : (!llvm.ptr) -> ()
    %15 = llvm.call @atexit(%1) : (!llvm.ptr) -> i32
    %16 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %17 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %18 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %19 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %20 = llvm.alloca %c2_i64 x !llvm.ptr {alignment = 16 : i64} : (i64) -> !llvm.ptr
    %21 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %22 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %23 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %24 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %25 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %26 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %27 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %28 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %29 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %30 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %31 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %32 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %33 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %34 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.call @nvshmem_init() : () -> ()
    %35 = llvm.call @nvshmem_team_my_pe(%c2_i32) : (i32) -> i32
    %36 = llvm.call @cudaSetDevice(%35) : (i32) -> i32
    %37 = llvm.call @nvshmem_my_pe() : () -> i32
    %38 = llvm.call @nvshmem_n_pes() : () -> i32
    %39 = arith.cmpi ne, %38, %c2_i32 : i32
    scf.if %39 {
      %68 = llvm.call @printf(%8, %38, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
      llvm.call @nvshmem_global_exit(%c1_i32) : (i32) -> ()
    }
    %40 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
    %41 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
    %42 = llvm.getelementptr inbounds %27[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %42 {alignment = 4 : i64} : i32, !llvm.ptr
    %43 = llvm.getelementptr inbounds %27[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %43 {alignment = 4 : i64} : i32, !llvm.ptr
    %44 = llvm.getelementptr inbounds %27[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %44 {alignment = 4 : i64} : i32, !llvm.ptr
    %45 = llvm.getelementptr inbounds %28[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %45 {alignment = 4 : i64} : i32, !llvm.ptr
    %46 = llvm.getelementptr inbounds %28[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %46 {alignment = 4 : i64} : i32, !llvm.ptr
    %47 = llvm.getelementptr inbounds %28[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %47 {alignment = 4 : i64} : i32, !llvm.ptr
    %48 = llvm.call @cudaMemset(%40, %c0_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
    %49 = llvm.call @cudaMemset(%41, %c1_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
    llvm.call @nvshmem_barrier_all() : () -> ()
    %50 = llvm.load %27 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %51 = llvm.load %28 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %50, %29 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %51, %30 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.intr.lifetime.start 16, %23 : !llvm.ptr
    llvm.intr.lifetime.start 16, %24 : !llvm.ptr
    llvm.store %0, %23 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %0, %24 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> ()
    llvm.intr.lifetime.end 16, %23 : !llvm.ptr
    llvm.intr.lifetime.end 16, %24 : !llvm.ptr
    %52 = llvm.load %27 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %53 = llvm.load %28 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %52, %31 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %53, %32 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.intr.lifetime.start 8, %16 : !llvm.ptr
    llvm.intr.lifetime.start 8, %17 : !llvm.ptr
    llvm.intr.lifetime.start 16, %18 : !llvm.ptr
    llvm.intr.lifetime.start 16, %19 : !llvm.ptr
    llvm.intr.lifetime.start 16, %20 : !llvm.ptr
    llvm.store %40, %16 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %41, %17 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %16, %20 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %54 = llvm.getelementptr %20[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %17, %54 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %0, %18 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %0, %19 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %55 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32
    %56 = arith.cmpi eq, %55, %c0_i32 : i32
    scf.if %56 {
      llvm.call @nvshmem_int_get_nbi(%41, %40, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> ()
    }
    llvm.intr.lifetime.end 8, %16 : !llvm.ptr
    llvm.intr.lifetime.end 8, %17 : !llvm.ptr
    llvm.intr.lifetime.end 16, %18 : !llvm.ptr
    llvm.intr.lifetime.end 16, %19 : !llvm.ptr
    llvm.intr.lifetime.end 16, %20 : !llvm.ptr
    %57 = arith.cmpi eq, %37, %c0_i32 : i32
    scf.if %57 {
      %68 = llvm.call @cudaMemset(%41, %c42_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
    }
    llvm.call @nvshmem_barrier_all() : () -> ()
    %58 = llvm.load %27 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %59 = llvm.load %28 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %58, %33 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %59, %34 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.intr.lifetime.start 16, %21 : !llvm.ptr
    llvm.intr.lifetime.start 16, %22 : !llvm.ptr
    llvm.store %0, %21 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %0, %22 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> ()
    llvm.intr.lifetime.end 16, %21 : !llvm.ptr
    llvm.intr.lifetime.end 16, %22 : !llvm.ptr
    %60 = llvm.call @cudaMemcpy(%25, %40, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
    %61 = llvm.call @cudaMemcpy(%26, %41, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
    %62 = llvm.load %26 {alignment = 4 : i64} : !llvm.ptr -> i32
    %63 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> i32
    %64 = llvm.call @printf(%10, %37, %62, %63) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    llvm.call @nvshmem_barrier_all() : () -> ()
    %65 = llvm.load %25 {alignment = 4 : i64} : !llvm.ptr -> i32
    %66 = llvm.load %26 {alignment = 4 : i64} : !llvm.ptr -> i32
    %67 = llvm.call @printf(%11, %37, %65, %66) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    llvm.call @nvshmem_free(%40) : (!llvm.ptr) -> ()
    llvm.call @nvshmem_free(%41) : (!llvm.ptr) -> ()
    llvm.call @nvshmem_finalize() : () -> ()
    llvm.return %c0_i32 : i32
  }
  llvm.func @nvshmem_init() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_team_my_pe(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_my_pe() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_n_pes() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_global_exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_malloc(i64 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemset(!llvm.ptr {llvm.noundef}, i32 {llvm.noundef}, i64 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_barrier_all() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemcpy(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_free(!llvm.ptr {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_finalize() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
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

