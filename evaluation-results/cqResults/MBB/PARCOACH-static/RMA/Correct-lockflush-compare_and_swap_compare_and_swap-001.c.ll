; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-compare_and_swap_compare_and_swap-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-compare_and_swap_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

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
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 0, ptr %10, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata ptr %11, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 0, ptr %11, align 4, !dbg !52
  %19 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !53
  %20 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !54
  %21 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !55
  %22 = load i32, ptr %6, align 4, !dbg !56
  %23 = icmp slt i32 %22, 2, !dbg !58
  br i1 %23, label %24, label %26, !dbg !59

24:                                               ; preds = %2
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !60
  br label %26, !dbg !60

26:                                               ; preds = %24, %2
  call void @llvm.dbg.declare(metadata ptr %12, metadata !61, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %13, metadata !64, metadata !DIExpression()), !dbg !65
  %27 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !66
  store ptr %27, ptr %13, align 8, !dbg !65
  %28 = load ptr, ptr %13, align 8, !dbg !67
  %29 = call i32 @MPI_Win_create(ptr noundef %28, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %12), !dbg !68
  %30 = load i32, ptr %7, align 4, !dbg !69
  %31 = icmp eq i32 %30, 0, !dbg !71
  br i1 %31, label %32, label %52, !dbg !72

32:                                               ; preds = %26
  %33 = load i32, ptr %12, align 4, !dbg !73
  %34 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %33), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %14, metadata !76, metadata !DIExpression()), !dbg !77
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !78
  store ptr %35, ptr %14, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata ptr %15, metadata !79, metadata !DIExpression()), !dbg !80
  %36 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !81
  store ptr %36, ptr %15, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata ptr %16, metadata !82, metadata !DIExpression()), !dbg !83
  %37 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !84
  store ptr %37, ptr %16, align 8, !dbg !83
  %38 = load ptr, ptr %14, align 8, !dbg !85
  %39 = load ptr, ptr %16, align 8, !dbg !86
  %40 = load ptr, ptr %15, align 8, !dbg !87
  %41 = load i32, ptr %12, align 4, !dbg !88
  %42 = call i32 @MPI_Compare_and_swap(ptr noundef %38, ptr noundef %39, ptr noundef %40, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef %41), !dbg !89
  call void @llvm.dbg.declare(metadata ptr %17, metadata !90, metadata !DIExpression()), !dbg !91
  %43 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !92
  store ptr %43, ptr %17, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata ptr %18, metadata !93, metadata !DIExpression()), !dbg !94
  %44 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !95
  store ptr %44, ptr %18, align 8, !dbg !94
  %45 = load ptr, ptr %14, align 8, !dbg !96
  %46 = load ptr, ptr %18, align 8, !dbg !97
  %47 = load ptr, ptr %17, align 8, !dbg !98
  %48 = load i32, ptr %12, align 4, !dbg !99
  %49 = call i32 @MPI_Compare_and_swap(ptr noundef %45, ptr noundef %46, ptr noundef %47, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef %48), !dbg !100
  %50 = load i32, ptr %12, align 4, !dbg !101
  %51 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %50), !dbg !102
  br label %52, !dbg !103

