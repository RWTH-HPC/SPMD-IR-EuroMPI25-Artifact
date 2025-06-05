module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>, #dlti.dl_entry<"dlti.endianness", "little">>} {
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.1"("localbuf is %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.2"("PE %d: localbuf = %d, remote = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.3"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
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
  llvm.mlir.global private unnamed_addr constant @".str.4"("%s:%d: non-zero status: %d: %s, exiting... \00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.5"("/home/sw339864/promotion/mlir-research/software/nvshmem/include/host/nvshmem_api.h\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.mlir.global private unnamed_addr constant @".str.6"("aborting due to error in nvshmemi_init_thread \0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local}
  llvm.func @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_inline, no_unwind, optimize_none, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i32 = arith.constant 0 : i32
    %c-42_i32 = arith.constant -42 : i32
    %0 = llvm.mlir.addressof @__const._ZL12nvshmem_initv.app_nvshmem_version : !llvm.ptr
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = llvm.mlir.addressof @stderr : !llvm.ptr
    %3 = llvm.mlir.addressof @".str.4" : !llvm.ptr
    %4 = llvm.mlir.addressof @".str.5" : !llvm.ptr
    %c57_i32 = arith.constant 57 : i32
    %5 = llvm.mlir.addressof @".str.6" : !llvm.ptr
    %c-1_i32 = arith.constant -1 : i32
    %6 = llvm.mlir.addressof @".str.3" : !llvm.ptr
    %7 = llvm.mlir.addressof @".str.2" : !llvm.ptr
    %8 = llvm.mlir.addressof @".str.1" : !llvm.ptr
    %c1_i64 = arith.constant 1 : i64
    %c4_i64 = arith.constant 4 : i64
    %9 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %10 = llvm.mlir.constant(1 : i32) : i32
    %11 = llvm.alloca %10 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %12 = llvm.alloca %10 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %13 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %14 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 1, %11 : !llvm.ptr
    llvm.intr.lifetime.start 1, %12 : !llvm.ptr
    %15 = llvm.load %0 : !llvm.ptr -> !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>
    llvm.store %15, %12 : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>, !llvm.ptr
    %16 = llvm.getelementptr inbounds %12[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %17 = llvm.load %16 {alignment = 4 : i64} : !llvm.ptr -> i64
    %18 = llvm.getelementptr inbounds %12[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %19 = llvm.load %18 {alignment = 4 : i64} : !llvm.ptr -> i32
    %20 = llvm.call @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(%c2_i32, %11, %c0_i32, %1, %17, %19) : (i32, !llvm.ptr, i32, !llvm.ptr, i64, i32) -> i32
    %21 = arith.cmpi ne, %20, %c0_i32 : i32
    %22 = arith.select %21, %c-42_i32, %c0_i32 : i32
    scf.if %21 {
      %23 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %24 = llvm.call @__errno_location() {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, will_return} : () -> !llvm.ptr
      %25 = llvm.load %24 {alignment = 4 : i64} : !llvm.ptr -> i32
      %26 = llvm.call @strerror(%25) {no_unwind} : (i32) -> !llvm.ptr
      %27 = llvm.call @fprintf(%23, %3, %4, %c57_i32, %20, %26) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, !llvm.ptr) -> i32
      %28 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %29 = llvm.call @fprintf(%28, %5) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr) -> i32
      llvm.call @exit(%c-1_i32) {no_unwind} : (i32) -> ()
    } else {
      llvm.intr.lifetime.end 1, %11 : !llvm.ptr
      llvm.intr.lifetime.end 1, %12 : !llvm.ptr
      %23 = llvm.call @nvshmem_team_my_pe(%c2_i32) : (i32) -> i32
      %24 = llvm.call @cudaSetDevice(%23) : (i32) -> i32
      %25 = llvm.call @nvshmem_my_pe() : () -> i32
      %26 = llvm.call @nvshmem_n_pes() : () -> i32
      %27 = arith.cmpi ne, %26, %c2_i32 : i32
      scf.if %27 {
        %41 = llvm.call @printf(%9, %26, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
        llvm.call @nvshmem_global_exit(%c1_i32) : (i32) -> ()
      }
      %28 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      %29 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      llvm.call @nvshmem_barrier_all() : () -> ()
      %30 = llvm.call @cudaMemset(%28, %c0_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
      %31 = llvm.call @cudaMemset(%29, %c1_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
      %32 = arith.cmpi eq, %25, %c0_i32 : i32
      scf.if %32 {
        llvm.call @nvshmem_int_get_nbi(%29, %28, %c1_i64, %c1_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> ()
        %41 = llvm.call @cudaMemcpy(%14, %29, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
        %42 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32
        %43 = llvm.call @printf(%8, %42) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32) -> i32
      }
      llvm.call @nvshmem_barrier_all() : () -> ()
      %33 = llvm.call @cudaMemcpy(%13, %28, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
      %34 = llvm.call @cudaMemcpy(%14, %29, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
      %35 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32
      %36 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %37 = llvm.call @printf(%7, %25, %35, %36) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      llvm.call @nvshmem_barrier_all() : () -> ()
      %38 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %39 = llvm.load %14 {alignment = 4 : i64} : !llvm.ptr -> i32
      %40 = llvm.call @printf(%6, %25, %38, %39) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      llvm.call @nvshmem_free(%28) : (!llvm.ptr) -> ()
      llvm.call @nvshmem_free(%29) : (!llvm.ptr) -> ()
      llvm.call @nvshmemi_finalize() : () -> ()
    }
    llvm.return %22 : i32
  }
  llvm.func @nvshmem_team_my_pe(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_my_pe() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_n_pes() -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @printf(!llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_global_exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_malloc(i64 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_barrier_all() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemset(!llvm.ptr {llvm.noundef}, i32 {llvm.noundef}, i64 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemcpy(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_free(!llvm.ptr {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64, i32) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @fprintf(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @strerror(i32 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @__errno_location() -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return}
  llvm.func @exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["noreturn", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmemi_finalize() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

