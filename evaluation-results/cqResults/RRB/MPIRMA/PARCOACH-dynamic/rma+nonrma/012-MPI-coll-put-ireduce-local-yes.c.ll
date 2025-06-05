; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/012-MPI-coll-put-ireduce-local-yes.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/012-MPI-coll-put-ireduce-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !40 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !46, metadata !DIExpression()), !dbg !47
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %6, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %7, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata ptr %8, metadata !54, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %10, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 1, ptr %10, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata ptr %11, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 2, ptr %11, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata ptr %12, metadata !64, metadata !DIExpression()), !dbg !65
  store ptr %10, ptr %12, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata ptr %13, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %14, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 42, ptr %14, align 4, !dbg !69
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !70
  %18 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !71
  %19 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !72
  %20 = load i32, ptr %7, align 4, !dbg !73
  %21 = icmp ne i32 %20, 2, !dbg !75
  br i1 %21, label %22, label %26, !dbg !76

22:                                               ; preds = %2
  %23 = load i32, ptr %7, align 4, !dbg !77
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %23, i32 noundef 2), !dbg !79
  %25 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !80
  br label %26, !dbg !81

26:                                               ; preds = %22, %2
  %27 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !82
  call void @llvm.dbg.declare(metadata ptr %15, metadata !83, metadata !DIExpression()), !dbg !85
  store i32 0, ptr %15, align 4, !dbg !85
  br label %28, !dbg !86

28:                                               ; preds = %36, %26
  %29 = load i32, ptr %15, align 4, !dbg !87
  %30 = icmp slt i32 %29, 10, !dbg !89
  br i1 %30, label %31, label %39, !dbg !90

31:                                               ; preds = %28
  %32 = load ptr, ptr %9, align 8, !dbg !91
  %33 = load i32, ptr %15, align 4, !dbg !93
  %34 = sext i32 %33 to i64, !dbg !91
  %35 = getelementptr inbounds i32, ptr %32, i64 %34, !dbg !91
  store i32 0, ptr %35, align 4, !dbg !94
  br label %36, !dbg !95

36:                                               ; preds = %31
  %37 = load i32, ptr %15, align 4, !dbg !96
  %38 = add nsw i32 %37, 1, !dbg !96
  store i32 %38, ptr %15, align 4, !dbg !96
  br label %28, !dbg !97, !llvm.loop !98

39:                                               ; preds = %28
  call void @llvm.dbg.declare(metadata ptr %16, metadata !101, metadata !DIExpression()), !dbg !103
  %40 = load i32, ptr %8, align 4, !dbg !104
  %41 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %40), !dbg !105
  %42 = call i32 @MPI_Ireduce(ptr noundef %11, ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef 0, i32 noundef 1140850688, ptr noundef %16), !dbg !106
  %43 = load i32, ptr %6, align 4, !dbg !107
  %44 = icmp eq i32 %43, 0, !dbg !109
  br i1 %44, label %45, label %48, !dbg !110

45:                                               ; preds = %39
  %46 = load i32, ptr %8, align 4, !dbg !111
  %47 = call i32 @MPI_Put(ptr noundef %10, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %46), !dbg !113
  br label %48, !dbg !114

48:                                               ; preds = %45, %39
  %49 = call i32 @MPI_Wait(ptr noundef %16, ptr noundef inttoptr (i64 1 to ptr)), !dbg !115
  %50 = load i32, ptr %8, align 4, !dbg !116
  %51 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %50), !dbg !117
  %52 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !118
  %53 = load i32, ptr %6, align 4, !dbg !119
  %54 = load ptr, ptr %12, align 8, !dbg !120
  %55 = load i32, ptr %54, align 4, !dbg !121
  %56 = load i32, ptr %11, align 4, !dbg !122
  %57 = load ptr, ptr %9, align 8, !dbg !123
  %58 = getelementptr inbounds i32, ptr %57, i64 0, !dbg !123
  %59 = load i32, ptr %58, align 4, !dbg !123
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %53, i32 noundef %55, i32 noundef %56, i32 noundef %59), !dbg !124
  %61 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !125
  %62 = call i32 @MPI_Finalize(), !dbg !126
  ret i32 0, !dbg !127
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

