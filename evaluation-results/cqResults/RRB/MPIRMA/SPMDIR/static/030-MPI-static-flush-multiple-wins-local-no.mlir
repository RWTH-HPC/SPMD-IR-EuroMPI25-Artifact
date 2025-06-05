#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250731-154348/RRB/MPIRMA/SPMDIR/static/030-MPI-static-flush-multiple-wins-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 352, elements = #llvm.di_subrange<count = 44 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 392, elements = #llvm.di_subrange<count = 49 : i64>>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 20, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file, line = 68, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p2 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("I have %d ranks. You should rerun with %d.\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("Process %d finished. Sums: sum1 = %d, sum2 = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c50_i64 = arith.constant {spmd.executionKind = "All"} 50 : i64
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %0 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c100_i32 = arith.constant {spmd.executionKind = "All"} 100 : i32
    %c4_i32 = arith.constant {spmd.executionKind = "All"} 4 : i32
    %c400_i64 = arith.constant {spmd.executionKind = "All"} 400 : i64
    %1 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c3_i32 = arith.constant {spmd.executionKind = "All"} 3 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %2 = "spmd.commWorld"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %3 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %4 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %5 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %6 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %9 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %10 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %11 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.store %arg0, %4 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %arg1, %5 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr, !llvm.ptr
    llvm.intr.lifetime.start 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    %12 = "spmd.init"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_0 = "spmd.getSizeOfComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %13 = arith.cmpi eq, %size, %c3_i32 {spmd.executionKind = "All"} : i32
    scf.if %13 {
    } else {
      %20 = llvm.call @printf(%1, %size, %c3_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %21 = "spmd.abort"(%2, %c1_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    llvm.intr.lifetime.start 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 8, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 8, %11 {spmd.executionKind = "All"} : !llvm.ptr
    %baseAddress, %win, %error_1 = "spmd.winAlloc"(%2, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
    %baseAddress_2, %win_3, %error_4 = "spmd.winAlloc"(%2, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
    scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32  : i32 {
      %20 = arith.addi %rank, %c1_i32 {spmd.executionKind = "All"} : i32
      %21 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
      %22 = llvm.getelementptr inbounds %baseAddress[%21] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %20, %22 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
      %23 = arith.addi %rank, %c1_i32 {spmd.executionKind = "All"} : i32
      %24 = arith.muli %23, %arg2 {spmd.executionKind = "All"} : i32
      %25 = llvm.getelementptr inbounds %baseAddress_2[%21] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %24, %25 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %error_5 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
    %14 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %14 {
      %20 = "spmd.lockAll"(%win, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win, i32) -> !spmd.error
      %21 = "spmd.lockAll"(%win_3, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win, i32) -> !spmd.error
      %error_8 = "spmd.put"(%baseAddress_2, %c50_i64, %3, %c1_i64, %c1_i32, %win, %c0_i64, %c50_i64, %3, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %22 = "spmd.flushAll"(%win) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win) -> !spmd.error
      %error_9 = "spmd.get"(%baseAddress_2, %c50_i64, %3, %c1_i64, %c2_i32, %win_3, %c0_i64, %c50_i64, %3, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %23 = "spmd.flush"(%c2_i32, %win_3) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
      %error_10 = "spmd.get"(%baseAddress, %c50_i64, %3, %c1_i64, %c2_i32, %win_3, %c0_i64, %c50_i64, %3, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %24 = "spmd.flushAll"(%win) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win) -> !spmd.error
      %25 = "spmd.flushAll"(%win_3) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win) -> !spmd.error
      %26 = "spmd.unlockAll"(%win) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win) -> !spmd.error
      %27 = "spmd.unlockAll"(%win_3) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %error_6 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
    %15:2 = scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32 iter_args(%arg3 = %c0_i32, %arg4 = %c0_i32) -> (i32, i32)  : i32 {
      %20 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
      %21 = llvm.getelementptr inbounds %baseAddress[%20] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      %22 = llvm.load %21 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %23 = arith.addi %22, %arg3 {spmd.executionKind = "All"} : i32
      %24 = llvm.getelementptr inbounds %baseAddress_2[%20] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      %25 = llvm.load %24 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %26 = arith.addi %25, %arg4 {spmd.executionKind = "All"} : i32
      scf.yield {spmd.executionKind = "All"} %23, %26 : i32, i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %error_7 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
    %16 = llvm.call @printf(%0, %rank, %15#0, %15#1) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %17 = "spmd.winFree"(%win) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
    %18 = "spmd.winFree"(%win_3) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
    %19 = "spmd.finalize"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.intr.lifetime.end 8, %11 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 8, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

