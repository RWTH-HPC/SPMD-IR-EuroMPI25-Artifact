; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@1 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@2 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@3 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@4 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@5 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@6 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@7 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@8 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@9 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@10 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@11 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@12 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@13 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@14 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1
@15 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata ptr %6, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 -1, ptr %6, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata ptr %7, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 -1, ptr %7, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata ptr %8, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 0, ptr %8, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata ptr %9, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 0, ptr %9, align 4, !dbg !48
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !49
  %16 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !50
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !51
  %18 = load i32, ptr %6, align 4, !dbg !52
  %19 = icmp slt i32 %18, 2, !dbg !54
  br i1 %19, label %20, label %22, !dbg !55

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !56
  br label %22, !dbg !56

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !57, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %11, metadata !60, metadata !DIExpression()), !dbg !61
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !62
  store ptr %23, ptr %11, align 8, !dbg !61
  %24 = load ptr, ptr %11, align 8, !dbg !63
  %25 = call i32 @parcoach_rma_MPI_Win_create(ptr %24, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %10, i32 39, ptr @0), !dbg !64
  %26 = load i32, ptr %10, align 4, !dbg !65
  %27 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, i32 %26, i32 41, ptr @1), !dbg !66
  call void @parcoach_rma_load(ptr %7, i64 32, i32 42, ptr @2), !dbg !67
  %28 = load i32, ptr %7, align 4, !dbg !67
  %29 = icmp eq i32 %28, 0, !dbg !69
  br i1 %29, label %30, label %41, !dbg !70

30:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata ptr %12, metadata !71, metadata !DIExpression()), !dbg !73
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !74
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @3), !dbg !73
  store ptr %31, ptr %12, align 8, !dbg !73
  call void @parcoach_rma_load(ptr %12, i64 64, i32 46, ptr @4), !dbg !75
  %32 = load ptr, ptr %12, align 8, !dbg !75
  %33 = getelementptr inbounds i32, ptr %32, i64 0, !dbg !75
  call void @parcoach_rma_store(ptr %33, i64 32, i32 46, ptr @5), !dbg !76
  store i32 42, ptr %33, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata ptr %13, metadata !77, metadata !DIExpression()), !dbg !78
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !79
  call void @parcoach_rma_store(ptr %13, i64 64, i32 48, ptr @6), !dbg !78
  store ptr %34, ptr %13, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata ptr %14, metadata !80, metadata !DIExpression()), !dbg !81
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !82
  call void @parcoach_rma_store(ptr %14, i64 64, i32 50, ptr @7), !dbg !81
  store ptr %35, ptr %14, align 8, !dbg !81
  call void @parcoach_rma_load(ptr %12, i64 64, i32 52, ptr @8), !dbg !83
  %36 = load ptr, ptr %12, align 8, !dbg !83
  call void @parcoach_rma_load(ptr %14, i64 64, i32 52, ptr @9), !dbg !84
  %37 = load ptr, ptr %14, align 8, !dbg !84
  call void @parcoach_rma_load(ptr %13, i64 64, i32 52, ptr @10), !dbg !85
  %38 = load ptr, ptr %13, align 8, !dbg !85
  call void @parcoach_rma_load(ptr %10, i64 32, i32 52, ptr @11), !dbg !86
  %39 = load i32, ptr %10, align 4, !dbg !86
  %40 = call i32 @MPI_Compare_and_swap(ptr noundef %36, ptr noundef %37, ptr noundef %38, i32 noundef 1275069445, i32 noundef 0, i64 noundef 0, i32 noundef %39), !dbg !87
  br label %41, !dbg !88

