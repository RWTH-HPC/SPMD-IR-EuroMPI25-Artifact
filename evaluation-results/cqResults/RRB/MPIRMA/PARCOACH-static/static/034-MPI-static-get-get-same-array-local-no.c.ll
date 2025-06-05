; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.values = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
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
  %10 = alloca [2 x i32], align 4
  %11 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 @__const.main.values, i64 8, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata ptr %11, metadata !55, metadata !DIExpression()), !dbg !56
  %16 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !57
  store ptr %16, ptr %11, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %12, metadata !58, metadata !DIExpression()), !dbg !59
  %17 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 1, !dbg !60
  store ptr %17, ptr %12, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %13, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %14, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 42, ptr %14, align 4, !dbg !64
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !65
  %19 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !66
  %20 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !67
  %21 = load i32, ptr %7, align 4, !dbg !68
  %22 = icmp ne i32 %21, 2, !dbg !70
  br i1 %22, label %23, label %27, !dbg !71

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !72
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !74
  %26 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !75
  br label %27, !dbg !76

27:                                               ; preds = %23, %2
  %28 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !77
  call void @llvm.dbg.declare(metadata ptr %15, metadata !78, metadata !DIExpression()), !dbg !80
  store i32 0, ptr %15, align 4, !dbg !80
  br label %29, !dbg !81

29:                                               ; preds = %37, %27
  %30 = load i32, ptr %15, align 4, !dbg !82
  %31 = icmp slt i32 %30, 10, !dbg !84
  br i1 %31, label %32, label %40, !dbg !85

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !86
  %34 = load i32, ptr %15, align 4, !dbg !88
  %35 = sext i32 %34 to i64, !dbg !86
  %36 = getelementptr inbounds i32, ptr %33, i64 %35, !dbg !86
  store i32 0, ptr %36, align 4, !dbg !89
  br label %37, !dbg !90

37:                                               ; preds = %32
  %38 = load i32, ptr %15, align 4, !dbg !91
  %39 = add nsw i32 %38, 1, !dbg !91
  store i32 %39, ptr %15, align 4, !dbg !91
  br label %29, !dbg !92, !llvm.loop !93

40:                                               ; preds = %29
  %41 = load i32, ptr %8, align 4, !dbg !96
  %42 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %41), !dbg !97
  %43 = load i32, ptr %6, align 4, !dbg !98
  %44 = icmp eq i32 %43, 0, !dbg !100
  br i1 %44, label %45, label %52, !dbg !101

45:                                               ; preds = %40
  %46 = load ptr, ptr %11, align 8, !dbg !102
  %47 = load i32, ptr %8, align 4, !dbg !104
  %48 = call i32 @MPI_Get(ptr noundef %46, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %47), !dbg !105
  %49 = load ptr, ptr %12, align 8, !dbg !106
  %50 = load i32, ptr %8, align 4, !dbg !107
  %51 = call i32 @MPI_Get(ptr noundef %49, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %50), !dbg !108
  br label %52, !dbg !109

