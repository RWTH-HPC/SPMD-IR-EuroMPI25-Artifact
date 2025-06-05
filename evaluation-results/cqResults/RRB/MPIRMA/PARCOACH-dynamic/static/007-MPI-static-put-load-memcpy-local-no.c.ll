; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/007-MPI-static-put-load-memcpy-local-no.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/007-MPI-static-put-load-memcpy-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"*buf_alias is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !35 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !41, metadata !DIExpression()), !dbg !42
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata ptr %6, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %7, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %8, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %9, metadata !52, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata ptr %10, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 1, ptr %10, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %11, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 2, ptr %11, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %12, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %10, ptr %12, align 8, !dbg !60
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
  call void @llvm.dbg.declare(metadata ptr %16, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata ptr %17, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 %12, i64 8, i1 false), !dbg !102
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %17, ptr align 8 %9, i64 8, i1 false), !dbg !103
  %43 = load i32, ptr %6, align 4, !dbg !104
  %44 = icmp eq i32 %43, 0, !dbg !106
  br i1 %44, label %45, label %52, !dbg !107

45:                                               ; preds = %40
  %46 = load ptr, ptr %12, align 8, !dbg !108
  %47 = load i32, ptr %8, align 4, !dbg !110
  %48 = call i32 @MPI_Put(ptr noundef %46, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %47), !dbg !111
  %49 = load ptr, ptr %16, align 8, !dbg !112
  %50 = load i32, ptr %49, align 4, !dbg !113
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %50), !dbg !114
  br label %52, !dbg !115

52:                                               ; preds = %45, %40
  %53 = load i32, ptr %8, align 4, !dbg !116
  %54 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %53), !dbg !117
  %55 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !118
  %56 = load i32, ptr %6, align 4, !dbg !119
  %57 = load ptr, ptr %12, align 8, !dbg !120
  %58 = load i32, ptr %57, align 4, !dbg !121
  %59 = load i32, ptr %11, align 4, !dbg !122
  %60 = load ptr, ptr %9, align 8, !dbg !123
  %61 = getelementptr inbounds i32, ptr %60, i64 0, !dbg !123
  %62 = load i32, ptr %61, align 4, !dbg !123
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %56, i32 noundef %58, i32 noundef %59, i32 noundef %62), !dbg !124
  %64 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !125
  %65 = call i32 @MPI_Finalize(), !dbg !126
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/007-MPI-static-put-load-memcpy-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "110554e20f6c8ac43257487489093c5b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 18)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 54, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/007-MPI-static-put-load-memcpy-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "110554e20f6c8ac43257487489093c5b")
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
!35 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !36, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!36 = !DISubroutineType(types: !37)
!37 = !{!22, !22, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!40 = !{}
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !2, line: 13, type: !22)
!42 = !DILocation(line: 13, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !2, line: 13, type: !38)
!44 = !DILocation(line: 13, column: 27, scope: !35)
!45 = !DILocalVariable(name: "rank", scope: !35, file: !2, line: 15, type: !22)
!46 = !DILocation(line: 15, column: 9, scope: !35)
!47 = !DILocalVariable(name: "size", scope: !35, file: !2, line: 15, type: !22)
!48 = !DILocation(line: 15, column: 15, scope: !35)
!49 = !DILocalVariable(name: "win", scope: !35, file: !2, line: 16, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!51 = !DILocation(line: 16, column: 13, scope: !35)
!52 = !DILocalVariable(name: "win_base", scope: !35, file: !2, line: 17, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!54 = !DILocation(line: 17, column: 10, scope: !35)
!55 = !DILocalVariable(name: "value", scope: !35, file: !2, line: 18, type: !22)
!56 = !DILocation(line: 18, column: 9, scope: !35)
!57 = !DILocalVariable(name: "value2", scope: !35, file: !2, line: 18, type: !22)
!58 = !DILocation(line: 18, column: 20, scope: !35)
!59 = !DILocalVariable(name: "buf", scope: !35, file: !2, line: 19, type: !53)
!60 = !DILocation(line: 19, column: 10, scope: !35)
!61 = !DILocalVariable(name: "result", scope: !35, file: !2, line: 20, type: !22)
!62 = !DILocation(line: 20, column: 9, scope: !35)
!63 = !DILocalVariable(name: "token", scope: !35, file: !2, line: 21, type: !22)
!64 = !DILocation(line: 21, column: 9, scope: !35)
!65 = !DILocation(line: 23, column: 5, scope: !35)
!66 = !DILocation(line: 24, column: 5, scope: !35)
!67 = !DILocation(line: 25, column: 5, scope: !35)
!68 = !DILocation(line: 27, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !35, file: !2, line: 27, column: 9)
!70 = !DILocation(line: 27, column: 14, scope: !69)
!71 = !DILocation(line: 27, column: 9, scope: !35)
!72 = !DILocation(line: 28, column: 69, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !2, line: 27, column: 27)
!74 = !DILocation(line: 28, column: 9, scope: !73)
!75 = !DILocation(line: 29, column: 9, scope: !73)
!76 = !DILocation(line: 30, column: 5, scope: !73)
!77 = !DILocation(line: 32, column: 5, scope: !35)
!78 = !DILocalVariable(name: "i", scope: !79, file: !2, line: 33, type: !22)
!79 = distinct !DILexicalBlock(scope: !35, file: !2, line: 33, column: 5)
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
!96 = !DILocation(line: 37, column: 22, scope: !35)
!97 = !DILocation(line: 37, column: 5, scope: !35)
!98 = !DILocalVariable(name: "buf_alias", scope: !35, file: !2, line: 39, type: !53)
!99 = !DILocation(line: 39, column: 10, scope: !35)
!100 = !DILocalVariable(name: "win_base_alias", scope: !35, file: !2, line: 40, type: !53)
!101 = !DILocation(line: 40, column: 10, scope: !35)
!102 = !DILocation(line: 42, column: 5, scope: !35)
!103 = !DILocation(line: 43, column: 5, scope: !35)
!104 = !DILocation(line: 45, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !35, file: !2, line: 45, column: 9)
!106 = !DILocation(line: 45, column: 14, scope: !105)
!107 = !DILocation(line: 45, column: 9, scope: !35)
!108 = !DILocation(line: 46, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !2, line: 45, column: 20)
!110 = !DILocation(line: 46, column: 52, scope: !109)
!111 = !DILocation(line: 46, column: 9, scope: !109)
!112 = !DILocation(line: 47, column: 39, scope: !109)
!113 = !DILocation(line: 47, column: 38, scope: !109)
!114 = !DILocation(line: 47, column: 9, scope: !109)
!115 = !DILocation(line: 48, column: 5, scope: !109)
!116 = !DILocation(line: 50, column: 22, scope: !35)
!117 = !DILocation(line: 50, column: 5, scope: !35)
!118 = !DILocation(line: 52, column: 5, scope: !35)
!119 = !DILocation(line: 55, column: 9, scope: !35)
!120 = !DILocation(line: 56, column: 10, scope: !35)
!121 = !DILocation(line: 56, column: 9, scope: !35)
!122 = !DILocation(line: 57, column: 9, scope: !35)
!123 = !DILocation(line: 58, column: 9, scope: !35)
!124 = !DILocation(line: 53, column: 5, scope: !35)
!125 = !DILocation(line: 60, column: 5, scope: !35)
!126 = !DILocation(line: 61, column: 5, scope: !35)
!127 = !DILocation(line: 63, column: 5, scope: !35)
