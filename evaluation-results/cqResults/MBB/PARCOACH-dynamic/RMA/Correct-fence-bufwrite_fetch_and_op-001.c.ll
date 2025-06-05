; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-bufwrite_fetch_and_op-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-bufwrite_fetch_and_op-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !32 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, ptr %6, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, ptr %7, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata ptr %8, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 0, ptr %8, align 4, !dbg !47
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !48
  %14 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !49
  %15 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !50
  %16 = load i32, ptr %6, align 4, !dbg !51
  %17 = icmp slt i32 %16, 2, !dbg !53
  br i1 %17, label %18, label %20, !dbg !54

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !55
  br label %20, !dbg !55

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !60
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !61
  store ptr %21, ptr %10, align 8, !dbg !60
  %22 = load ptr, ptr %10, align 8, !dbg !62
  %23 = call i32 @MPI_Win_create(ptr noundef %22, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9), !dbg !63
  %24 = load i32, ptr %9, align 4, !dbg !64
  %25 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %24), !dbg !65
  %26 = load i32, ptr %7, align 4, !dbg !66
  %27 = icmp eq i32 %26, 0, !dbg !68
  br i1 %27, label %28, label %37, !dbg !69

28:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata ptr %11, metadata !70, metadata !DIExpression()), !dbg !72
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !73
  store ptr %29, ptr %11, align 8, !dbg !72
  %30 = load ptr, ptr %11, align 8, !dbg !74
  %31 = getelementptr inbounds i32, ptr %30, i64 0, !dbg !74
  store i32 42, ptr %31, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata ptr %12, metadata !76, metadata !DIExpression()), !dbg !77
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !78
  store ptr %32, ptr %12, align 8, !dbg !77
  %33 = load ptr, ptr %11, align 8, !dbg !79
  %34 = load ptr, ptr %12, align 8, !dbg !80
  %35 = load i32, ptr %9, align 4, !dbg !81
  %36 = call i32 @MPI_Fetch_and_op(ptr noundef %33, ptr noundef %34, i32 noundef 1275069445, i32 noundef 0, i64 noundef 0, i32 noundef 1476395011, i32 noundef %35), !dbg !82
  br label %37, !dbg !83

37:                                               ; preds = %28, %20
  %38 = load i32, ptr %9, align 4, !dbg !84
  %39 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %38), !dbg !85
  %40 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !86
  %41 = call i32 @MPI_Finalize(), !dbg !87
  %42 = load i32, ptr %7, align 4, !dbg !88
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %42), !dbg !89
  ret i32 0, !dbg !90
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

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Fetch_and_op(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-bufwrite_fetch_and_op-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9066b91926501a7f992db105bf9f328c")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !22, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-bufwrite_fetch_and_op-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9066b91926501a7f992db105bf9f328c")
!14 = !{!15, !18, !19, !20, !21}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!22 = !{!0, !7}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"openmp", i32 50}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 2}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Debian clang version 15.0.6"}
!32 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !33, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!33 = !DISubroutineType(types: !34)
!34 = !{!17, !17, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !2, line: 22, type: !17)
!39 = !DILocation(line: 22, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !2, line: 22, type: !35)
!41 = !DILocation(line: 22, column: 27, scope: !32)
!42 = !DILocalVariable(name: "nprocs", scope: !32, file: !2, line: 23, type: !17)
!43 = !DILocation(line: 23, column: 7, scope: !32)
!44 = !DILocalVariable(name: "rank", scope: !32, file: !2, line: 24, type: !17)
!45 = !DILocation(line: 24, column: 7, scope: !32)
!46 = !DILocalVariable(name: "int_0", scope: !32, file: !2, line: 25, type: !17)
!47 = !DILocation(line: 25, column: 7, scope: !32)
!48 = !DILocation(line: 27, column: 3, scope: !32)
!49 = !DILocation(line: 28, column: 3, scope: !32)
!50 = !DILocation(line: 29, column: 3, scope: !32)
!51 = !DILocation(line: 30, column: 7, scope: !52)
!52 = distinct !DILexicalBlock(scope: !32, file: !2, line: 30, column: 7)
!53 = !DILocation(line: 30, column: 14, scope: !52)
!54 = !DILocation(line: 30, column: 7, scope: !32)
!55 = !DILocation(line: 31, column: 5, scope: !52)
!56 = !DILocalVariable(name: "mpi_win_0", scope: !32, file: !2, line: 34, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!58 = !DILocation(line: 34, column: 11, scope: !32)
!59 = !DILocalVariable(name: "winbuf", scope: !32, file: !2, line: 36, type: !18)
!60 = !DILocation(line: 36, column: 8, scope: !32)
!61 = !DILocation(line: 36, column: 24, scope: !32)
!62 = !DILocation(line: 38, column: 18, scope: !32)
!63 = !DILocation(line: 38, column: 3, scope: !32)
!64 = !DILocation(line: 40, column: 20, scope: !32)
!65 = !DILocation(line: 40, column: 3, scope: !32)
!66 = !DILocation(line: 41, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !32, file: !2, line: 41, column: 7)
!68 = !DILocation(line: 41, column: 12, scope: !67)
!69 = !DILocation(line: 41, column: 7, scope: !32)
!70 = !DILocalVariable(name: "buf", scope: !71, file: !2, line: 43, type: !18)
!71 = distinct !DILexicalBlock(scope: !67, file: !2, line: 41, column: 18)
!72 = !DILocation(line: 43, column: 10, scope: !71)
!73 = !DILocation(line: 43, column: 23, scope: !71)
!74 = !DILocation(line: 45, column: 5, scope: !71)
!75 = !DILocation(line: 45, column: 12, scope: !71)
!76 = !DILocalVariable(name: "int_0", scope: !71, file: !2, line: 47, type: !18)
!77 = !DILocation(line: 47, column: 10, scope: !71)
!78 = !DILocation(line: 47, column: 25, scope: !71)
!79 = !DILocation(line: 49, column: 22, scope: !71)
!80 = !DILocation(line: 49, column: 27, scope: !71)
!81 = !DILocation(line: 49, column: 58, scope: !71)
!82 = !DILocation(line: 49, column: 5, scope: !71)
!83 = !DILocation(line: 50, column: 3, scope: !71)
!84 = !DILocation(line: 51, column: 20, scope: !32)
!85 = !DILocation(line: 51, column: 3, scope: !32)
!86 = !DILocation(line: 52, column: 3, scope: !32)
!87 = !DILocation(line: 54, column: 3, scope: !32)
!88 = !DILocation(line: 55, column: 41, scope: !32)
!89 = !DILocation(line: 55, column: 3, scope: !32)
!90 = !DILocation(line: 56, column: 3, scope: !32)
