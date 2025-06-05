; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c"
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
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !45, metadata !DIExpression()), !dbg !46
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %6, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 -1, ptr %6, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata ptr %7, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 -1, ptr %7, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata ptr %8, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 738197504, ptr %8, align 4, !dbg !54
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !55
  %12 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !56
  %13 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !57
  %14 = load i32, ptr %6, align 4, !dbg !58
  %15 = icmp slt i32 %14, 2, !dbg !60
  br i1 %15, label %16, label %18, !dbg !61

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !62
  br label %18, !dbg !62

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !63, metadata !DIExpression()), !dbg !64
  %19 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !65
  store ptr %19, ptr %9, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %10, metadata !66, metadata !DIExpression()), !dbg !67
  %20 = load i32, ptr %6, align 4, !dbg !68
  %21 = mul nsw i32 10, %20, !dbg !69
  %22 = sext i32 %21 to i64, !dbg !70
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 4) #5, !dbg !71
  store ptr %23, ptr %10, align 8, !dbg !67
  %24 = load i32, ptr %7, align 4, !dbg !72
  %25 = icmp eq i32 %24, 0, !dbg !74
  br i1 %25, label %26, label %28, !dbg !75

26:                                               ; preds = %18
  %27 = call i32 @MPI_Ibarrier(i32 noundef 1140850688, ptr noundef %8), !dbg !76
  br label %28, !dbg !78

28:                                               ; preds = %26, %18
  %29 = load i32, ptr %7, align 4, !dbg !79
  %30 = icmp ne i32 %29, 0, !dbg !81
  br i1 %30, label %31, label %33, !dbg !82

31:                                               ; preds = %28
  %32 = call i32 @MPI_Ibarrier(i32 noundef 1140850688, ptr noundef %8), !dbg !83
  br label %33, !dbg !85

33:                                               ; preds = %31, %28
  %34 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !86
  %35 = load ptr, ptr %9, align 8, !dbg !87
  call void @free(ptr noundef %35) #6, !dbg !88
  %36 = load ptr, ptr %10, align 8, !dbg !89
  call void @free(ptr noundef %36) #6, !dbg !90
  %37 = call i32 @MPI_Finalize(), !dbg !91
  %38 = load i32, ptr %7, align 4, !dbg !92
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %38), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Ibarrier(i32 noundef, ptr noundef) #2

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
!llvm.module.flags = !{!30, !31, !32, !33, !34, !35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "03f22f062b006b26091753eb56b44cf3")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !29, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "03f22f062b006b26091753eb56b44cf3")
!14 = !{!15, !18, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
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
!53 = !DILocalVariable(name: "mpi_request_0", scope: !39, file: !2, line: 25, type: !15)
!54 = !DILocation(line: 25, column: 15, scope: !39)
!55 = !DILocation(line: 27, column: 3, scope: !39)
!56 = !DILocation(line: 28, column: 3, scope: !39)
!57 = !DILocation(line: 29, column: 3, scope: !39)
!58 = !DILocation(line: 30, column: 7, scope: !59)
!59 = distinct !DILexicalBlock(scope: !39, file: !2, line: 30, column: 7)
!60 = !DILocation(line: 30, column: 14, scope: !59)
!61 = !DILocation(line: 30, column: 7, scope: !39)
!62 = !DILocation(line: 31, column: 5, scope: !59)
!63 = !DILocalVariable(name: "buf", scope: !39, file: !2, line: 34, type: !19)
!64 = !DILocation(line: 34, column: 8, scope: !39)
!65 = !DILocation(line: 34, column: 21, scope: !39)
!66 = !DILocalVariable(name: "recv_buf", scope: !39, file: !2, line: 36, type: !19)
!67 = !DILocation(line: 36, column: 8, scope: !39)
!68 = !DILocation(line: 36, column: 38, scope: !39)
!69 = !DILocation(line: 36, column: 36, scope: !39)
!70 = !DILocation(line: 36, column: 33, scope: !39)
!71 = !DILocation(line: 36, column: 26, scope: !39)
!72 = !DILocation(line: 38, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !39, file: !2, line: 38, column: 7)
!74 = !DILocation(line: 38, column: 12, scope: !73)
!75 = !DILocation(line: 38, column: 7, scope: !39)
!76 = !DILocation(line: 39, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 38, column: 18)
!78 = !DILocation(line: 40, column: 3, scope: !77)
!79 = !DILocation(line: 41, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !39, file: !2, line: 41, column: 7)
!81 = !DILocation(line: 41, column: 12, scope: !80)
!82 = !DILocation(line: 41, column: 7, scope: !39)
!83 = !DILocation(line: 42, column: 5, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !2, line: 41, column: 18)
!85 = !DILocation(line: 43, column: 3, scope: !84)
!86 = !DILocation(line: 44, column: 3, scope: !39)
!87 = !DILocation(line: 45, column: 8, scope: !39)
!88 = !DILocation(line: 45, column: 3, scope: !39)
!89 = !DILocation(line: 46, column: 8, scope: !39)
!90 = !DILocation(line: 46, column: 3, scope: !39)
!91 = !DILocation(line: 48, column: 3, scope: !39)
!92 = !DILocation(line: 49, column: 41, scope: !39)
!93 = !DILocation(line: 49, column: 3, scope: !39)
!94 = !DILocation(line: 50, column: 3, scope: !39)
