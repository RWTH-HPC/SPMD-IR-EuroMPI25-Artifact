; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/002-MPI-static-get-load-deep-nesting-local-yes.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/002-MPI-static-get-load-deep-nesting-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"*buf is %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !35 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  %5 = load ptr, ptr %3, align 8, !dbg !45
  %6 = load i32, ptr %4, align 4, !dbg !46
  %7 = call i32 @MPI_Get(ptr noundef %5, i32 noundef 1, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 1, i32 noundef 1275069445, i32 noundef %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !49 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load ptr, ptr %3, align 8, !dbg !54
  %6 = load i32, ptr %4, align 4, !dbg !55
  call void @deeeeeeeeep(ptr noundef %5, i32 noundef %6), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !58 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !61, metadata !DIExpression()), !dbg !62
  %5 = load ptr, ptr %3, align 8, !dbg !63
  %6 = load i32, ptr %4, align 4, !dbg !64
  call void @deeeeeeeep(ptr noundef %5, i32 noundef %6), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !67 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !70, metadata !DIExpression()), !dbg !71
  %5 = load ptr, ptr %3, align 8, !dbg !72
  %6 = load i32, ptr %4, align 4, !dbg !73
  call void @deeeeeeep(ptr noundef %5, i32 noundef %6), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !76 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !79, metadata !DIExpression()), !dbg !80
  %5 = load ptr, ptr %3, align 8, !dbg !81
  %6 = load i32, ptr %4, align 4, !dbg !82
  call void @deeeeeep(ptr noundef %5, i32 noundef %6), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeep(ptr noundef %0, i32 noundef %1) #0 !dbg !85 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !88, metadata !DIExpression()), !dbg !89
  %5 = load ptr, ptr %3, align 8, !dbg !90
  %6 = load i32, ptr %4, align 4, !dbg !91
  call void @deeeeep(ptr noundef %5, i32 noundef %6), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeep(ptr noundef %0, i32 noundef %1) #0 !dbg !94 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !97, metadata !DIExpression()), !dbg !98
  %5 = load ptr, ptr %3, align 8, !dbg !99
  %6 = load i32, ptr %4, align 4, !dbg !100
  call void @deeeep(ptr noundef %5, i32 noundef %6), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deep(ptr noundef %0, i32 noundef %1) #0 !dbg !103 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !106, metadata !DIExpression()), !dbg !107
  %5 = load ptr, ptr %3, align 8, !dbg !108
  %6 = load i32, ptr %4, align 4, !dbg !109
  call void @deeep(ptr noundef %5, i32 noundef %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rank0(ptr noundef %0, i32 noundef %1) #0 !dbg !112 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !115, metadata !DIExpression()), !dbg !116
  %5 = load ptr, ptr %3, align 8, !dbg !117
  %6 = load i32, ptr %4, align 4, !dbg !118
  call void @deep(ptr noundef %5, i32 noundef %6), !dbg !119
  %7 = load ptr, ptr %3, align 8, !dbg !120
  %8 = load i32, ptr %7, align 4, !dbg !121
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8), !dbg !122
  ret void, !dbg !123
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !124 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !129, metadata !DIExpression()), !dbg !130
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata ptr %6, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata ptr %7, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata ptr %8, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata ptr %9, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata ptr %10, metadata !141, metadata !DIExpression()), !dbg !142
  store i32 1, ptr %10, align 4, !dbg !142
  call void @llvm.dbg.declare(metadata ptr %11, metadata !143, metadata !DIExpression()), !dbg !144
  store i32 2, ptr %11, align 4, !dbg !144
  call void @llvm.dbg.declare(metadata ptr %12, metadata !145, metadata !DIExpression()), !dbg !146
  store ptr %10, ptr %12, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata ptr %13, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata ptr %14, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 42, ptr %14, align 4, !dbg !150
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !151
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !152
  %18 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !153
  %19 = load i32, ptr %7, align 4, !dbg !154
  %20 = icmp ne i32 %19, 2, !dbg !156
  br i1 %20, label %21, label %25, !dbg !157

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !158
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %22, i32 noundef 2), !dbg !160
  %24 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !161
  br label %25, !dbg !162

