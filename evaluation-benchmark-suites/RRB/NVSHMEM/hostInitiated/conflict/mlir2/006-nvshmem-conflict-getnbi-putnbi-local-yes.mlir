module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f80, dense<128> : vector<2xi64>>, #dlti.dl_entry<i128, dense<128> : vector<2xi64>>, #dlti.dl_entry<i8, dense<8> : vector<2xi64>>, #dlti.dl_entry<i16, dense<16> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi64>>, #dlti.dl_entry<i1, dense<8> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi64>>, #dlti.dl_entry<f128, dense<128> : vector<2xi64>>, #dlti.dl_entry<f64, dense<64> : vector<2xi64>>, #dlti.dl_entry<f16, dense<16> : vector<2xi64>>, #dlti.dl_entry<i32, dense<32> : vector<2xi64>>, #dlti.dl_entry<i64, dense<64> : vector<2xi64>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi64>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi64>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i64>, #dlti.dl_entry<"dlti.endianness", "little">>} {
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
    %c1_i64 = arith.constant 1 : i64
    %c4_i64 = arith.constant 4 : i64
    %8 = llvm.mlir.addressof @".str" : !llvm.ptr
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %9 = llvm.mlir.constant(1 : i32) : i32
    %10 = llvm.alloca %9 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %11 = llvm.alloca %9 x !llvm.struct<(i64, i32)> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %12 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %13 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 1, %10 : !llvm.ptr
    llvm.intr.lifetime.start 1, %11 : !llvm.ptr
    %14 = llvm.load %0 : !llvm.ptr -> !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>
    llvm.store %14, %11 : !llvm.struct<"struct.nvshmemi_version_t", (i32, i32, i32)>, !llvm.ptr
    %15 = llvm.getelementptr inbounds %11[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %16 = llvm.load %15 {alignment = 4 : i64} : !llvm.ptr -> i64
    %17 = llvm.getelementptr inbounds %11[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i64, i32)>
    %18 = llvm.load %17 {alignment = 4 : i64} : !llvm.ptr -> i32
    %19 = llvm.call @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(%c2_i32, %10, %c0_i32, %1, %16, %18) : (i32, !llvm.ptr, i32, !llvm.ptr, i64, i32) -> i32
    %20 = arith.cmpi ne, %19, %c0_i32 : i32
    %21 = arith.select %20, %c-42_i32, %c0_i32 : i32
    scf.if %20 {
      %22 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %23 = llvm.call @__errno_location() {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, will_return} : () -> !llvm.ptr
      %24 = llvm.load %23 {alignment = 4 : i64} : !llvm.ptr -> i32
      %25 = llvm.call @strerror(%24) {no_unwind} : (i32) -> !llvm.ptr
      %26 = llvm.call @fprintf(%22, %3, %4, %c57_i32, %19, %25) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, !llvm.ptr) -> i32
      %27 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
      %28 = llvm.call @fprintf(%27, %5) vararg(!llvm.func<i32 (ptr, ptr, ...)>) {no_unwind} : (!llvm.ptr, !llvm.ptr) -> i32
      llvm.call @exit(%c-1_i32) {no_unwind} : (i32) -> ()
    } else {
      llvm.intr.lifetime.end 1, %10 : !llvm.ptr
      llvm.intr.lifetime.end 1, %11 : !llvm.ptr
      %22 = llvm.call @nvshmem_team_my_pe(%c2_i32) : (i32) -> i32
      %23 = llvm.call @cudaSetDevice(%22) : (i32) -> i32
      %24 = llvm.call @nvshmem_my_pe() : () -> i32
      %25 = llvm.call @nvshmem_n_pes() : () -> i32
      %26 = arith.cmpi ne, %25, %c2_i32 : i32
      scf.if %26 {
        %40 = llvm.call @printf(%8, %25, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32) -> i32
        llvm.call @nvshmem_global_exit(%c1_i32) : (i32) -> ()
      }
      %27 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      %28 = llvm.call @nvshmem_malloc(%c4_i64) : (i64) -> !llvm.ptr
      llvm.call @nvshmem_barrier_all() : () -> ()
      %29 = llvm.call @cudaMemset(%27, %c0_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
      %30 = llvm.call @cudaMemset(%28, %c1_i32, %c4_i64) : (!llvm.ptr, i32, i64) -> i32
      %31 = arith.cmpi eq, %24, %c0_i32 : i32
      scf.if %31 {
        llvm.call @nvshmem_int_get_nbi(%28, %27, %c1_i64, %c1_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> ()
        llvm.call @nvshmem_int_put_nbi(%27, %28, %c1_i64, %c1_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> ()
      }
      llvm.call @nvshmem_barrier_all() : () -> ()
      %32 = llvm.call @cudaMemcpy(%12, %27, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
      %33 = llvm.call @cudaMemcpy(%13, %28, %c4_i64, %c2_i32) : (!llvm.ptr, !llvm.ptr, i64, i32) -> i32
      %34 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %35 = llvm.load %12 {alignment = 4 : i64} : !llvm.ptr -> i32
      %36 = llvm.call @printf(%7, %24, %34, %35) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      llvm.call @nvshmem_barrier_all() : () -> ()
      %37 = llvm.load %12 {alignment = 4 : i64} : !llvm.ptr -> i32
      %38 = llvm.load %13 {alignment = 4 : i64} : !llvm.ptr -> i32
      %39 = llvm.call @printf(%6, %24, %37, %38) vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32, i32, i32) -> i32
      llvm.call @nvshmem_free(%27) : (!llvm.ptr) -> ()
      llvm.call @nvshmem_free(%28) : (!llvm.ptr) -> ()
      llvm.call @nvshmemi_finalize() : () -> ()
    }
    llvm.return %21 : i32
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
  llvm.func @nvshmem_int_put_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @cudaMemcpy(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmem_free(!llvm.ptr {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @_Z20nvshmemi_init_threadiPijP21nvshmemx_init_attr_v118nvshmemi_version_t(i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i32 {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64, i32) -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @fprintf(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, ...) -> i32 attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @strerror(i32 {llvm.noundef}) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @__errno_location() -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return}
  llvm.func @exit(i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = ["noreturn", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func @nvshmemi_finalize() attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

