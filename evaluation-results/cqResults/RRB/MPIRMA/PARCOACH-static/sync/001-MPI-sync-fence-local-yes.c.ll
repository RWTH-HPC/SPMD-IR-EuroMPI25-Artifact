; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/sync/001-MPI-sync-fence-local-yes.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/sync/001-MPI-sync-fence-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata ptr %8, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %9, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %10, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 1, ptr %10, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %11, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 2, ptr %11, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %12, metadata !54, metadata !DIExpression()), !dbg !55
  store ptr %10, ptr %12, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %13, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %14, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 42, ptr %14, align 4, !dbg !59
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !60
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !61
  %18 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !62
  %19 = load i32, ptr %7, align 4, !dbg !63
  %20 = icmp ne i32 %19, 2, !dbg !65
  br i1 %20, label %21, label %25, !dbg !66

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !67
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22, i32 noundef 2), !dbg !69
  %24 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !70
  br label %25, !dbg !71

25:                                               ; preds = %21, %2
  %26 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %15, metadata !73, metadata !DIExpression()), !dbg !75
  store i32 0, ptr %15, align 4, !dbg !75
  br label %27, !dbg !76

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !77
  %29 = icmp slt i32 %28, 10, !dbg !79
  br i1 %29, label %30, label %38, !dbg !80

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !81
  %32 = load i32, ptr %15, align 4, !dbg !83
  %33 = sext i32 %32 to i64, !dbg !81
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !81
  store i32 0, ptr %34, align 4, !dbg !84
  br label %35, !dbg !85

35:                                               ; preds = %30
  %36 = load i32, ptr %15, align 4, !dbg !86
  %37 = add nsw i32 %36, 1, !dbg !86
  store i32 %37, ptr %15, align 4, !dbg !86
  br label %27, !dbg !87, !llvm.loop !88

38:                                               ; preds = %27
  %39 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !91
  %40 = load i32, ptr %8, align 4, !dbg !92
  %41 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %40), !dbg !93
  %42 = load i32, ptr %6, align 4, !dbg !94
  %43 = icmp eq i32 %42, 0, !dbg !96
  br i1 %43, label %44, label %47, !dbg !97

44:                                               ; preds = %38
  %45 = load i32, ptr %8, align 4, !dbg !98
  %46 = call i32 @MPI_Put(ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %45), !dbg !100
  store i32 42, ptr %10, align 4, !dbg !101
  br label %47, !dbg !102

47:                                               ; preds = %44, %38
  %48 = load i32, ptr %8, align 4, !dbg !103
  %49 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %48), !dbg !104
  %50 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !105
  %51 = load i32, ptr %6, align 4, !dbg !106
  %52 = load ptr, ptr %12, align 8, !dbg !107
  %53 = load i32, ptr %52, align 4, !dbg !108
  %54 = load i32, ptr %11, align 4, !dbg !109
  %55 = load ptr, ptr %9, align 8, !dbg !110
  %56 = getelementptr inbounds i32, ptr %55, i64 0, !dbg !110
  %57 = load i32, ptr %56, align 4, !dbg !110
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %51, i32 noundef %53, i32 noundef %54, i32 noundef %57), !dbg !111
  %59 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !112
  %60 = call i32 @MPI_Finalize(), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/sync/001-MPI-sync-fence-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1e8c98e4f7e6094192fe7c3df97c659f")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/sync/001-MPI-sync-fence-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1e8c98e4f7e6094192fe7c3df97c659f")
