; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@1 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@2 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@3 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@4 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@5 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@6 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@7 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@8 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@9 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@10 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@11 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@12 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@13 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@14 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@15 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1
@16 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !32 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, ptr %6, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, ptr %7, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata ptr %8, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 0, ptr %8, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata ptr %9, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 0, ptr %9, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %10, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 0, ptr %10, align 4, !dbg !51
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !52
  %18 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !53
  %19 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !54
  %20 = load i32, ptr %6, align 4, !dbg !55
  %21 = icmp slt i32 %20, 2, !dbg !57
  br i1 %21, label %22, label %24, !dbg !58

22:                                               ; preds = %2
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !59
  br label %24, !dbg !59

24:                                               ; preds = %22, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !60, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %12, metadata !63, metadata !DIExpression()), !dbg !64
  %25 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !65
  store ptr %25, ptr %12, align 8, !dbg !64
  %26 = load ptr, ptr %12, align 8, !dbg !66
  %27 = call i32 @parcoach_rma_MPI_Win_create(ptr %26, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %11, i32 40, ptr @0), !dbg !67
  %28 = load i32, ptr %7, align 4, !dbg !68
  %29 = icmp eq i32 %28, 0, !dbg !70
  br i1 %29, label %30, label %48, !dbg !71

30:                                               ; preds = %24
  %31 = load i32, ptr %11, align 4, !dbg !72
  %32 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %31, i32 43, ptr @1), !dbg !74
  call void @llvm.dbg.declare(metadata ptr %13, metadata !75, metadata !DIExpression()), !dbg !76
  %33 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !77
  call void @parcoach_rma_store(ptr %13, i64 64, i32 45, ptr @2), !dbg !76
  store ptr %33, ptr %13, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata ptr %14, metadata !78, metadata !DIExpression()), !dbg !79
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !80
  call void @parcoach_rma_store(ptr %14, i64 64, i32 47, ptr @3), !dbg !79
  store ptr %34, ptr %14, align 8, !dbg !79
  call void @parcoach_rma_load(ptr %13, i64 64, i32 49, ptr @4), !dbg !81
  %35 = load ptr, ptr %13, align 8, !dbg !81
  call void @parcoach_rma_load(ptr %14, i64 64, i32 49, ptr @5), !dbg !82
  %36 = load ptr, ptr %14, align 8, !dbg !82
  call void @parcoach_rma_load(ptr %11, i64 32, i32 49, ptr @6), !dbg !83
  %37 = load i32, ptr %11, align 4, !dbg !83
  %38 = call i32 @MPI_Fetch_and_op(ptr noundef %35, ptr noundef %36, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1476395011, i32 noundef %37), !dbg !84
  call void @llvm.dbg.declare(metadata ptr %15, metadata !85, metadata !DIExpression()), !dbg !86
  %39 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !87
  call void @parcoach_rma_store(ptr %15, i64 64, i32 51, ptr @7), !dbg !86
  store ptr %39, ptr %15, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata ptr %16, metadata !88, metadata !DIExpression()), !dbg !89
  %40 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !90
  call void @parcoach_rma_store(ptr %16, i64 64, i32 53, ptr @8), !dbg !89
  store ptr %40, ptr %16, align 8, !dbg !89
  call void @parcoach_rma_load(ptr %13, i64 64, i32 55, ptr @9), !dbg !91
  %41 = load ptr, ptr %13, align 8, !dbg !91
  call void @parcoach_rma_load(ptr %16, i64 64, i32 55, ptr @10), !dbg !92
  %42 = load ptr, ptr %16, align 8, !dbg !92
  call void @parcoach_rma_load(ptr %15, i64 64, i32 55, ptr @11), !dbg !93
  %43 = load ptr, ptr %15, align 8, !dbg !93
  call void @parcoach_rma_load(ptr %11, i64 32, i32 55, ptr @12), !dbg !94
  %44 = load i32, ptr %11, align 4, !dbg !94
  %45 = call i32 @MPI_Compare_and_swap(ptr noundef %41, ptr noundef %42, ptr noundef %43, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef %44), !dbg !95
  call void @parcoach_rma_load(ptr %11, i64 32, i32 56, ptr @13), !dbg !96
  %46 = load i32, ptr %11, align 4, !dbg !96
  %47 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %46, i32 56, ptr @14), !dbg !97
  br label %48, !dbg !98

48:                                               ; preds = %30, %24
  %49 = call i32 @parcoach_rma_MPI_Win_free(ptr %11, i32 58, ptr @15), !dbg !99
  %50 = call i32 @MPI_Finalize(), !dbg !100
  call void @parcoach_rma_load(ptr %7, i64 32, i32 61, ptr @16), !dbg !101
  %51 = load i32, ptr %7, align 4, !dbg !101
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %51), !dbg !102
  ret i32 0, !dbg !103
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