41:                                               ; preds = %30, %22
  call void @parcoach_rma_load(ptr %10, i64 32, i32 54, ptr @12), !dbg !89
  %42 = load i32, ptr %10, align 4, !dbg !89
  %43 = call i32 @parcoach_rma_MPI_Win_unlock_all(i32 %42, i32 54, ptr @13), !dbg !90
  %44 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 55, ptr @14), !dbg !91
  %45 = call i32 @MPI_Finalize(), !dbg !92
  call void @parcoach_rma_load(ptr %7, i64 32, i32 58, ptr @15), !dbg !93
  %46 = load i32, ptr %7, align 4, !dbg !93
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %46), !dbg !94
  ret i32 0, !dbg !95
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

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "63e3f591d64034d4c94630997f36c162")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !21, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufwrite_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "63e3f591d64034d4c94630997f36c162")
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
!45 = !DILocalVariable(name: "int_0", scope: !31, file: !2, line: 25, type: !17)
!46 = !DILocation(line: 25, column: 7, scope: !31)
!47 = !DILocalVariable(name: "int_1", scope: !31, file: !2, line: 26, type: !17)
!48 = !DILocation(line: 26, column: 7, scope: !31)
!49 = !DILocation(line: 28, column: 3, scope: !31)
!50 = !DILocation(line: 29, column: 3, scope: !31)
!51 = !DILocation(line: 30, column: 3, scope: !31)
!52 = !DILocation(line: 31, column: 7, scope: !53)
!53 = distinct !DILexicalBlock(scope: !31, file: !2, line: 31, column: 7)
!54 = !DILocation(line: 31, column: 14, scope: !53)
!55 = !DILocation(line: 31, column: 7, scope: !31)
!56 = !DILocation(line: 32, column: 5, scope: !53)
!57 = !DILocalVariable(name: "mpi_win_0", scope: !31, file: !2, line: 35, type: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!59 = !DILocation(line: 35, column: 11, scope: !31)
!60 = !DILocalVariable(name: "winbuf", scope: !31, file: !2, line: 37, type: !18)
!61 = !DILocation(line: 37, column: 8, scope: !31)
!62 = !DILocation(line: 37, column: 24, scope: !31)
!63 = !DILocation(line: 39, column: 18, scope: !31)
!64 = !DILocation(line: 39, column: 3, scope: !31)
!65 = !DILocation(line: 41, column: 23, scope: !31)
!66 = !DILocation(line: 41, column: 3, scope: !31)
!67 = !DILocation(line: 42, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !31, file: !2, line: 42, column: 7)
!69 = !DILocation(line: 42, column: 12, scope: !68)
!70 = !DILocation(line: 42, column: 7, scope: !31)
!71 = !DILocalVariable(name: "buf", scope: !72, file: !2, line: 44, type: !18)
!72 = distinct !DILexicalBlock(scope: !68, file: !2, line: 42, column: 18)
!73 = !DILocation(line: 44, column: 10, scope: !72)
!74 = !DILocation(line: 44, column: 23, scope: !72)
!75 = !DILocation(line: 46, column: 5, scope: !72)
!76 = !DILocation(line: 46, column: 12, scope: !72)
!77 = !DILocalVariable(name: "int_0", scope: !72, file: !2, line: 48, type: !18)
!78 = !DILocation(line: 48, column: 10, scope: !72)
!79 = !DILocation(line: 48, column: 25, scope: !72)
!80 = !DILocalVariable(name: "int_1", scope: !72, file: !2, line: 50, type: !18)
!81 = !DILocation(line: 50, column: 10, scope: !72)
!82 = !DILocation(line: 50, column: 25, scope: !72)
!83 = !DILocation(line: 52, column: 26, scope: !72)
!84 = !DILocation(line: 52, column: 31, scope: !72)
!85 = !DILocation(line: 52, column: 38, scope: !72)
!86 = !DILocation(line: 52, column: 60, scope: !72)
!87 = !DILocation(line: 52, column: 5, scope: !72)
!88 = !DILocation(line: 53, column: 3, scope: !72)
!89 = !DILocation(line: 54, column: 22, scope: !31)
!90 = !DILocation(line: 54, column: 3, scope: !31)
!91 = !DILocation(line: 55, column: 3, scope: !31)
!92 = !DILocation(line: 57, column: 3, scope: !31)
!93 = !DILocation(line: 58, column: 41, scope: !31)
!94 = !DILocation(line: 58, column: 3, scope: !31)
!95 = !DILocation(line: 59, column: 3, scope: !31)
