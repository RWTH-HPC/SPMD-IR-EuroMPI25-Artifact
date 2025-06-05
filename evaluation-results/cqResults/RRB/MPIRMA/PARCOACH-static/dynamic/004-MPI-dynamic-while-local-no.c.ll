; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/dynamic/004-MPI-dynamic-while-local-no.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/dynamic/004-MPI-dynamic-while-local-no.c"
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
  %16 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata ptr %15, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 10, ptr %15, align 4, !dbg !61
  %17 = load i32, ptr %4, align 4, !dbg !62
  %18 = icmp sgt i32 %17, 1, !dbg !64
  br i1 %18, label %19, label %24, !dbg !65

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8, !dbg !66
  %21 = getelementptr inbounds ptr, ptr %20, i64 1, !dbg !66
  %22 = load ptr, ptr %21, align 8, !dbg !66
  %23 = call i32 @atoi(ptr noundef %22) #4, !dbg !68
  store i32 %23, ptr %15, align 4, !dbg !69
  br label %24, !dbg !70

24:                                               ; preds = %19, %2
  %25 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !71
  %26 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !72
  %27 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !73
  %28 = load i32, ptr %7, align 4, !dbg !74
  %29 = icmp ne i32 %28, 2, !dbg !76
  br i1 %29, label %30, label %34, !dbg !77

30:                                               ; preds = %24
  %31 = load i32, ptr %7, align 4, !dbg !78
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %31, i32 noundef 2), !dbg !80
  %33 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !81
  br label %34, !dbg !82

34:                                               ; preds = %30, %24
  %35 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !83
  call void @llvm.dbg.declare(metadata ptr %16, metadata !84, metadata !DIExpression()), !dbg !86
  store i32 0, ptr %16, align 4, !dbg !86
  br label %36, !dbg !87

36:                                               ; preds = %44, %34
  %37 = load i32, ptr %16, align 4, !dbg !88
  %38 = icmp slt i32 %37, 10, !dbg !90
  br i1 %38, label %39, label %47, !dbg !91

39:                                               ; preds = %36
  %40 = load ptr, ptr %9, align 8, !dbg !92
  %41 = load i32, ptr %16, align 4, !dbg !94
  %42 = sext i32 %41 to i64, !dbg !92
  %43 = getelementptr inbounds i32, ptr %40, i64 %42, !dbg !92
  store i32 0, ptr %43, align 4, !dbg !95
  br label %44, !dbg !96

44:                                               ; preds = %39
  %45 = load i32, ptr %16, align 4, !dbg !97
  %46 = add nsw i32 %45, 1, !dbg !97
  store i32 %46, ptr %16, align 4, !dbg !97
  br label %36, !dbg !98, !llvm.loop !99

47:                                               ; preds = %36
  %48 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !102
  %49 = load i32, ptr %6, align 4, !dbg !103
  %50 = icmp eq i32 %49, 0, !dbg !105
  br i1 %50, label %51, label %74, !dbg !106

51:                                               ; preds = %47
  %52 = load i32, ptr %8, align 4, !dbg !107
  %53 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %52), !dbg !109
  br label %54, !dbg !110

54:                                               ; preds = %64, %51
  %55 = load i32, ptr %15, align 4, !dbg !111
  %56 = sub nsw i32 %55, 6, !dbg !112
  %57 = srem i32 %56, 3, !dbg !113
  %58 = icmp slt i32 %57, 2, !dbg !114
  br i1 %58, label %59, label %62, !dbg !115

59:                                               ; preds = %54
  %60 = load i32, ptr %10, align 4, !dbg !116
  %61 = icmp slt i32 %60, 9999, !dbg !117
  br label %62

62:                                               ; preds = %59, %54
  %63 = phi i1 [ false, %54 ], [ %61, %59 ], !dbg !118
  br i1 %63, label %64, label %71, !dbg !110

