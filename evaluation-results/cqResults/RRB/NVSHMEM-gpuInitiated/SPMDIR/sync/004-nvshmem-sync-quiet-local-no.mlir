#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "char", sizeInBits = 8, encoding = DW_ATE_signed_char>
#di_file = #llvm.di_file<"cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu" in "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite">
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#di_derived_type = #llvm.di_derived_type<tag = DW_TAG_const_type, baseType = #di_basic_type>
#di_composite_type = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 200, elements = #llvm.di_subrange<count = 25 : i64>>
#di_composite_type1 = #llvm.di_composite_type<tag = DW_TAG_array_type, baseType = #di_derived_type, sizeInBits = 632, elements = #llvm.di_subrange<count = 79 : i64>>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#di_global_variable = #llvm.di_global_variable<file = #di_file, line = 47, type = #di_composite_type, isLocalToUnit = true, isDefined = true>
#di_global_variable1 = #llvm.di_global_variable<file = #di_file, line = 73, type = #di_composite_type1, isLocalToUnit = true, isDefined = true>
#di_global_variable_expression = #llvm.di_global_variable_expression<var = #di_global_variable, expr = <>>
#di_global_variable_expression1 = #llvm.di_global_variable_expression<var = #di_global_variable1, expr = <>>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.ident = "clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)", llvm.target_triple = "x86_64-unknown-linux-gnu", spmd.executionKind = "All"} {
  llvm.mlir.global private unnamed_addr constant @".str"("Got %d PEs, expected %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @".str.1"("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\0A\00") {addr_space = 0 : i32, alignment = 1 : i64, dbg_exprs = [#di_global_variable_expression1], dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private unnamed_addr constant @mlir.llvm.nameless_global_0("_Z14nvshmem_kernelPiS_\00") {addr_space = 0 : i32, alignment = 1 : i64, dso_local, spmd.executionKind = "All"}
  llvm.mlir.global private constant @mlir.llvm.nameless_global_1("#di_file = #llvm.di_file<\22/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22 in \22/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite\22>\0A#di_file1 = #llvm.di_file<\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22 in \22/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite\22>\0A#di_subroutine_type = #llvm.di_subroutine_type<>\0A#loc1 = loc(\22nvshmem_kernel\22)\0A#loc2 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:14:0)\0A#loc13 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:0:0)\0A#tbaa_root = #llvm.tbaa_root<id = \22Simple C++ TBAA\22>\0A#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C_plus_plus_14, file = #di_file, producer = \22clang version 20.0.0git (https://github.com/burakSemih/llvm-project.git a5b8f53f3db10b0ff5451335362b36a25139a3f8)\22, isOptimized = true, emissionKind = DebugDirectivesOnly, nameTableKind = None>\0A#di_subprogram = #llvm.di_subprogram<id = distinct[1]<>, compileUnit = #di_compile_unit, scope = #di_file1, name = \22nvshmem_kernel\22, file = #di_file1, line = 14, scopeLine = 14, subprogramFlags = \22Definition|Optimized\22, type = #di_subroutine_type>\0A#tbaa_type_desc = #llvm.tbaa_type_desc<id = \22omnipotent char\22, members = {<#tbaa_root, 0>}>\0A#loc17 = loc(fused<#di_subprogram>[#loc1, #loc2])\0A#loc27 = loc(fused<#di_subprogram>[#loc13])\0A#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = \22int\22, members = {<#tbaa_type_desc, 0>}>\0A#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>\0Amodule attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, \22dlti.endianness\22 = \22little\22>, llvm.data_layout = \22e-i64:64-i128:128-v16:16-v32:32-n16:32:64\22, llvm.target_triple = \22nvptx64-nvidia-cuda\22} {\0A  llvm.func local_unnamed_addr ptx_kernelcc @_Z14nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.noundef} loc(fused<#di_subprogram>[#loc1, #loc2]), %arg1: !llvm.ptr {llvm.noundef} loc(fused<#di_subprogram>[#loc1, #loc2])) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [\22mustprogress\22, \22norecurse\22, [\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22], [\22uniform-work-group-size\22, \22true\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx78\22, \22+sm_89\22]>} {\0A    %c0_i32 = arith.constant 0 : i32 loc(#loc3)\0A    %c1_i32 = arith.constant 1 : i32 loc(#loc3)\0A    %c1_i64 = arith.constant 1 : i64 loc(#loc3)\0A    llvm.store %c0_i32, %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr loc(#loc18)\0A    llvm.store %c1_i32, %arg1 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr loc(#loc19)\0A    %0 = llvm.call tail @nvshmem_my_pe() {convergent, no_unwind} : () -> i32 loc(#loc20)\0A    llvm.call tail @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc21)\0A    %1 = arith.cmpi eq, %0, %c0_i32 : i32 loc(#loc22)\0A    cf.cond_br %1, ^bb1, ^bb2(%c0_i32 : i32) loc(#loc22)\0A  ^bb1:  // pred: ^bb0\0A    llvm.call tail @nvshmem_int_get_nbi(%arg1, %arg0, %c1_i64, %c1_i32) {convergent, no_unwind} : (!llvm.ptr, !llvm.ptr, i64, i32) -> () loc(#loc23)\0A    llvm.call tail @nvshmem_quiet() {convergent, no_unwind} : () -> () loc(#loc24)\0A    %2 = llvm.load %arg1 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32 loc(#loc25)\0A    cf.br ^bb2(%2 : i32) loc(#loc26)\0A  ^bb2(%3: i32 loc(fused<#di_subprogram>[#loc13])):  // 2 preds: ^bb0, ^bb1\0A    llvm.call tail @nvshmem_barrier_all() {convergent, no_unwind} : () -> () loc(#loc28)\0A    %4 = llvm.load %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32 loc(#loc29)\0A    %5 = arith.addi %4, %3 : i32 loc(#loc29)\0A    llvm.store %5, %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr loc(#loc29)\0A    llvm.return loc(#loc30)\0A  } loc(#loc17)\0A  llvm.func local_unnamed_addr @nvshmem_my_pe() -> i32 attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx78\22, \22+sm_89\22]>} loc(#loc3)\0A  llvm.func local_unnamed_addr @nvshmem_barrier_all() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx78\22, \22+sm_89\22]>} loc(#loc3)\0A  llvm.func local_unnamed_addr @nvshmem_int_get_nbi(!llvm.ptr {llvm.noundef}, !llvm.ptr {llvm.noundef}, i64 {llvm.noundef}, i32 {llvm.noundef}) attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx78\22, \22+sm_89\22]>} loc(#loc3)\0A  llvm.func local_unnamed_addr @nvshmem_quiet() attributes {convergent, frame_pointer = #llvm.framePointerKind<all>, no_unwind, passthrough = [[\22no-trapping-math\22, \22true\22], [\22stack-protector-buffer-size\22, \228\22], [\22target-cpu\22, \22sm_89\22]], target_cpu = \22sm_89\22, target_features = #llvm.target_features<[\22+ptx78\22, \22+sm_89\22]>} loc(#loc3)\0A} loc(#loc)\0A#loc = loc(\22/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:0:0)\0A#loc3 = loc(unknown)\0A#loc4 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:16:13)\0A#loc5 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:17:15)\0A#loc6 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:20:17)\0A#loc7 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:23:5)\0A#loc8 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:25:15)\0A#loc9 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:26:9)\0A#loc10 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:27:9)\0A#loc11 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:28:13)\0A#loc12 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:29:5)\0A#loc14 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:30:5)\0A#loc15 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:31:13)\0A#loc16 = loc(\22cq-results-20250731-154348/RRB/NVSHMEM-gpuInitiated/SPMDIR/sync/004-nvshmem-sync-quiet-local-no.cu\22:32:1)\0A#loc18 = loc(fused<#di_subprogram>[#loc4])\0A#loc19 = loc(fused<#di_subprogram>[#loc5])\0A#loc20 = loc(fused<#di_subprogram>[#loc6])\0A#loc21 = loc(fused<#di_subprogram>[#loc7])\0A#loc22 = loc(fused<#di_subprogram>[#loc8])\0A#loc23 = loc(fused<#di_subprogram>[#loc9])\0A#loc24 = loc(fused<#di_subprogram>[#loc10])\0A#loc25 = loc(fused<#di_subprogram>[#loc11])\0A#loc26 = loc(fused<#di_subprogram>[#loc12])\0A#loc28 = loc(fused<#di_subprogram>[#loc14])\0A#loc29 = loc(fused<#di_subprogram>[#loc15])\0A#loc30 = loc(fused<#di_subprogram>[#loc16])\0A\00") {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nv_fatbin", spmd.executionKind = "All"}
  llvm.mlir.global internal constant @__cuda_fatbin_wrapper() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, section = ".nvFatBinSegment", spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> {
    %0 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_1 {spmd.executionKind = "All"} : !llvm.ptr
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c1180844977_i32 = arith.constant {spmd.executionKind = "All"} 1180844977 : i32
    %2 = llvm.mlir.undef {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)>
    %3 = llvm.insertvalue %c1180844977_i32, %2[0] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %4 = llvm.insertvalue %c1_i32, %3[1] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %5 = llvm.insertvalue %1, %4[2] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    %6 = llvm.insertvalue %0, %5[3] {spmd.executionKind = "All"} : !llvm.struct<(i32, i32, ptr, ptr)> 
    llvm.return {spmd.executionKind = "All"} %6 : !llvm.struct<(i32, i32, ptr, ptr)>
  }
  llvm.mlir.global internal unnamed_addr @__cuda_gpubin_handle() {addr_space = 0 : i32, alignment = 8 : i64, dso_local, spmd.executionKind = "All"} : !llvm.ptr {
    %0 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %0 : !llvm.ptr
  }
  llvm.func @_Z29__device_stub__nvshmem_kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.readnone}, %arg1: !llvm.ptr {llvm.nocapture, llvm.readnone}) attributes {always_inline, memory_effects = #llvm.memory_effects<other = none, argMem = none, inaccessibleMem = none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["uniform-work-group-size", "true"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", will_return} {
    llvm.return {spmd.executionKind = "All"}
  }
  llvm.func local_unnamed_addr @main(%arg0: i32 {llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readnone}) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %c0_i64 = arith.constant {spmd.executionKind = "All"} 0 : i64
    %0 = llvm.mlir.addressof @__cuda_module_dtor {spmd.executionKind = "All"} : !llvm.ptr
    %c-1_i32 = arith.constant {spmd.executionKind = "All"} -1 : i32
    %1 = llvm.mlir.addressof @mlir.llvm.nameless_global_0 {spmd.executionKind = "All"} : !llvm.ptr
    %2 = llvm.mlir.addressof @_Z29__device_stub__nvshmem_kernelPiS_ {spmd.executionKind = "All"} : !llvm.ptr
    %3 = llvm.mlir.addressof @__cuda_gpubin_handle {spmd.executionKind = "All"} : !llvm.ptr
    %4 = llvm.mlir.addressof @__cuda_fatbin_wrapper {spmd.executionKind = "All"} : !llvm.ptr
    %c1_i64 = arith.constant {spmd.executionKind = "All"} 1 : i64
    %c1_i32 = arith.constant {spmd.executionKind = "All"} 1 : i32
    %c2_i32 = arith.constant {spmd.executionKind = "All"} 2 : i32
    %5 = llvm.mlir.addressof @".str" {spmd.executionKind = "All"} : !llvm.ptr
    %c4_i64 = arith.constant {spmd.executionKind = "All"} 4 : i64
    %6 = llvm.mlir.zero {spmd.executionKind = "All"} : !llvm.ptr
    %7 = llvm.mlir.addressof @".str.1" {spmd.executionKind = "All"} : !llvm.ptr
    %c0_i32 = arith.constant {spmd.executionKind = "All"} 0 : i32
    %8 = "spmd.constDatatype"() <{typeAttr = i32, usedModel = 0 : i32}> {spmd.executionKind = "All"} : () -> !spmd.datatype
    %9 = "spmd.commWorld"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %10 = "spmd.commNode"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.comm
    %11 = llvm.call tail @__cudaRegisterFatBinary(%4) {spmd.executionKind = "All"} : (!llvm.ptr) -> !llvm.ptr
    llvm.store %11, %3 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr, !llvm.ptr
    %12 = llvm.call tail @__cudaRegisterFunction(%11, %2, %1, %1, %c-1_i32, %6, %6, %6, %6, %6) {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    llvm.call tail @__cudaRegisterFatBinaryEnd(%11) {spmd.executionKind = "All"} : (!llvm.ptr) -> ()
    %13 = llvm.call tail @atexit(%0) {spmd.executionKind = "All"} : (!llvm.ptr) -> i32
    %14 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    %15 = llvm.alloca %c1_i32 x i32 {alignment = 4 : i64, spmd.executionKind = "All"} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start 4, %14 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.start 4, %15 {spmd.executionKind = "All"} : !llvm.ptr
    %16 = "spmd.init"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    %rank, %error = "spmd.getRankInComm"(%10) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %17 = llvm.call tail @cudaSetDevice(%rank) {no_unwind, spmd.executionKind = "All"} : (i32) -> i32
    %rank_0, %error_1 = "spmd.getRankInComm"(%9) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %size, %error_2 = "spmd.getSizeOfComm"(%9) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %18 = arith.cmpi eq, %size, %c2_i32 {spmd.executionKind = "All"} : i32
    scf.if %18 {
    } else {
      %34 = llvm.call tail @printf(%5, %size, %c2_i32) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32) -> i32
      %35 = "spmd.abort"(%9, %c1_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i32) -> !spmd.error
    } {spmd.executionKind = "All", spmd.isMultiValued = false}
    %address, %error_3 = "spmd.malloc"(%9, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    %address_4, %error_5 = "spmd.malloc"(%9, %c4_i64) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, i64) -> (!llvm.ptr, !spmd.error)
    llvm.store %c0_i32, %address {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.store %c1_i32, %address_4 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %rank_6, %error_7 = "spmd.getRankInComm"(%9) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm) -> (i32, !spmd.error)
    %19 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %20 = arith.cmpi eq, %rank_6, %c0_i32 {spmd.executionKind = "All"} : i32
    %21 = scf.if %20 -> (i32) {
      %win, %error_8 = "spmd.winCreate"(%9, %address, %c0_i32) <{usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!spmd.comm, !llvm.ptr, i32) -> (!spmd.win, !spmd.error)
      %error_9 = "spmd.get"(%address_4, %c1_i64, %8, %c1_i64, %c1_i32, %win, %c0_i64, %c1_i64, %8, %c1_i64) <{isAtomic = false, isBlocking = true, usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : (!llvm.ptr, i64, !spmd.datatype, i64, i32, !spmd.win, i64, i64, !spmd.datatype, i64) -> !spmd.error
      %34 = "spmd.flushAll"() <{isLocal = false, usedModel = 2 : i32}> {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} : () -> !spmd.error
      %35 = llvm.load %address_4 {alignment = 4 : i64, spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
      scf.yield {spmd.executedBy = array<i32: 0>, spmd.executionKind = "Static"} %35 : i32
    } else {
      scf.yield {spmd.executedNotBy = array<i32: 0>, spmd.executionKind = "AllBut"} %c0_i32 : i32
    } {spmd.executionKind = "All", spmd.isMultiValued = true}
    %22 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %23 = llvm.load %address {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = arith.addi %23, %21 {spmd.executionKind = "All"} : i32
    llvm.store %24, %address {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = "spmd.memcpy"(%14, %address, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %26 = "spmd.memcpy"(%15, %address_4, %c4_i64, %c2_i32) <{usedModel = 4 : i32}> {spmd.executionKind = "All"} : (!llvm.ptr, !llvm.ptr, i64, i32) -> !spmd.error
    %27 = "spmd.fence"(%c0_i32) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (i32) -> !spmd.error
    %28 = llvm.load %14 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.load %15 {alignment = 4 : i64, spmd.executionKind = "All", tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.call @printf(%7, %rank_0, %28, %29) vararg(!llvm.func<i32 (ptr, ...)>) {no_unwind, spmd.executionKind = "All"} : (!llvm.ptr, i32, i32, i32) -> i32
    %31 = "spmd.free"(%9, %address) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %32 = "spmd.free"(%9, %address_4) <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : (!spmd.comm, !llvm.ptr) -> !spmd.error
    %33 = "spmd.finalize"() <{usedModel = 2 : i32}> {spmd.executionKind = "All"} : () -> !spmd.error
    llvm.intr.lifetime.end 4, %15 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.intr.lifetime.end 4, %14 {spmd.executionKind = "All"} : !llvm.ptr
    llvm.return {spmd.executionKind = "All"} %c0_i32 : i32
  }
  llvm.func local_unnamed_addr @cudaSetDevice(i32 {llvm.noundef}) -> i32 attributes {passthrough = [["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @printf(!llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, ...) -> (i32 {llvm.noundef}) attributes {no_unwind, passthrough = ["nofree", ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], spmd.executionKind = "All", target_cpu = "x86-64", target_features = #llvm.target_features<["+cmov", "+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"}
  llvm.func local_unnamed_addr @__cudaRegisterFunction(!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32 attributes {spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @__cudaRegisterFatBinary(!llvm.ptr) -> !llvm.ptr attributes {spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @__cudaRegisterFatBinaryEnd(!llvm.ptr) attributes {spmd.executionKind = "All"}
  llvm.func local_unnamed_addr @__cudaUnregisterFatBinary(!llvm.ptr) attributes {spmd.executionKind = "All"}
  llvm.func internal @__cuda_module_dtor() attributes {always_inline, dso_local, spmd.executionKind = "All"} {
    %0 = llvm.mlir.addressof @__cuda_gpubin_handle {spmd.executionKind = "All"} : !llvm.ptr
    %1 = llvm.load %0 {alignment = 8 : i64, spmd.executionKind = "All"} : !llvm.ptr -> !llvm.ptr
    llvm.call tail @__cudaUnregisterFatBinary(%1) {spmd.executionKind = "All"} : (!llvm.ptr) -> ()
    llvm.return {spmd.executionKind = "All"}
  }
  llvm.func local_unnamed_addr @atexit(!llvm.ptr) -> i32 attributes {passthrough = ["nofree"], spmd.executionKind = "All"}
}