52:                                               ; preds = %45, %40
  %53 = load i32, ptr %8, align 4, !dbg !110
  %54 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %53), !dbg !111
  %55 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !112
  %56 = load i32, ptr %6, align 4, !dbg !113
  %57 = load ptr, ptr %11, align 8, !dbg !114
  %58 = load i32, ptr %57, align 4, !dbg !115
  %59 = load ptr, ptr %12, align 8, !dbg !116
  %60 = load i32, ptr %59, align 4, !dbg !117
  %61 = load ptr, ptr %9, align 8, !dbg !118
  %62 = getelementptr inbounds i32, ptr %61, i64 0, !dbg !118
  %63 = load i32, ptr %62, align 4, !dbg !118
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %56, i32 noundef %58, i32 noundef %60, i32 noundef %63), !dbg !119
  %65 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !120
  %66 = call i32 @MPI_Finalize(), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @MPI_Init(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #3

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #3

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @MPI_Barrier(i32 noundef) #3

declare i32 @MPI_Win_free(ptr noundef) #3

declare i32 @MPI_Finalize() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c832545789c8f719ae357ba5ba58edf4")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c832545789c8f719ae357ba5ba58edf4")
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
!50 = !DILocalVariable(name: "values", scope: !30, file: !2, line: 17, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 64, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 2)
!54 = !DILocation(line: 17, column: 9, scope: !30)
!55 = !DILocalVariable(name: "buf0", scope: !30, file: !2, line: 18, type: !48)
!56 = !DILocation(line: 18, column: 10, scope: !30)
!57 = !DILocation(line: 18, column: 19, scope: !30)
!58 = !DILocalVariable(name: "buf1", scope: !30, file: !2, line: 19, type: !48)
!59 = !DILocation(line: 19, column: 10, scope: !30)
!60 = !DILocation(line: 19, column: 19, scope: !30)
!61 = !DILocalVariable(name: "result", scope: !30, file: !2, line: 20, type: !17)
!62 = !DILocation(line: 20, column: 9, scope: !30)
!63 = !DILocalVariable(name: "token", scope: !30, file: !2, line: 21, type: !17)
!64 = !DILocation(line: 21, column: 9, scope: !30)
!65 = !DILocation(line: 23, column: 5, scope: !30)
!66 = !DILocation(line: 24, column: 5, scope: !30)
!67 = !DILocation(line: 25, column: 5, scope: !30)
!68 = !DILocation(line: 27, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !30, file: !2, line: 27, column: 9)
!70 = !DILocation(line: 27, column: 14, scope: !69)
!71 = !DILocation(line: 27, column: 9, scope: !30)
!72 = !DILocation(line: 28, column: 69, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !2, line: 27, column: 27)
!74 = !DILocation(line: 28, column: 9, scope: !73)
!75 = !DILocation(line: 29, column: 9, scope: !73)
!76 = !DILocation(line: 30, column: 5, scope: !73)
!77 = !DILocation(line: 32, column: 5, scope: !30)
!78 = !DILocalVariable(name: "i", scope: !79, file: !2, line: 33, type: !17)
!79 = distinct !DILexicalBlock(scope: !30, file: !2, line: 33, column: 5)
!80 = !DILocation(line: 33, column: 14, scope: !79)
!81 = !DILocation(line: 33, column: 10, scope: !79)
!82 = !DILocation(line: 33, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 33, column: 5)
!84 = !DILocation(line: 33, column: 23, scope: !83)
!85 = !DILocation(line: 33, column: 5, scope: !79)
!86 = !DILocation(line: 34, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !2, line: 33, column: 40)
!88 = !DILocation(line: 34, column: 18, scope: !87)
!89 = !DILocation(line: 34, column: 21, scope: !87)
!90 = !DILocation(line: 35, column: 5, scope: !87)
!91 = !DILocation(line: 33, column: 36, scope: !83)
!92 = !DILocation(line: 33, column: 5, scope: !83)
!93 = distinct !{!93, !85, !94, !95}
!94 = !DILocation(line: 35, column: 5, scope: !79)
!95 = !{!"llvm.loop.mustprogress"}
!96 = !DILocation(line: 37, column: 22, scope: !30)
!97 = !DILocation(line: 37, column: 5, scope: !30)
!98 = !DILocation(line: 38, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !30, file: !2, line: 38, column: 9)
!100 = !DILocation(line: 38, column: 14, scope: !99)
!101 = !DILocation(line: 38, column: 9, scope: !30)
!102 = !DILocation(line: 39, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !2, line: 38, column: 20)
!104 = !DILocation(line: 39, column: 53, scope: !103)
!105 = !DILocation(line: 39, column: 9, scope: !103)
!106 = !DILocation(line: 40, column: 17, scope: !103)
!107 = !DILocation(line: 40, column: 53, scope: !103)
!108 = !DILocation(line: 40, column: 9, scope: !103)
!109 = !DILocation(line: 41, column: 5, scope: !103)
!110 = !DILocation(line: 42, column: 22, scope: !30)
!111 = !DILocation(line: 42, column: 5, scope: !30)
!112 = !DILocation(line: 44, column: 5, scope: !30)
!113 = !DILocation(line: 47, column: 9, scope: !30)
!114 = !DILocation(line: 48, column: 10, scope: !30)
!115 = !DILocation(line: 48, column: 9, scope: !30)
!116 = !DILocation(line: 49, column: 10, scope: !30)
!117 = !DILocation(line: 49, column: 9, scope: !30)
!118 = !DILocation(line: 50, column: 9, scope: !30)
!119 = !DILocation(line: 45, column: 5, scope: !30)
!120 = !DILocation(line: 52, column: 5, scope: !30)
!121 = !DILocation(line: 53, column: 5, scope: !30)
!122 = !DILocation(line: 55, column: 5, scope: !30)
