; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@1 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@2 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@3 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@4 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@5 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@6 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@7 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@8 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@9 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@10 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1
@11 = private unnamed_addr constant [90 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c\00", align 1

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
  store i32 738197504, ptr %8, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 738197504, ptr %9, align 4, !dbg !58
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !59
  %14 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !60
  %15 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !61
  %16 = load i32, ptr %6, align 4, !dbg !62
  %17 = icmp slt i32 %16, 2, !dbg !64
  br i1 %17, label %18, label %20, !dbg !65

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !66
  br label %20, !dbg !66

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !67, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata ptr %11, metadata !70, metadata !DIExpression()), !dbg !71
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !72
  store ptr %21, ptr %11, align 8, !dbg !71
  %22 = load ptr, ptr %11, align 8, !dbg !73
  %23 = call i32 @parcoach_rma_MPI_Win_create(ptr %22, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %10, i32 39, ptr @0), !dbg !74
  %24 = load i32, ptr %7, align 4, !dbg !75
  %25 = icmp eq i32 %24, 0, !dbg !77
  br i1 %25, label %26, label %42, !dbg !78

26:                                               ; preds = %20
  %27 = load i32, ptr %10, align 4, !dbg !79
  %28 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %27, i32 42, ptr @1), !dbg !81
  call void @llvm.dbg.declare(metadata ptr %12, metadata !82, metadata !DIExpression()), !dbg !83
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !84
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @2), !dbg !83
  store ptr %29, ptr %12, align 8, !dbg !83
  call void @parcoach_rma_load(ptr %12, i64 64, i32 46, ptr @3), !dbg !85
  %30 = load ptr, ptr %12, align 8, !dbg !85
  call void @parcoach_rma_load(ptr %10, i64 32, i32 46, ptr @4), !dbg !86
  %31 = load i32, ptr %10, align 4, !dbg !86
  %32 = call i32 @MPI_Rget(ptr noundef %30, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef %31, ptr noundef %8), !dbg !87
  call void @parcoach_rma_load(ptr %10, i64 32, i32 47, ptr @5), !dbg !88
  %33 = load i32, ptr %10, align 4, !dbg !88
  %34 = call i32 @MPI_Win_flush_local(i32 noundef 1, i32 noundef %33), !dbg !89
  call void @parcoach_rma_load(ptr %12, i64 64, i32 48, ptr @6), !dbg !90
  %35 = load ptr, ptr %12, align 8, !dbg !90
  call void @parcoach_rma_load(ptr %10, i64 32, i32 48, ptr @7), !dbg !91
  %36 = load i32, ptr %10, align 4, !dbg !91
  %37 = call i32 @MPI_Rput(ptr noundef %35, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef 10, i32 noundef 1275069445, i32 noundef %36, ptr noundef %9), !dbg !92
  call void @parcoach_rma_load(ptr %10, i64 32, i32 49, ptr @8), !dbg !93
  %38 = load i32, ptr %10, align 4, !dbg !93
  %39 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %38, i32 49, ptr @9), !dbg !94
  %40 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !95
  %41 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef inttoptr (i64 1 to ptr)), !dbg !96
  br label %42, !dbg !97

