; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@1 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@2 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@3 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@4 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@5 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@6 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@7 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@8 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@9 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@10 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@11 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@12 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@13 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1
@14 = private unnamed_addr constant [115 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !44, metadata !DIExpression()), !dbg !45
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, ptr %6, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -1, ptr %7, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %8, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, ptr %8, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %9, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 0, ptr %9, align 4, !dbg !55
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !56
  %16 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !57
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !58
  %18 = load i32, ptr %6, align 4, !dbg !59
  %19 = icmp slt i32 %18, 2, !dbg !61
  br i1 %19, label %20, label %22, !dbg !62

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !63
  br label %22, !dbg !63

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata ptr %11, metadata !69, metadata !DIExpression()), !dbg !70
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !71
  store ptr %23, ptr %11, align 8, !dbg !70
  %24 = load ptr, ptr %11, align 8, !dbg !72
  %25 = call i32 @parcoach_rma_MPI_Win_create(ptr %24, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %10, i32 39, ptr @0), !dbg !73
  %26 = load i32, ptr %7, align 4, !dbg !74
  %27 = icmp eq i32 %26, 0, !dbg !76
  br i1 %27, label %28, label %43, !dbg !77

28:                                               ; preds = %22
  %29 = load ptr, ptr %10, align 8, !dbg !78
  %30 = call i32 @parcoach_rma_MPI_Win_lock(i32 1, i32 1, i32 0, ptr %29, i32 42, ptr @1), !dbg !80
  call void @llvm.dbg.declare(metadata ptr %12, metadata !81, metadata !DIExpression()), !dbg !82
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !83
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @2), !dbg !82
  store ptr %31, ptr %12, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata ptr %13, metadata !84, metadata !DIExpression()), !dbg !85
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !86
  call void @parcoach_rma_store(ptr %13, i64 64, i32 46, ptr @3), !dbg !85
  store ptr %32, ptr %13, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata ptr %14, metadata !87, metadata !DIExpression()), !dbg !88
  %33 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !89
  call void @parcoach_rma_store(ptr %14, i64 64, i32 48, ptr @4), !dbg !88
  store ptr %33, ptr %14, align 8, !dbg !88
  call void @parcoach_rma_load(ptr %12, i64 64, i32 50, ptr @5), !dbg !90
  %34 = load ptr, ptr %12, align 8, !dbg !90
  call void @parcoach_rma_load(ptr %14, i64 64, i32 50, ptr @6), !dbg !91
  %35 = load ptr, ptr %14, align 8, !dbg !91
  call void @parcoach_rma_load(ptr %13, i64 64, i32 50, ptr @7), !dbg !92
  %36 = load ptr, ptr %13, align 8, !dbg !92
  call void @parcoach_rma_load(ptr %10, i64 64, i32 51, ptr @8), !dbg !93
  %37 = load ptr, ptr %10, align 8, !dbg !93
  %38 = call i32 @MPI_Compare_and_swap(ptr noundef %34, ptr noundef %35, ptr noundef %36, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, ptr noundef %37), !dbg !94
  call void @parcoach_rma_load(ptr %12, i64 64, i32 52, ptr @9), !dbg !95
  %39 = load ptr, ptr %12, align 8, !dbg !95
  %40 = getelementptr inbounds i32, ptr %39, i64 0, !dbg !95
  call void @parcoach_rma_store(ptr %40, i64 32, i32 52, ptr @10), !dbg !96
  store i32 42, ptr %40, align 4, !dbg !96
  call void @parcoach_rma_load(ptr %10, i64 64, i32 53, ptr @11), !dbg !97
  %41 = load ptr, ptr %10, align 8, !dbg !97
  %42 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, ptr %41, i32 53, ptr @12), !dbg !98
  br label %43, !dbg !99

