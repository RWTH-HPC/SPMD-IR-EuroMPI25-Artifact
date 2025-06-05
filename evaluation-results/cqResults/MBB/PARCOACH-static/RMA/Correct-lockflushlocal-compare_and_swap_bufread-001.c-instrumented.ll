; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@1 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@2 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@3 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@4 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@5 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@6 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@7 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@8 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@9 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@10 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@11 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@12 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@13 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1
@14 = private unnamed_addr constant [105 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
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
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !42, metadata !DIExpression()), !dbg !43
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata ptr %6, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 -1, ptr %6, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata ptr %7, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, ptr %7, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %8, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 0, ptr %8, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %9, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, ptr %9, align 4, !dbg !53
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !54
  %16 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !55
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !56
  %18 = load i32, ptr %6, align 4, !dbg !57
  %19 = icmp slt i32 %18, 2, !dbg !59
  br i1 %19, label %20, label %22, !dbg !60

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !61
  br label %22, !dbg !61

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !62, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata ptr %11, metadata !65, metadata !DIExpression()), !dbg !66
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !67
  store ptr %23, ptr %11, align 8, !dbg !66
  %24 = load ptr, ptr %11, align 8, !dbg !68
  %25 = call i32 @parcoach_rma_MPI_Win_create(ptr %24, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %10, i32 39, ptr @0), !dbg !69
  %26 = load i32, ptr %7, align 4, !dbg !70
  %27 = icmp eq i32 %26, 0, !dbg !72
  br i1 %27, label %28, label %45, !dbg !73

28:                                               ; preds = %22
  %29 = load i32, ptr %10, align 4, !dbg !74
  %30 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %29, i32 42, ptr @1), !dbg !76
  call void @llvm.dbg.declare(metadata ptr %12, metadata !77, metadata !DIExpression()), !dbg !78
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !79
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @2), !dbg !78
  store ptr %31, ptr %12, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata ptr %13, metadata !80, metadata !DIExpression()), !dbg !81
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !82
  call void @parcoach_rma_store(ptr %13, i64 64, i32 46, ptr @3), !dbg !81
  store ptr %32, ptr %13, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata ptr %14, metadata !83, metadata !DIExpression()), !dbg !84
  %33 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !85
  call void @parcoach_rma_store(ptr %14, i64 64, i32 48, ptr @4), !dbg !84
  store ptr %33, ptr %14, align 8, !dbg !84
  call void @parcoach_rma_load(ptr %12, i64 64, i32 50, ptr @5), !dbg !86
  %34 = load ptr, ptr %12, align 8, !dbg !86
  call void @parcoach_rma_load(ptr %14, i64 64, i32 50, ptr @6), !dbg !87
  %35 = load ptr, ptr %14, align 8, !dbg !87
  call void @parcoach_rma_load(ptr %13, i64 64, i32 50, ptr @7), !dbg !88
  %36 = load ptr, ptr %13, align 8, !dbg !88
  call void @parcoach_rma_load(ptr %10, i64 32, i32 50, ptr @8), !dbg !89
  %37 = load i32, ptr %10, align 4, !dbg !89
  %38 = call i32 @MPI_Compare_and_swap(ptr noundef %34, ptr noundef %35, ptr noundef %36, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef %37), !dbg !90
  call void @parcoach_rma_load(ptr %12, i64 64, i32 51, ptr @9), !dbg !91
  %39 = load ptr, ptr %12, align 8, !dbg !91
  %40 = getelementptr inbounds i32, ptr %39, i64 0, !dbg !91
  call void @parcoach_rma_load(ptr %40, i64 32, i32 51, ptr @10), !dbg !91
  %41 = load i32, ptr %40, align 4, !dbg !91
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %41), !dbg !92
  call void @parcoach_rma_load(ptr %10, i64 32, i32 52, ptr @11), !dbg !93
  %43 = load i32, ptr %10, align 4, !dbg !93
  %44 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %43, i32 52, ptr @12), !dbg !94
  br label %45, !dbg !95