25:                                               ; preds = %21, %2
  %26 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9, ptr noundef %8), !dbg !163
  call void @llvm.dbg.declare(metadata ptr %15, metadata !164, metadata !DIExpression()), !dbg !166
  store i32 0, ptr %15, align 4, !dbg !166
  br label %27, !dbg !167

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !168
  %29 = icmp slt i32 %28, 10, !dbg !170
  br i1 %29, label %30, label %38, !dbg !171

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !172
  %32 = load i32, ptr %15, align 4, !dbg !174
  %33 = sext i32 %32 to i64, !dbg !172
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !172
  store i32 0, ptr %34, align 4, !dbg !175
  br label %35, !dbg !176

35:                                               ; preds = %30
  %36 = load i32, ptr %15, align 4, !dbg !177
  %37 = add nsw i32 %36, 1, !dbg !177
  store i32 %37, ptr %15, align 4, !dbg !177
  br label %27, !dbg !178, !llvm.loop !179

38:                                               ; preds = %27
  %39 = load i32, ptr %8, align 4, !dbg !182
  %40 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %39), !dbg !183
  %41 = load i32, ptr %6, align 4, !dbg !184
  %42 = icmp eq i32 %41, 0, !dbg !186
  br i1 %42, label %43, label %46, !dbg !187

43:                                               ; preds = %38
  %44 = load ptr, ptr %12, align 8, !dbg !188
  %45 = load i32, ptr %8, align 4, !dbg !190
  call void @rank0(ptr noundef %44, i32 noundef %45), !dbg !191
  br label %46, !dbg !192

