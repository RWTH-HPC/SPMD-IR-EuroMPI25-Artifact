; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/P2P/Correct-mpi_recv-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/P2P/Correct-mpi_recv-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !39 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !45, metadata !DIExpression()), !dbg !46
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %6, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 -1, ptr %6, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata ptr %7, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 -1, ptr %7, align 4, !dbg !52
  %9 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !53
  %10 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !54
  %11 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !55
  %12 = load i32, ptr %6, align 4, !dbg !56
  %13 = icmp slt i32 %12, 2, !dbg !58
  br i1 %13, label %14, label %16, !dbg !59

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !60
  br label %16, !dbg !60

16:                                               ; preds = %14, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !61, metadata !DIExpression()), !dbg !62
  %17 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !63
  store ptr %17, ptr %8, align 8, !dbg !62
  %18 = load i32, ptr %7, align 4, !dbg !64
  %19 = icmp eq i32 %18, 0, !dbg !66
  br i1 %19, label %20, label %23, !dbg !67

20:                                               ; preds = %16
  %21 = load ptr, ptr %8, align 8, !dbg !68
  %22 = call i32 @MPI_Recv(ptr noundef %21, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i32 noundef 0, i32 noundef 1140850688, ptr noundef inttoptr (i64 1 to ptr)), !dbg !70
  br label %23, !dbg !71

23:                                               ; preds = %20, %16
  %24 = load i32, ptr %7, align 4, !dbg !72
  %25 = icmp eq i32 %24, 1, !dbg !74
  br i1 %25, label %26, label %29, !dbg !75

26:                                               ; preds = %23
  %27 = load ptr, ptr %8, align 8, !dbg !76
  %28 = call i32 @MPI_Send(ptr noundef %27, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 0, i32 noundef 1140850688), !dbg !78
  br label %29, !dbg !79

29:                                               ; preds = %26, %23
  %30 = load ptr, ptr %8, align 8, !dbg !80
  call void @free(ptr noundef %30) #6, !dbg !81
  %31 = call i32 @MPI_Finalize(), !dbg !82
  %32 = load i32, ptr %7, align 4, !dbg !83
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %32), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Recv(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Send(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!30, !31, !32, !33, !34, !35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/P2P/Correct-mpi_recv-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "710a1e09a36c5e28b575a8f1437c1406")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 44, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !29, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/P2P/Correct-mpi_recv-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "710a1e09a36c5e28b575a8f1437c1406")
!14 = !{!15, !18, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
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
!39 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !40, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !44)
!40 = !DISubroutineType(types: !41)
!41 = !{!17, !17, !42}
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!44 = !{}
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !2, line: 22, type: !17)
!46 = !DILocation(line: 22, column: 14, scope: !39)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !39, file: !2, line: 22, type: !42)
!48 = !DILocation(line: 22, column: 27, scope: !39)
!49 = !DILocalVariable(name: "nprocs", scope: !39, file: !2, line: 23, type: !17)
!50 = !DILocation(line: 23, column: 7, scope: !39)
!51 = !DILocalVariable(name: "rank", scope: !39, file: !2, line: 24, type: !17)
!52 = !DILocation(line: 24, column: 7, scope: !39)
!53 = !DILocation(line: 26, column: 3, scope: !39)
!54 = !DILocation(line: 27, column: 3, scope: !39)
!55 = !DILocation(line: 28, column: 3, scope: !39)
!56 = !DILocation(line: 29, column: 7, scope: !57)
!57 = distinct !DILexicalBlock(scope: !39, file: !2, line: 29, column: 7)
!58 = !DILocation(line: 29, column: 14, scope: !57)
!59 = !DILocation(line: 29, column: 7, scope: !39)
!60 = !DILocation(line: 30, column: 5, scope: !57)
!61 = !DILocalVariable(name: "buf", scope: !39, file: !2, line: 33, type: !18)
!62 = !DILocation(line: 33, column: 8, scope: !39)
!63 = !DILocation(line: 33, column: 21, scope: !39)
!64 = !DILocation(line: 35, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !39, file: !2, line: 35, column: 7)
!66 = !DILocation(line: 35, column: 12, scope: !65)
!67 = !DILocation(line: 35, column: 7, scope: !39)
!68 = !DILocation(line: 36, column: 14, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !2, line: 35, column: 18)
!70 = !DILocation(line: 36, column: 5, scope: !69)
!71 = !DILocation(line: 37, column: 3, scope: !69)
!72 = !DILocation(line: 38, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !39, file: !2, line: 38, column: 7)
!74 = !DILocation(line: 38, column: 12, scope: !73)
!75 = !DILocation(line: 38, column: 7, scope: !39)
!76 = !DILocation(line: 39, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 38, column: 18)
!78 = !DILocation(line: 39, column: 5, scope: !77)
!79 = !DILocation(line: 40, column: 3, scope: !77)
!80 = !DILocation(line: 41, column: 8, scope: !39)
!81 = !DILocation(line: 41, column: 3, scope: !39)
!82 = !DILocation(line: 43, column: 3, scope: !39)
!83 = !DILocation(line: 44, column: 41, scope: !39)
!84 = !DILocation(line: 44, column: 3, scope: !39)
!85 = !DILocation(line: 45, column: 3, scope: !39)
