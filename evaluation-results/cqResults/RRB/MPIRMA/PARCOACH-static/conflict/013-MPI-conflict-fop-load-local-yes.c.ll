; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/conflict/013-MPI-conflict-fop-load-local-yes.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/conflict/013-MPI-conflict-fop-load-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [13 x i8] c"value is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !42, metadata !DIExpression()), !dbg !43
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata ptr %6, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %7, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %8, metadata !50, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %9, metadata !53, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %10, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 1, ptr %10, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 2, ptr %11, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %12, metadata !60, metadata !DIExpression()), !dbg !61
  store ptr %10, ptr %12, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata ptr %13, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %14, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 42, ptr %14, align 4, !dbg !65
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !66
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !67
  %18 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !68
  %19 = load i32, ptr %7, align 4, !dbg !69
  %20 = icmp ne i32 %19, 2, !dbg !71
  br i1 %20, label %21, label %25, !dbg !72

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !73
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22, i32 noundef 2), !dbg !75
  %24 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !76
  br label %25, !dbg !77

25:                                               ; preds = %21, %2
  %26 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !78
  call void @llvm.dbg.declare(metadata ptr %15, metadata !79, metadata !DIExpression()), !dbg !81
  store i32 0, ptr %15, align 4, !dbg !81
  br label %27, !dbg !82

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !83
  %29 = icmp slt i32 %28, 10, !dbg !85
  br i1 %29, label %30, label %38, !dbg !86

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !87
  %32 = load i32, ptr %15, align 4, !dbg !89
  %33 = sext i32 %32 to i64, !dbg !87
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !87
  store i32 0, ptr %34, align 4, !dbg !90
  br label %35, !dbg !91

35:                                               ; preds = %30
  %36 = load i32, ptr %15, align 4, !dbg !92
  %37 = add nsw i32 %36, 1, !dbg !92
  store i32 %37, ptr %15, align 4, !dbg !92
  br label %27, !dbg !93, !llvm.loop !94

38:                                               ; preds = %27
  %39 = load i32, ptr %8, align 4, !dbg !97
  %40 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %39), !dbg !98
  %41 = load i32, ptr %6, align 4, !dbg !99
  %42 = icmp eq i32 %41, 0, !dbg !101
  br i1 %42, label %43, label %48, !dbg !102

43:                                               ; preds = %38
  %44 = load i32, ptr %8, align 4, !dbg !103
  %45 = call i32 @MPI_Fetch_and_op(ptr noundef %11, ptr noundef %10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1476395011, i32 noundef %44), !dbg !105
  %46 = load i32, ptr %10, align 4, !dbg !106
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %46), !dbg !107
  br label %48, !dbg !108

48:                                               ; preds = %43, %38
  %49 = load i32, ptr %8, align 4, !dbg !109
  %50 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %49), !dbg !110
  %51 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !111
  %52 = load i32, ptr %6, align 4, !dbg !112
  %53 = load ptr, ptr %12, align 8, !dbg !113
  %54 = load i32, ptr %53, align 4, !dbg !114
  %55 = load i32, ptr %11, align 4, !dbg !115
  %56 = load ptr, ptr %9, align 8, !dbg !116
  %57 = getelementptr inbounds i32, ptr %56, i64 0, !dbg !116
  %58 = load i32, ptr %57, align 4, !dbg !116
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %52, i32 noundef %54, i32 noundef %55, i32 noundef %58), !dbg !117
  %60 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !118
  %61 = call i32 @MPI_Finalize(), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Fetch_and_op(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/conflict/013-MPI-conflict-fop-load-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e7282d47a1c78f42ebd2a7b63b62fba4")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 13)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !26, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/conflict/013-MPI-conflict-fop-load-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e7282d47a1c78f42ebd2a7b63b62fba4")
