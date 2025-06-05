#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250604-173113/RRB/MPIRMA/SPMDIR/static/030-MPI-static-flush-multiple-wins-local-no.c" in "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 352, elements = #llvm.di_subrange<count = 44 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 392, elements = #llvm.di_subrange<count = 49 : i64>>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 20, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file, line = 71, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p2 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("I have %d ranks. You should rerun with %d.\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("Process %d finished. Sums: sum1 = %d, sum2 = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.range = #llvm.constant_range<i32, 0, 2>}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c50_i64 = arith.constant {spmd.executionKind = "All"} 50 : i64
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %0 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c100_i32 = arith.constant {spmd.executionKind = "All"} 100 : i32
    %c4_i32 = arith.constant {spmd.executionKind = "All"} 4 : i32
    %c400_i64 = arith.constant {spmd.executionKind = "All"} 400 : i64
    %1 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c3_i32 = arith.constant {spmd.executionKind = "All"} 3 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %2 = "spmd.commWorld"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %3 = "spmd.constLockTypeOp"() <{stringAttr = "EXCLUSIVE", usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.lock
    %4 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %5 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %6 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %9 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %10 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %11 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %12 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.store %arg0, %5 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %arg1, %6 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr, !llvm.ptr
    llvm.intr.lifetime.start 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    %13 = "spmd.init"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_0 = "spmd.getSizeOfComm"(%2) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %14 = arith.cmpi eq, %size, %c3_i32 {spmd.executionKind = "All"} : i32
    %15 = arith.cmpi ne, %size, %c3_i32 {spmd.executionKind = "All"} : i32
    %16 = arith.extui %15 {spmd.executionKind = "All"} : i1 to i32
    scf.if %14 {
      llvm.intr.lifetime.start 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.start 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.start 8, %11 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.start 8, %12 {spmd.executionKind = "All"} : !llvm.ptr
      %baseAddress, %win, %error_1 = "spmd.winAlloc"(%2, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
      %baseAddress_2, %win_3, %error_4 = "spmd.winAlloc"(%2, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
      scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32  : i32 {
        %25 = arith.addi %rank, %c1_i32 {spmd.executionKind = "All"} : i32
        %26 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
        %27 = llvm.getelementptr inbounds %baseAddress[%26] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %25, %27 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
        %28 = arith.addi %rank, %c1_i32 {spmd.executionKind = "All"} : i32
        %29 = arith.muli %28, %arg2 {spmd.executionKind = "All"} : i32
        %30 = llvm.getelementptr inbounds %baseAddress_2[%26] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %29, %30 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
      } {spmd.executionKind = "All", spmd.isMultiValued = false}
      %error_5 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
      %17 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
      scf.if %17 {
        %25 = "spmd.lock"(%c1_i32, %win, %3, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win, !spmd.lock, i32) -> !spmd.error
        %26 = "spmd.lock"(%c2_i32, %win_3, %3, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win, !spmd.lock, i32) -> !spmd.error
        %error_8 = "spmd.put"(%baseAddress_2, %c50_i64, %4, %c1_i64, %c1_i32, %win, %c0_i64, %c50_i64, %4, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
        %27 = "spmd.flush"(%c1_i32, %win) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
        %error_9 = "spmd.get"(%baseAddress_2, %c50_i64, %4, %c1_i64, %c2_i32, %win_3, %c0_i64, %c50_i64, %4, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
        %28 = "spmd.flush"(%c2_i32, %win_3) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
        %error_10 = "spmd.get"(%baseAddress, %c50_i64, %4, %c1_i64, %c2_i32, %win_3, %c0_i64, %c50_i64, %4, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
        %29 = "spmd.flush"(%c1_i32, %win) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
        %30 = "spmd.flush"(%c2_i32, %win_3) <{isLocal = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
        %31 = "spmd.unlock"(%c1_i32, %win) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
        %32 = "spmd.unlock"(%c2_i32, %win_3) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (i32, !spmd.win) -> !spmd.error
      } {spmd.executionKind = "All", spmd.isMultiValued = true}
      %18 = "spmd.fence"(%win, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
      %19 = "spmd.fence"(%win_3, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
      %error_6 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
      %20:2 = scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32 iter_args(%arg3 = %c0_i32, %arg4 = %c0_i32) -> (i32, i32)  : i32 {
        %25 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
        %26 = llvm.getelementptr inbounds %baseAddress[%25] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %27 = llvm.load %26 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
        %28 = arith.addi %27, %arg3 {spmd.executionKind = "All"} : i32
        %29 = llvm.getelementptr inbounds %baseAddress_2[%25] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
        %30 = llvm.load %29 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
        %31 = arith.addi %30, %arg4 {spmd.executionKind = "All"} : i32
        scf.yield {spmd.executionKind = "All"} %28, %31 : i32, i32
      } {spmd.executionKind = "All", spmd.isMultiValued = false}
      %error_7 = "spmd.barrier"(%2) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
      %21 = llvm.call @printf(%0, %rank, %20#0, %20#1) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
      %22 = "spmd.winFree"(%win) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
      %23 = "spmd.winFree"(%win_3) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
      %24 = "spmd.finalize"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
      llvm.intr.lifetime.end 8, %12 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.end 8, %11 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.end 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
      llvm.intr.lifetime.end 4, %9 {spmd.executionKind = "All"} : !llvm.ptr
    } else {
      %17 = llvm.call @printf(%1, %size, %c3_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    llvm.intr.lifetime.end 4, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %7 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %16 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

