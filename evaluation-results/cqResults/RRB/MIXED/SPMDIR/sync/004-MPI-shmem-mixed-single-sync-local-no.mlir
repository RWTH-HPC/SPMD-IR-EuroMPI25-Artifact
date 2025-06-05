#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "int", sizeInBits = 32, encoding = DW_ATE_signed>
#di_basic_type1 = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MIXED/SPMDIR/sync/004-MPI-shmem-mixed-single-sync-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#di_file1 = #llvm.di_file<"cq-results-20250731-154348/RRB/MIXED/SPMDIR/sync/004-MPI-shmem-mixed-single-sync-local-no.c" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#di_subprogram = #llvm.di_subprogram<recId = distinct[0]<>, isRecSelf = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[1]<>, sourceLanguage = DW_LANG_C11, file = #di_file, producer = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", isOptimized = true, emissionKind = Full, nameTableKind = None>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type1, sizeInBits = 504, elements = #llvm.di_subrange<count = 63 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_basic_type1, sizeInBits = 568, elements = #llvm.di_subrange<count = 71 : i64>>
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type1, sizeInBits = 64>
#di_derived_type1 = #llvm.di_derived_type<tag = DW_TAG_typedef, name = "MPI_Win", baseType = #di_basic_type>
#di_derived_type2 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_basic_type, sizeInBits = 64>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "argc", file = #di_file1, line = 12, arg = 1, type = #di_basic_type>
#di_local_variable1 = #llvm.di_local_variable<scope = #di_subprogram, name = "mpi_size", file = #di_file1, line = 15, type = #di_basic_type>
#di_local_variable2 = #llvm.di_local_variable<scope = #di_subprogram, name = "shmem_pe", file = #di_file1, line = 15, type = #di_basic_type>
#di_local_variable3 = #llvm.di_local_variable<scope = #di_subprogram, name = "shmem_size", file = #di_file1, line = 15, type = #di_basic_type>
#di_local_variable4 = #llvm.di_local_variable<scope = #di_subprogram, name = "shmem_target_pe", file = #di_file1, line = 17, type = #di_basic_type>
#di_derived_type3 = #llvm.di_derived_type<tag = DW_TAG_pointer_type, baseType = #di_derived_type, sizeInBits = 64>
#di_global_variable = #llvm.di_global_variable<file = #di_file1, line = 31, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file1, line = 61, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#di_local_variable5 = #llvm.di_local_variable<scope = #di_subprogram, name = "win", file = #di_file1, line = 18, type = #di_derived_type1>
#di_local_variable6 = #llvm.di_local_variable<scope = #di_subprogram, name = "remote1", file = #di_file1, line = 35, type = #di_derived_type2>
#di_local_variable7 = #llvm.di_local_variable<scope = #di_subprogram, name = "remote2", file = #di_file1, line = 36, type = #di_derived_type2>
#di_local_variable8 = #llvm.di_local_variable<scope = #di_subprogram, name = "localbuf", file = #di_file1, line = 37, type = #di_derived_type2>
#di_local_variable9 = #llvm.di_local_variable<scope = #di_subprogram, name = "mpi_ranks", file = #di_file1, line = 42, type = #di_derived_type2>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#di_local_variable10 = #llvm.di_local_variable<scope = #di_subprogram, name = "argv", file = #di_file1, line = 12, arg = 2, type = #di_derived_type3>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_basic_type, #di_basic_type, #di_derived_type3>
#di_subprogram1 = #llvm.di_subprogram<recId = distinct[0]<>, id = distinct[2]<>, compileUnit = #di_compile_unit, scope = #di_file1, name = "main", file = #di_file1, line = 12, scopeLine = 13, subprogramFlags = "Definition|Optimized", type = #di_subroutine_type, retainedNodes = #di_local_variable, #di_local_variable10, #di_local_variable1, #di_local_variable2, #di_local_variable3, #di_local_variable4, #di_local_variable5, #di_local_variable6, #di_local_variable7, #di_local_variable8, #di_local_variable9>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "any pointer", members = {<#tbaa_type_desc, 0>}>
#di_global_variable2 = #llvm.di_global_variable<scope = #di_subprogram1, name = "mpi_rank", file = #di_file1, line = 14, type = #di_basic_type, isLocalToUnit = true, isDefined = true>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#di_global_variable_expression2 = #llvm.di_global_variable_expression<var = #di_global_variable2, expr = <>>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "p2 omnipotent char", members = {<#tbaa_type_desc2, 0>}>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc3, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global internal @main.mpi_rank(0 : i32) {addr_space = 0 : i32, alignment = 4 : i64, dbg_exprs = [#di_global_variable_expression2], dso_local, spmd.executionKind = "All"} : i32
  llvm.mlir.global private unnamed_addr constant @".str"("I have %d PEs and %d ranks. You should rerun with %d of both.\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global external local_unnamed_addr @SHMEM_TEAM_WORLD() {addr_space = 0 : i32, alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr
  llvm.mlir.global private unnamed_addr constant @".str.1"("MPI Rank: %d, SHMEM PE %d: localbuf = %d, remote1 = %d, remote2 = %d \0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.noundef}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = [["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.undef {spmd.executionKind = "All"} : i32
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %c4_i32 = arith.constant {spmd.executionKind = "All"} 4 : i32
    %c4_i64 = arith.constant {spmd.executionKind = "All"} 4 : i64
    %2 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %3 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %4 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %5 = "spmd.commWorld"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %6 = "spmd.commWorld"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %7 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %8 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %9 = llvm.alloca %c1_i32 x !llvm.ptr {alignment = 8 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %10 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %11 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.store %arg0, %8 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %arg1, %9 {alignment = 8 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag1]} : !llvm.ptr, !llvm.ptr
    llvm.intr.lifetime.start 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %11 {spmd.executionKind = "All"} : !llvm.ptr
    %12 = "spmd.init"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%6) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_0 = "spmd.getSizeOfComm"(%6) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %13 = "spmd.init"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %size_1, %error_2 = "spmd.getSizeOfComm"(%5) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %rank_3, %error_4 = "spmd.getRankInComm"(%5) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %14 = arith.cmpi ne, %size_1, %c2_i32 {spmd.executionKind = "All"} : i32
    %15 = arith.cmpi ne, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    %16 = arith.ori %14, %15 {spmd.executionKind = "All"} : i1
    scf.if %16 {
      %34 = llvm.call @printf(%2, %size_1, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %address, %error_5 = "spmd.malloc"(%5, %c4_i64) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_6, %error_7 = "spmd.malloc"(%5, %c4_i64) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_8, %error_9 = "spmd.malloc"(%5, %c4_i64) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %win, %error_10 = "spmd.winCreate"(%6, %address, %c4_i64, %c4_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr, i64, i32) -> (!spmd.win, !spmd.error)
    %17 = arith.extsi %size {spmd.executionKind = "All"} : i32 to i64
    %18 = llvm.call @shmem_calloc(%17, %c4_i64) {no_unwind, spmd.executionKind = "All"} : (i64, i64) -> !llvm.ptr
    %19 = builtin.unrealized_conversion_cast %rank : i32 to !llvm.ptr {spmd.executionKind = "All"}
    %error_11 = "spmd.allgather"(%5, %19, %c1_i64, %4, %18, %c1_i64, %4) <{isBlocking = true, usedModel = 1 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr, i64, !spmd.datatype, !llvm.ptr, i64, !spmd.datatype) -> !spmd.error
    %20 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %21 = "spmd.fence"(%win, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %22 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %22 {
      %34 = llvm.getelementptr inbounds %18[4] {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr) -> !llvm.ptr, i8
      %35 = llvm.load %34 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      %error_12 = "spmd.get"(%address_8, %c1_i64, %7, %c1_i64, %35, %win, %c0_i64, %c1_i64, %7, %c1_i64) <{isAtomic = true, isBlocking = false, usedModel = 0 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %23 = "spmd.fence"(%win, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %24 = arith.cmpi eq, %rank, %c0_i32 {spmd.executionKind = "All"} : i32
    scf.if %24 {
      %win_12, %error_13 = "spmd.winCreate"(%5, %address_6, %c0_i32) <{usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_14 = "spmd.get"(%address_8, %c1_i64, %3, %c1_i64, %1, %win_12, %c0_i64, %c1_i64, %3, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 1 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %25 = "spmd.fence"(%c0_i32) <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %26 = "spmd.fence"(%win, %c0_i32) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win, i32) -> !spmd.error
    %27 = llvm.load %address_8 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.load %address {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.load %address_6 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.call @printf(%0, %rank, %rank_3, %27, %28, %29) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32, i32, i32) -> i32
    %31 = "spmd.winFree"(%win) <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : (!spmd.win) -> !spmd.error
    %32 = "spmd.finalize"() <{usedModel = 1 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %33 = "spmd.finalize"() <{usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.intr.lifetime.end 4, %11 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %10 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @shmem_calloc(i64 {llvm.noundef}, i64 {llvm.noundef}) -> !llvm.ptr attributes {passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
}

