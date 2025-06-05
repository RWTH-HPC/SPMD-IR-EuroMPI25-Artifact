; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/002-MPI-p2p-put-send-local-no.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/002-MPI-p2p-put-send-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !39 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !45, metadata !DIExpression()), !dbg !46
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %6, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %7, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %8, metadata !53, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 1, ptr %10, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %11, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 2, ptr %11, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata ptr %12, metadata !63, metadata !DIExpression()), !dbg !64
  store ptr %10, ptr %12, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %13, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %14, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 42, ptr %14, align 4, !dbg !68
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !69
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !70
  %18 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !71
  %19 = load i32, ptr %7, align 4, !dbg !72
  %20 = icmp ne i32 %19, 2, !dbg !74
  br i1 %20, label %21, label %25, !dbg !75

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !76
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22, i32 noundef 2), !dbg !78
  %24 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !79
  br label %25, !dbg !80

25:                                               ; preds = %21, %2
  %26 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !81
  call void @llvm.dbg.declare(metadata ptr %15, metadata !82, metadata !DIExpression()), !dbg !84
  store i32 0, ptr %15, align 4, !dbg !84
  br label %27, !dbg !85

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !86
  %29 = icmp slt i32 %28, 10, !dbg !88
  br i1 %29, label %30, label %38, !dbg !89

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !90
  %32 = load i32, ptr %15, align 4, !dbg !92
  %33 = sext i32 %32 to i64, !dbg !90
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !90
  store i32 0, ptr %34, align 4, !dbg !93
  br label %35, !dbg !94

35:                                               ; preds = %30
  %36 = load i32, ptr %15, align 4, !dbg !95
  %37 = add nsw i32 %36, 1, !dbg !95
  store i32 %37, ptr %15, align 4, !dbg !95
  br label %27, !dbg !96, !llvm.loop !97

38:                                               ; preds = %27
  %39 = load i32, ptr %8, align 4, !dbg !100
  %40 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %39), !dbg !101
  %41 = load i32, ptr %6, align 4, !dbg !102
  %42 = icmp eq i32 %41, 0, !dbg !104
  br i1 %42, label %43, label %47, !dbg !105

43:                                               ; preds = %38
  %44 = load i32, ptr %8, align 4, !dbg !106
  %45 = call i32 @MPI_Put(ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %44), !dbg !108
  %46 = call i32 @MPI_Send(ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i32 noundef 0, i32 noundef 1140850688), !dbg !109
  br label %47, !dbg !110

47:                                               ; preds = %43, %38
  %48 = load i32, ptr %6, align 4, !dbg !111
  %49 = icmp eq i32 %48, 1, !dbg !113
  br i1 %49, label %50, label %52, !dbg !114

50:                                               ; preds = %47
  %51 = call i32 @MPI_Recv(ptr noundef %11, i32 noundef 1, i32 noundef 1275069445, i32 noundef 0, i32 noundef -1, i32 noundef 1140850688, ptr noundef inttoptr (i64 1 to ptr)), !dbg !115
  br label %52, !dbg !117

