; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/004-MPI-static-get-load-aliasing-local-yes.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/004-MPI-static-get-load-aliasing-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"*buf_alias is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @aliasgenerator(ptr noundef %0, ptr noundef %1) #0 !dbg !35 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !41, metadata !DIExpression()), !dbg !42
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  %5 = load ptr, ptr %3, align 8, !dbg !45
  %6 = load ptr, ptr %5, align 8, !dbg !46
  %7 = load ptr, ptr %4, align 8, !dbg !47
  store ptr %6, ptr %7, align 8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !50 {
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
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !55, metadata !DIExpression()), !dbg !56
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %6, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata ptr %7, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %8, metadata !63, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata ptr %9, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %10, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 1, ptr %10, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata ptr %11, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 2, ptr %11, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata ptr %12, metadata !72, metadata !DIExpression()), !dbg !73
  store ptr %10, ptr %12, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata ptr %13, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %14, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 42, ptr %14, align 4, !dbg !77
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !78
  %19 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !79
  %20 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !80
  %21 = load i32, ptr %7, align 4, !dbg !81
  %22 = icmp ne i32 %21, 2, !dbg !83
  br i1 %22, label %23, label %27, !dbg !84

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !85
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !87
  %26 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !88
  br label %27, !dbg !89

27:                                               ; preds = %23, %2
  %28 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !90
  call void @llvm.dbg.declare(metadata ptr %15, metadata !91, metadata !DIExpression()), !dbg !93
  store i32 0, ptr %15, align 4, !dbg !93
  br label %29, !dbg !94

29:                                               ; preds = %37, %27
  %30 = load i32, ptr %15, align 4, !dbg !95
  %31 = icmp slt i32 %30, 10, !dbg !97
  br i1 %31, label %32, label %40, !dbg !98

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !99
  %34 = load i32, ptr %15, align 4, !dbg !101
  %35 = sext i32 %34 to i64, !dbg !99
  %36 = getelementptr inbounds i32, ptr %33, i64 %35, !dbg !99
  store i32 0, ptr %36, align 4, !dbg !102
  br label %37, !dbg !103

37:                                               ; preds = %32
  %38 = load i32, ptr %15, align 4, !dbg !104
  %39 = add nsw i32 %38, 1, !dbg !104
  store i32 %39, ptr %15, align 4, !dbg !104
  br label %29, !dbg !105, !llvm.loop !106

40:                                               ; preds = %29
  %41 = load i32, ptr %8, align 4, !dbg !109
  %42 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %41), !dbg !110
  call void @llvm.dbg.declare(metadata ptr %16, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata ptr %17, metadata !113, metadata !DIExpression()), !dbg !114
  call void @aliasgenerator(ptr noundef %12, ptr noundef %16), !dbg !115
  call void @aliasgenerator(ptr noundef %9, ptr noundef %17), !dbg !116
  %43 = load i32, ptr %6, align 4, !dbg !117
  %44 = icmp eq i32 %43, 0, !dbg !119
  br i1 %44, label %45, label %52, !dbg !120

45:                                               ; preds = %40
  %46 = load ptr, ptr %12, align 8, !dbg !121
  %47 = load i32, ptr %8, align 4, !dbg !123
  %48 = call i32 @MPI_Get(ptr noundef %46, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %47), !dbg !124
  %49 = load ptr, ptr %16, align 8, !dbg !125
  %50 = load i32, ptr %49, align 4, !dbg !126
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %50), !dbg !127
  br label %52, !dbg !128

