; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_op_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@ompi_mpi_op_sum = external global %struct.ompi_predefined_op_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@1 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@2 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@3 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@4 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@5 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@6 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@7 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@8 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@9 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@10 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@11 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@12 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@13 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@14 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@15 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@16 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1
@17 = private unnamed_addr constant [113 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !41 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !47, metadata !DIExpression()), !dbg !48
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %6, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 -1, ptr %6, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 -1, ptr %7, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, ptr %8, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 0, ptr %9, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 0, ptr %10, align 4, !dbg !60
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !61
  %18 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !62
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !63
  %20 = load i32, ptr %6, align 4, !dbg !64
  %21 = icmp slt i32 %20, 2, !dbg !66
  br i1 %21, label %22, label %24, !dbg !67

22:                                               ; preds = %2
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !68
  br label %24, !dbg !68

24:                                               ; preds = %22, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata ptr %12, metadata !74, metadata !DIExpression()), !dbg !75
  %25 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !76
  store ptr %25, ptr %12, align 8, !dbg !75
  %26 = load ptr, ptr %12, align 8, !dbg !77
  %27 = call i32 @parcoach_rma_MPI_Win_create(ptr %26, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %11, i32 40, ptr @0), !dbg !78
  %28 = load ptr, ptr %11, align 8, !dbg !79
  %29 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, ptr %28, i32 42, ptr @1), !dbg !80
  call void @parcoach_rma_load(ptr %7, i64 32, i32 43, ptr @2), !dbg !81
  %30 = load i32, ptr %7, align 4, !dbg !81
  %31 = icmp eq i32 %30, 0, !dbg !83
  br i1 %31, label %32, label %46, !dbg !84

32:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %13, metadata !85, metadata !DIExpression()), !dbg !87
  %33 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !88
  call void @parcoach_rma_store(ptr %13, i64 64, i32 45, ptr @3), !dbg !87
  store ptr %33, ptr %13, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata ptr %14, metadata !89, metadata !DIExpression()), !dbg !90
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !91
  call void @parcoach_rma_store(ptr %14, i64 64, i32 47, ptr @4), !dbg !90
  store ptr %34, ptr %14, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata ptr %15, metadata !92, metadata !DIExpression()), !dbg !93
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !94
  call void @parcoach_rma_store(ptr %15, i64 64, i32 49, ptr @5), !dbg !93
  store ptr %35, ptr %15, align 8, !dbg !93
  call void @parcoach_rma_load(ptr %13, i64 64, i32 51, ptr @6), !dbg !95
  %36 = load ptr, ptr %13, align 8, !dbg !95
  call void @parcoach_rma_load(ptr %15, i64 64, i32 51, ptr @7), !dbg !96
  %37 = load ptr, ptr %15, align 8, !dbg !96
  call void @parcoach_rma_load(ptr %14, i64 64, i32 51, ptr @8), !dbg !97
  %38 = load ptr, ptr %14, align 8, !dbg !97
  call void @parcoach_rma_load(ptr %11, i64 64, i32 51, ptr @9), !dbg !98
  %39 = load ptr, ptr %11, align 8, !dbg !98
  %40 = call i32 @MPI_Compare_and_swap(ptr noundef %36, ptr noundef %37, ptr noundef %38, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, ptr noundef %39), !dbg !99
  call void @llvm.dbg.declare(metadata ptr %16, metadata !100, metadata !DIExpression()), !dbg !101
  %41 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !102
  call void @parcoach_rma_store(ptr %16, i64 64, i32 53, ptr @10), !dbg !101
  store ptr %41, ptr %16, align 8, !dbg !101
  call void @parcoach_rma_load(ptr %13, i64 64, i32 55, ptr @11), !dbg !103
  %42 = load ptr, ptr %13, align 8, !dbg !103
  call void @parcoach_rma_load(ptr %16, i64 64, i32 55, ptr @12), !dbg !104
  %43 = load ptr, ptr %16, align 8, !dbg !104
  call void @parcoach_rma_load(ptr %11, i64 64, i32 55, ptr @13), !dbg !105
  %44 = load ptr, ptr %11, align 8, !dbg !105
  %45 = call i32 @MPI_Fetch_and_op(ptr noundef %42, ptr noundef %43, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, ptr noundef @ompi_mpi_op_sum, ptr noundef %44), !dbg !106
  br label %46, !dbg !107

46:                                               ; preds = %32, %24
  call void @parcoach_rma_load(ptr %11, i64 64, i32 57, ptr @14), !dbg !108
  %47 = load ptr, ptr %11, align 8, !dbg !108
  %48 = call i32 @parcoach_rma_MPI_Win_unlock_all(ptr %47, i32 57, ptr @15), !dbg !109
  %49 = call i32 @parcoach_rma_MPI_Win_free(ptr %11, i32 58, ptr @16), !dbg !110
  %50 = call i32 @MPI_Finalize(), !dbg !111
  call void @parcoach_rma_load(ptr %7, i64 32, i32 61, ptr @17), !dbg !112
  %51 = load i32, ptr %7, align 4, !dbg !112
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %51), !dbg !113
  ret i32 0, !dbg !114
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

