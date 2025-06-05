; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@1 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@2 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@3 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@4 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@5 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@6 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@7 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@8 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@9 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@10 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@11 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@12 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1
@13 = private unnamed_addr constant [96 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !31 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata ptr %6, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 -1, ptr %6, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata ptr %7, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 -1, ptr %7, align 4, !dbg !44
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !45
  %12 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !46
  %13 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !47
  %14 = load i32, ptr %6, align 4, !dbg !48
  %15 = icmp slt i32 %14, 2, !dbg !50
  br i1 %15, label %16, label %18, !dbg !51

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !52
  br label %18, !dbg !52

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !53, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !57
  %19 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !58
  store ptr %19, ptr %9, align 8, !dbg !57
  %20 = load ptr, ptr %9, align 8, !dbg !59
  %21 = call i32 @parcoach_rma_MPI_Win_create(ptr %20, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %8, i32 37, ptr @0), !dbg !60
  %22 = load i32, ptr %8, align 4, !dbg !61
  %23 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, i32 %22, i32 39, ptr @1), !dbg !62
  call void @parcoach_rma_load(ptr %7, i64 32, i32 40, ptr @2), !dbg !63
  %24 = load i32, ptr %7, align 4, !dbg !63
  %25 = icmp eq i32 %24, 0, !dbg !65
  br i1 %25, label %26, label %34, !dbg !66

26:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %10, metadata !67, metadata !DIExpression()), !dbg !69
  %27 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !70
  call void @parcoach_rma_store(ptr %10, i64 64, i32 42, ptr @3), !dbg !69
  store ptr %27, ptr %10, align 8, !dbg !69
  call void @parcoach_rma_load(ptr %10, i64 64, i32 44, ptr @4), !dbg !71
  %28 = load ptr, ptr %10, align 8, !dbg !71
  call void @parcoach_rma_load(ptr %8, i64 32, i32 45, ptr @5), !dbg !72
  %29 = load i32, ptr %8, align 4, !dbg !72
  %30 = call i32 @parcoach_rma_MPI_Get(ptr %28, i32 10, i32 1275069445, i32 1, i64 0, i32 10, i32 1275069445, i32 %29, i32 44, ptr @6), !dbg !73
  call void @parcoach_rma_load(ptr %10, i64 64, i32 46, ptr @7), !dbg !74
  %31 = load ptr, ptr %10, align 8, !dbg !74
  call void @parcoach_rma_load(ptr %8, i64 32, i32 47, ptr @8), !dbg !75
  %32 = load i32, ptr %8, align 4, !dbg !75
  %33 = call i32 @parcoach_rma_MPI_Get(ptr %31, i32 10, i32 1275069445, i32 0, i64 0, i32 10, i32 1275069445, i32 %32, i32 46, ptr @9), !dbg !76
  br label %34, !dbg !77

34:                                               ; preds = %26, %18
  call void @parcoach_rma_load(ptr %8, i64 32, i32 49, ptr @10), !dbg !78
  %35 = load i32, ptr %8, align 4, !dbg !78
  %36 = call i32 @parcoach_rma_MPI_Win_unlock_all(i32 %35, i32 49, ptr @11), !dbg !79
  %37 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 50, ptr @12), !dbg !80
  %38 = call i32 @MPI_Finalize(), !dbg !81
  call void @parcoach_rma_load(ptr %7, i64 32, i32 53, ptr @13), !dbg !82
  %39 = load i32, ptr %7, align 4, !dbg !82
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %39), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Win_create(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_lock_all(i32 noundef, i32 noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock_all(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Get(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "cf8b6d58a501b68bf46d0d1dbfa652e5")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !21, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/LocalConcurrency-lockallflush-get_get-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "cf8b6d58a501b68bf46d0d1dbfa652e5")
!14 = !{!15, !18, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!21 = !{!0, !7}
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"openmp", i32 50}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 2}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Debian clang version 15.0.6"}
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !32, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !36)
!32 = !DISubroutineType(types: !33)
!33 = !{!17, !17, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!36 = !{}
!37 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 22, type: !17)
!38 = !DILocation(line: 22, column: 14, scope: !31)
!39 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 22, type: !34)
!40 = !DILocation(line: 22, column: 27, scope: !31)
!41 = !DILocalVariable(name: "nprocs", scope: !31, file: !2, line: 23, type: !17)
!42 = !DILocation(line: 23, column: 7, scope: !31)
!43 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 24, type: !17)
!44 = !DILocation(line: 24, column: 7, scope: !31)
!45 = !DILocation(line: 26, column: 3, scope: !31)
!46 = !DILocation(line: 27, column: 3, scope: !31)
!47 = !DILocation(line: 28, column: 3, scope: !31)
!48 = !DILocation(line: 29, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !2, line: 29, column: 7)
!50 = !DILocation(line: 29, column: 14, scope: !49)
!51 = !DILocation(line: 29, column: 7, scope: !31)
!52 = !DILocation(line: 30, column: 5, scope: !49)
!53 = !DILocalVariable(name: "mpi_win_0", scope: !31, file: !2, line: 33, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!55 = !DILocation(line: 33, column: 11, scope: !31)
!56 = !DILocalVariable(name: "winbuf", scope: !31, file: !2, line: 35, type: !18)
!57 = !DILocation(line: 35, column: 8, scope: !31)
!58 = !DILocation(line: 35, column: 24, scope: !31)
!59 = !DILocation(line: 37, column: 18, scope: !31)
!60 = !DILocation(line: 37, column: 3, scope: !31)
!61 = !DILocation(line: 39, column: 23, scope: !31)
!62 = !DILocation(line: 39, column: 3, scope: !31)
!63 = !DILocation(line: 40, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !31, file: !2, line: 40, column: 7)
!65 = !DILocation(line: 40, column: 12, scope: !64)
!66 = !DILocation(line: 40, column: 7, scope: !31)
!67 = !DILocalVariable(name: "buf", scope: !68, file: !2, line: 42, type: !18)
!68 = distinct !DILexicalBlock(scope: !64, file: !2, line: 40, column: 18)
!69 = !DILocation(line: 42, column: 10, scope: !68)
!70 = !DILocation(line: 42, column: 23, scope: !68)
!71 = !DILocation(line: 44, column: 32, scope: !68)
!72 = !DILocation(line: 45, column: 32, scope: !68)
!73 = !DILocation(line: 44, column: 24, scope: !68)
!74 = !DILocation(line: 46, column: 32, scope: !68)
!75 = !DILocation(line: 47, column: 32, scope: !68)
!76 = !DILocation(line: 46, column: 24, scope: !68)
!77 = !DILocation(line: 48, column: 3, scope: !68)
!78 = !DILocation(line: 49, column: 22, scope: !31)
!79 = !DILocation(line: 49, column: 3, scope: !31)
!80 = !DILocation(line: 50, column: 3, scope: !31)
!81 = !DILocation(line: 52, column: 3, scope: !31)
!82 = !DILocation(line: 53, column: 41, scope: !31)
!83 = !DILocation(line: 53, column: 3, scope: !31)
!84 = !DILocation(line: 54, column: 3, scope: !31)