46:                                               ; preds = %43, %38
  %47 = load i32, ptr %8, align 4, !dbg !193
  %48 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %47), !dbg !194
  %49 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !195
  %50 = load i32, ptr %6, align 4, !dbg !196
  %51 = load ptr, ptr %12, align 8, !dbg !197
  %52 = load i32, ptr %51, align 4, !dbg !198
  %53 = load i32, ptr %11, align 4, !dbg !199
  %54 = load ptr, ptr %9, align 8, !dbg !200
  %55 = getelementptr inbounds i32, ptr %54, i64 0, !dbg !200
  %56 = load i32, ptr %55, align 4, !dbg !200
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %50, i32 noundef %52, i32 noundef %53, i32 noundef %56), !dbg !201
  %58 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !202
  %59 = call i32 @MPI_Finalize(), !dbg !203
  ret i32 0, !dbg !204
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/002-MPI-static-get-load-deep-nesting-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3503028d0af23dd77d5c99b554f735fb")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 12)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 49)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 67, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/002-MPI-static-get-load-deep-nesting-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3503028d0af23dd77d5c99b554f735fb")
!19 = !{!20, !23, !24}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
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
!35 = distinct !DISubprogram(name: "deeeeeeeeep", scope: !2, file: !2, line: 9, type: !36, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !38, !39}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!40 = !{}
!41 = !DILocalVariable(name: "buf", arg: 1, scope: !35, file: !2, line: 9, type: !38)
!42 = !DILocation(line: 9, column: 49, scope: !35)
!43 = !DILocalVariable(name: "win", arg: 2, scope: !35, file: !2, line: 9, type: !39)
!44 = !DILocation(line: 9, column: 62, scope: !35)
!45 = !DILocation(line: 13, column: 13, scope: !35)
!46 = !DILocation(line: 13, column: 48, scope: !35)
!47 = !DILocation(line: 13, column: 5, scope: !35)
!48 = !DILocation(line: 14, column: 1, scope: !35)
!49 = distinct !DISubprogram(name: "deeeeeeeep", scope: !2, file: !2, line: 16, type: !36, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!50 = !DILocalVariable(name: "buf", arg: 1, scope: !49, file: !2, line: 16, type: !38)
!51 = !DILocation(line: 16, column: 48, scope: !49)
!52 = !DILocalVariable(name: "win", arg: 2, scope: !49, file: !2, line: 16, type: !39)
!53 = !DILocation(line: 16, column: 61, scope: !49)
!54 = !DILocation(line: 16, column: 80, scope: !49)
!55 = !DILocation(line: 16, column: 85, scope: !49)
!56 = !DILocation(line: 16, column: 68, scope: !49)
!57 = !DILocation(line: 16, column: 91, scope: !49)
!58 = distinct !DISubprogram(name: "deeeeeeep", scope: !2, file: !2, line: 17, type: !36, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!59 = !DILocalVariable(name: "buf", arg: 1, scope: !58, file: !2, line: 17, type: !38)
!60 = !DILocation(line: 17, column: 47, scope: !58)
!61 = !DILocalVariable(name: "win", arg: 2, scope: !58, file: !2, line: 17, type: !39)
!62 = !DILocation(line: 17, column: 60, scope: !58)
!63 = !DILocation(line: 17, column: 78, scope: !58)
!64 = !DILocation(line: 17, column: 83, scope: !58)
!65 = !DILocation(line: 17, column: 67, scope: !58)
!66 = !DILocation(line: 17, column: 89, scope: !58)
!67 = distinct !DISubprogram(name: "deeeeeep", scope: !2, file: !2, line: 18, type: !36, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!68 = !DILocalVariable(name: "buf", arg: 1, scope: !67, file: !2, line: 18, type: !38)
!69 = !DILocation(line: 18, column: 46, scope: !67)
!70 = !DILocalVariable(name: "win", arg: 2, scope: !67, file: !2, line: 18, type: !39)
!71 = !DILocation(line: 18, column: 59, scope: !67)
!72 = !DILocation(line: 18, column: 76, scope: !67)
!73 = !DILocation(line: 18, column: 81, scope: !67)
!74 = !DILocation(line: 18, column: 66, scope: !67)
!75 = !DILocation(line: 18, column: 87, scope: !67)
!76 = distinct !DISubprogram(name: "deeeeep", scope: !2, file: !2, line: 19, type: !36, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!77 = !DILocalVariable(name: "buf", arg: 1, scope: !76, file: !2, line: 19, type: !38)
!78 = !DILocation(line: 19, column: 45, scope: !76)
!79 = !DILocalVariable(name: "win", arg: 2, scope: !76, file: !2, line: 19, type: !39)
!80 = !DILocation(line: 19, column: 58, scope: !76)
!81 = !DILocation(line: 19, column: 74, scope: !76)
!82 = !DILocation(line: 19, column: 79, scope: !76)
!83 = !DILocation(line: 19, column: 65, scope: !76)
!84 = !DILocation(line: 19, column: 85, scope: !76)
!85 = distinct !DISubprogram(name: "deeeep", scope: !2, file: !2, line: 20, type: !36, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!86 = !DILocalVariable(name: "buf", arg: 1, scope: !85, file: !2, line: 20, type: !38)
!87 = !DILocation(line: 20, column: 44, scope: !85)
!88 = !DILocalVariable(name: "win", arg: 2, scope: !85, file: !2, line: 20, type: !39)
!89 = !DILocation(line: 20, column: 57, scope: !85)
!90 = !DILocation(line: 20, column: 72, scope: !85)
!91 = !DILocation(line: 20, column: 77, scope: !85)
!92 = !DILocation(line: 20, column: 64, scope: !85)
!93 = !DILocation(line: 20, column: 83, scope: !85)
!94 = distinct !DISubprogram(name: "deeep", scope: !2, file: !2, line: 21, type: !36, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!95 = !DILocalVariable(name: "buf", arg: 1, scope: !94, file: !2, line: 21, type: !38)
!96 = !DILocation(line: 21, column: 43, scope: !94)
!97 = !DILocalVariable(name: "win", arg: 2, scope: !94, file: !2, line: 21, type: !39)
!98 = !DILocation(line: 21, column: 56, scope: !94)
!99 = !DILocation(line: 21, column: 70, scope: !94)
!100 = !DILocation(line: 21, column: 75, scope: !94)
!101 = !DILocation(line: 21, column: 63, scope: !94)
!102 = !DILocation(line: 21, column: 81, scope: !94)
!103 = distinct !DISubprogram(name: "deep", scope: !2, file: !2, line: 22, type: !36, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!104 = !DILocalVariable(name: "buf", arg: 1, scope: !103, file: !2, line: 22, type: !38)
!105 = !DILocation(line: 22, column: 42, scope: !103)
!106 = !DILocalVariable(name: "win", arg: 2, scope: !103, file: !2, line: 22, type: !39)
!107 = !DILocation(line: 22, column: 55, scope: !103)
!108 = !DILocation(line: 22, column: 68, scope: !103)
!109 = !DILocation(line: 22, column: 73, scope: !103)
!110 = !DILocation(line: 22, column: 62, scope: !103)
!111 = !DILocation(line: 22, column: 79, scope: !103)
!112 = distinct !DISubprogram(name: "rank0", scope: !2, file: !2, line: 24, type: !36, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!113 = !DILocalVariable(name: "buf", arg: 1, scope: !112, file: !2, line: 24, type: !38)
!114 = !DILocation(line: 24, column: 17, scope: !112)
!115 = !DILocalVariable(name: "win", arg: 2, scope: !112, file: !2, line: 24, type: !39)
!116 = !DILocation(line: 24, column: 30, scope: !112)
!117 = !DILocation(line: 26, column: 10, scope: !112)
!118 = !DILocation(line: 26, column: 15, scope: !112)
!119 = !DILocation(line: 26, column: 5, scope: !112)
!120 = !DILocation(line: 28, column: 29, scope: !112)
!121 = !DILocation(line: 28, column: 28, scope: !112)
!122 = !DILocation(line: 28, column: 5, scope: !112)
!123 = !DILocation(line: 29, column: 1, scope: !112)
!124 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 34, type: !125, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!125 = !DISubroutineType(types: !126)
!126 = !{!22, !22, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!129 = !DILocalVariable(name: "argc", arg: 1, scope: !124, file: !2, line: 34, type: !22)
!130 = !DILocation(line: 34, column: 14, scope: !124)
!131 = !DILocalVariable(name: "argv", arg: 2, scope: !124, file: !2, line: 34, type: !127)
!132 = !DILocation(line: 34, column: 27, scope: !124)
!133 = !DILocalVariable(name: "rank", scope: !124, file: !2, line: 36, type: !22)
!134 = !DILocation(line: 36, column: 9, scope: !124)
!135 = !DILocalVariable(name: "size", scope: !124, file: !2, line: 36, type: !22)
!136 = !DILocation(line: 36, column: 15, scope: !124)
!137 = !DILocalVariable(name: "win", scope: !124, file: !2, line: 37, type: !39)
!138 = !DILocation(line: 37, column: 13, scope: !124)
!139 = !DILocalVariable(name: "win_base", scope: !124, file: !2, line: 38, type: !38)
!140 = !DILocation(line: 38, column: 10, scope: !124)
!141 = !DILocalVariable(name: "value", scope: !124, file: !2, line: 39, type: !22)
!142 = !DILocation(line: 39, column: 9, scope: !124)
!143 = !DILocalVariable(name: "value2", scope: !124, file: !2, line: 39, type: !22)
!144 = !DILocation(line: 39, column: 20, scope: !124)
!145 = !DILocalVariable(name: "buf", scope: !124, file: !2, line: 40, type: !38)
!146 = !DILocation(line: 40, column: 10, scope: !124)
!147 = !DILocalVariable(name: "result", scope: !124, file: !2, line: 41, type: !22)
!148 = !DILocation(line: 41, column: 9, scope: !124)
!149 = !DILocalVariable(name: "token", scope: !124, file: !2, line: 42, type: !22)
!150 = !DILocation(line: 42, column: 9, scope: !124)
!151 = !DILocation(line: 44, column: 5, scope: !124)
!152 = !DILocation(line: 45, column: 5, scope: !124)
!153 = !DILocation(line: 46, column: 5, scope: !124)
!154 = !DILocation(line: 48, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !124, file: !2, line: 48, column: 9)
!156 = !DILocation(line: 48, column: 14, scope: !155)
!157 = !DILocation(line: 48, column: 9, scope: !124)
!158 = !DILocation(line: 49, column: 69, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !2, line: 48, column: 27)
!160 = !DILocation(line: 49, column: 9, scope: !159)
!161 = !DILocation(line: 50, column: 9, scope: !159)
!162 = !DILocation(line: 51, column: 5, scope: !159)
!163 = !DILocation(line: 53, column: 5, scope: !124)
!164 = !DILocalVariable(name: "i", scope: !165, file: !2, line: 54, type: !22)
!165 = distinct !DILexicalBlock(scope: !124, file: !2, line: 54, column: 5)
!166 = !DILocation(line: 54, column: 14, scope: !165)
!167 = !DILocation(line: 54, column: 10, scope: !165)
!168 = !DILocation(line: 54, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !2, line: 54, column: 5)
!170 = !DILocation(line: 54, column: 23, scope: !169)
!171 = !DILocation(line: 54, column: 5, scope: !165)
!172 = !DILocation(line: 55, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !2, line: 54, column: 40)
!174 = !DILocation(line: 55, column: 18, scope: !173)
!175 = !DILocation(line: 55, column: 21, scope: !173)
!176 = !DILocation(line: 56, column: 5, scope: !173)
!177 = !DILocation(line: 54, column: 36, scope: !169)
!178 = !DILocation(line: 54, column: 5, scope: !169)
!179 = distinct !{!179, !171, !180, !181}
!180 = !DILocation(line: 56, column: 5, scope: !165)
!181 = !{!"llvm.loop.mustprogress"}
!182 = !DILocation(line: 58, column: 22, scope: !124)
!183 = !DILocation(line: 58, column: 5, scope: !124)
!184 = !DILocation(line: 60, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !124, file: !2, line: 60, column: 9)
!186 = !DILocation(line: 60, column: 14, scope: !185)
!187 = !DILocation(line: 60, column: 9, scope: !124)
!188 = !DILocation(line: 61, column: 15, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !2, line: 60, column: 20)
!190 = !DILocation(line: 61, column: 20, scope: !189)
!191 = !DILocation(line: 61, column: 9, scope: !189)
!192 = !DILocation(line: 62, column: 5, scope: !189)
!193 = !DILocation(line: 63, column: 22, scope: !124)
!194 = !DILocation(line: 63, column: 5, scope: !124)
!195 = !DILocation(line: 65, column: 5, scope: !124)
!196 = !DILocation(line: 68, column: 9, scope: !124)
!197 = !DILocation(line: 69, column: 10, scope: !124)
!198 = !DILocation(line: 69, column: 9, scope: !124)
!199 = !DILocation(line: 70, column: 9, scope: !124)
!200 = !DILocation(line: 71, column: 9, scope: !124)
!201 = !DILocation(line: 66, column: 5, scope: !124)
!202 = !DILocation(line: 73, column: 5, scope: !124)
!203 = !DILocation(line: 74, column: 5, scope: !124)
!204 = !DILocation(line: 76, column: 5, scope: !124)