52:                                               ; preds = %45, %40
  %53 = load i32, ptr %8, align 4, !dbg !129
  %54 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %53), !dbg !130
  %55 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !131
  %56 = load i32, ptr %6, align 4, !dbg !132
  %57 = load ptr, ptr %12, align 8, !dbg !133
  %58 = load i32, ptr %57, align 4, !dbg !134
  %59 = load i32, ptr %11, align 4, !dbg !135
  %60 = load ptr, ptr %9, align 8, !dbg !136
  %61 = getelementptr inbounds i32, ptr %60, i64 0, !dbg !136
  %62 = load i32, ptr %61, align 4, !dbg !136
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %56, i32 noundef %58, i32 noundef %59, i32 noundef %62), !dbg !137
  %64 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !138
  %65 = call i32 @MPI_Finalize(), !dbg !139
  ret i32 0, !dbg !140
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/004-MPI-static-get-load-aliasing-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f08b67cfb3c09515dc58fd6c23dc6f0d")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 51, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 18)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/004-MPI-static-get-load-aliasing-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f08b67cfb3c09515dc58fd6c23dc6f0d")
!19 = !{!20, !23, !24}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!25 = !{!0, !7, !12}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"openmp", i32 50}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"PIE Level", i32 2}
!32 = !{i32 7, !"uwtable", i32 2}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = !{!"Debian clang version 15.0.6"}
!35 = distinct !DISubprogram(name: "aliasgenerator", scope: !2, file: !2, line: 9, type: !36, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!40 = !{}
!41 = !DILocalVariable(name: "x", arg: 1, scope: !35, file: !2, line: 9, type: !38)
!42 = !DILocation(line: 9, column: 53, scope: !35)
!43 = !DILocalVariable(name: "y", arg: 2, scope: !35, file: !2, line: 9, type: !38)
!44 = !DILocation(line: 9, column: 62, scope: !35)
!45 = !DILocation(line: 9, column: 73, scope: !35)
!46 = !DILocation(line: 9, column: 72, scope: !35)
!47 = !DILocation(line: 9, column: 68, scope: !35)
!48 = !DILocation(line: 9, column: 70, scope: !35)
!49 = !DILocation(line: 9, column: 76, scope: !35)
!50 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !51, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!51 = !DISubroutineType(types: !52)
!52 = !{!22, !22, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !2, line: 14, type: !22)
!56 = !DILocation(line: 14, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !2, line: 14, type: !53)
!58 = !DILocation(line: 14, column: 27, scope: !50)
!59 = !DILocalVariable(name: "rank", scope: !50, file: !2, line: 16, type: !22)
!60 = !DILocation(line: 16, column: 9, scope: !50)
!61 = !DILocalVariable(name: "size", scope: !50, file: !2, line: 16, type: !22)
!62 = !DILocation(line: 16, column: 15, scope: !50)
!63 = !DILocalVariable(name: "win", scope: !50, file: !2, line: 17, type: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!65 = !DILocation(line: 17, column: 13, scope: !50)
!66 = !DILocalVariable(name: "win_base", scope: !50, file: !2, line: 18, type: !39)
!67 = !DILocation(line: 18, column: 10, scope: !50)
!68 = !DILocalVariable(name: "value", scope: !50, file: !2, line: 19, type: !22)
!69 = !DILocation(line: 19, column: 9, scope: !50)
!70 = !DILocalVariable(name: "value2", scope: !50, file: !2, line: 19, type: !22)
!71 = !DILocation(line: 19, column: 20, scope: !50)
!72 = !DILocalVariable(name: "buf", scope: !50, file: !2, line: 20, type: !39)
!73 = !DILocation(line: 20, column: 10, scope: !50)
!74 = !DILocalVariable(name: "result", scope: !50, file: !2, line: 21, type: !22)
!75 = !DILocation(line: 21, column: 9, scope: !50)
!76 = !DILocalVariable(name: "token", scope: !50, file: !2, line: 22, type: !22)
!77 = !DILocation(line: 22, column: 9, scope: !50)
!78 = !DILocation(line: 24, column: 5, scope: !50)
!79 = !DILocation(line: 25, column: 5, scope: !50)
!80 = !DILocation(line: 26, column: 5, scope: !50)
!81 = !DILocation(line: 28, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !50, file: !2, line: 28, column: 9)
!83 = !DILocation(line: 28, column: 14, scope: !82)
!84 = !DILocation(line: 28, column: 9, scope: !50)
!85 = !DILocation(line: 29, column: 69, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 28, column: 27)
!87 = !DILocation(line: 29, column: 9, scope: !86)
!88 = !DILocation(line: 30, column: 9, scope: !86)
!89 = !DILocation(line: 31, column: 5, scope: !86)
!90 = !DILocation(line: 33, column: 5, scope: !50)
!91 = !DILocalVariable(name: "i", scope: !92, file: !2, line: 34, type: !22)
!92 = distinct !DILexicalBlock(scope: !50, file: !2, line: 34, column: 5)
!93 = !DILocation(line: 34, column: 14, scope: !92)
!94 = !DILocation(line: 34, column: 10, scope: !92)
!95 = !DILocation(line: 34, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 34, column: 5)
!97 = !DILocation(line: 34, column: 23, scope: !96)
!98 = !DILocation(line: 34, column: 5, scope: !92)
!99 = !DILocation(line: 35, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !2, line: 34, column: 40)
!101 = !DILocation(line: 35, column: 18, scope: !100)
!102 = !DILocation(line: 35, column: 21, scope: !100)
!103 = !DILocation(line: 36, column: 5, scope: !100)
!104 = !DILocation(line: 34, column: 36, scope: !96)
!105 = !DILocation(line: 34, column: 5, scope: !96)
!106 = distinct !{!106, !98, !107, !108}
!107 = !DILocation(line: 36, column: 5, scope: !92)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 38, column: 22, scope: !50)
!110 = !DILocation(line: 38, column: 5, scope: !50)
!111 = !DILocalVariable(name: "buf_alias", scope: !50, file: !2, line: 40, type: !39)
!112 = !DILocation(line: 40, column: 10, scope: !50)
!113 = !DILocalVariable(name: "win_base_alias", scope: !50, file: !2, line: 41, type: !39)
!114 = !DILocation(line: 41, column: 10, scope: !50)
!115 = !DILocation(line: 43, column: 5, scope: !50)
!116 = !DILocation(line: 44, column: 5, scope: !50)
!117 = !DILocation(line: 46, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !50, file: !2, line: 46, column: 9)
!119 = !DILocation(line: 46, column: 14, scope: !118)
!120 = !DILocation(line: 46, column: 9, scope: !50)
!121 = !DILocation(line: 49, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !2, line: 46, column: 20)
!123 = !DILocation(line: 49, column: 52, scope: !122)
!124 = !DILocation(line: 49, column: 9, scope: !122)
!125 = !DILocation(line: 51, column: 39, scope: !122)
!126 = !DILocation(line: 51, column: 38, scope: !122)
!127 = !DILocation(line: 51, column: 9, scope: !122)
!128 = !DILocation(line: 52, column: 5, scope: !122)
!129 = !DILocation(line: 54, column: 22, scope: !50)
!130 = !DILocation(line: 54, column: 5, scope: !50)
!131 = !DILocation(line: 56, column: 5, scope: !50)
!132 = !DILocation(line: 59, column: 9, scope: !50)
!133 = !DILocation(line: 60, column: 10, scope: !50)
!134 = !DILocation(line: 60, column: 9, scope: !50)
!135 = !DILocation(line: 61, column: 9, scope: !50)
!136 = !DILocation(line: 62, column: 9, scope: !50)
!137 = !DILocation(line: 57, column: 5, scope: !50)
!138 = !DILocation(line: 64, column: 5, scope: !50)
!139 = !DILocation(line: 65, column: 5, scope: !50)
!140 = !DILocation(line: 67, column: 5, scope: !50)
