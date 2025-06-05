; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibcast-mpi_ibcast-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibcast-mpi_ibcast-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !40 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !46, metadata !DIExpression()), !dbg !47
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %6, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -1, ptr %6, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %7, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 -1, ptr %7, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %8, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 738197504, ptr %8, align 4, !dbg !55
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !56
  %12 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !57
  %13 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !58
  %14 = load i32, ptr %6, align 4, !dbg !59
  %15 = icmp slt i32 %14, 2, !dbg !61
  br i1 %15, label %16, label %18, !dbg !62

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !63
  br label %18, !dbg !63

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !64, metadata !DIExpression()), !dbg !65
  %19 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !66
  store ptr %19, ptr %9, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata ptr %10, metadata !67, metadata !DIExpression()), !dbg !68
  %20 = load i32, ptr %6, align 4, !dbg !69
  %21 = mul nsw i32 10, %20, !dbg !70
  %22 = sext i32 %21 to i64, !dbg !71
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 4) #5, !dbg !72
  store ptr %23, ptr %10, align 8, !dbg !68
  %24 = load i32, ptr %7, align 4, !dbg !73
  %25 = icmp eq i32 %24, 0, !dbg !75
  br i1 %25, label %26, label %29, !dbg !76

26:                                               ; preds = %18
  %27 = load ptr, ptr %9, align 8, !dbg !77
  %28 = call i32 @MPI_Ibcast(ptr noundef %27, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 1140850688, ptr noundef %8), !dbg !79
  br label %29, !dbg !80

29:                                               ; preds = %26, %18
  %30 = load i32, ptr %7, align 4, !dbg !81
  %31 = icmp ne i32 %30, 0, !dbg !83
  br i1 %31, label %32, label %35, !dbg !84

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !85
  %34 = call i32 @MPI_Ibcast(ptr noundef %33, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 1140850688, ptr noundef %8), !dbg !87
  br label %35, !dbg !88

35:                                               ; preds = %32, %29
  %36 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !89
  %37 = load ptr, ptr %9, align 8, !dbg !90
  call void @free(ptr noundef %37) #6, !dbg !91
  %38 = load ptr, ptr %10, align 8, !dbg !92
  call void @free(ptr noundef %38) #6, !dbg !93
  %39 = call i32 @MPI_Finalize(), !dbg !94
  %40 = load i32, ptr %7, align 4, !dbg !95
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %40), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Ibcast(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

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
!llvm.module.flags = !{!31, !32, !33, !34, !35, !36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibcast-mpi_ibcast-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "a67639b1e735f470219ebc4eb245772c")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !30, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibcast-mpi_ibcast-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "a67639b1e735f470219ebc4eb245772c")
!14 = !{!15, !18, !19, !20, !21}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
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
!40 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !41, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !45)
!41 = !DISubroutineType(types: !42)
!42 = !{!17, !17, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!45 = !{}
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !2, line: 22, type: !17)
!47 = !DILocation(line: 22, column: 14, scope: !40)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !2, line: 22, type: !43)
!49 = !DILocation(line: 22, column: 27, scope: !40)
!50 = !DILocalVariable(name: "nprocs", scope: !40, file: !2, line: 23, type: !17)
!51 = !DILocation(line: 23, column: 7, scope: !40)
!52 = !DILocalVariable(name: "rank", scope: !40, file: !2, line: 24, type: !17)
!53 = !DILocation(line: 24, column: 7, scope: !40)
!54 = !DILocalVariable(name: "mpi_request_0", scope: !40, file: !2, line: 25, type: !15)
!55 = !DILocation(line: 25, column: 15, scope: !40)
!56 = !DILocation(line: 27, column: 3, scope: !40)
!57 = !DILocation(line: 28, column: 3, scope: !40)
!58 = !DILocation(line: 29, column: 3, scope: !40)
!59 = !DILocation(line: 30, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !40, file: !2, line: 30, column: 7)
!61 = !DILocation(line: 30, column: 14, scope: !60)
!62 = !DILocation(line: 30, column: 7, scope: !40)
!63 = !DILocation(line: 31, column: 5, scope: !60)
!64 = !DILocalVariable(name: "buf", scope: !40, file: !2, line: 34, type: !19)
!65 = !DILocation(line: 34, column: 8, scope: !40)
!66 = !DILocation(line: 34, column: 21, scope: !40)
!67 = !DILocalVariable(name: "recv_buf", scope: !40, file: !2, line: 36, type: !19)
!68 = !DILocation(line: 36, column: 8, scope: !40)
!69 = !DILocation(line: 36, column: 38, scope: !40)
!70 = !DILocation(line: 36, column: 36, scope: !40)
!71 = !DILocation(line: 36, column: 33, scope: !40)
!72 = !DILocation(line: 36, column: 26, scope: !40)
!73 = !DILocation(line: 38, column: 7, scope: !74)
!74 = distinct !DILexicalBlock(scope: !40, file: !2, line: 38, column: 7)
!75 = !DILocation(line: 38, column: 12, scope: !74)
!76 = !DILocation(line: 38, column: 7, scope: !40)
!77 = !DILocation(line: 39, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !2, line: 38, column: 18)
!79 = !DILocation(line: 39, column: 5, scope: !78)
!80 = !DILocation(line: 40, column: 3, scope: !78)
!81 = !DILocation(line: 41, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !40, file: !2, line: 41, column: 7)
!83 = !DILocation(line: 41, column: 12, scope: !82)
!84 = !DILocation(line: 41, column: 7, scope: !40)
!85 = !DILocation(line: 42, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 41, column: 18)
!87 = !DILocation(line: 42, column: 5, scope: !86)
!88 = !DILocation(line: 43, column: 3, scope: !86)
!89 = !DILocation(line: 44, column: 3, scope: !40)
!90 = !DILocation(line: 45, column: 8, scope: !40)
!91 = !DILocation(line: 45, column: 3, scope: !40)
!92 = !DILocation(line: 46, column: 8, scope: !40)
!93 = !DILocation(line: 46, column: 3, scope: !40)
!94 = !DILocation(line: 48, column: 3, scope: !40)
!95 = !DILocation(line: 49, column: 41, scope: !40)
!96 = !DILocation(line: 49, column: 3, scope: !40)
!97 = !DILocation(line: 50, column: 3, scope: !40)