45:                                               ; preds = %28, %22
  %46 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 54, ptr @13), !dbg !96
  %47 = call i32 @MPI_Finalize(), !dbg !97
  call void @parcoach_rma_load(ptr %7, i64 32, i32 57, ptr @14), !dbg !98
  %48 = load i32, ptr %7, align 4, !dbg !98
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %48), !dbg !99
  ret i32 0, !dbg !100
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

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3d09521da3a74d9617b20816b4b9e999")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 51, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 57, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !26, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflushlocal-compare_and_swap_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3d09521da3a74d9617b20816b4b9e999")
!19 = !{!20, !23, !24, !25}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!26 = !{!0, !7, !12}
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"openmp", i32 50}
!31 = !{i32 7, !"PIC Level", i32 2}
!32 = !{i32 7, !"PIE Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Debian clang version 15.0.6"}
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !37, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !41)
!37 = !DISubroutineType(types: !38)
!38 = !{!22, !22, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!41 = !{}
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 22, type: !22)
!43 = !DILocation(line: 22, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 22, type: !39)
!45 = !DILocation(line: 22, column: 27, scope: !36)
!46 = !DILocalVariable(name: "nprocs", scope: !36, file: !2, line: 23, type: !22)
!47 = !DILocation(line: 23, column: 7, scope: !36)
!48 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 24, type: !22)
!49 = !DILocation(line: 24, column: 7, scope: !36)
!50 = !DILocalVariable(name: "int_0", scope: !36, file: !2, line: 25, type: !22)
!51 = !DILocation(line: 25, column: 7, scope: !36)
!52 = !DILocalVariable(name: "int_1", scope: !36, file: !2, line: 26, type: !22)
!53 = !DILocation(line: 26, column: 7, scope: !36)
!54 = !DILocation(line: 28, column: 3, scope: !36)
!55 = !DILocation(line: 29, column: 3, scope: !36)
!56 = !DILocation(line: 30, column: 3, scope: !36)
!57 = !DILocation(line: 31, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !36, file: !2, line: 31, column: 7)
!59 = !DILocation(line: 31, column: 14, scope: !58)
!60 = !DILocation(line: 31, column: 7, scope: !36)
!61 = !DILocation(line: 32, column: 5, scope: !58)
!62 = !DILocalVariable(name: "mpi_win_0", scope: !36, file: !2, line: 35, type: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!64 = !DILocation(line: 35, column: 11, scope: !36)
!65 = !DILocalVariable(name: "winbuf", scope: !36, file: !2, line: 37, type: !23)
!66 = !DILocation(line: 37, column: 8, scope: !36)
!67 = !DILocation(line: 37, column: 24, scope: !36)
!68 = !DILocation(line: 39, column: 18, scope: !36)
!69 = !DILocation(line: 39, column: 3, scope: !36)
!70 = !DILocation(line: 41, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !36, file: !2, line: 41, column: 7)
!72 = !DILocation(line: 41, column: 12, scope: !71)
!73 = !DILocation(line: 41, column: 7, scope: !36)
!74 = !DILocation(line: 42, column: 44, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !2, line: 41, column: 18)
!76 = !DILocation(line: 42, column: 5, scope: !75)
!77 = !DILocalVariable(name: "buf", scope: !75, file: !2, line: 44, type: !23)
!78 = !DILocation(line: 44, column: 10, scope: !75)
!79 = !DILocation(line: 44, column: 23, scope: !75)
!80 = !DILocalVariable(name: "int_0", scope: !75, file: !2, line: 46, type: !23)
!81 = !DILocation(line: 46, column: 10, scope: !75)
!82 = !DILocation(line: 46, column: 25, scope: !75)
!83 = !DILocalVariable(name: "int_1", scope: !75, file: !2, line: 48, type: !23)
!84 = !DILocation(line: 48, column: 10, scope: !75)
!85 = !DILocation(line: 48, column: 25, scope: !75)
!86 = !DILocation(line: 50, column: 26, scope: !75)
!87 = !DILocation(line: 50, column: 31, scope: !75)
!88 = !DILocation(line: 50, column: 38, scope: !75)
!89 = !DILocation(line: 50, column: 60, scope: !75)
!90 = !DILocation(line: 50, column: 5, scope: !75)
!91 = !DILocation(line: 51, column: 27, scope: !75)
!92 = !DILocation(line: 51, column: 5, scope: !75)
!93 = !DILocation(line: 52, column: 23, scope: !75)
!94 = !DILocation(line: 52, column: 5, scope: !75)
!95 = !DILocation(line: 53, column: 3, scope: !75)
!96 = !DILocation(line: 54, column: 3, scope: !36)
!97 = !DILocation(line: 56, column: 3, scope: !36)
!98 = !DILocation(line: 57, column: 41, scope: !36)
!99 = !DILocation(line: 57, column: 3, scope: !36)
!100 = !DILocation(line: 58, column: 3, scope: !36)
