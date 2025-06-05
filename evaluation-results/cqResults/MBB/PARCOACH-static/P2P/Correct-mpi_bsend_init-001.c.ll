; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/Correct-mpi_bsend_init-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/Correct-mpi_bsend_init-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !41 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
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
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !56
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !57
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !58
  %15 = load i32, ptr %6, align 4, !dbg !59
  %16 = icmp slt i32 %15, 2, !dbg !61
  br i1 %16, label %17, label %19, !dbg !62

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !63
  br label %19, !dbg !63

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !64, metadata !DIExpression()), !dbg !65
  %20 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !66
  store ptr %20, ptr %9, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata ptr %10, metadata !67, metadata !DIExpression()), !dbg !68
  %21 = call noalias ptr @calloc(i64 noundef 136, i64 noundef 1) #5, !dbg !69
  store ptr %21, ptr %10, align 8, !dbg !68
  %22 = load ptr, ptr %10, align 8, !dbg !70
  %23 = call i32 @MPI_Buffer_attach(ptr noundef %22, i32 noundef 136), !dbg !71
  %24 = load i32, ptr %7, align 4, !dbg !72
  %25 = icmp eq i32 %24, 0, !dbg !74
  br i1 %25, label %26, label %30, !dbg !75

26:                                               ; preds = %19
  %27 = load ptr, ptr %9, align 8, !dbg !76
  %28 = call i32 @MPI_Irecv(ptr noundef %27, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i32 noundef 0, i32 noundef 1140850688, ptr noundef %8), !dbg !78
  %29 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !79
  br label %30, !dbg !80

30:                                               ; preds = %26, %19
  %31 = load i32, ptr %7, align 4, !dbg !81
  %32 = icmp eq i32 %31, 1, !dbg !83
  br i1 %32, label %33, label %38, !dbg !84

33:                                               ; preds = %30
  %34 = load ptr, ptr %9, align 8, !dbg !85
  %35 = call i32 @MPI_Bsend_init(ptr noundef %34, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 0, i32 noundef 1140850688, ptr noundef %8), !dbg !87
  %36 = call i32 @MPI_Start(ptr noundef %8), !dbg !88
  %37 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !89
  br label %38, !dbg !90

38:                                               ; preds = %33, %30
  call void @llvm.dbg.declare(metadata ptr %11, metadata !91, metadata !DIExpression()), !dbg !92
  %39 = load ptr, ptr %10, align 8, !dbg !93
  %40 = call i32 @MPI_Buffer_detach(ptr noundef %39, ptr noundef %11), !dbg !94
  %41 = load ptr, ptr %10, align 8, !dbg !95
  call void @free(ptr noundef %41) #6, !dbg !96
  %42 = load ptr, ptr %9, align 8, !dbg !97
  call void @free(ptr noundef %42) #6, !dbg !98
  %43 = load i32, ptr %7, align 4, !dbg !99
  %44 = icmp eq i32 %43, 1, !dbg !101
  br i1 %44, label %45, label %47, !dbg !102

45:                                               ; preds = %38
  %46 = call i32 @MPI_Request_free(ptr noundef %8), !dbg !103
  br label %47, !dbg !105

47:                                               ; preds = %45, %38
  %48 = call i32 @MPI_Finalize(), !dbg !106
  %49 = load i32, ptr %7, align 4, !dbg !107
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %49), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Buffer_attach(ptr noundef, i32 noundef) #2

