; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@1 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@2 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@3 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@4 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@5 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@6 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@7 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@8 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@9 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@10 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@11 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@12 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@13 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@14 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@15 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1
@16 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c\00", align 1

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
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 0, ptr %10, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata ptr %11, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 0, ptr %11, align 4, !dbg !63
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !64
  %19 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !65
  %20 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !66
  %21 = load i32, ptr %6, align 4, !dbg !67
  %22 = icmp slt i32 %21, 2, !dbg !69
  br i1 %22, label %23, label %25, !dbg !70

23:                                               ; preds = %2
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !71
  br label %25, !dbg !71

25:                                               ; preds = %23, %2
  call void @llvm.dbg.declare(metadata ptr %12, metadata !72, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata ptr %13, metadata !75, metadata !DIExpression()), !dbg !76
  %26 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !77
  store ptr %26, ptr %13, align 8, !dbg !76
  %27 = load ptr, ptr %13, align 8, !dbg !78
  %28 = call i32 @parcoach_rma_MPI_Win_create(ptr %27, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %12, i32 41, ptr @0), !dbg !79
  %29 = load i32, ptr %7, align 4, !dbg !80
  %30 = icmp eq i32 %29, 0, !dbg !82
  br i1 %30, label %31, label %50, !dbg !83

31:                                               ; preds = %25
  %32 = load i32, ptr %12, align 4, !dbg !84
  %33 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %32, i32 44, ptr @1), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %14, metadata !87, metadata !DIExpression()), !dbg !88
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !89
  call void @parcoach_rma_store(ptr %14, i64 64, i32 46, ptr @2), !dbg !88
  store ptr %34, ptr %14, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata ptr %15, metadata !90, metadata !DIExpression()), !dbg !91
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !92
  call void @parcoach_rma_store(ptr %15, i64 64, i32 48, ptr @3), !dbg !91
  store ptr %35, ptr %15, align 8, !dbg !91
  call void @parcoach_rma_load(ptr %14, i64 64, i32 50, ptr @4), !dbg !93
  %36 = load ptr, ptr %14, align 8, !dbg !93
  call void @parcoach_rma_load(ptr %15, i64 64, i32 50, ptr @5), !dbg !94
  %37 = load ptr, ptr %15, align 8, !dbg !94
  call void @parcoach_rma_load(ptr %12, i64 32, i32 51, ptr @6), !dbg !95
  %38 = load i32, ptr %12, align 4, !dbg !95
  %39 = call i32 @MPI_Rget_accumulate(ptr noundef %36, i32 noundef 10, i32 noundef 1275069445, ptr noundef %37, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %38, ptr noundef %8), !dbg !96
  call void @llvm.dbg.declare(metadata ptr %16, metadata !97, metadata !DIExpression()), !dbg !98
  %40 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !99
  call void @parcoach_rma_store(ptr %16, i64 64, i32 53, ptr @7), !dbg !98
  store ptr %40, ptr %16, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata ptr %17, metadata !100, metadata !DIExpression()), !dbg !101
  %41 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !102
  call void @parcoach_rma_store(ptr %17, i64 64, i32 55, ptr @8), !dbg !101
  store ptr %41, ptr %17, align 8, !dbg !101
  call void @parcoach_rma_load(ptr %14, i64 64, i32 57, ptr @9), !dbg !103
  %42 = load ptr, ptr %14, align 8, !dbg !103
  call void @parcoach_rma_load(ptr %17, i64 64, i32 57, ptr @10), !dbg !104
  %43 = load ptr, ptr %17, align 8, !dbg !104
  call void @parcoach_rma_load(ptr %16, i64 64, i32 57, ptr @11), !dbg !105
  %44 = load ptr, ptr %16, align 8, !dbg !105
  call void @parcoach_rma_load(ptr %12, i64 32, i32 57, ptr @12), !dbg !106
  %45 = load i32, ptr %12, align 4, !dbg !106
  %46 = call i32 @MPI_Compare_and_swap(ptr noundef %42, ptr noundef %43, ptr noundef %44, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef %45), !dbg !107
  call void @parcoach_rma_load(ptr %12, i64 32, i32 58, ptr @13), !dbg !108
  %47 = load i32, ptr %12, align 4, !dbg !108
  %48 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %47, i32 58, ptr @14), !dbg !109
  %49 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !110
  br label %50, !dbg !111

