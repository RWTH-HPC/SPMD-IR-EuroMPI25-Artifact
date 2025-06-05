#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250731-154348/MBB/SPMDIR/RMA/Correct-lockflushlocal-rget_accumulate_rget-001.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 216, elements = #llvm.di_subrange<count = 27 : i64>>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 60, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p2 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str.1"("Rank %d finished normally\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @str("MBB ERROR: This test needs at least 2 processes to produce a bug!\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0 = arith.constant {spmd.executionKind = "All"} 0 : index
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c10_i64 = arith.constant {spmd.executionKind = "All"} 10 : i64
    %c4_i32 = arith.constant {spmd.executionKind = "All"} 4 : i32
    %c80_i64 = arith.constant {spmd.executionKind = "All"} 80 : i64
    %c4_i64 = arith.constant {spmd.executionKind = "All"} 4 : i64
    %c20_i64 = arith.constant {spmd.executionKind = "All"} 20 : i64
    %0 = llvm.mlir.addressof @str {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %1 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c-1_i32 = arith.constant {spmd.executionKind = "All"} -1 : i32
    %c738197504_i32 = arith.constant {spmd.executionKind = "All"} 738197504 : i32
    %2 = "spmd.commWorld"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %3 = "spmd.constLockTypeOp"() <{stringAttr = "EXCLUSIVE", usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.lock
    %4 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %5 = "spmd.constOpType"() <{stringAttr = "SUM", usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.op
    %6 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %9 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %alloca = memref.alloca() {spmd.executionKind = "All"} : memref<1x!spmd.req>
    %10 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %alloca_0 = memref.alloca() {spmd.executionKind = "All"} : memref<1x!spmd.req>
    %11 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %12 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.store %arg0, %6 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %arg1, %7 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr, !llvm.ptr
    llvm.intr.lifetime.start 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.store %c-1_i32, %8 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.intr.lifetime.start 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.store %c-1_i32, %9 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.intr.lifetime.start 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.store %c738197504_i32, %10 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.intr.lifetime.start 4, %11 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.store %c738197504_i32, %11 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = "spmd.init"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %size, %error = "spmd.getSizeOfComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %rank, %error_1 = "spmd.getRankInComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %14 = arith.cmpi slt, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    scf.if %14 {
      %20 = llvm.call @puts(%0) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr) -> i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    llvm.intr.lifetime.start 4, %12 {spmd.executionKind = "All"} : !llvm.ptr
    %15 = llvm.call @calloc(%c20_i64, %c4_i64) {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = readwrite>, no_unwind, spmd.executionKind = "All", will_return} : (i64, i64) -> !llvm.ptr
    %win, %error_2 = "spmd.winCreate"(%2, %15, %c80_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr, i64, i32) -> (!spmd.win, !spmd.error)
    %16 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %16 {
      %20 = "spmd.lock"(%c1_i32, %win, %3, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win, !spmd.lock, i32) -> !spmd.error
      %21 = llvm.call @calloc(%c10_i64, %c4_i64) {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = readwrite>, no_unwind, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", will_return} : (i64, i64) -> !llvm.ptr
      %22 = llvm.call @calloc(%c10_i64, %c4_i64) {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = readwrite>, no_unwind, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", will_return} : (i64, i64) -> !llvm.ptr
      %req, %error_3 = "spmd.getAccumulate"(%21, %c10_i64, %4, %c1_i64, %22, %c10_i64, %4, %c1_i64, %c1_i32, %win, %c0_i64, %c10_i64, %4, %c1_i64, %5) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, !llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64, !spmd.op) -> (!spmd.req, !spmd.error)
      memref.store %req, %alloca[%c0] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : memref<1x!spmd.req>
      %23 = "spmd.flush"(%c1_i32, %win) <{isLocal = true, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
      %req_4, %error_5 = "spmd.get"(%21, %c10_i64, %4, %c1_i64, %c1_i32, %win, %c10_i64, %c10_i64, %4, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> (!spmd.req, !spmd.error)
      memref.store %req_4, %alloca_0[%c0] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : memref<1x!spmd.req>
      %24 = "spmd.unlock"(%c1_i32, %win) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
      %25 = memref.load %alloca[%c0] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : memref<1x!spmd.req>
      %error_6 = "spmd.wait"(%25) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.req) -> !spmd.error
      %26 = memref.load %alloca_0[%c0] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : memref<1x!spmd.req>
      %error_7 = "spmd.wait"(%26) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.req) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %17 = "spmd.winFree"(%win) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
    %18 = "spmd.finalize"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %19 = llvm.call @printf(%1, %rank) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32) -> i32
    llvm.intr.lifetime.end 4, %12 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %11 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @calloc(i64 {llvm.noundef}, i64 {llvm.noundef}) -> (!llvm.ptr {llvm.noalias, llvm.noundef}) attributes {memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = readwrite>, no_unwind, passthrough = ["mustprogress", "nofree", ["allockind", "17"], ["allocsize", "1"], ["alloc-family", "malloc"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return}
  llvm.func local_unnamed_addr @puts(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree"], spmd.executionKind = "All"}
}

