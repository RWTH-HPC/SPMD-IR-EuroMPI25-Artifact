; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@1 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@2 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@3 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@4 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@5 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@6 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@7 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@8 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@9 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@10 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@11 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@12 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@13 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1
@14 = private unnamed_addr constant [107 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %6, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 -1, ptr %6, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %7, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, ptr %7, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata ptr %8, metadata !67, metadata !DIExpression()), !dbg !68
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata ptr %9, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 0, ptr %9, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata ptr %10, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 0, ptr %10, align 4, !dbg !72
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !73
  %17 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !74
  %18 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !75
  %19 = load i32, ptr %6, align 4, !dbg !76
  %20 = icmp slt i32 %19, 2, !dbg !78
  br i1 %20, label %21, label %23, !dbg !79

21:                                               ; preds = %2
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !80
  br label %23, !dbg !80

23:                                               ; preds = %21, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !81, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata ptr %12, metadata !86, metadata !DIExpression()), !dbg !87
  %24 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !88
  store ptr %24, ptr %12, align 8, !dbg !87
  %25 = load ptr, ptr %12, align 8, !dbg !89
  %26 = call i32 @parcoach_rma_MPI_Win_create(ptr %25, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %11, i32 40, ptr @0), !dbg !90
  %27 = load i32, ptr %7, align 4, !dbg !91
  %28 = icmp eq i32 %27, 0, !dbg !93
  br i1 %28, label %29, label %46, !dbg !94

29:                                               ; preds = %23
  %30 = load ptr, ptr %11, align 8, !dbg !95
  %31 = call i32 @parcoach_rma_MPI_Win_lock(i32 1, i32 1, i32 0, ptr %30, i32 43, ptr @1), !dbg !97
  call void @llvm.dbg.declare(metadata ptr %13, metadata !98, metadata !DIExpression()), !dbg !99
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !100
  call void @parcoach_rma_store(ptr %13, i64 64, i32 45, ptr @2), !dbg !99
  store ptr %32, ptr %13, align 8, !dbg !99
  call void @parcoach_rma_load(ptr %13, i64 64, i32 47, ptr @3), !dbg !101
  %33 = load ptr, ptr %13, align 8, !dbg !101
  call void @parcoach_rma_load(ptr %11, i64 64, i32 47, ptr @4), !dbg !102
  %34 = load ptr, ptr %11, align 8, !dbg !102
  %35 = call i32 @MPI_Rget(ptr noundef %33, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %34, ptr noundef %8), !dbg !103
  call void @llvm.dbg.declare(metadata ptr %14, metadata !104, metadata !DIExpression()), !dbg !105
  %36 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !106
  call void @parcoach_rma_store(ptr %14, i64 64, i32 50, ptr @5), !dbg !105
  store ptr %36, ptr %14, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata ptr %15, metadata !107, metadata !DIExpression()), !dbg !108
  %37 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !109
  call void @parcoach_rma_store(ptr %15, i64 64, i32 52, ptr @6), !dbg !108
  store ptr %37, ptr %15, align 8, !dbg !108
  call void @parcoach_rma_load(ptr %13, i64 64, i32 54, ptr @7), !dbg !110
  %38 = load ptr, ptr %13, align 8, !dbg !110
  call void @parcoach_rma_load(ptr %15, i64 64, i32 54, ptr @8), !dbg !111
  %39 = load ptr, ptr %15, align 8, !dbg !111
  call void @parcoach_rma_load(ptr %14, i64 64, i32 54, ptr @9), !dbg !112
  %40 = load ptr, ptr %14, align 8, !dbg !112
  call void @parcoach_rma_load(ptr %11, i64 64, i32 55, ptr @10), !dbg !113
  %41 = load ptr, ptr %11, align 8, !dbg !113
  %42 = call i32 @MPI_Compare_and_swap(ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 10, ptr noundef %41), !dbg !114
  call void @parcoach_rma_load(ptr %11, i64 64, i32 56, ptr @11), !dbg !115
  %43 = load ptr, ptr %11, align 8, !dbg !115
  %44 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, ptr %43, i32 56, ptr @12), !dbg !116
  %45 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !117
  br label %46, !dbg !118