declare i32 @MPI_Win_lock_all(i32 noundef, ptr noundef) #2

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef) #2

declare i32 @MPI_Fetch_and_op(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c99d2b603af69bc17cf883ca7803b661")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 61, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflushlocal-compare_and_swap_fetch_and_op-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c99d2b603af69bc17cf883ca7803b661")
!14 = !{!15, !19, !20, !22, !25, !28}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 425, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !16, line: 425, flags: DIFlagFwdDecl)
!31 = !{!0, !7}
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"openmp", i32 50}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 2}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = !{!"Debian clang version 15.0.6"}
!41 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !46)
!42 = !DISubroutineType(types: !43)
!43 = !{!21, !21, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !{}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 22, type: !21)
!48 = !DILocation(line: 22, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 22, type: !44)
!50 = !DILocation(line: 22, column: 27, scope: !41)
!51 = !DILocalVariable(name: "nprocs", scope: !41, file: !2, line: 23, type: !21)
!52 = !DILocation(line: 23, column: 7, scope: !41)
!53 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 24, type: !21)
!54 = !DILocation(line: 24, column: 7, scope: !41)
!55 = !DILocalVariable(name: "int_0", scope: !41, file: !2, line: 25, type: !21)
!56 = !DILocation(line: 25, column: 7, scope: !41)
!57 = !DILocalVariable(name: "int_1", scope: !41, file: !2, line: 26, type: !21)
!58 = !DILocation(line: 26, column: 7, scope: !41)
!59 = !DILocalVariable(name: "int_2", scope: !41, file: !2, line: 27, type: !21)
!60 = !DILocation(line: 27, column: 7, scope: !41)
!61 = !DILocation(line: 29, column: 3, scope: !41)
!62 = !DILocation(line: 30, column: 3, scope: !41)
!63 = !DILocation(line: 31, column: 3, scope: !41)
!64 = !DILocation(line: 32, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !41, file: !2, line: 32, column: 7)
!66 = !DILocation(line: 32, column: 14, scope: !65)
!67 = !DILocation(line: 32, column: 7, scope: !41)
!68 = !DILocation(line: 33, column: 5, scope: !65)
!69 = !DILocalVariable(name: "mpi_win_0", scope: !41, file: !2, line: 36, type: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!73 = !DILocation(line: 36, column: 11, scope: !41)
!74 = !DILocalVariable(name: "winbuf", scope: !41, file: !2, line: 38, type: !20)
!75 = !DILocation(line: 38, column: 8, scope: !41)
!76 = !DILocation(line: 38, column: 24, scope: !41)
!77 = !DILocation(line: 40, column: 18, scope: !41)
!78 = !DILocation(line: 40, column: 3, scope: !41)
!79 = !DILocation(line: 42, column: 23, scope: !41)
!80 = !DILocation(line: 42, column: 3, scope: !41)
!81 = !DILocation(line: 43, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !41, file: !2, line: 43, column: 7)
!83 = !DILocation(line: 43, column: 12, scope: !82)
!84 = !DILocation(line: 43, column: 7, scope: !41)
!85 = !DILocalVariable(name: "buf", scope: !86, file: !2, line: 45, type: !20)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 43, column: 18)
!87 = !DILocation(line: 45, column: 10, scope: !86)
!88 = !DILocation(line: 45, column: 23, scope: !86)
!89 = !DILocalVariable(name: "int_0", scope: !86, file: !2, line: 47, type: !20)
!90 = !DILocation(line: 47, column: 10, scope: !86)
!91 = !DILocation(line: 47, column: 25, scope: !86)
!92 = !DILocalVariable(name: "int_1", scope: !86, file: !2, line: 49, type: !20)
!93 = !DILocation(line: 49, column: 10, scope: !86)
!94 = !DILocation(line: 49, column: 25, scope: !86)
!95 = !DILocation(line: 51, column: 26, scope: !86)
!96 = !DILocation(line: 51, column: 31, scope: !86)
!97 = !DILocation(line: 51, column: 38, scope: !86)
!98 = !DILocation(line: 51, column: 60, scope: !86)
!99 = !DILocation(line: 51, column: 5, scope: !86)
!100 = !DILocalVariable(name: "int_2", scope: !86, file: !2, line: 53, type: !20)
!101 = !DILocation(line: 53, column: 10, scope: !86)
!102 = !DILocation(line: 53, column: 25, scope: !86)
!103 = !DILocation(line: 55, column: 22, scope: !86)
!104 = !DILocation(line: 55, column: 27, scope: !86)
!105 = !DILocation(line: 55, column: 58, scope: !86)
!106 = !DILocation(line: 55, column: 5, scope: !86)
!107 = !DILocation(line: 56, column: 3, scope: !86)
!108 = !DILocation(line: 57, column: 22, scope: !41)
!109 = !DILocation(line: 57, column: 3, scope: !41)
!110 = !DILocation(line: 58, column: 3, scope: !41)
!111 = !DILocation(line: 60, column: 3, scope: !41)
!112 = !DILocation(line: 61, column: 41, scope: !41)
!113 = !DILocation(line: 61, column: 3, scope: !41)
!114 = !DILocation(line: 62, column: 3, scope: !41)
