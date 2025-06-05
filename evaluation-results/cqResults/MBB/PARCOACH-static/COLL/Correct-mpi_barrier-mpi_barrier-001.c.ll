; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !29 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !35, metadata !DIExpression()), !dbg !36
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata ptr %6, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 -1, ptr %6, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata ptr %7, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 -1, ptr %7, align 4, !dbg !42
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !43
  %11 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !44
  %12 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !45
  %13 = load i32, ptr %6, align 4, !dbg !46
  %14 = icmp slt i32 %13, 2, !dbg !48
  br i1 %14, label %15, label %17, !dbg !49

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !50
  br label %17, !dbg !50

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !51, metadata !DIExpression()), !dbg !52
  %18 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !53
  store ptr %18, ptr %8, align 8, !dbg !52
  call void @llvm.dbg.declare(metadata ptr %9, metadata !54, metadata !DIExpression()), !dbg !55
  %19 = load i32, ptr %6, align 4, !dbg !56
  %20 = mul nsw i32 10, %19, !dbg !57
  %21 = sext i32 %20 to i64, !dbg !58
  %22 = call noalias ptr @calloc(i64 noundef %21, i64 noundef 4) #5, !dbg !59
  store ptr %22, ptr %9, align 8, !dbg !55
  %23 = load i32, ptr %7, align 4, !dbg !60
  %24 = icmp eq i32 %23, 0, !dbg !62
  br i1 %24, label %25, label %27, !dbg !63

25:                                               ; preds = %17
  %26 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !64
  br label %27, !dbg !66

27:                                               ; preds = %25, %17
  %28 = load i32, ptr %7, align 4, !dbg !67
  %29 = icmp ne i32 %28, 0, !dbg !69
  br i1 %29, label %30, label %32, !dbg !70

30:                                               ; preds = %27
  %31 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !71
  br label %32, !dbg !73

32:                                               ; preds = %30, %27
  %33 = load ptr, ptr %8, align 8, !dbg !74
  call void @free(ptr noundef %33) #6, !dbg !75
  %34 = load ptr, ptr %9, align 8, !dbg !76
  call void @free(ptr noundef %34) #6, !dbg !77
  %35 = call i32 @MPI_Finalize(), !dbg !78
  %36 = load i32, ptr %7, align 4, !dbg !79
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Barrier(i32 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "aede514809220c69e892280c4c8ecf8b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !19, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "aede514809220c69e892280c4c8ecf8b")
!14 = !{!15, !18}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !{!0, !7}
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 7, !"openmp", i32 50}
!24 = !{i32 7, !"PIC Level", i32 2}
!25 = !{i32 7, !"PIE Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 2}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Debian clang version 15.0.6"}
!29 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !30, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !34)
!30 = !DISubroutineType(types: !31)
!31 = !{!17, !17, !32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!34 = !{}
!35 = !DILocalVariable(name: "argc", arg: 1, scope: !29, file: !2, line: 22, type: !17)
!36 = !DILocation(line: 22, column: 14, scope: !29)
!37 = !DILocalVariable(name: "argv", arg: 2, scope: !29, file: !2, line: 22, type: !32)
!38 = !DILocation(line: 22, column: 27, scope: !29)
!39 = !DILocalVariable(name: "nprocs", scope: !29, file: !2, line: 23, type: !17)
!40 = !DILocation(line: 23, column: 7, scope: !29)
!41 = !DILocalVariable(name: "rank", scope: !29, file: !2, line: 24, type: !17)
!42 = !DILocation(line: 24, column: 7, scope: !29)
!43 = !DILocation(line: 26, column: 3, scope: !29)
!44 = !DILocation(line: 27, column: 3, scope: !29)
!45 = !DILocation(line: 28, column: 3, scope: !29)
!46 = !DILocation(line: 29, column: 7, scope: !47)
!47 = distinct !DILexicalBlock(scope: !29, file: !2, line: 29, column: 7)
!48 = !DILocation(line: 29, column: 14, scope: !47)
!49 = !DILocation(line: 29, column: 7, scope: !29)
!50 = !DILocation(line: 30, column: 5, scope: !47)
!51 = !DILocalVariable(name: "buf", scope: !29, file: !2, line: 33, type: !18)
!52 = !DILocation(line: 33, column: 8, scope: !29)
!53 = !DILocation(line: 33, column: 21, scope: !29)
!54 = !DILocalVariable(name: "recv_buf", scope: !29, file: !2, line: 35, type: !18)
!55 = !DILocation(line: 35, column: 8, scope: !29)
!56 = !DILocation(line: 35, column: 38, scope: !29)
!57 = !DILocation(line: 35, column: 36, scope: !29)
!58 = !DILocation(line: 35, column: 33, scope: !29)
!59 = !DILocation(line: 35, column: 26, scope: !29)
!60 = !DILocation(line: 37, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !29, file: !2, line: 37, column: 7)
!62 = !DILocation(line: 37, column: 12, scope: !61)
!63 = !DILocation(line: 37, column: 7, scope: !29)
!64 = !DILocation(line: 38, column: 5, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !2, line: 37, column: 18)
!66 = !DILocation(line: 39, column: 3, scope: !65)
!67 = !DILocation(line: 40, column: 7, scope: !68)
!68 = distinct !DILexicalBlock(scope: !29, file: !2, line: 40, column: 7)
!69 = !DILocation(line: 40, column: 12, scope: !68)
!70 = !DILocation(line: 40, column: 7, scope: !29)
!71 = !DILocation(line: 41, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !2, line: 40, column: 18)
!73 = !DILocation(line: 42, column: 3, scope: !72)
!74 = !DILocation(line: 43, column: 8, scope: !29)
!75 = !DILocation(line: 43, column: 3, scope: !29)
!76 = !DILocation(line: 44, column: 8, scope: !29)
!77 = !DILocation(line: 44, column: 3, scope: !29)
!78 = !DILocation(line: 46, column: 3, scope: !29)
!79 = !DILocation(line: 47, column: 41, scope: !29)
!80 = !DILocation(line: 47, column: 3, scope: !29)
!81 = !DILocation(line: 48, column: 3, scope: !29)