46:                                               ; preds = %29, %23
  %47 = call i32 @parcoach_rma_MPI_Win_free(ptr %11, i32 59, ptr @13), !dbg !119
  %48 = call i32 @MPI_Finalize(), !dbg !120
  call void @parcoach_rma_load(ptr %7, i64 32, i32 62, ptr @14), !dbg !121
  %49 = load i32, ptr %7, align 4, !dbg !121
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %49), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Win_create(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Rget(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!44, !45, !46, !47, !48, !49, !50, !51}
!llvm.ident = !{!52}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9291b0f8cc315f20de1ea70563c77f43")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 62, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !43, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockunlock-rget_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9291b0f8cc315f20de1ea70563c77f43")
!14 = !{!15, !19, !20, !23, !25, !28, !31}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !34)
!34 = !{!35, !36, !37, !38, !39}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !33, file: !16, line: 441, baseType: !24, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !33, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !33, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !33, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !33, file: !16, line: 449, baseType: !40, size: 64, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !{!0, !7}
!44 = !{i32 7, !"Dwarf Version", i32 5}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"openmp", i32 50}
!48 = !{i32 7, !"PIC Level", i32 2}
!49 = !{i32 7, !"PIE Level", i32 2}
!50 = !{i32 7, !"uwtable", i32 2}
!51 = !{i32 7, !"frame-pointer", i32 2}
!52 = !{!"Debian clang version 15.0.6"}
!53 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !54, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !58)
!54 = !DISubroutineType(types: !55)
!55 = !{!24, !24, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !{}
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !2, line: 22, type: !24)
!60 = !DILocation(line: 22, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !2, line: 22, type: !56)
!62 = !DILocation(line: 22, column: 27, scope: !53)
!63 = !DILocalVariable(name: "nprocs", scope: !53, file: !2, line: 23, type: !24)
!64 = !DILocation(line: 23, column: 7, scope: !53)
!65 = !DILocalVariable(name: "rank", scope: !53, file: !2, line: 24, type: !24)
!66 = !DILocation(line: 24, column: 7, scope: !53)
!67 = !DILocalVariable(name: "mpi_request_0", scope: !53, file: !2, line: 25, type: !15)
!68 = !DILocation(line: 25, column: 15, scope: !53)
!69 = !DILocalVariable(name: "int_0", scope: !53, file: !2, line: 26, type: !24)
!70 = !DILocation(line: 26, column: 7, scope: !53)
!71 = !DILocalVariable(name: "int_1", scope: !53, file: !2, line: 27, type: !24)
!72 = !DILocation(line: 27, column: 7, scope: !53)
!73 = !DILocation(line: 29, column: 3, scope: !53)
!74 = !DILocation(line: 30, column: 3, scope: !53)
!75 = !DILocation(line: 31, column: 3, scope: !53)
!76 = !DILocation(line: 32, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !53, file: !2, line: 32, column: 7)
!78 = !DILocation(line: 32, column: 14, scope: !77)
!79 = !DILocation(line: 32, column: 7, scope: !53)
!80 = !DILocation(line: 33, column: 5, scope: !77)
!81 = !DILocalVariable(name: "mpi_win_0", scope: !53, file: !2, line: 36, type: !82)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!85 = !DILocation(line: 36, column: 11, scope: !53)
!86 = !DILocalVariable(name: "winbuf", scope: !53, file: !2, line: 38, type: !23)
!87 = !DILocation(line: 38, column: 8, scope: !53)
!88 = !DILocation(line: 38, column: 24, scope: !53)
!89 = !DILocation(line: 40, column: 18, scope: !53)
!90 = !DILocation(line: 40, column: 3, scope: !53)
!91 = !DILocation(line: 42, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !53, file: !2, line: 42, column: 7)
!93 = !DILocation(line: 42, column: 12, scope: !92)
!94 = !DILocation(line: 42, column: 7, scope: !53)
!95 = !DILocation(line: 43, column: 44, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 42, column: 18)
!97 = !DILocation(line: 43, column: 5, scope: !96)
!98 = !DILocalVariable(name: "buf", scope: !96, file: !2, line: 45, type: !23)
!99 = !DILocation(line: 45, column: 10, scope: !96)
!100 = !DILocation(line: 45, column: 23, scope: !96)
!101 = !DILocation(line: 47, column: 33, scope: !96)
!102 = !DILocation(line: 47, column: 70, scope: !96)
!103 = !DILocation(line: 47, column: 24, scope: !96)
!104 = !DILocalVariable(name: "int_0", scope: !96, file: !2, line: 50, type: !23)
!105 = !DILocation(line: 50, column: 10, scope: !96)
!106 = !DILocation(line: 50, column: 25, scope: !96)
!107 = !DILocalVariable(name: "int_1", scope: !96, file: !2, line: 52, type: !23)
!108 = !DILocation(line: 52, column: 10, scope: !96)
!109 = !DILocation(line: 52, column: 25, scope: !96)
!110 = !DILocation(line: 54, column: 45, scope: !96)
!111 = !DILocation(line: 54, column: 50, scope: !96)
!112 = !DILocation(line: 54, column: 57, scope: !96)
!113 = !DILocation(line: 55, column: 45, scope: !96)
!114 = !DILocation(line: 54, column: 24, scope: !96)
!115 = !DILocation(line: 56, column: 23, scope: !96)
!116 = !DILocation(line: 56, column: 5, scope: !96)
!117 = !DILocation(line: 57, column: 5, scope: !96)
!118 = !DILocation(line: 58, column: 3, scope: !96)
!119 = !DILocation(line: 59, column: 3, scope: !53)
!120 = !DILocation(line: 61, column: 3, scope: !53)
!121 = !DILocation(line: 62, column: 41, scope: !53)
!122 = !DILocation(line: 62, column: 3, scope: !53)
!123 = !DILocation(line: 63, column: 3, scope: !53)
