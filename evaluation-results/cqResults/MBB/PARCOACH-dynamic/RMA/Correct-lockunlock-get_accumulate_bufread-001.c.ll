; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockunlock-get_accumulate_bufread-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockunlock-get_accumulate_bufread-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !37 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 -1, ptr %6, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 -1, ptr %7, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata ptr %8, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 0, ptr %8, align 4, !dbg !52
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !53
  %14 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !54
  %15 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !55
  %16 = load i32, ptr %6, align 4, !dbg !56
  %17 = icmp slt i32 %16, 2, !dbg !58
  br i1 %17, label %18, label %20, !dbg !59

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !60
  br label %20, !dbg !60

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !61, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %10, metadata !64, metadata !DIExpression()), !dbg !65
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !66
  store ptr %21, ptr %10, align 8, !dbg !65
  %22 = load ptr, ptr %10, align 8, !dbg !67
  %23 = call i32 @MPI_Win_create(ptr noundef %22, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9), !dbg !68
  %24 = load i32, ptr %7, align 4, !dbg !69
  %25 = icmp eq i32 %24, 0, !dbg !71
  br i1 %25, label %26, label %41, !dbg !72

26:                                               ; preds = %20
  %27 = load i32, ptr %9, align 4, !dbg !73
  %28 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %27), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %11, metadata !76, metadata !DIExpression()), !dbg !77
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !78
  store ptr %29, ptr %11, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata ptr %12, metadata !79, metadata !DIExpression()), !dbg !80
  %30 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !81
  store ptr %30, ptr %12, align 8, !dbg !80
  %31 = load ptr, ptr %11, align 8, !dbg !82
  %32 = load ptr, ptr %12, align 8, !dbg !83
  %33 = load i32, ptr %9, align 4, !dbg !84
  %34 = call i32 @MPI_Get_accumulate(ptr noundef %31, i32 noundef 10, i32 noundef 1275069445, ptr noundef %32, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %33), !dbg !85
  %35 = load ptr, ptr %11, align 8, !dbg !86
  %36 = getelementptr inbounds i32, ptr %35, i64 0, !dbg !86
  %37 = load i32, ptr %36, align 4, !dbg !86
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %37), !dbg !87
  %39 = load i32, ptr %9, align 4, !dbg !88
  %40 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %39), !dbg !89
  br label %41, !dbg !90

41:                                               ; preds = %26, %20
  %42 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !91
  %43 = call i32 @MPI_Finalize(), !dbg !92
  %44 = load i32, ptr %7, align 4, !dbg !93
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %44), !dbg !94
  ret i32 0, !dbg !95
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

declare i32 @MPI_Get_accumulate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!28, !29, !30, !31, !32, !33, !34, !35}
!llvm.ident = !{!36}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockunlock-get_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "cf68415b7ee3194154eee87d7ab00fa0")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !27, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockunlock-get_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "cf68415b7ee3194154eee87d7ab00fa0")
!19 = !{!20, !23, !24, !25, !26}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !21, line: 303, baseType: !22)
!27 = !{!0, !7, !12}
!28 = !{i32 7, !"Dwarf Version", i32 5}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{i32 1, !"wchar_size", i32 4}
!31 = !{i32 7, !"openmp", i32 50}
!32 = !{i32 7, !"PIC Level", i32 2}
!33 = !{i32 7, !"PIE Level", i32 2}
!34 = !{i32 7, !"uwtable", i32 2}
!35 = !{i32 7, !"frame-pointer", i32 2}
!36 = !{!"Debian clang version 15.0.6"}
!37 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !38, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !42)
!38 = !DISubroutineType(types: !39)
!39 = !{!22, !22, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !{}
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !2, line: 22, type: !22)
!44 = !DILocation(line: 22, column: 14, scope: !37)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !2, line: 22, type: !40)
!46 = !DILocation(line: 22, column: 27, scope: !37)
!47 = !DILocalVariable(name: "nprocs", scope: !37, file: !2, line: 23, type: !22)
!48 = !DILocation(line: 23, column: 7, scope: !37)
!49 = !DILocalVariable(name: "rank", scope: !37, file: !2, line: 24, type: !22)
!50 = !DILocation(line: 24, column: 7, scope: !37)
!51 = !DILocalVariable(name: "int_0", scope: !37, file: !2, line: 25, type: !22)
!52 = !DILocation(line: 25, column: 7, scope: !37)
!53 = !DILocation(line: 27, column: 3, scope: !37)
!54 = !DILocation(line: 28, column: 3, scope: !37)
!55 = !DILocation(line: 29, column: 3, scope: !37)
!56 = !DILocation(line: 30, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !37, file: !2, line: 30, column: 7)
!58 = !DILocation(line: 30, column: 14, scope: !57)
!59 = !DILocation(line: 30, column: 7, scope: !37)
!60 = !DILocation(line: 31, column: 5, scope: !57)
!61 = !DILocalVariable(name: "mpi_win_0", scope: !37, file: !2, line: 34, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!63 = !DILocation(line: 34, column: 11, scope: !37)
!64 = !DILocalVariable(name: "winbuf", scope: !37, file: !2, line: 36, type: !23)
!65 = !DILocation(line: 36, column: 8, scope: !37)
!66 = !DILocation(line: 36, column: 24, scope: !37)
!67 = !DILocation(line: 38, column: 18, scope: !37)
!68 = !DILocation(line: 38, column: 3, scope: !37)
!69 = !DILocation(line: 40, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !37, file: !2, line: 40, column: 7)
!71 = !DILocation(line: 40, column: 12, scope: !70)
!72 = !DILocation(line: 40, column: 7, scope: !37)
!73 = !DILocation(line: 41, column: 44, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !2, line: 40, column: 18)
!75 = !DILocation(line: 41, column: 5, scope: !74)
!76 = !DILocalVariable(name: "buf", scope: !74, file: !2, line: 43, type: !23)
!77 = !DILocation(line: 43, column: 10, scope: !74)
!78 = !DILocation(line: 43, column: 23, scope: !74)
!79 = !DILocalVariable(name: "int_0", scope: !74, file: !2, line: 45, type: !23)
!80 = !DILocation(line: 45, column: 10, scope: !74)
!81 = !DILocation(line: 45, column: 25, scope: !74)
!82 = !DILocation(line: 47, column: 24, scope: !74)
!83 = !DILocation(line: 47, column: 42, scope: !74)
!84 = !DILocation(line: 48, column: 33, scope: !74)
!85 = !DILocation(line: 47, column: 5, scope: !74)
!86 = !DILocation(line: 49, column: 27, scope: !74)
!87 = !DILocation(line: 49, column: 5, scope: !74)
!88 = !DILocation(line: 50, column: 23, scope: !74)
!89 = !DILocation(line: 50, column: 5, scope: !74)
!90 = !DILocation(line: 51, column: 3, scope: !74)
!91 = !DILocation(line: 52, column: 3, scope: !37)
!92 = !DILocation(line: 54, column: 3, scope: !37)
!93 = !DILocation(line: 55, column: 41, scope: !37)
!94 = !DILocation(line: 55, column: 3, scope: !37)
!95 = !DILocation(line: 56, column: 3, scope: !37)
