; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@1 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@2 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@3 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@4 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@5 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@6 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@7 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@8 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@9 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@10 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@11 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@12 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1
@13 = private unnamed_addr constant [101 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !42 {
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
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !48, metadata !DIExpression()), !dbg !49
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %6, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 -1, ptr %6, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %7, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 -1, ptr %7, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %8, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 738197504, ptr %8, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %9, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 0, ptr %9, align 4, !dbg !59
  %14 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !60
  %15 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !61
  %16 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !62
  %17 = load i32, ptr %6, align 4, !dbg !63
  %18 = icmp slt i32 %17, 2, !dbg !65
  br i1 %18, label %19, label %21, !dbg !66

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !67
  br label %21, !dbg !67

21:                                               ; preds = %19, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !68, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %11, metadata !71, metadata !DIExpression()), !dbg !72
  %22 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !73
  store ptr %22, ptr %11, align 8, !dbg !72
  %23 = load ptr, ptr %11, align 8, !dbg !74
  %24 = call i32 @parcoach_rma_MPI_Win_create(ptr %23, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %10, i32 39, ptr @0), !dbg !75
  %25 = load i32, ptr %10, align 4, !dbg !76
  %26 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, i32 %25, i32 41, ptr @1), !dbg !77
  call void @parcoach_rma_load(ptr %7, i64 32, i32 42, ptr @2), !dbg !78
  %27 = load i32, ptr %7, align 4, !dbg !78
  %28 = icmp eq i32 %27, 0, !dbg !80
  br i1 %28, label %29, label %39, !dbg !81

29:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %12, metadata !82, metadata !DIExpression()), !dbg !84
  %30 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !85
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @3), !dbg !84
  store ptr %30, ptr %12, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata ptr %13, metadata !86, metadata !DIExpression()), !dbg !87
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !88
  call void @parcoach_rma_store(ptr %13, i64 64, i32 46, ptr @4), !dbg !87
  store ptr %31, ptr %13, align 8, !dbg !87
  call void @parcoach_rma_load(ptr %12, i64 64, i32 48, ptr @5), !dbg !89
  %32 = load ptr, ptr %12, align 8, !dbg !89
  call void @parcoach_rma_load(ptr %13, i64 64, i32 48, ptr @6), !dbg !90
  %33 = load ptr, ptr %13, align 8, !dbg !90
  call void @parcoach_rma_load(ptr %10, i64 32, i32 49, ptr @7), !dbg !91
  %34 = load i32, ptr %10, align 4, !dbg !91
  %35 = call i32 @MPI_Rget_accumulate(ptr noundef %32, i32 noundef 10, i32 noundef 1275069445, ptr noundef %33, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %34, ptr noundef %8), !dbg !92
  %36 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !93
  call void @parcoach_rma_load(ptr %12, i64 64, i32 51, ptr @8), !dbg !94
  %37 = load ptr, ptr %12, align 8, !dbg !94
  %38 = getelementptr inbounds i32, ptr %37, i64 0, !dbg !94
  call void @parcoach_rma_store(ptr %38, i64 32, i32 51, ptr @9), !dbg !95
  store i32 42, ptr %38, align 4, !dbg !95
  br label %39, !dbg !96

39:                                               ; preds = %29, %21
  call void @parcoach_rma_load(ptr %10, i64 32, i32 53, ptr @10), !dbg !97
  %40 = load i32, ptr %10, align 4, !dbg !97
  %41 = call i32 @parcoach_rma_MPI_Win_unlock_all(i32 %40, i32 53, ptr @11), !dbg !98
  call void @parcoach_rma_load(ptr %7, i64 32, i32 54, ptr @12), !dbg !99
  %42 = load i32, ptr %7, align 4, !dbg !99
  %43 = icmp eq i32 %42, 0, !dbg !101
  br i1 %43, label %44, label %46, !dbg !102

44:                                               ; preds = %39
  %45 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !103
  br label %46, !dbg !105

