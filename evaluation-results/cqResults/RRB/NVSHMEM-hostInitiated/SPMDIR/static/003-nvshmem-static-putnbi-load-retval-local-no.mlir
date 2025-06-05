#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250731-154348/RRB/NVSHMEM-hostInitiated/SPMDIR/static/003-nvshmem-static-putnbi-load-retval-local-no.cpp" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_const_type, baseType = #di_basic_type>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 200, elements = #llvm.di_subrange<count = 25 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 144, elements = #llvm.di_subrange<count = 18 : i64>>
#di_composite_type2 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 632, elements = #llvm.di_subrange<count = 79 : i64>>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 30, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file, line = 57, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#di_global_variable2 = #llvm.di_global_variable<file = #di_file, line = 69, type = #di_composite_type2, isLocalToUnit = true, isDefined = true>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#di_global_variable_expression2 = #llvm.di_global_variable_expression<var = #di_global_variable2, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("lbuf_alias is %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.2"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression2], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readnone}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %0 = llvm.mlir.addressof @".str.2" {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %c4_i64 = arith.constant {spmd.executionKind = "All"} 4 : i64
    %2 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %3 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %4 = "spmd.commWorld"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %5 = "spmd.commNode"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %6 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    %9 = "spmd.init"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%5) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %10 = llvm.call tail @cudaSetDevice(%rank) {no_unwind, spmd.executionKind = "All"} : (i32) -> i32
    %rank_0, %error_1 = "spmd.getRankInComm"(%4) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_2 = "spmd.getSizeOfComm"(%4) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %11 = arith.cmpi eq, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    scf.if %11 {
    } else {
      %26 = llvm.call tail @printf(%2, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %27 = "spmd.abort"(%4, %c1_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %address, %error_3 = "spmd.malloc"(%4, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_4, %error_5 = "spmd.malloc"(%4, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %12 = "spmd.memset"(%address, %c0_i32, %c4_i64) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, i32, i64) -> !spmd.error
    %13 = "spmd.memset"(%address_4, %c1_i32, %c4_i64) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, i32, i64) -> !spmd.error
    llvm.intr.lifetime.start 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    %14 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %15 = arith.cmpi eq, %rank_0, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %15 {
      %win, %error_6 = "spmd.winCreate"(%4, %address, %c0_i32) <{usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_7 = "spmd.put"(%address_4, %c1_i64, %3, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %3, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %26 = "spmd.memcpy"(%8, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
      %27 = llvm.load %8 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %28 = llvm.call @printf(%1, %27) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i32) -> i32
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %16 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %17 = "spmd.memcpy"(%6, %address, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %18 = "spmd.memcpy"(%7, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %19 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %20 = llvm.load %6 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.load %7 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.call @printf(%0, %rank_0, %20, %21) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %23 = "spmd.free"(%4, %address) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %24 = "spmd.free"(%4, %address_4) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %25 = "spmd.finalize"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.intr.lifetime.end 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