50:                                               ; preds = %31, %25
  %51 = call i32 @parcoach_rma_MPI_Win_free(ptr %12, i32 61, ptr @15), !dbg !112
  %52 = call i32 @MPI_Finalize(), !dbg !113
  call void @parcoach_rma_load(ptr %7, i64 32, i32 64, ptr @16), !dbg !114
  %53 = load i32, ptr %7, align 4, !dbg !114
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %53), !dbg !115
  ret i32 0, !dbg !116
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

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 35, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e554ff372cfc9221ec27f94897db345b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !32, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-rget_accumulate_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e554ff372cfc9221ec27f94897db345b")
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
!60 = !DILocalVariable(name: "int_1", scope: !42, file: !2, line: 27, type: !17)
!61 = !DILocation(line: 27, column: 7, scope: !42)
!62 = !DILocalVariable(name: "int_2", scope: !42, file: !2, line: 28, type: !17)
!63 = !DILocation(line: 28, column: 7, scope: !42)
!64 = !DILocation(line: 30, column: 3, scope: !42)
!65 = !DILocation(line: 31, column: 3, scope: !42)
!66 = !DILocation(line: 32, column: 3, scope: !42)
!67 = !DILocation(line: 33, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !42, file: !2, line: 33, column: 7)
!69 = !DILocation(line: 33, column: 14, scope: !68)
!70 = !DILocation(line: 33, column: 7, scope: !42)
!71 = !DILocation(line: 34, column: 5, scope: !68)
!72 = !DILocalVariable(name: "mpi_win_0", scope: !42, file: !2, line: 37, type: !73)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!74 = !DILocation(line: 37, column: 11, scope: !42)
!75 = !DILocalVariable(name: "winbuf", scope: !42, file: !2, line: 39, type: !19)
!76 = !DILocation(line: 39, column: 8, scope: !42)
!77 = !DILocation(line: 39, column: 24, scope: !42)
!78 = !DILocation(line: 41, column: 18, scope: !42)
!79 = !DILocation(line: 41, column: 3, scope: !42)
!80 = !DILocation(line: 43, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !42, file: !2, line: 43, column: 7)
!82 = !DILocation(line: 43, column: 12, scope: !81)
!83 = !DILocation(line: 43, column: 7, scope: !42)
!84 = !DILocation(line: 44, column: 44, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !2, line: 43, column: 18)
!86 = !DILocation(line: 44, column: 5, scope: !85)
!87 = !DILocalVariable(name: "buf", scope: !85, file: !2, line: 46, type: !19)
!88 = !DILocation(line: 46, column: 10, scope: !85)
!89 = !DILocation(line: 46, column: 23, scope: !85)
!90 = !DILocalVariable(name: "int_0", scope: !85, file: !2, line: 48, type: !19)
!91 = !DILocation(line: 48, column: 10, scope: !85)
!92 = !DILocation(line: 48, column: 25, scope: !85)
!93 = !DILocation(line: 50, column: 25, scope: !85)
!94 = !DILocation(line: 50, column: 43, scope: !85)
!95 = !DILocation(line: 51, column: 34, scope: !85)
!96 = !DILocation(line: 50, column: 5, scope: !85)
!97 = !DILocalVariable(name: "int_1", scope: !85, file: !2, line: 53, type: !19)
!98 = !DILocation(line: 53, column: 10, scope: !85)
!99 = !DILocation(line: 53, column: 25, scope: !85)
!100 = !DILocalVariable(name: "int_2", scope: !85, file: !2, line: 55, type: !19)
!101 = !DILocation(line: 55, column: 10, scope: !85)
!102 = !DILocation(line: 55, column: 25, scope: !85)
!103 = !DILocation(line: 57, column: 26, scope: !85)
!104 = !DILocation(line: 57, column: 31, scope: !85)
!105 = !DILocation(line: 57, column: 38, scope: !85)
!106 = !DILocation(line: 57, column: 61, scope: !85)
!107 = !DILocation(line: 57, column: 5, scope: !85)
!108 = !DILocation(line: 58, column: 23, scope: !85)
!109 = !DILocation(line: 58, column: 5, scope: !85)
!110 = !DILocation(line: 59, column: 5, scope: !85)
!111 = !DILocation(line: 60, column: 3, scope: !85)
!112 = !DILocation(line: 61, column: 3, scope: !42)
!113 = !DILocation(line: 63, column: 3, scope: !42)
!114 = !DILocation(line: 64, column: 41, scope: !42)
!115 = !DILocation(line: 64, column: 3, scope: !42)
!116 = !DILocation(line: 65, column: 3, scope: !42)