64:                                               ; preds = %62
  %65 = load i32, ptr %15, align 4, !dbg !119
  %66 = add nsw i32 %65, -1, !dbg !119
  store i32 %66, ptr %15, align 4, !dbg !119
  %67 = load i32, ptr %8, align 4, !dbg !121
  %68 = call i32 @MPI_Get(ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %67), !dbg !122
  %69 = load i32, ptr %8, align 4, !dbg !123
  %70 = call i32 @MPI_Win_flush(i32 noundef 1, i32 noundef %69), !dbg !124
  br label %54, !dbg !110, !llvm.loop !125

71:                                               ; preds = %62
  %72 = load i32, ptr %8, align 4, !dbg !127
  %73 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %72), !dbg !128
  br label %74, !dbg !129

74:                                               ; preds = %71, %47
  %75 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !130
  %76 = load i32, ptr %6, align 4, !dbg !131
  %77 = load ptr, ptr %12, align 8, !dbg !132
  %78 = load i32, ptr %77, align 4, !dbg !133
  %79 = load i32, ptr %11, align 4, !dbg !134
  %80 = load ptr, ptr %9, align 8, !dbg !135
  %81 = getelementptr inbounds i32, ptr %80, i64 0, !dbg !135
  %82 = load i32, ptr %81, align 4, !dbg !135
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %76, i32 noundef %78, i32 noundef %79, i32 noundef %82), !dbg !136
  %84 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !137
  %85 = call i32 @MPI_Finalize(), !dbg !138
  ret i32 0, !dbg !139
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #2