52:                                               ; preds = %50, %47
  %53 = load i32, ptr %8, align 4, !dbg !118
  %54 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %53), !dbg !119
  %55 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !120
  %56 = load i32, ptr %6, align 4, !dbg !121
  %57 = load ptr, ptr %12, align 8, !dbg !122
  %58 = load i32, ptr %57, align 4, !dbg !123
  %59 = load i32, ptr %11, align 4, !dbg !124
  %60 = load ptr, ptr %9, align 8, !dbg !125
  %61 = getelementptr inbounds i32, ptr %60, i64 0, !dbg !125
  %62 = load i32, ptr %61, align 4, !dbg !125
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %56, i32 noundef %58, i32 noundef %59, i32 noundef %62), !dbg !126
  %64 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !127
  %65 = call i32 @MPI_Finalize(), !dbg !128
  ret i32 0, !dbg !129
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

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Send(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Recv(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!30, !31, !32, !33, !34, !35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/002-MPI-p2p-put-send-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7e2b6eaa45bcebfc59044a0a8c50f92b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !29, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/002-MPI-p2p-put-send-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7e2b6eaa45bcebfc59044a0a8c50f92b")
!14 = !{!15, !18, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !23)
!23 = !{!24, !25, !26, !27, !28}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !22, file: !16, line: 588, baseType: !17, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !22, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !22, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !22, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !22, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!29 = !{!0, !7}
!30 = !{i32 7, !"Dwarf Version", i32 5}
!31 = !{i32 2, !"Debug Info Version", i32 3}
!32 = !{i32 1, !"wchar_size", i32 4}
!33 = !{i32 7, !"openmp", i32 50}
!34 = !{i32 7, !"PIC Level", i32 2}
!35 = !{i32 7, !"PIE Level", i32 2}
!36 = !{i32 7, !"uwtable", i32 2}
!37 = !{i32 7, !"frame-pointer", i32 2}
!38 = !{!"Debian clang version 15.0.6"}
!39 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !40, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !44)
!40 = !DISubroutineType(types: !41)
!41 = !{!17, !17, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!44 = !{}
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !2, line: 12, type: !17)
!46 = !DILocation(line: 12, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !2, line: 12, type: !42)
!48 = !DILocation(line: 12, column: 27, scope: !39)
!49 = !DILocalVariable(name: "rank", scope: !39, file: !2, line: 14, type: !17)
!50 = !DILocation(line: 14, column: 9, scope: !39)
!51 = !DILocalVariable(name: "size", scope: !39, file: !2, line: 14, type: !17)
!52 = !DILocation(line: 14, column: 15, scope: !39)
!53 = !DILocalVariable(name: "win", scope: !39, file: !2, line: 15, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!55 = !DILocation(line: 15, column: 13, scope: !39)
!56 = !DILocalVariable(name: "win_base", scope: !39, file: !2, line: 16, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!58 = !DILocation(line: 16, column: 10, scope: !39)
!59 = !DILocalVariable(name: "value", scope: !39, file: !2, line: 17, type: !17)
!60 = !DILocation(line: 17, column: 9, scope: !39)
!61 = !DILocalVariable(name: "value2", scope: !39, file: !2, line: 17, type: !17)
!62 = !DILocation(line: 17, column: 20, scope: !39)
!63 = !DILocalVariable(name: "buf", scope: !39, file: !2, line: 18, type: !57)
!64 = !DILocation(line: 18, column: 10, scope: !39)
!65 = !DILocalVariable(name: "result", scope: !39, file: !2, line: 19, type: !17)
!66 = !DILocation(line: 19, column: 9, scope: !39)
!67 = !DILocalVariable(name: "token", scope: !39, file: !2, line: 20, type: !17)
!68 = !DILocation(line: 20, column: 9, scope: !39)
!69 = !DILocation(line: 22, column: 5, scope: !39)
!70 = !DILocation(line: 23, column: 5, scope: !39)
!71 = !DILocation(line: 24, column: 5, scope: !39)
!72 = !DILocation(line: 26, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !39, file: !2, line: 26, column: 9)
!74 = !DILocation(line: 26, column: 14, scope: !73)
!75 = !DILocation(line: 26, column: 9, scope: !39)
!76 = !DILocation(line: 27, column: 69, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 26, column: 27)
!78 = !DILocation(line: 27, column: 9, scope: !77)
!79 = !DILocation(line: 28, column: 9, scope: !77)
!80 = !DILocation(line: 29, column: 5, scope: !77)
!81 = !DILocation(line: 31, column: 5, scope: !39)
!82 = !DILocalVariable(name: "i", scope: !83, file: !2, line: 32, type: !17)
!83 = distinct !DILexicalBlock(scope: !39, file: !2, line: 32, column: 5)
!84 = !DILocation(line: 32, column: 14, scope: !83)
!85 = !DILocation(line: 32, column: 10, scope: !83)
!86 = !DILocation(line: 32, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !2, line: 32, column: 5)
!88 = !DILocation(line: 32, column: 23, scope: !87)
!89 = !DILocation(line: 32, column: 5, scope: !83)
!90 = !DILocation(line: 33, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !2, line: 32, column: 40)
!92 = !DILocation(line: 33, column: 18, scope: !91)
!93 = !DILocation(line: 33, column: 21, scope: !91)
!94 = !DILocation(line: 34, column: 5, scope: !91)
!95 = !DILocation(line: 32, column: 36, scope: !87)
!96 = !DILocation(line: 32, column: 5, scope: !87)
!97 = distinct !{!97, !89, !98, !99}
!98 = !DILocation(line: 34, column: 5, scope: !83)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 36, column: 22, scope: !39)
!101 = !DILocation(line: 36, column: 5, scope: !39)
!102 = !DILocation(line: 37, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !39, file: !2, line: 37, column: 9)
!104 = !DILocation(line: 37, column: 14, scope: !103)
!105 = !DILocation(line: 37, column: 9, scope: !39)
!106 = !DILocation(line: 38, column: 55, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !2, line: 37, column: 20)
!108 = !DILocation(line: 38, column: 9, scope: !107)
!109 = !DILocation(line: 39, column: 9, scope: !107)
!110 = !DILocation(line: 40, column: 5, scope: !107)
!111 = !DILocation(line: 41, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !39, file: !2, line: 41, column: 9)
!113 = !DILocation(line: 41, column: 14, scope: !112)
!114 = !DILocation(line: 41, column: 9, scope: !39)
!115 = !DILocation(line: 42, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !2, line: 41, column: 20)
!117 = !DILocation(line: 43, column: 5, scope: !116)
!118 = !DILocation(line: 44, column: 22, scope: !39)
!119 = !DILocation(line: 44, column: 5, scope: !39)
!120 = !DILocation(line: 46, column: 5, scope: !39)
!121 = !DILocation(line: 49, column: 9, scope: !39)
!122 = !DILocation(line: 50, column: 10, scope: !39)
!123 = !DILocation(line: 50, column: 9, scope: !39)
!124 = !DILocation(line: 51, column: 9, scope: !39)
!125 = !DILocation(line: 52, column: 9, scope: !39)
!126 = !DILocation(line: 47, column: 5, scope: !39)
!127 = !DILocation(line: 54, column: 5, scope: !39)
!128 = !DILocation(line: 55, column: 5, scope: !39)
!129 = !DILocation(line: 57, column: 5, scope: !39)
