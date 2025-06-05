#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250731-154348/RRB/SHMEM/SPMDIR/conflict/050-shmem-conflict-putnbi-putnbi-same-array-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 336, elements = #llvm.di_subrange<count = 42 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 440, elements = #llvm.di_subrange<count = 55 : i64>>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 21, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file, line = 64, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("I have %d PEs. You should rerun with %d.\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("Process %d finished. Array sums: send = %d, recv = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readnone}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %0 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c25_i64 = arith.constant {spmd.executionKind = "All"} 25 : i64
    %c100_i32 = arith.constant {spmd.executionKind = "All"} 100 : i32
    %c400_i64 = arith.constant {spmd.executionKind = "All"} 400 : i64
    %1 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c-42_i32 = arith.constant {spmd.executionKind = "All"} -42 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %2 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %3 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %4 = "spmd.commWorld"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %5 = "spmd.init"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %size, %error = "spmd.getSizeOfComm"(%4) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %rank, %error_0 = "spmd.getRankInComm"(%4) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %6 = arith.cmpi eq, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    %7 = arith.select %6, %c0_i32, %c-42_i32 {spmd.executionKind = "All"} : i32
    scf.if %6 {
      %8 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      %address, %error_1 = "spmd.malloc"(%4, %c400_i64) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
      %9 = llvm.getelementptr inbounds %address[200] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, i8
      %address_2, %error_3 = "spmd.malloc"(%4, %c400_i64) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
      %10 = llvm.getelementptr inbounds %address_2[200] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, i8
      %11 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
      scf.if %11 {
        scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32  : i32 {
          %18 = arith.extui %arg2 {nonNeg, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : i32 to i64
          %19 = llvm.getelementptr inbounds %address[%18] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %arg2, %19 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
          %20 = llvm.getelementptr inbounds %address_2[%18] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %c0_i32, %20 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
        } {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", spmd.isMultiValued = false}
      } else {
        scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32  : i32 {
          %18 = arith.extui %arg2 {nonNeg, spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut"} : i32 to i64
          %19 = llvm.getelementptr inbounds %address[%18] {spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %c0_i32, %19 {alignment = 4 : i64, spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
          %20 = llvm.getelementptr inbounds %address_2[%18] {spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %c0_i32, %20 {alignment = 4 : i64, spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
        } {spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut", spmd.isMultiValued = false}
      } {spmd.executionKind = "All", spmd.isMultiValued = true}
      %12 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      scf.if %11 {
        %win, %error_4 = "spmd.winCreate"(%4, %address_2, %c0_i32) <{usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
        %error_5 = "spmd.put"(%address, %c25_i64, %3, %c1_i64, %c1_i32, %win, %c0_i64, %c25_i64, %3, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
        %win_6, %error_7 = "spmd.winCreate"(%4, %10, %c0_i32) <{usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
        %error_8 = "spmd.put"(%9, %c25_i64, %2, %c1_i64, %c1_i32, %win_6, %c0_i64, %c25_i64, %2, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      } {spmd.executionKind = "All", spmd.isMultiValued = true}
      %13 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      %14:2 = scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32 iter_args(%arg3 = %c0_i32, %arg4 = %c0_i32) -> (i32, i32)  : i32 {
        %18 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
        %19 = llvm.getelementptr inbounds %address[%18] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %20 = llvm.load %19 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
        %21 = arith.addi %20, %arg3 {spmd.executionKind = "All"} : i32
        %22 = llvm.getelementptr inbounds %address_2[%18] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %23 = llvm.load %22 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
        %24 = arith.addi %23, %arg4 {spmd.executionKind = "All"} : i32
        scf.yield {spmd.executionKind = "All"} %21, %24 : i32, i32
      } {spmd.executionKind = "All", spmd.isMultiValued = false}
      %15 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      %16 = llvm.call tail @printf(%0, %rank, %14#0, %14#1) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
      %17 = "spmd.finalize"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    } else {
      %8 = llvm.call tail @printf(%1, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %9 = "spmd.abort"(%4, %c1_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    llvm.return {spmd.executionKind = "All"} %7 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