declare i32 @MPI_Init(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #3

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Barrier(i32 noundef) #3

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_flush(i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_free(ptr noundef) #3

declare i32 @MPI_Finalize() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/dynamic/004-MPI-dynamic-while-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7607f5665c0d4fec3861a653c4e8cf98")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/dynamic/004-MPI-dynamic-while-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7607f5665c0d4fec3861a653c4e8cf98")
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
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !31, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 13, type: !17)
!37 = !DILocation(line: 13, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 13, type: !33)
!39 = !DILocation(line: 13, column: 27, scope: !30)
!40 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 15, type: !17)
!41 = !DILocation(line: 15, column: 9, scope: !30)
!42 = !DILocalVariable(name: "size", scope: !30, file: !2, line: 15, type: !17)
!43 = !DILocation(line: 15, column: 15, scope: !30)
!44 = !DILocalVariable(name: "win", scope: !30, file: !2, line: 16, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!46 = !DILocation(line: 16, column: 13, scope: !30)
!47 = !DILocalVariable(name: "win_base", scope: !30, file: !2, line: 17, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!49 = !DILocation(line: 17, column: 10, scope: !30)
!50 = !DILocalVariable(name: "value", scope: !30, file: !2, line: 18, type: !17)
!51 = !DILocation(line: 18, column: 9, scope: !30)
!52 = !DILocalVariable(name: "value2", scope: !30, file: !2, line: 18, type: !17)
!53 = !DILocation(line: 18, column: 20, scope: !30)
!54 = !DILocalVariable(name: "buf", scope: !30, file: !2, line: 19, type: !48)
!55 = !DILocation(line: 19, column: 10, scope: !30)
!56 = !DILocalVariable(name: "result", scope: !30, file: !2, line: 20, type: !17)
!57 = !DILocation(line: 20, column: 9, scope: !30)
!58 = !DILocalVariable(name: "token", scope: !30, file: !2, line: 21, type: !17)
!59 = !DILocation(line: 21, column: 9, scope: !30)
!60 = !DILocalVariable(name: "ctrl", scope: !30, file: !2, line: 23, type: !17)
!61 = !DILocation(line: 23, column: 9, scope: !30)
!62 = !DILocation(line: 24, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !30, file: !2, line: 24, column: 9)
!64 = !DILocation(line: 24, column: 14, scope: !63)
!65 = !DILocation(line: 24, column: 9, scope: !30)
!66 = !DILocation(line: 25, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !2, line: 24, column: 19)
!68 = !DILocation(line: 25, column: 16, scope: !67)
!69 = !DILocation(line: 25, column: 14, scope: !67)
!70 = !DILocation(line: 26, column: 5, scope: !67)
!71 = !DILocation(line: 28, column: 5, scope: !30)
!72 = !DILocation(line: 29, column: 5, scope: !30)
!73 = !DILocation(line: 30, column: 5, scope: !30)
!74 = !DILocation(line: 32, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !30, file: !2, line: 32, column: 9)
!76 = !DILocation(line: 32, column: 14, scope: !75)
!77 = !DILocation(line: 32, column: 9, scope: !30)
!78 = !DILocation(line: 33, column: 69, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 32, column: 27)
!80 = !DILocation(line: 33, column: 9, scope: !79)
!81 = !DILocation(line: 34, column: 9, scope: !79)
!82 = !DILocation(line: 35, column: 5, scope: !79)
!83 = !DILocation(line: 37, column: 5, scope: !30)
!84 = !DILocalVariable(name: "i", scope: !85, file: !2, line: 38, type: !17)
!85 = distinct !DILexicalBlock(scope: !30, file: !2, line: 38, column: 5)
!86 = !DILocation(line: 38, column: 14, scope: !85)
!87 = !DILocation(line: 38, column: 10, scope: !85)
!88 = !DILocation(line: 38, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !2, line: 38, column: 5)
!90 = !DILocation(line: 38, column: 23, scope: !89)
!91 = !DILocation(line: 38, column: 5, scope: !85)
!92 = !DILocation(line: 39, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !2, line: 38, column: 40)
!94 = !DILocation(line: 39, column: 18, scope: !93)
!95 = !DILocation(line: 39, column: 21, scope: !93)
!96 = !DILocation(line: 40, column: 5, scope: !93)
!97 = !DILocation(line: 38, column: 36, scope: !89)
!98 = !DILocation(line: 38, column: 5, scope: !89)
!99 = distinct !{!99, !91, !100, !101}
!100 = !DILocation(line: 40, column: 5, scope: !85)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 42, column: 5, scope: !30)
!103 = !DILocation(line: 44, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !30, file: !2, line: 44, column: 9)
!105 = !DILocation(line: 44, column: 14, scope: !104)
!106 = !DILocation(line: 44, column: 9, scope: !30)
!107 = !DILocation(line: 45, column: 48, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !2, line: 44, column: 20)
!109 = !DILocation(line: 45, column: 9, scope: !108)
!110 = !DILocation(line: 46, column: 9, scope: !108)
!111 = !DILocation(line: 46, column: 17, scope: !108)
!112 = !DILocation(line: 46, column: 22, scope: !108)
!113 = !DILocation(line: 46, column: 27, scope: !108)
!114 = !DILocation(line: 46, column: 31, scope: !108)
!115 = !DILocation(line: 46, column: 35, scope: !108)
!116 = !DILocation(line: 46, column: 38, scope: !108)
!117 = !DILocation(line: 46, column: 44, scope: !108)
!118 = !DILocation(line: 0, scope: !108)
!119 = !DILocation(line: 47, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !2, line: 46, column: 52)
!121 = !DILocation(line: 48, column: 59, scope: !120)
!122 = !DILocation(line: 48, column: 13, scope: !120)
!123 = !DILocation(line: 49, column: 30, scope: !120)
!124 = !DILocation(line: 49, column: 13, scope: !120)
!125 = distinct !{!125, !110, !126, !101}
!126 = !DILocation(line: 50, column: 9, scope: !108)
!127 = !DILocation(line: 51, column: 27, scope: !108)
!128 = !DILocation(line: 51, column: 9, scope: !108)
!129 = !DILocation(line: 52, column: 5, scope: !108)
!130 = !DILocation(line: 54, column: 5, scope: !30)
!131 = !DILocation(line: 57, column: 9, scope: !30)
!132 = !DILocation(line: 58, column: 10, scope: !30)
!133 = !DILocation(line: 58, column: 9, scope: !30)
!134 = !DILocation(line: 59, column: 9, scope: !30)
!135 = !DILocation(line: 60, column: 9, scope: !30)
!136 = !DILocation(line: 55, column: 5, scope: !30)
!137 = !DILocation(line: 62, column: 5, scope: !30)
!138 = !DILocation(line: 63, column: 5, scope: !30)
!139 = !DILocation(line: 65, column: 5, scope: !30)
