#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250604-173113/RRB/MPIRMA/SPMDIR/static/021-MPI-static-win-in-array-local-yes.c" in "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type, sizeInBits = 392, elements = #llvm.di_subrange<count = 49 : i64>>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 50, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p2 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("Process %d finished. Sums: sum0 = %d, sum1 = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %0 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c50_i64 = arith.constant {spmd.executionKind = "All"} 50 : i64
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c100_i32 = arith.constant {spmd.executionKind = "All"} 100 : i32
    %c4_i32 = arith.constant {spmd.executionKind = "All"} 4 : i32
    %c400_i64 = arith.constant {spmd.executionKind = "All"} 400 : i64
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %1 = "spmd.commWorld"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %2 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %3 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %4 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %5 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %6 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %7 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %c1_i32 x !llvm.array<2 x i32> {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.store %arg0, %3 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %arg1, %4 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr, !llvm.ptr
    llvm.intr.lifetime.start 4, %5 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 8, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 8, %7 {spmd.executionKind = "All"} : !llvm.ptr
    %9 = "spmd.init"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%1) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    llvm.intr.lifetime.start 8, %8 {spmd.executionKind = "All"} : !llvm.ptr
    %baseAddress, %win, %error_0 = "spmd.winAlloc"(%1, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
    %baseAddress_1, %win_2, %error_3 = "spmd.winAlloc"(%1, %c400_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64, i32) -> (!llvm.ptr, !spmd.win, !spmd.error)
    scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32  : i32 {
      %18 = arith.addi %rank, %c1_i32 {spmd.executionKind = "All"} : i32
      %19 = arith.muli %18, %arg2 {spmd.executionKind = "All"} : i32
      %20 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
      %21 = llvm.getelementptr inbounds %baseAddress[%20] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %19, %21 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
      %22 = llvm.getelementptr inbounds %baseAddress_1[%20] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      llvm.store %c0_i32, %22 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %10 = "spmd.fence"(%win_2, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %11 = "spmd.fence"(%win_2, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %12 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %12 {
      %error_5 = "spmd.get"(%baseAddress_1, %c50_i64, %2, %c1_i64, %c1_i32, %win_2, %c0_i64, %c50_i64, %2, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %18 = "spmd.fence"(%win_2, %c0_i32) <{usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.win, i32) -> !spmd.error
      %error_6 = "spmd.get"(%baseAddress_1, %c50_i64, %2, %c1_i64, %c1_i32, %win_2, %c50_i64, %c50_i64, %2, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %13 = "spmd.fence"(%win_2, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %14 = "spmd.fence"(%win_2, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %error_4 = "spmd.barrier"(%1) <{isBlocking = true, usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> !spmd.error
    %15:2 = scf.for %arg2 = %c0_i32 to %c100_i32 step %c1_i32 iter_args(%arg3 = %c0_i32, %arg4 = %c0_i32) -> (i32, i32)  : i32 {
      %18 = arith.extui %arg2 {nonNeg, spmd.executionKind = "All"} : i32 to i64
      %19 = llvm.getelementptr inbounds %baseAddress[%18] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      %20 = llvm.load %19 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %21 = arith.addi %20, %arg3 {spmd.executionKind = "All"} : i32
      %22 = llvm.getelementptr inbounds %baseAddress_1[%18] {spmd.executionKind = "All"} : (!llvm.ptr, i64) -> !llvm.ptr, i32
      %23 = llvm.load %22 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %24 = arith.addi %23, %arg4 {spmd.executionKind = "All"} : i32
      scf.yield {spmd.executionKind = "All"} %21, %24 : i32, i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %16 = llvm.call @printf(%0, %rank, %15#0, %15#1) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %17 = "spmd.finalize"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.intr.lifetime.end 8, %8 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 8, %7 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 8, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %5 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