declare i32 @MPI_Ireduce(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!31, !32, !33, !34, !35, !36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/012-MPI-coll-put-ireduce-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5f4c076fdf8782f49bda470fec81ee40")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !30, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/rma+nonrma/012-MPI-coll-put-ireduce-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5f4c076fdf8782f49bda470fec81ee40")
!14 = !{!15, !18, !19, !20, !21}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !24)
!24 = !{!25, !26, !27, !28, !29}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !23, file: !16, line: 588, baseType: !17, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !23, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !23, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !23, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !23, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!30 = !{!0, !7}
!31 = !{i32 7, !"Dwarf Version", i32 5}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 7, !"openmp", i32 50}
!35 = !{i32 7, !"PIC Level", i32 2}
!36 = !{i32 7, !"PIE Level", i32 2}
!37 = !{i32 7, !"uwtable", i32 2}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = !{!"Debian clang version 15.0.6"}
!40 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !41, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !45)
!41 = !DISubroutineType(types: !42)
!42 = !{!17, !17, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!45 = !{}
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !2, line: 12, type: !17)
!47 = !DILocation(line: 12, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !2, line: 12, type: !43)
!49 = !DILocation(line: 12, column: 27, scope: !40)
!50 = !DILocalVariable(name: "rank", scope: !40, file: !2, line: 14, type: !17)
!51 = !DILocation(line: 14, column: 9, scope: !40)
!52 = !DILocalVariable(name: "size", scope: !40, file: !2, line: 14, type: !17)
!53 = !DILocation(line: 14, column: 15, scope: !40)
!54 = !DILocalVariable(name: "win", scope: !40, file: !2, line: 15, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!56 = !DILocation(line: 15, column: 13, scope: !40)
!57 = !DILocalVariable(name: "win_base", scope: !40, file: !2, line: 16, type: !58)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!59 = !DILocation(line: 16, column: 10, scope: !40)
!60 = !DILocalVariable(name: "value", scope: !40, file: !2, line: 17, type: !17)
!61 = !DILocation(line: 17, column: 9, scope: !40)
!62 = !DILocalVariable(name: "value2", scope: !40, file: !2, line: 17, type: !17)
!63 = !DILocation(line: 17, column: 20, scope: !40)
!64 = !DILocalVariable(name: "buf", scope: !40, file: !2, line: 18, type: !58)
!65 = !DILocation(line: 18, column: 10, scope: !40)
!66 = !DILocalVariable(name: "result", scope: !40, file: !2, line: 19, type: !17)
!67 = !DILocation(line: 19, column: 9, scope: !40)
!68 = !DILocalVariable(name: "token", scope: !40, file: !2, line: 20, type: !17)
!69 = !DILocation(line: 20, column: 9, scope: !40)
!70 = !DILocation(line: 22, column: 5, scope: !40)
!71 = !DILocation(line: 23, column: 5, scope: !40)
!72 = !DILocation(line: 24, column: 5, scope: !40)
!73 = !DILocation(line: 26, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !40, file: !2, line: 26, column: 9)
!75 = !DILocation(line: 26, column: 14, scope: !74)
!76 = !DILocation(line: 26, column: 9, scope: !40)
!77 = !DILocation(line: 27, column: 69, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !2, line: 26, column: 27)
!79 = !DILocation(line: 27, column: 9, scope: !78)
!80 = !DILocation(line: 28, column: 9, scope: !78)
!81 = !DILocation(line: 29, column: 5, scope: !78)
!82 = !DILocation(line: 31, column: 5, scope: !40)
!83 = !DILocalVariable(name: "i", scope: !84, file: !2, line: 32, type: !17)
!84 = distinct !DILexicalBlock(scope: !40, file: !2, line: 32, column: 5)
!85 = !DILocation(line: 32, column: 14, scope: !84)
!86 = !DILocation(line: 32, column: 10, scope: !84)
!87 = !DILocation(line: 32, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !2, line: 32, column: 5)
!89 = !DILocation(line: 32, column: 23, scope: !88)
!90 = !DILocation(line: 32, column: 5, scope: !84)
!91 = !DILocation(line: 33, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 32, column: 40)
!93 = !DILocation(line: 33, column: 18, scope: !92)
!94 = !DILocation(line: 33, column: 21, scope: !92)
!95 = !DILocation(line: 34, column: 5, scope: !92)
!96 = !DILocation(line: 32, column: 36, scope: !88)
!97 = !DILocation(line: 32, column: 5, scope: !88)
!98 = distinct !{!98, !90, !99, !100}
!99 = !DILocation(line: 34, column: 5, scope: !84)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocalVariable(name: "req", scope: !40, file: !2, line: 36, type: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!103 = !DILocation(line: 36, column: 17, scope: !40)
!104 = !DILocation(line: 37, column: 22, scope: !40)
!105 = !DILocation(line: 37, column: 5, scope: !40)
!106 = !DILocation(line: 39, column: 5, scope: !40)
!107 = !DILocation(line: 40, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !40, file: !2, line: 40, column: 9)
!109 = !DILocation(line: 40, column: 14, scope: !108)
!110 = !DILocation(line: 40, column: 9, scope: !40)
!111 = !DILocation(line: 42, column: 55, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !2, line: 40, column: 20)
!113 = !DILocation(line: 42, column: 9, scope: !112)
!114 = !DILocation(line: 43, column: 5, scope: !112)
!115 = !DILocation(line: 44, column: 5, scope: !40)
!116 = !DILocation(line: 45, column: 22, scope: !40)
!117 = !DILocation(line: 45, column: 5, scope: !40)
!118 = !DILocation(line: 47, column: 5, scope: !40)
!119 = !DILocation(line: 50, column: 9, scope: !40)
!120 = !DILocation(line: 51, column: 10, scope: !40)
!121 = !DILocation(line: 51, column: 9, scope: !40)
!122 = !DILocation(line: 52, column: 9, scope: !40)
!123 = !DILocation(line: 53, column: 9, scope: !40)
!124 = !DILocation(line: 48, column: 5, scope: !40)
!125 = !DILocation(line: 55, column: 5, scope: !40)
!126 = !DILocation(line: 56, column: 5, scope: !40)
!127 = !DILocation(line: 58, column: 5, scope: !40)