declare i32 @MPI_Irecv(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Bsend_init(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Start(ptr noundef) #2

declare i32 @MPI_Buffer_detach(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Request_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/P2P/Correct-mpi_bsend_init-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e6da15d808e727629aa040e4a7c49620")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/Correct-mpi_bsend_init-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e6da15d808e727629aa040e4a7c49620")
!14 = !{!15, !18, !19, !20, !21, !22}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !25)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !24, file: !16, line: 588, baseType: !17, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !24, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !24, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !24, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !24, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!31 = !{!0, !7}
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"openmp", i32 50}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 2}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = !{!"Debian clang version 15.0.6"}
!41 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !45)
!42 = !DISubroutineType(types: !43)
!43 = !{!17, !17, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!45 = !{}
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 22, type: !17)
!47 = !DILocation(line: 22, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 22, type: !44)
!49 = !DILocation(line: 22, column: 27, scope: !41)
!50 = !DILocalVariable(name: "nprocs", scope: !41, file: !2, line: 23, type: !17)
!51 = !DILocation(line: 23, column: 7, scope: !41)
!52 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 24, type: !17)
!53 = !DILocation(line: 24, column: 7, scope: !41)
!54 = !DILocalVariable(name: "mpi_request_0", scope: !41, file: !2, line: 25, type: !15)
!55 = !DILocation(line: 25, column: 15, scope: !41)
!56 = !DILocation(line: 27, column: 3, scope: !41)
!57 = !DILocation(line: 28, column: 3, scope: !41)
!58 = !DILocation(line: 29, column: 3, scope: !41)
!59 = !DILocation(line: 30, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !41, file: !2, line: 30, column: 7)
!61 = !DILocation(line: 30, column: 14, scope: !60)
!62 = !DILocation(line: 30, column: 7, scope: !41)
!63 = !DILocation(line: 31, column: 5, scope: !60)
!64 = !DILocalVariable(name: "buf", scope: !41, file: !2, line: 34, type: !19)
!65 = !DILocation(line: 34, column: 8, scope: !41)
!66 = !DILocation(line: 34, column: 21, scope: !41)
!67 = !DILocalVariable(name: "mpi_buf", scope: !41, file: !2, line: 36, type: !20)
!68 = !DILocation(line: 36, column: 9, scope: !41)
!69 = !DILocation(line: 37, column: 15, scope: !41)
!70 = !DILocation(line: 39, column: 21, scope: !41)
!71 = !DILocation(line: 39, column: 3, scope: !41)
!72 = !DILocation(line: 40, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !41, file: !2, line: 40, column: 7)
!74 = !DILocation(line: 40, column: 12, scope: !73)
!75 = !DILocation(line: 40, column: 7, scope: !41)
!76 = !DILocation(line: 41, column: 15, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 40, column: 18)
!78 = !DILocation(line: 41, column: 5, scope: !77)
!79 = !DILocation(line: 42, column: 5, scope: !77)
!80 = !DILocation(line: 43, column: 3, scope: !77)
!81 = !DILocation(line: 44, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !41, file: !2, line: 44, column: 7)
!83 = !DILocation(line: 44, column: 12, scope: !82)
!84 = !DILocation(line: 44, column: 7, scope: !41)
!85 = !DILocation(line: 45, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 44, column: 18)
!87 = !DILocation(line: 45, column: 5, scope: !86)
!88 = !DILocation(line: 46, column: 5, scope: !86)
!89 = !DILocation(line: 47, column: 5, scope: !86)
!90 = !DILocation(line: 48, column: 3, scope: !86)
!91 = !DILocalVariable(name: "freed_size", scope: !41, file: !2, line: 49, type: !17)
!92 = !DILocation(line: 49, column: 7, scope: !41)
!93 = !DILocation(line: 50, column: 21, scope: !41)
!94 = !DILocation(line: 50, column: 3, scope: !41)
!95 = !DILocation(line: 51, column: 8, scope: !41)
!96 = !DILocation(line: 51, column: 3, scope: !41)
!97 = !DILocation(line: 52, column: 8, scope: !41)
!98 = !DILocation(line: 52, column: 3, scope: !41)
!99 = !DILocation(line: 53, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !41, file: !2, line: 53, column: 7)
!101 = !DILocation(line: 53, column: 12, scope: !100)
!102 = !DILocation(line: 53, column: 7, scope: !41)
!103 = !DILocation(line: 54, column: 5, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 53, column: 18)
!105 = !DILocation(line: 55, column: 3, scope: !104)
!106 = !DILocation(line: 57, column: 3, scope: !41)
!107 = !DILocation(line: 58, column: 41, scope: !41)
!108 = !DILocation(line: 58, column: 3, scope: !41)
!109 = !DILocation(line: 59, column: 3, scope: !41)