!14 = !{!15, !18, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!20 = !{!0, !7}
!21 = !{i32 7, !"Dwarf Version", i32 5}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"openmp", i32 50}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Debian clang version 15.0.6"}
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !31, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 12, type: !17)
!37 = !DILocation(line: 12, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 12, type: !33)
!39 = !DILocation(line: 12, column: 27, scope: !30)
!40 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 14, type: !17)
!41 = !DILocation(line: 14, column: 9, scope: !30)
!42 = !DILocalVariable(name: "size", scope: !30, file: !2, line: 14, type: !17)
!43 = !DILocation(line: 14, column: 15, scope: !30)
!44 = !DILocalVariable(name: "win", scope: !30, file: !2, line: 15, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!46 = !DILocation(line: 15, column: 13, scope: !30)
!47 = !DILocalVariable(name: "win_base", scope: !30, file: !2, line: 16, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!49 = !DILocation(line: 16, column: 10, scope: !30)
!50 = !DILocalVariable(name: "value", scope: !30, file: !2, line: 17, type: !17)
!51 = !DILocation(line: 17, column: 9, scope: !30)
!52 = !DILocalVariable(name: "value2", scope: !30, file: !2, line: 17, type: !17)
!53 = !DILocation(line: 17, column: 20, scope: !30)
!54 = !DILocalVariable(name: "buf", scope: !30, file: !2, line: 18, type: !48)
!55 = !DILocation(line: 18, column: 10, scope: !30)
!56 = !DILocalVariable(name: "result", scope: !30, file: !2, line: 19, type: !17)
!57 = !DILocation(line: 19, column: 9, scope: !30)
!58 = !DILocalVariable(name: "token", scope: !30, file: !2, line: 20, type: !17)
!59 = !DILocation(line: 20, column: 9, scope: !30)
!60 = !DILocation(line: 22, column: 5, scope: !30)
!61 = !DILocation(line: 23, column: 5, scope: !30)
!62 = !DILocation(line: 24, column: 5, scope: !30)
!63 = !DILocation(line: 26, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !30, file: !2, line: 26, column: 9)
!65 = !DILocation(line: 26, column: 14, scope: !64)
!66 = !DILocation(line: 26, column: 9, scope: !30)
!67 = !DILocation(line: 27, column: 69, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !2, line: 26, column: 27)
!69 = !DILocation(line: 27, column: 9, scope: !68)
!70 = !DILocation(line: 28, column: 9, scope: !68)
!71 = !DILocation(line: 29, column: 5, scope: !68)
!72 = !DILocation(line: 31, column: 5, scope: !30)
!73 = !DILocalVariable(name: "i", scope: !74, file: !2, line: 32, type: !17)
!74 = distinct !DILexicalBlock(scope: !30, file: !2, line: 32, column: 5)
!75 = !DILocation(line: 32, column: 14, scope: !74)
!76 = !DILocation(line: 32, column: 10, scope: !74)
!77 = !DILocation(line: 32, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !2, line: 32, column: 5)
!79 = !DILocation(line: 32, column: 23, scope: !78)
!80 = !DILocation(line: 32, column: 5, scope: !74)
!81 = !DILocation(line: 33, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 32, column: 40)
!83 = !DILocation(line: 33, column: 18, scope: !82)
!84 = !DILocation(line: 33, column: 21, scope: !82)
!85 = !DILocation(line: 34, column: 5, scope: !82)
!86 = !DILocation(line: 32, column: 36, scope: !78)
!87 = !DILocation(line: 32, column: 5, scope: !78)
!88 = distinct !{!88, !80, !89, !90}
!89 = !DILocation(line: 34, column: 5, scope: !74)
!90 = !{!"llvm.loop.mustprogress"}
!91 = !DILocation(line: 36, column: 5, scope: !30)
!92 = !DILocation(line: 38, column: 22, scope: !30)
!93 = !DILocation(line: 38, column: 5, scope: !30)
!94 = !DILocation(line: 39, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !30, file: !2, line: 39, column: 9)
!96 = !DILocation(line: 39, column: 14, scope: !95)
!97 = !DILocation(line: 39, column: 9, scope: !30)
!98 = !DILocation(line: 42, column: 55, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !2, line: 39, column: 20)
!100 = !DILocation(line: 42, column: 9, scope: !99)
!101 = !DILocation(line: 44, column: 15, scope: !99)
!102 = !DILocation(line: 45, column: 5, scope: !99)
!103 = !DILocation(line: 46, column: 22, scope: !30)
!104 = !DILocation(line: 46, column: 5, scope: !30)
!105 = !DILocation(line: 48, column: 5, scope: !30)
!106 = !DILocation(line: 51, column: 9, scope: !30)
!107 = !DILocation(line: 52, column: 10, scope: !30)
!108 = !DILocation(line: 52, column: 9, scope: !30)
!109 = !DILocation(line: 53, column: 9, scope: !30)
!110 = !DILocation(line: 54, column: 9, scope: !30)
!111 = !DILocation(line: 49, column: 5, scope: !30)
!112 = !DILocation(line: 56, column: 5, scope: !30)
!113 = !DILocation(line: 57, column: 5, scope: !30)
!114 = !DILocation(line: 59, column: 5, scope: !30)