43:                                               ; preds = %28, %22
  %44 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 55, ptr @13), !dbg !100
  %45 = call i32 @MPI_Finalize(), !dbg !101
  call void @parcoach_rma_load(ptr %7, i64 32, i32 58, ptr @14), !dbg !102
  %46 = load i32, ptr %7, align 4, !dbg !102
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %46), !dbg !103
  ret i32 0, !dbg !104
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

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

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
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "2f2e026e61ca371e2895b76a1dc34982")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !28, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/LocalConcurrency-lockflushlocal-compare_and_swap_bufwrite-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "2f2e026e61ca371e2895b76a1dc34982")
!14 = !{!15, !19, !20, !22, !25}
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
!28 = !{!0, !7}
!29 = !{i32 7, !"Dwarf Version", i32 5}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"openmp", i32 50}
!33 = !{i32 7, !"PIC Level", i32 2}
!34 = !{i32 7, !"PIE Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 2}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{!"Debian clang version 15.0.6"}
!38 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !39, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !43)
!39 = !DISubroutineType(types: !40)
!40 = !{!21, !21, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!43 = !{}
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !2, line: 22, type: !21)
!45 = !DILocation(line: 22, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !2, line: 22, type: !41)
!47 = !DILocation(line: 22, column: 27, scope: !38)
!48 = !DILocalVariable(name: "nprocs", scope: !38, file: !2, line: 23, type: !21)
!49 = !DILocation(line: 23, column: 7, scope: !38)
!50 = !DILocalVariable(name: "rank", scope: !38, file: !2, line: 24, type: !21)
!51 = !DILocation(line: 24, column: 7, scope: !38)
!52 = !DILocalVariable(name: "int_0", scope: !38, file: !2, line: 25, type: !21)
!53 = !DILocation(line: 25, column: 7, scope: !38)
!54 = !DILocalVariable(name: "int_1", scope: !38, file: !2, line: 26, type: !21)
!55 = !DILocation(line: 26, column: 7, scope: !38)
!56 = !DILocation(line: 28, column: 3, scope: !38)
!57 = !DILocation(line: 29, column: 3, scope: !38)
!58 = !DILocation(line: 30, column: 3, scope: !38)
!59 = !DILocation(line: 31, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !38, file: !2, line: 31, column: 7)
!61 = !DILocation(line: 31, column: 14, scope: !60)
!62 = !DILocation(line: 31, column: 7, scope: !38)
!63 = !DILocation(line: 32, column: 5, scope: !60)
!64 = !DILocalVariable(name: "mpi_win_0", scope: !38, file: !2, line: 35, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!68 = !DILocation(line: 35, column: 11, scope: !38)
!69 = !DILocalVariable(name: "winbuf", scope: !38, file: !2, line: 37, type: !20)
!70 = !DILocation(line: 37, column: 8, scope: !38)
!71 = !DILocation(line: 37, column: 24, scope: !38)
!72 = !DILocation(line: 39, column: 18, scope: !38)
!73 = !DILocation(line: 39, column: 3, scope: !38)
!74 = !DILocation(line: 41, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !38, file: !2, line: 41, column: 7)
!76 = !DILocation(line: 41, column: 12, scope: !75)
!77 = !DILocation(line: 41, column: 7, scope: !38)
!78 = !DILocation(line: 42, column: 44, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 41, column: 18)
!80 = !DILocation(line: 42, column: 5, scope: !79)
!81 = !DILocalVariable(name: "buf", scope: !79, file: !2, line: 44, type: !20)
!82 = !DILocation(line: 44, column: 10, scope: !79)
!83 = !DILocation(line: 44, column: 23, scope: !79)
!84 = !DILocalVariable(name: "int_0", scope: !79, file: !2, line: 46, type: !20)
!85 = !DILocation(line: 46, column: 10, scope: !79)
!86 = !DILocation(line: 46, column: 25, scope: !79)
!87 = !DILocalVariable(name: "int_1", scope: !79, file: !2, line: 48, type: !20)
!88 = !DILocation(line: 48, column: 10, scope: !79)
!89 = !DILocation(line: 48, column: 25, scope: !79)
!90 = !DILocation(line: 50, column: 45, scope: !79)
!91 = !DILocation(line: 50, column: 50, scope: !79)
!92 = !DILocation(line: 50, column: 57, scope: !79)
!93 = !DILocation(line: 51, column: 45, scope: !79)
!94 = !DILocation(line: 50, column: 24, scope: !79)
!95 = !DILocation(line: 52, column: 24, scope: !79)
!96 = !DILocation(line: 52, column: 31, scope: !79)
!97 = !DILocation(line: 53, column: 23, scope: !79)
!98 = !DILocation(line: 53, column: 5, scope: !79)
!99 = !DILocation(line: 54, column: 3, scope: !79)
!100 = !DILocation(line: 55, column: 3, scope: !38)
!101 = !DILocation(line: 57, column: 3, scope: !38)
!102 = !DILocation(line: 58, column: 41, scope: !38)
!103 = !DILocation(line: 58, column: 3, scope: !38)
!104 = !DILocation(line: 59, column: 3, scope: !38)