42:                                               ; preds = %26, %20
  %43 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 53, ptr @10), !dbg !98
  %44 = call i32 @MPI_Finalize(), !dbg !99
  call void @parcoach_rma_load(ptr %7, i64 32, i32 56, ptr @11), !dbg !100
  %45 = load i32, ptr %7, align 4, !dbg !100
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %45), !dbg !101
  ret i32 0, !dbg !102
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

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Rget(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_flush_local(i32 noundef, i32 noundef) #2

declare i32 @MPI_Rput(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, i32, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, i32, i32, ptr)

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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9b7c55d9f7bc0961e24c5c92f6bfcb60")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-rget_rput-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9b7c55d9f7bc0961e24c5c92f6bfcb60")
!14 = !{!15, !18, !19, !20, !21, !22}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !25)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !24, file: !16, line: 588, baseType: !17, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !24, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !24, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !24, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !24, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
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
!43 = !{!17, !17, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !{}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 22, type: !17)
!48 = !DILocation(line: 22, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 22, type: !44)
!50 = !DILocation(line: 22, column: 27, scope: !41)
!51 = !DILocalVariable(name: "nprocs", scope: !41, file: !2, line: 23, type: !17)
!52 = !DILocation(line: 23, column: 7, scope: !41)
!53 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 24, type: !17)
!54 = !DILocation(line: 24, column: 7, scope: !41)
!55 = !DILocalVariable(name: "mpi_request_0", scope: !41, file: !2, line: 25, type: !15)
!56 = !DILocation(line: 25, column: 15, scope: !41)
!57 = !DILocalVariable(name: "mpi_request_1", scope: !41, file: !2, line: 26, type: !15)
!58 = !DILocation(line: 26, column: 15, scope: !41)
!59 = !DILocation(line: 28, column: 3, scope: !41)
!60 = !DILocation(line: 29, column: 3, scope: !41)
!61 = !DILocation(line: 30, column: 3, scope: !41)
!62 = !DILocation(line: 31, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !41, file: !2, line: 31, column: 7)
!64 = !DILocation(line: 31, column: 14, scope: !63)
!65 = !DILocation(line: 31, column: 7, scope: !41)
!66 = !DILocation(line: 32, column: 5, scope: !63)
!67 = !DILocalVariable(name: "mpi_win_0", scope: !41, file: !2, line: 35, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!69 = !DILocation(line: 35, column: 11, scope: !41)
!70 = !DILocalVariable(name: "winbuf", scope: !41, file: !2, line: 37, type: !19)
!71 = !DILocation(line: 37, column: 8, scope: !41)
!72 = !DILocation(line: 37, column: 24, scope: !41)
!73 = !DILocation(line: 39, column: 18, scope: !41)
!74 = !DILocation(line: 39, column: 3, scope: !41)
!75 = !DILocation(line: 41, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !41, file: !2, line: 41, column: 7)
!77 = !DILocation(line: 41, column: 12, scope: !76)
!78 = !DILocation(line: 41, column: 7, scope: !41)
!79 = !DILocation(line: 42, column: 44, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !2, line: 41, column: 18)
!81 = !DILocation(line: 42, column: 5, scope: !80)
!82 = !DILocalVariable(name: "buf", scope: !80, file: !2, line: 44, type: !19)
!83 = !DILocation(line: 44, column: 10, scope: !80)
!84 = !DILocation(line: 44, column: 23, scope: !80)
!85 = !DILocation(line: 46, column: 14, scope: !80)
!86 = !DILocation(line: 46, column: 51, scope: !80)
!87 = !DILocation(line: 46, column: 5, scope: !80)
!88 = !DILocation(line: 47, column: 28, scope: !80)
!89 = !DILocation(line: 47, column: 5, scope: !80)
!90 = !DILocation(line: 48, column: 14, scope: !80)
!91 = !DILocation(line: 48, column: 52, scope: !80)
!92 = !DILocation(line: 48, column: 5, scope: !80)
!93 = !DILocation(line: 49, column: 23, scope: !80)
!94 = !DILocation(line: 49, column: 5, scope: !80)
!95 = !DILocation(line: 50, column: 5, scope: !80)
!96 = !DILocation(line: 51, column: 5, scope: !80)
!97 = !DILocation(line: 52, column: 3, scope: !80)
!98 = !DILocation(line: 53, column: 3, scope: !41)
!99 = !DILocation(line: 55, column: 3, scope: !41)
!100 = !DILocation(line: 56, column: 41, scope: !41)
!101 = !DILocation(line: 56, column: 3, scope: !41)
!102 = !DILocation(line: 57, column: 3, scope: !41)