declare i32 @MPI_Fetch_and_op(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d8abd19c94bda61314ff96291b20d633")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 61, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !22, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-fetch_and_op_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d8abd19c94bda61314ff96291b20d633")
!14 = !{!15, !18, !19, !20, !21}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!22 = !{!0, !7}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"openmp", i32 50}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 2}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Debian clang version 15.0.6"}
!32 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !33, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!33 = !DISubroutineType(types: !34)
!34 = !{!17, !17, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !2, line: 22, type: !17)
!39 = !DILocation(line: 22, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !2, line: 22, type: !35)
!41 = !DILocation(line: 22, column: 27, scope: !32)
!42 = !DILocalVariable(name: "nprocs", scope: !32, file: !2, line: 23, type: !17)
!43 = !DILocation(line: 23, column: 7, scope: !32)
!44 = !DILocalVariable(name: "rank", scope: !32, file: !2, line: 24, type: !17)
!45 = !DILocation(line: 24, column: 7, scope: !32)
!46 = !DILocalVariable(name: "int_0", scope: !32, file: !2, line: 25, type: !17)
!47 = !DILocation(line: 25, column: 7, scope: !32)
!48 = !DILocalVariable(name: "int_1", scope: !32, file: !2, line: 26, type: !17)
!49 = !DILocation(line: 26, column: 7, scope: !32)
!50 = !DILocalVariable(name: "int_2", scope: !32, file: !2, line: 27, type: !17)
!51 = !DILocation(line: 27, column: 7, scope: !32)
!52 = !DILocation(line: 29, column: 3, scope: !32)
!53 = !DILocation(line: 30, column: 3, scope: !32)
!54 = !DILocation(line: 31, column: 3, scope: !32)
!55 = !DILocation(line: 32, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !32, file: !2, line: 32, column: 7)
!57 = !DILocation(line: 32, column: 14, scope: !56)
!58 = !DILocation(line: 32, column: 7, scope: !32)
!59 = !DILocation(line: 33, column: 5, scope: !56)
!60 = !DILocalVariable(name: "mpi_win_0", scope: !32, file: !2, line: 36, type: !61)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!62 = !DILocation(line: 36, column: 11, scope: !32)
!63 = !DILocalVariable(name: "winbuf", scope: !32, file: !2, line: 38, type: !18)
!64 = !DILocation(line: 38, column: 8, scope: !32)
!65 = !DILocation(line: 38, column: 24, scope: !32)
!66 = !DILocation(line: 40, column: 18, scope: !32)
!67 = !DILocation(line: 40, column: 3, scope: !32)
!68 = !DILocation(line: 42, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !32, file: !2, line: 42, column: 7)
!70 = !DILocation(line: 42, column: 12, scope: !69)
!71 = !DILocation(line: 42, column: 7, scope: !32)
!72 = !DILocation(line: 43, column: 44, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !2, line: 42, column: 18)
!74 = !DILocation(line: 43, column: 5, scope: !73)
!75 = !DILocalVariable(name: "buf", scope: !73, file: !2, line: 45, type: !18)
!76 = !DILocation(line: 45, column: 10, scope: !73)
!77 = !DILocation(line: 45, column: 23, scope: !73)
!78 = !DILocalVariable(name: "int_0", scope: !73, file: !2, line: 47, type: !18)
!79 = !DILocation(line: 47, column: 10, scope: !73)
!80 = !DILocation(line: 47, column: 25, scope: !73)
!81 = !DILocation(line: 49, column: 22, scope: !73)
!82 = !DILocation(line: 49, column: 27, scope: !73)
!83 = !DILocation(line: 49, column: 58, scope: !73)
!84 = !DILocation(line: 49, column: 5, scope: !73)
!85 = !DILocalVariable(name: "int_1", scope: !73, file: !2, line: 51, type: !18)
!86 = !DILocation(line: 51, column: 10, scope: !73)
!87 = !DILocation(line: 51, column: 25, scope: !73)
!88 = !DILocalVariable(name: "int_2", scope: !73, file: !2, line: 53, type: !18)
!89 = !DILocation(line: 53, column: 10, scope: !73)
!90 = !DILocation(line: 53, column: 25, scope: !73)
!91 = !DILocation(line: 55, column: 26, scope: !73)
!92 = !DILocation(line: 55, column: 31, scope: !73)
!93 = !DILocation(line: 55, column: 38, scope: !73)
!94 = !DILocation(line: 55, column: 61, scope: !73)
!95 = !DILocation(line: 55, column: 5, scope: !73)
!96 = !DILocation(line: 56, column: 23, scope: !73)
!97 = !DILocation(line: 56, column: 5, scope: !73)
!98 = !DILocation(line: 57, column: 3, scope: !73)
!99 = !DILocation(line: 58, column: 3, scope: !32)
!100 = !DILocation(line: 60, column: 3, scope: !32)
!101 = !DILocation(line: 61, column: 41, scope: !32)
!102 = !DILocation(line: 61, column: 3, scope: !32)
!103 = !DILocation(line: 62, column: 3, scope: !32)
