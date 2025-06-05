module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>, #dlti.dl_entry<"dlti.endianness", "little">>} {
  llvm.comdat @__llvm_global_comdat {
    llvm.comdat_selector @_ZN4dim3C2Ejjj any
  }
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @__const._ZL12nvshmem_initv.app_nvshmem_version() {addr_space = 0 : i32, alignment = 4 : i64, dso_local} : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)> {
    %c0_i32 = arith.constant 0 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = llvm.mlir.undef : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>
    %1 = llvm.insertvalue %c3_i32, %0[0] : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)> 
    %2 = llvm.insertvalue %c0_i32, %1[1] : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)> 
    %3 = llvm.insertvalue %c0_i32, %2[2] : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)> 
    llvm.return %3 : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>
  }
  llvm.mlir.global external @stderr() {addr_space = 0 : i32, alignment = 8 : i64} : !llvm.ptr
  llvm.mlir.global private unnamed_addr constant @".str.3"("%s:%d: non-zero status: %d: %s, exiting... \00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.4"("/home/sw339864/promotion/mlir-research/software/nvshmem/include/host/nvshmem_api.h\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.5"("aborting due to error in nvshmemi_init_thread \0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.func @_Z14nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) attributes {always_inline, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["mustprogress", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c1_i64 = arith.constant 1 : i64
    %c42_i32 = arith.constant 42 : i32
    llvm.call @nvshmem_barrier_all() : () -> ()
    llvm.store %c0_i32, %arg0 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %c1_i32, %arg1 {alignment = 4 : i64} : i32, !llvm.ptr
    %0 = llvm.call @nvshmem_my_pe() : () -> i32
    %1 = arith.cmpi eq, %0, %c0_i32 : i32
    scf.if %1 {
      llvm.call @nvshmem_int_put_nbi(%arg0, %arg1, %c1_i64, %c1_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> ()
      llvm.store %c42_i32, %arg1 {alignment = 4 : i64} : i32, !llvm.ptr
    }
    llvm.call @nvshmem_barrier_all() : () -> ()
    llvm.return
  }
  llvm.func @nvshmem_barrier_all() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_my_pe() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_int_put_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i32 = arith.constant 0 : i32
    %c-42_i32 = arith.constant -42 : i32
    %0 = llvm.mlir.addressof @__const._ZL12nvshmem_initv.app_nvshmem_version : !llvm.ptr
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = llvm.mlir.addressof @stderr : !llvm.ptr
    %3 = llvm.mlir.addressof @".str.3" : !llvm.ptr
    %4 = llvm.mlir.addressof @".str.4" : !llvm.ptr
    %c57_i32 = arith.constant 57 : i32
    %5 = llvm.mlir.addressof @".str.5" : !llvm.ptr
    %c-1_i32 = arith.constant -1 : i32
    %6 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %7 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %8 = llvm.mlir.addressof @_Z14nvshmem_kernelPiS_ : !llvm.ptr
    %c1024_i32 = arith.constant 1024 : i32
    %c4096_i64 = arith.constant 4096 : i64
    %c4_i64 = arith.constant 4 : i64
    %9 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %10 = llvm.mlir.constant(1 : i32) : i32
    %11 = llvm.alloca %10 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %12 = llvm.alloca %10 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %13 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %14 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %15 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %16 = llvm.alloca %c1_i32 x !llvm.array<2 x ptr> {alignment = 16 : i64} : (i32) -> !llvm.ptr
    %17 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %18 = llvm.alloca %c1_i32 x !llvm.struct<"struct.dim3", (i32, i32, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %19 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %20 = llvm.alloca %c1_i32 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 1, %11 : !llvm.ptr
    llvm.intr.lifetime.start 1, %12 : !llvm.ptr
    %21 = llvm.load %0 : !llvm.ptr -> !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>
    llvm.store %21, %12 : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>, !llvm.ptr
    %22 = llvm.getelementptr inbounds %12[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %23 = llvm.load %22 {alignment = 4 : i64} : !llvm.ptr -> i64
    %24 = llvm.getelementptr inbounds %12[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %25 = llvm.load %24 {alignment = 4 : i64} : !llvm.ptr -> i32
    %26 = llvm.call @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(%c2_i32, %11, %c0_i32, %1, %23, %25) : (i32, !llvm.ptr, i32, !llvm.ptr, i64, i32) -> i32
    %27 = arith.cmpi ne, %26, %c0_i32 : i32
    %28 = arith.select %27, %c-42_i32, %c0_i32 : i32
    scf.if %27 {
      %29 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %30 = llvm.call @__errno_location() {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, will_return} : () -> !llvm.ptr
      %31 = llvm.load %30 {alignment = 4 : i64} : !llvm.ptr -> i32
      %32 = llvm.call @strerror(%31) {no_unwind} : (i32) -> !llvm.ptr
      %33 = llvm.call @fprintf(%29, %3, %4, %c57_i32, %26, %32) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, !llvm.ptr) -> i32
      %34 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %35 = llvm.call @fprintf(%34, %5) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr) -> i32
      llvm.call @exit(%c-1_i32) {no_unwind} : (i32) -> ()
    } else {
      llvm.intr.lifetime.end 1, %11 : !llvm.ptr
      llvm.intr.lifetime.end 1, %12 : !llvm.ptr
      %29 = llvm.call @nvshmem_team_my_pe(%c2_i32) : (i32) -> i32
      %30 = llvm.call @cudaSetDevice(%29) : (i32) -> i32
      %31 = llvm.call @cudaStreamCreate(%15) : (!llvm.ptr) -> i32
      %32 = llvm.call @nvshmem_my_pe() : () -> i32
      %33 = llvm.call @nvshmem_n_pes() : () -> i32
      %34 = arith.cmpi ne, %33, %c2_i32 : i32
      scf.if %34 {
        %71 = llvm.call @printf(%9, %33, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
        llvm.call @nvshmem_global_exit(%c1_i32) : (i32) -> ()
      }
      %35 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      %36 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      llvm.store %35, %16 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
      %37 = llvm.getelementptr inbounds %16[1] : (!llvm.ptr) -> !llvm.ptr, !llvm.ptr
      llvm.store %36, %37 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
      %38 = llvm.getelementptr inbounds %17[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1_i32, %38 {alignment = 4 : i64} : i32, !llvm.ptr
      %39 = llvm.getelementptr inbounds %17[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1_i32, %39 {alignment = 4 : i64} : i32, !llvm.ptr
      %40 = llvm.getelementptr inbounds %17[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1_i32, %40 {alignment = 4 : i64} : i32, !llvm.ptr
      %41 = llvm.getelementptr inbounds %18[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1024_i32, %41 {alignment = 4 : i64} : i32, !llvm.ptr
      %42 = llvm.getelementptr inbounds %18[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1_i32, %42 {alignment = 4 : i64} : i32, !llvm.ptr
      %43 = llvm.getelementptr inbounds %18[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"struct.dim3", (i32, i32, i32)>
      llvm.store %c1_i32, %43 {alignment = 4 : i64} : i32, !llvm.ptr
      %44 = llvm.load %17 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
      %45 = llvm.load %18 : !llvm.ptr -> !llvm.struct<"struct.dim3", (i32, i32, i32)>
      %46 = llvm.getelementptr inbounds %16[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x ptr>
      %47 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      llvm.store %44, %19 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
      %48 = llvm.getelementptr inbounds %19[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
      %49 = llvm.load %48 {alignment = 4 : i64} : !llvm.ptr -> i64
      %50 = llvm.getelementptr inbounds %19[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
      %51 = llvm.load %50 {alignment = 4 : i64} : !llvm.ptr -> i32
      llvm.store %45, %20 : !llvm.struct<"struct.dim3", (i32, i32, i32)>, !llvm.ptr
      %52 = llvm.getelementptr inbounds %20[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
      %53 = llvm.load %52 {alignment = 4 : i64} : !llvm.ptr -> i64
      %54 = llvm.getelementptr inbounds %20[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
      %55 = llvm.load %54 {alignment = 4 : i64} : !llvm.ptr -> i32
      %56 = llvm.call @_Z26nvshmemx_collective_launchPKv4dim3S1_PPvmP11CUstream_st(%8, %49, %51, %53, %55, %46, %c4096_i64, %47) : (!llvm.ptr, i64, i32, i64, i32, !llvm.ptr, i64, !llvm.ptr) -> i32
      %57 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %58 = llvm.call @cudaMemcpyAsync(%13, %35, %c4_i64, %c2_i32, %57) : (!llvm.ptr, !llvm.ptr, i64, i32, !llvm.ptr) -> i32
      %59 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %60 = llvm.call @cudaMemcpyAsync(%14, %36, %c4_i64, %c2_i32, %59) : (!llvm.ptr, !llvm.ptr, i64, i32, !llvm.ptr) -> i32
      %61 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      llvm.call @nvshmemx_barrier_all_on_stream(%61) : (!llvm.ptr) -> ()
      %62 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %63 = llvm.call @cudaStreamSynchronize(%62) : (!llvm.ptr) -> i32
      %64 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32
      %65 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %66 = llvm.call @printf(%7, %32, %64, %65) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      %67 = llvm.load %15 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      llvm.call @nvshmemx_barrier_all_on_stream(%67) : (!llvm.ptr) -> ()
      %68 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %69 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32
      %70 = llvm.call @printf(%6, %32, %68, %69) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      llvm.call @nvshmem_free(%35) : (!llvm.ptr) -> ()
      llvm.call @nvshmem_free(%36) : (!llvm.ptr) -> ()
      llvm.call @nvshmemi_finalize() : () -> ()
    }
    llvm.return %28 : i32
  }
  llvm.func @nvshmem_team_my_pe(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaStreamCreate(!llvm.ptr {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_n_pes() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_global_exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_malloc(i64 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @_Z26nvshmemx_collective_launchPKv4dim3S1_PPvmP11CUstream_st(!llvm.ptr {llvm.noundef}, i64, i32, i64, i32, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemcpyAsync(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmemx_barrier_all_on_stream(!llvm.ptr {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaStreamSynchronize(!llvm.ptr {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_free(!llvm.ptr {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64, i32) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @fprintf(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @strerror(i32 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @__errno_location() -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return}
  llvm.func @exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["noreturn", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmemi_finalize() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