52:                                               ; preds = %32, %26
  %53 = call i32 @MPI_Win_free(ptr noundef %12), !dbg !104
  %54 = call i32 @MPI_Finalize(), !dbg !105
  %55 = load i32, ptr %7, align 4, !dbg !106
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %55), !dbg !107
  ret i32 0, !dbg !108
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

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 35, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-compare_and_swap_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "b5ca1fca11efa92894d86fafad4209b8")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !21, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockflush-compare_and_swap_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "b5ca1fca11efa92894d86fafad4209b8")
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
!49 = !DILocalVariable(name: "int_2", scope: !31, file: !2, line: 27, type: !17)
!50 = !DILocation(line: 27, column: 7, scope: !31)
!51 = !DILocalVariable(name: "int_3", scope: !31, file: !2, line: 28, type: !17)
!52 = !DILocation(line: 28, column: 7, scope: !31)
!53 = !DILocation(line: 30, column: 3, scope: !31)
!54 = !DILocation(line: 31, column: 3, scope: !31)
!55 = !DILocation(line: 32, column: 3, scope: !31)
!56 = !DILocation(line: 33, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !31, file: !2, line: 33, column: 7)
!58 = !DILocation(line: 33, column: 14, scope: !57)
!59 = !DILocation(line: 33, column: 7, scope: !31)
!60 = !DILocation(line: 34, column: 5, scope: !57)
!61 = !DILocalVariable(name: "mpi_win_0", scope: !31, file: !2, line: 37, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!63 = !DILocation(line: 37, column: 11, scope: !31)
!64 = !DILocalVariable(name: "winbuf", scope: !31, file: !2, line: 39, type: !18)
!65 = !DILocation(line: 39, column: 8, scope: !31)
!66 = !DILocation(line: 39, column: 24, scope: !31)
!67 = !DILocation(line: 41, column: 18, scope: !31)
!68 = !DILocation(line: 41, column: 3, scope: !31)
!69 = !DILocation(line: 43, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !31, file: !2, line: 43, column: 7)
!71 = !DILocation(line: 43, column: 12, scope: !70)
!72 = !DILocation(line: 43, column: 7, scope: !31)
!73 = !DILocation(line: 44, column: 44, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !2, line: 43, column: 18)
!75 = !DILocation(line: 44, column: 5, scope: !74)
!76 = !DILocalVariable(name: "buf", scope: !74, file: !2, line: 46, type: !18)
!77 = !DILocation(line: 46, column: 10, scope: !74)
!78 = !DILocation(line: 46, column: 23, scope: !74)
!79 = !DILocalVariable(name: "int_0", scope: !74, file: !2, line: 48, type: !18)
!80 = !DILocation(line: 48, column: 10, scope: !74)
!81 = !DILocation(line: 48, column: 25, scope: !74)
!82 = !DILocalVariable(name: "int_1", scope: !74, file: !2, line: 50, type: !18)
!83 = !DILocation(line: 50, column: 10, scope: !74)
!84 = !DILocation(line: 50, column: 25, scope: !74)
!85 = !DILocation(line: 52, column: 26, scope: !74)
!86 = !DILocation(line: 52, column: 31, scope: !74)
!87 = !DILocation(line: 52, column: 38, scope: !74)
!88 = !DILocation(line: 52, column: 60, scope: !74)
!89 = !DILocation(line: 52, column: 5, scope: !74)
!90 = !DILocalVariable(name: "int_2", scope: !74, file: !2, line: 54, type: !18)
!91 = !DILocation(line: 54, column: 10, scope: !74)
!92 = !DILocation(line: 54, column: 25, scope: !74)
!93 = !DILocalVariable(name: "int_3", scope: !74, file: !2, line: 56, type: !18)
!94 = !DILocation(line: 56, column: 10, scope: !74)
!95 = !DILocation(line: 56, column: 25, scope: !74)
!96 = !DILocation(line: 58, column: 26, scope: !74)
!97 = !DILocation(line: 58, column: 31, scope: !74)
!98 = !DILocation(line: 58, column: 38, scope: !74)
!99 = !DILocation(line: 58, column: 61, scope: !74)
!100 = !DILocation(line: 58, column: 5, scope: !74)
!101 = !DILocation(line: 59, column: 23, scope: !74)
!102 = !DILocation(line: 59, column: 5, scope: !74)
!103 = !DILocation(line: 60, column: 3, scope: !74)
!104 = !DILocation(line: 61, column: 3, scope: !31)
!105 = !DILocation(line: 63, column: 3, scope: !31)
!106 = !DILocation(line: 64, column: 41, scope: !31)
!107 = !DILocation(line: 64, column: 3, scope: !31)
!108 = !DILocation(line: 65, column: 3, scope: !31)