46:                                               ; preds = %44, %39
  %47 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 57, ptr @13), !dbg !106
  %48 = call i32 @MPI_Finalize(), !dbg !107
  %49 = load i32, ptr %7, align 4, !dbg !108
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %49), !dbg !109
  ret i32 0, !dbg !110
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

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "6baf77782e694c4d2c1cbceb4675cb45")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 60, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !32, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-rmarequest-rget_accumulate_bufwrite-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "6baf77782e694c4d2c1cbceb4675cb45")
!14 = !{!15, !18, !19, !20, !21, !22, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !26)
!26 = !{!27, !28, !29, !30, !31}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !25, file: !16, line: 588, baseType: !17, size: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !25, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !25, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !25, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !25, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!32 = !{!0, !7}
!33 = !{i32 7, !"Dwarf Version", i32 5}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"openmp", i32 50}
!37 = !{i32 7, !"PIC Level", i32 2}
!38 = !{i32 7, !"PIE Level", i32 2}
!39 = !{i32 7, !"uwtable", i32 2}
!40 = !{i32 7, !"frame-pointer", i32 2}
!41 = !{!"Debian clang version 15.0.6"}
!42 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !43, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !47)
!43 = !DISubroutineType(types: !44)
!44 = !{!17, !17, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!47 = !{}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !2, line: 22, type: !17)
!49 = !DILocation(line: 22, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !2, line: 22, type: !45)
!51 = !DILocation(line: 22, column: 27, scope: !42)
!52 = !DILocalVariable(name: "nprocs", scope: !42, file: !2, line: 23, type: !17)
!53 = !DILocation(line: 23, column: 7, scope: !42)
!54 = !DILocalVariable(name: "rank", scope: !42, file: !2, line: 24, type: !17)
!55 = !DILocation(line: 24, column: 7, scope: !42)
!56 = !DILocalVariable(name: "mpi_request_0", scope: !42, file: !2, line: 25, type: !15)
!57 = !DILocation(line: 25, column: 15, scope: !42)
!58 = !DILocalVariable(name: "int_0", scope: !42, file: !2, line: 26, type: !17)
!59 = !DILocation(line: 26, column: 7, scope: !42)
!60 = !DILocation(line: 28, column: 3, scope: !42)
!61 = !DILocation(line: 29, column: 3, scope: !42)
!62 = !DILocation(line: 30, column: 3, scope: !42)
!63 = !DILocation(line: 31, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !42, file: !2, line: 31, column: 7)
!65 = !DILocation(line: 31, column: 14, scope: !64)
!66 = !DILocation(line: 31, column: 7, scope: !42)
!67 = !DILocation(line: 32, column: 5, scope: !64)
!68 = !DILocalVariable(name: "mpi_win_0", scope: !42, file: !2, line: 35, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!70 = !DILocation(line: 35, column: 11, scope: !42)
!71 = !DILocalVariable(name: "winbuf", scope: !42, file: !2, line: 37, type: !19)
!72 = !DILocation(line: 37, column: 8, scope: !42)
!73 = !DILocation(line: 37, column: 24, scope: !42)
!74 = !DILocation(line: 39, column: 18, scope: !42)
!75 = !DILocation(line: 39, column: 3, scope: !42)
!76 = !DILocation(line: 41, column: 23, scope: !42)
!77 = !DILocation(line: 41, column: 3, scope: !42)
!78 = !DILocation(line: 42, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !42, file: !2, line: 42, column: 7)
!80 = !DILocation(line: 42, column: 12, scope: !79)
!81 = !DILocation(line: 42, column: 7, scope: !42)
!82 = !DILocalVariable(name: "buf", scope: !83, file: !2, line: 44, type: !19)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 42, column: 18)
!84 = !DILocation(line: 44, column: 10, scope: !83)
!85 = !DILocation(line: 44, column: 23, scope: !83)
!86 = !DILocalVariable(name: "int_0", scope: !83, file: !2, line: 46, type: !19)
!87 = !DILocation(line: 46, column: 10, scope: !83)
!88 = !DILocation(line: 46, column: 25, scope: !83)
!89 = !DILocation(line: 48, column: 25, scope: !83)
!90 = !DILocation(line: 48, column: 43, scope: !83)
!91 = !DILocation(line: 49, column: 34, scope: !83)
!92 = !DILocation(line: 48, column: 5, scope: !83)
!93 = !DILocation(line: 50, column: 5, scope: !83)
!94 = !DILocation(line: 51, column: 5, scope: !83)
!95 = !DILocation(line: 51, column: 12, scope: !83)
!96 = !DILocation(line: 52, column: 3, scope: !83)
!97 = !DILocation(line: 53, column: 22, scope: !42)
!98 = !DILocation(line: 53, column: 3, scope: !42)
!99 = !DILocation(line: 54, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !42, file: !2, line: 54, column: 7)
!101 = !DILocation(line: 54, column: 12, scope: !100)
!102 = !DILocation(line: 54, column: 7, scope: !42)
!103 = !DILocation(line: 55, column: 5, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 54, column: 18)
!105 = !DILocation(line: 56, column: 3, scope: !104)
!106 = !DILocation(line: 57, column: 3, scope: !42)
!107 = !DILocation(line: 59, column: 3, scope: !42)
!108 = !DILocation(line: 60, column: 41, scope: !42)
!109 = !DILocation(line: 60, column: 3, scope: !42)
!110 = !DILocation(line: 61, column: 3, scope: !42)