!19 = !{!20, !23, !24, !25}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !21, line: 303, baseType: !22)
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
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !37, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !41)
!37 = !DISubroutineType(types: !38)
!38 = !{!22, !22, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!41 = !{}
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 12, type: !22)
!43 = !DILocation(line: 12, column: 14, scope: !36)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 12, type: !39)
!45 = !DILocation(line: 12, column: 27, scope: !36)
!46 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 14, type: !22)
!47 = !DILocation(line: 14, column: 9, scope: !36)
!48 = !DILocalVariable(name: "size", scope: !36, file: !2, line: 14, type: !22)
!49 = !DILocation(line: 14, column: 15, scope: !36)
!50 = !DILocalVariable(name: "win", scope: !36, file: !2, line: 15, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!52 = !DILocation(line: 15, column: 13, scope: !36)
!53 = !DILocalVariable(name: "win_base", scope: !36, file: !2, line: 16, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!55 = !DILocation(line: 16, column: 10, scope: !36)
!56 = !DILocalVariable(name: "value", scope: !36, file: !2, line: 17, type: !22)
!57 = !DILocation(line: 17, column: 9, scope: !36)
!58 = !DILocalVariable(name: "value2", scope: !36, file: !2, line: 17, type: !22)
!59 = !DILocation(line: 17, column: 20, scope: !36)
!60 = !DILocalVariable(name: "buf", scope: !36, file: !2, line: 18, type: !54)
!61 = !DILocation(line: 18, column: 10, scope: !36)
!62 = !DILocalVariable(name: "result", scope: !36, file: !2, line: 19, type: !22)
!63 = !DILocation(line: 19, column: 9, scope: !36)
!64 = !DILocalVariable(name: "token", scope: !36, file: !2, line: 20, type: !22)
!65 = !DILocation(line: 20, column: 9, scope: !36)
!66 = !DILocation(line: 22, column: 5, scope: !36)
!67 = !DILocation(line: 23, column: 5, scope: !36)
!68 = !DILocation(line: 24, column: 5, scope: !36)
!69 = !DILocation(line: 26, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !36, file: !2, line: 26, column: 9)
!71 = !DILocation(line: 26, column: 14, scope: !70)
!72 = !DILocation(line: 26, column: 9, scope: !36)
!73 = !DILocation(line: 27, column: 69, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !2, line: 26, column: 27)
!75 = !DILocation(line: 27, column: 9, scope: !74)
!76 = !DILocation(line: 28, column: 9, scope: !74)
!77 = !DILocation(line: 29, column: 5, scope: !74)
!78 = !DILocation(line: 31, column: 5, scope: !36)
!79 = !DILocalVariable(name: "i", scope: !80, file: !2, line: 32, type: !22)
!80 = distinct !DILexicalBlock(scope: !36, file: !2, line: 32, column: 5)
!81 = !DILocation(line: 32, column: 14, scope: !80)
!82 = !DILocation(line: 32, column: 10, scope: !80)
!83 = !DILocation(line: 32, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !2, line: 32, column: 5)
!85 = !DILocation(line: 32, column: 23, scope: !84)
!86 = !DILocation(line: 32, column: 5, scope: !80)
!87 = !DILocation(line: 33, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !2, line: 32, column: 40)
!89 = !DILocation(line: 33, column: 18, scope: !88)
!90 = !DILocation(line: 33, column: 21, scope: !88)
!91 = !DILocation(line: 34, column: 5, scope: !88)
!92 = !DILocation(line: 32, column: 36, scope: !84)
!93 = !DILocation(line: 32, column: 5, scope: !84)
!94 = distinct !{!94, !86, !95, !96}
!95 = !DILocation(line: 34, column: 5, scope: !80)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 36, column: 22, scope: !36)
!98 = !DILocation(line: 36, column: 5, scope: !36)
!99 = !DILocation(line: 37, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !36, file: !2, line: 37, column: 9)
!101 = !DILocation(line: 37, column: 14, scope: !100)
!102 = !DILocation(line: 37, column: 9, scope: !36)
!103 = !DILocation(line: 39, column: 67, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 37, column: 20)
!105 = !DILocation(line: 39, column: 9, scope: !104)
!106 = !DILocation(line: 41, column: 33, scope: !104)
!107 = !DILocation(line: 41, column: 9, scope: !104)
!108 = !DILocation(line: 42, column: 5, scope: !104)
!109 = !DILocation(line: 43, column: 22, scope: !36)
!110 = !DILocation(line: 43, column: 5, scope: !36)
!111 = !DILocation(line: 45, column: 5, scope: !36)
!112 = !DILocation(line: 48, column: 9, scope: !36)
!113 = !DILocation(line: 49, column: 10, scope: !36)
!114 = !DILocation(line: 49, column: 9, scope: !36)
!115 = !DILocation(line: 50, column: 9, scope: !36)
!116 = !DILocation(line: 51, column: 9, scope: !36)
!117 = !DILocation(line: 46, column: 5, scope: !36)
!118 = !DILocation(line: 53, column: 5, scope: !36)
!119 = !DILocation(line: 54, column: 5, scope: !36)
!120 = !DILocation(line: 56, column: 5, scope: !36)
