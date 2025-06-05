#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32, encoding = DW_ATE_signed>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/SHMEM/SPMDIR/dynamic/006-shmem-dynamic-getnbi-loop-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#di_file1 = #llvm.di_file<"cq-results-20250731-154348/RRB/SHMEM/SPMDIR/dynamic/006-shmem-dynamic-getnbi-loop-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#di_subprogram = #llvm.di_subprogram<recId = distinct[0]<>, isRecSelf = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[1]<>, sourceLanguage = DW_LANG_C11, file = #di_file, producer = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", isOptimized = true, emissionKind = Full, nameTableKind = None>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type1, sizeInBits = 336, elements = #llvm.di_subrange<count = 42 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type1, sizeInBits = 632, elements = #llvm.di_subrange<count = 79 : i64>>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64>
#di_lexical_block = #llvm.di_lexical_block<scope = #di_subprogram, file = #di_file1, line = 35, column = 9>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "argc", file = #di_file1, line = 13, arg = 1, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "localbuf", file = #di_file1, line = 16, type = #di_basic_type>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "ctrl", file = #di_file1, line = 18, type = #di_basic_type>
#di_local_variable3 = #llvm.di_local_variable<scope = #di_subprogram, name = "num_pe", file = #di_file1, line = 25, type = #di_basic_type>
#di_local_variable4 = #llvm.di_local_variable<scope = #di_subprogram, name = "my_pe", file = #di_file1, line = 26, type = #di_basic_type>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_derived_type, sizeInBits = 64>
#di_global_variable = #llvm.di_global_variable<file = #di_file1, line = 29, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file1, line = 44, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#di_lexical_block1 = #llvm.di_lexical_block<scope = #di_lexical_block, file = #di_file1, line = 35, column = 21>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#di_lexical_block2 = #llvm.di_lexical_block<scope = #di_lexical_block1, file = #di_file1, line = 36, column = 9>
#di_local_variable5 = #llvm.di_local_variable<scope = #di_subprogram, name = "argv", file = #di_file1, line = 13, arg = 2, type = #di_derived_type1>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_basic_type, #di_basic_type, #di_derived_type1>
#di_local_variable6 = #llvm.di_local_variable<scope = #di_lexical_block2, name = "i", file = #di_file1, line = 36, type = #di_basic_type>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#di_subprogram1 = #llvm.di_subprogram<recId = distinct[0]<>, id = distinct[2]<>, compileUnit = #di_compile_unit, scope = #di_file1, name = "main", file = #di_file1, line = 13, scopeLine = 14, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type, retainedNodes = #di_local_variable, #di_local_variable5, #di_local_variable1, #di_local_variable2, #di_local_variable3, #di_local_variable4, #di_local_variable6>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#di_global_variable2 = #llvm.di_global_variable<scope = #di_subprogram1, name = "remote", file = #di_file1, line = 15, type = #di_basic_type, isLocalToUnit = true, isDefined = true>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p1 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#di_global_variable_expression2 = #llvm.di_global_variable_expression<var = #di_global_variable2, expr = <>>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global internal @main.remote(0 : i32) {addr_space = 0 : i32, alignment = 4 : i64, dbg_exprs = [#di_global_variable_expression2], dso_local, spmd.executionKind = "All"} : i32
  llvm.mlir.global private unnamed_addr constant @".str"("I have %d PEs. You should rerun with %d.\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %0 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.addressof @main.remote {spmd.executionKind = "All"} : !llvm.ptr
    %2 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c10_i32 = arith.constant {spmd.executionKind = "All"} 10 : i32
    %3 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    %c-1_i32 = arith.constant {spmd.executionKind = "All"} -1 : i32
    %c-42_i32 = arith.constant {spmd.executionKind = "All"} -42 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %4 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %5 = "spmd.commWorld"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %6 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.store %c1_i32, %6 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %7 = arith.cmpi sgt, %arg0, %c1_i32 {spmd.executionKind = "All"} : i32
    %8 = scf.if %7 -> (i32) {
      %12 = llvm.getelementptr inbounds %arg1[8] {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr, i8
      %13 = llvm.load %12 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr -> !llvm.ptr
      %14 = llvm.call tail @strtol(%13, %3, %c10_i32) {no_unwind, spmd.executionKind = "All", will_return} : (!llvm.ptr, !llvm.ptr, i32) -> i64
      %15 = arith.trunci %14 {spmd.executionKind = "All"} : i64 to i32
      scf.yield {spmd.executionKind = "All"} %15 : i32
    } else {
      scf.yield {spmd.executionKind = "All"} %c-1_i32 : i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %9 = "spmd.init"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %size, %error = "spmd.getSizeOfComm"(%5) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %rank, %error_0 = "spmd.getRankInComm"(%5) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %10 = arith.cmpi eq, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    %11 = arith.select %10, %c0_i32, %c-42_i32 {spmd.executionKind = "All"} : i32
    scf.if %10 {
      %12 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      %13 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
      scf.if %13 {
        scf.for %arg2 = %c0_i32 to %8 step %c1_i32  : i32 {
          %win, %error_1 = "spmd.winCreate"(%5, %1, %c0_i32) <{usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
          %error_2 = "spmd.get"(%6, %c1_i64, %4, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %4, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
          %19 = "spmd.flushAll"() <{isLocal = false, usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : () -> !spmd.error
        } {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", spmd.isMultiValued = false}
      } {spmd.executionKind = "All", spmd.isMultiValued = true}
      %14 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
      %15 = llvm.load %1 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %16 = llvm.load %6 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %17 = llvm.call @printf(%0, %rank, %15, %16) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
      %18 = "spmd.finalize"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
      llvm.intr.lifetime.end 4, %6 {spmd.executionKind = "All"} : !llvm.ptr
    } else {
      %12 = llvm.call tail @printf(%2, %rank, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %13 = "spmd.abort"(%5, %c1_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    llvm.return {spmd.executionKind = "All"} %11 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @strtol(!llvm.ptr {llvm.noundef, llvm.readonly}, !llvm.ptr {llvm.nocapture, llvm.noundef}, i32 {llvm.noundef}) -> i64 attributes {no_unwind, passthrough = ["mustprogress", "nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return}
}

