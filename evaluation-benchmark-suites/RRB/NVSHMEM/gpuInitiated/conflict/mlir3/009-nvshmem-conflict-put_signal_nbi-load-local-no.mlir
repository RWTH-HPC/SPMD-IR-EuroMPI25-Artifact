module attributes {dlti.dl_spec = #dlti.dl_spec<f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (git@github.com:ivanradanov/llvm-project.git 872c28cfdf6140fafac11eddbb5895f11bc6f295)", llvm.target_triple = "x86_64-unknown-linux-gnu"} {
  llvm.func @nvshmem_int_put_signal_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "sm_89"]], target_cpu = "sm_89", target_features = #llvm.target_features<["+ptx84", "+sm_89"]>}
  llvm.comdat @__llvm_global_comdat {
    llvm.comdat_selector @_ZN4dim3C2Ejjj any
  }
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0("_Z14nvshmem_kernelPiS_Pm\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private constant @mlir.llvm.nameless_global_1("#loc1 = loc(unknown)\0Amodule attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, \22dlti.endianness\22 = \22little\22>, llvm.data_layout = \22e-i64:64-i128:128-v16:16-v32:32-n16:32:64\22, llvm.target_triple = \22nvptx64-nvidia-cuda\22} {\0A  llvm.func ptx_kernelcc @_Z14nvshmem_kernelPiS_Pm(%arg0: !llvm.ptr {llvm.noundef} loc(unknown), %arg1: !llvm.ptr {llvm.noundef} loc(unknown), %arg2: !llvm.ptr {llvm.noundef} loc(unknown)) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} {\0A    %c1_i32 = arith.constant 1 : i32 loc(#loc1)\0A    %c0_i32 = arith.constant 0 : i32 loc(#loc1)\0A    %c0_i64 = arith.constant 0 : i64 loc(#loc1)\0A    %c1_i64 = arith.constant 1 : i64 loc(#loc1)\0A    %c9_i32 = arith.constant 9 : i32 loc(#loc1)\0A    %0 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %1 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %2 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %3 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    %4 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr loc(#loc1)\0A    llvm.store %arg0, %0 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    llvm.store %arg1, %1 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    llvm.store %arg2, %2 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr loc(#loc1)\0A    %5 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.store %c0_i32, %5 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %6 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.store %c1_i32, %6 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %7 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.store %c0_i64, %7 {alignment = 8 : i64} : i64, !llvm.ptr loc(#loc1)\0A    llvm.store %c0_i32, %3 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    %8 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32 loc(#loc1)\0A    llvm.store %8, %4 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    %9 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %10 = arith.cmpi eq, %9, %c0_i32 : i32 loc(#loc1)\0A    cf.cond_br %10, ^bb1, ^bb2 loc(#loc1)\0A  ^bb1:  // pred: ^bb0\0A    %11 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %12 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %13 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    llvm.call @nvshmem_int_put_signal_nbi(%11, %12, %c1_i64, %13, %c1_i64, %c9_i32, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr, i64, i32, i32) -> () loc(#loc1)\0A    %14 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %15 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    llvm.store %15, %3 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    cf.br ^bb2 loc(#loc1)\0A  ^bb2:  // 2 preds: ^bb0, ^bb1\0A    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc1)\0A    %16 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %17 = llvm.load %0 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr loc(#loc1)\0A    %18 = llvm.load %17 {alignment = 4 : i64} : !llvm.ptr -> i32 loc(#loc1)\0A    %19 = arith.addi %18, %16 : i32 loc(#loc1)\0A    llvm.store %19, %17 {alignment = 4 : i64} : i32, !llvm.ptr loc(#loc1)\0A    llvm.return loc(#loc1)\0A  } loc(#loc1)\0A  llvm.func @nvshmem_my_pe() -> i32 attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_barrier_all() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A  llvm.func @nvshmem_int_put_signal_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx84\22, \22+sm_89\22]>} loc(#loc1)\0A} loc(#loc)\0A#loc = loc(\22/home/sw339864/promotion/mlir-research/data-race-detection-benchmark-suite/rmaracebench/nvshmem/gpuInitiated/conflict//009-nvshmem-conflict-put_signal_nbi-load-local-no.cu\22:0:0)\0A\00") {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nv_fatbin"}
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
  llvm.func @_Z29__device_stub__nvshmem_kernelPiS_Pm(%arg0: !llvm.ptr {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}, %arg2: !llvm.ptr {llvm.noundef}) attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    llvm.return
  }
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i32 = arith.constant 0 : i32
    %c9_i32 = arith.constant 9 : i32
    %c1_i64 = arith.constant 1 : i64
    %c0_i64 = arith.constant 0 : i64
    %0 = llvm.mlir.undef : !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %1 = llvm.mlir.addressof @__cuda_module_dtor : !llvm.ptr
    %2 = llvm.mlir.addressof @__cuda_gpubin_handle : !llvm.ptr
    %3 = llvm.mlir.addressof @__cuda_fatbin_wrapper : !llvm.ptr
    %4 = llvm.mlir.addressof @_Z29__device_stub__nvshmem_kernelPiS_Pm : !llvm.ptr
    %5 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 : !llvm.ptr
    %c-1_i32 = arith.constant -1 : i32
    %c1_i32 = arith.constant 1 : i32
    %c3_i64 = arith.constant 3 : i64
    %c2_i32 = arith.constant 2 : i32
    %6 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c4_i64 = arith.constant 4 : i64
    %c8_i64 = arith.constant 8 : i64
    %7 = llvm.mlir.zero : !llvm.ptr
    %8 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %9 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %10 = llvm.call @__cudaRegisterFatBinary(%3) : (!llvm.ptr) -> !llvm.ptr
    llvm.store %10, %2 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %11 = llvm.call @__cudaRegisterFunction(%10, %4, %5, %5, %c-1_i32, %7, %7, %7, %7, %7) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    llvm.call @__cudaRegisterFatBinaryEnd(%10) : (!llvm.ptr) -> ()
    %12 = llvm.call @atexit(%1) : (!llvm.ptr) -> i32
    %13 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %14 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %15 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %16 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %17 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %18 = llvm.alloca %c3_i64 x !llvm.ptr {alignment = 16 : i64} : (i64) -> !llvm.ptr
    %19 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %20 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %21 = llvm.alloca %c1_i32 x !llvm.array<3 x ptr> {alignment = 16 : i64} : (i32) -> !llvm.ptr
    %22 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %23 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %24 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %25 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.call @nvshmem_init() : () -> ()
    %26 = llvm.call @nvshmem_team_my_pe(%c2_i32) : (i32) -> i32
    %27 = llvm.call @cudaSetDevice(%26) : (i32) -> i32
    %28 = llvm.call @nvshmem_my_pe() : () -> i32
    %29 = llvm.call @nvshmem_n_pes() : () -> i32
    %30 = arith.cmpi ne, %29, %c2_i32 : i32
    scf.if %30 {
      %65 = llvm.call @printf(%6, %29, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
      llvm.call @nvshmem_global_exit(%c1_i32) : (i32) -> ()
    }
    %31 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
    %32 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
    %33 = llvm.call @nvshmem_malloc(%c8_i64) : (i64) -> !llvm.ptr
    llvm.store %31, %21 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %34 = llvm.getelementptr inbounds %21[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %32, %34 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %35 = llvm.getelementptr inbounds %21[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %33, %35 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %36 = llvm.getelementptr inbounds %22[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %36 {alignment = 4 : i64} : i32, !llvm.ptr
    %37 = llvm.getelementptr inbounds %22[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %37 {alignment = 4 : i64} : i32, !llvm.ptr
    %38 = llvm.getelementptr inbounds %22[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %38 {alignment = 4 : i64} : i32, !llvm.ptr
    %39 = llvm.getelementptr inbounds %23[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %39 {alignment = 4 : i64} : i32, !llvm.ptr
    %40 = llvm.getelementptr inbounds %23[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %40 {alignment = 4 : i64} : i32, !llvm.ptr
    %41 = llvm.getelementptr inbounds %23[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
    llvm.store %c1_i32, %41 {alignment = 4 : i64} : i32, !llvm.ptr
    %42 = llvm.load %22 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %43 = llvm.load %23 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
    %44 = llvm.getelementptr inbounds %21[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x ptr>
    llvm.store %42, %24 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %43, %25 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    %45 = llvm.load %44 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    %46 = llvm.getelementptr %44[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    %47 = llvm.load %46 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    %48 = llvm.getelementptr %44[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    %49 = llvm.load %48 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.intr.lifetime.start 8, %13 : !llvm.ptr
    llvm.intr.lifetime.start 8, %14 : !llvm.ptr
    llvm.intr.lifetime.start 8, %15 : !llvm.ptr
    llvm.intr.lifetime.start 16, %16 : !llvm.ptr
    llvm.intr.lifetime.start 16, %17 : !llvm.ptr
    llvm.intr.lifetime.start 24, %18 : !llvm.ptr
    llvm.store %45, %13 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %47, %14 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %49, %15 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %13, %18 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %50 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %14, %50 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %51 = llvm.getelementptr %18[2] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
    llvm.store %15, %51 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %0, %16 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %0, %17 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
    llvm.store %c0_i32, %45 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %c1_i32, %47 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %c0_i64, %49 {alignment = 8 : i64} : i64, !llvm.ptr
    %52 = llvm.call @nvshmem_my_pe() {convergent, no_unwind} : () -> i32
    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> ()
    %53 = arith.cmpi eq, %52, %c0_i32 : i32
    %54 = scf.if %53 -> (i32) {
      llvm.call @nvshmem_int_put_signal_nbi(%45, %47, %c1_i64, %49, %c1_i64, %c9_i32, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr, i64, i32, i32) -> ()
      %65 = llvm.load %47 {alignment = 4 : i64} : !llvm.ptr -> i32
      scf.yield %65 : i32
    } else {
      scf.yield %c0_i32 : i32
    }
    llvm.call @nvshmem_barrier_all() {convergent, no_unwind} : () -> ()
    %55 = llvm.load %45 {alignment = 4 : i64} : !llvm.ptr -> i32
    %56 = arith.addi %55, %54 : i32
    llvm.store %56, %45 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.intr.lifetime.end 8, %13 : !llvm.ptr
    llvm.intr.lifetime.end 8, %14 : !llvm.ptr
    llvm.intr.lifetime.end 8, %15 : !llvm.ptr
    llvm.intr.lifetime.end 16, %16 : !llvm.ptr
    llvm.intr.lifetime.end 16, %17 : !llvm.ptr
    llvm.intr.lifetime.end 24, %18 : !llvm.ptr
    %57 = llvm.call @cudaMemcpy(%19, %31, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
    %58 = llvm.call @cudaMemcpy(%20, %32, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
    llvm.call @nvshmem_barrier_all() : () -> ()
    %59 = llvm.load %20 {alignment = 4 : i64} : !llvm.ptr -> i32
    %60 = llvm.load %19 {alignment = 4 : i64} : !llvm.ptr -> i32
    %61 = llvm.call @printf(%8, %28, %59, %60) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    llvm.call @nvshmem_barrier_all() : () -> ()
    %62 = llvm.load %19 {alignment = 4 : i64} : !llvm.ptr -> i32
    %63 = llvm.load %20 {alignment = 4 : i64} : !llvm.ptr -> i32
    %64 = llvm.call @printf(%9, %28, %62, %63) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
    llvm.call @nvshmem_free(%31) : (!llvm.ptr) -> ()
    llvm.call @nvshmem_free(%32) : (!llvm.ptr) -> ()
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
  llvm.func @cudaMemcpy(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_barrier_all() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
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

