; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@__const.main.values = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [2 x i32], align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %8, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !63
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %10, ptr align 4 @__const.main.values, i64 8, i1 false), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %11, metadata !64, metadata !DIExpression()), !dbg !65
  %16 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !66
  store ptr %16, ptr %11, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata ptr %12, metadata !67, metadata !DIExpression()), !dbg !68
  %17 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 1, !dbg !69
  store ptr %17, ptr %12, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata ptr %13, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %14, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 42, ptr %14, align 4, !dbg !73
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !74
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !75
  %20 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !76
  %21 = load i32, ptr %7, align 4, !dbg !77
  %22 = icmp ne i32 %21, 2, !dbg !79
  br i1 %22, label %23, label %27, !dbg !80

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !81
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !83
  %26 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !84
  br label %27, !dbg !85

27:                                               ; preds = %23, %2
  %28 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %9, ptr noundef %8), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %15, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 0, ptr %15, align 4, !dbg !89
  br label %29, !dbg !90

29:                                               ; preds = %37, %27
  %30 = load i32, ptr %15, align 4, !dbg !91
  %31 = icmp slt i32 %30, 10, !dbg !93
  br i1 %31, label %32, label %40, !dbg !94

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !95
  %34 = load i32, ptr %15, align 4, !dbg !97
  %35 = sext i32 %34 to i64, !dbg !95
  %36 = getelementptr inbounds i32, ptr %33, i64 %35, !dbg !95
  store i32 0, ptr %36, align 4, !dbg !98
  br label %37, !dbg !99

37:                                               ; preds = %32
  %38 = load i32, ptr %15, align 4, !dbg !100
  %39 = add nsw i32 %38, 1, !dbg !100
  store i32 %39, ptr %15, align 4, !dbg !100
  br label %29, !dbg !101, !llvm.loop !102

40:                                               ; preds = %29
  %41 = load ptr, ptr %8, align 8, !dbg !105
  %42 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %41), !dbg !106
  %43 = load i32, ptr %6, align 4, !dbg !107
  %44 = icmp eq i32 %43, 0, !dbg !109
  br i1 %44, label %45, label %52, !dbg !110

45:                                               ; preds = %40
  %46 = load ptr, ptr %11, align 8, !dbg !111
  %47 = load ptr, ptr %8, align 8, !dbg !113
  %48 = call i32 @MPI_Get(ptr noundef %46, i32 noundef 1, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 1, ptr noundef @ompi_mpi_int, ptr noundef %47), !dbg !114
  %49 = load ptr, ptr %12, align 8, !dbg !115
  %50 = load ptr, ptr %8, align 8, !dbg !116
  %51 = call i32 @MPI_Get(ptr noundef %49, i32 noundef 1, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 1, ptr noundef @ompi_mpi_int, ptr noundef %50), !dbg !117
  br label %52, !dbg !118

52:                                               ; preds = %45, %40
  %53 = load ptr, ptr %8, align 8, !dbg !119
  %54 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %53), !dbg !120
  %55 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !121
  %56 = load i32, ptr %6, align 4, !dbg !122
  %57 = load ptr, ptr %11, align 8, !dbg !123
  %58 = load i32, ptr %57, align 4, !dbg !124
  %59 = load ptr, ptr %12, align 8, !dbg !125
  %60 = load i32, ptr %59, align 4, !dbg !126
  %61 = load ptr, ptr %9, align 8, !dbg !127
  %62 = getelementptr inbounds i32, ptr %61, i64 0, !dbg !127
  %63 = load i32, ptr %62, align 4, !dbg !127
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %56, i32 noundef %58, i32 noundef %60, i32 noundef %63), !dbg !128
  %65 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !129
  %66 = call i32 @MPI_Finalize(), !dbg !130
  ret i32 0, !dbg !131
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @MPI_Init(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #3

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Barrier(ptr noundef) #3

declare i32 @MPI_Win_free(ptr noundef) #3

declare i32 @MPI_Finalize() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c832545789c8f719ae357ba5ba58edf4")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/034-MPI-static-get-get-same-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c832545789c8f719ae357ba5ba58edf4")
!14 = !{!15, !19, !20, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!26 = !{!0, !7}
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"openmp", i32 50}
!31 = !{i32 7, !"PIC Level", i32 2}
!32 = !{i32 7, !"PIE Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Debian clang version 15.0.6"}
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !37, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !42)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !{}
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 12, type: !39)
!44 = !DILocation(line: 12, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 12, type: !40)
!46 = !DILocation(line: 12, column: 27, scope: !36)
!47 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 14, type: !39)
!48 = !DILocation(line: 14, column: 9, scope: !36)
!49 = !DILocalVariable(name: "size", scope: !36, file: !2, line: 14, type: !39)
!50 = !DILocation(line: 14, column: 15, scope: !36)
!51 = !DILocalVariable(name: "win", scope: !36, file: !2, line: 15, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!55 = !DILocation(line: 15, column: 13, scope: !36)
!56 = !DILocalVariable(name: "win_base", scope: !36, file: !2, line: 16, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!58 = !DILocation(line: 16, column: 10, scope: !36)
!59 = !DILocalVariable(name: "values", scope: !36, file: !2, line: 17, type: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 64, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 2)
!63 = !DILocation(line: 17, column: 9, scope: !36)
!64 = !DILocalVariable(name: "buf0", scope: !36, file: !2, line: 18, type: !57)
!65 = !DILocation(line: 18, column: 10, scope: !36)
!66 = !DILocation(line: 18, column: 19, scope: !36)
!67 = !DILocalVariable(name: "buf1", scope: !36, file: !2, line: 19, type: !57)
!68 = !DILocation(line: 19, column: 10, scope: !36)
!69 = !DILocation(line: 19, column: 19, scope: !36)
!70 = !DILocalVariable(name: "result", scope: !36, file: !2, line: 20, type: !39)
!71 = !DILocation(line: 20, column: 9, scope: !36)
!72 = !DILocalVariable(name: "token", scope: !36, file: !2, line: 21, type: !39)
!73 = !DILocation(line: 21, column: 9, scope: !36)
!74 = !DILocation(line: 23, column: 5, scope: !36)
!75 = !DILocation(line: 24, column: 5, scope: !36)
!76 = !DILocation(line: 25, column: 5, scope: !36)
!77 = !DILocation(line: 27, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !36, file: !2, line: 27, column: 9)
!79 = !DILocation(line: 27, column: 14, scope: !78)
!80 = !DILocation(line: 27, column: 9, scope: !36)
!81 = !DILocation(line: 28, column: 69, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 27, column: 27)
!83 = !DILocation(line: 28, column: 9, scope: !82)
!84 = !DILocation(line: 29, column: 9, scope: !82)
!85 = !DILocation(line: 30, column: 5, scope: !82)
!86 = !DILocation(line: 32, column: 5, scope: !36)
!87 = !DILocalVariable(name: "i", scope: !88, file: !2, line: 33, type: !39)
!88 = distinct !DILexicalBlock(scope: !36, file: !2, line: 33, column: 5)
!89 = !DILocation(line: 33, column: 14, scope: !88)
!90 = !DILocation(line: 33, column: 10, scope: !88)
!91 = !DILocation(line: 33, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 33, column: 5)
!93 = !DILocation(line: 33, column: 23, scope: !92)
!94 = !DILocation(line: 33, column: 5, scope: !88)
!95 = !DILocation(line: 34, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 33, column: 40)
!97 = !DILocation(line: 34, column: 18, scope: !96)
!98 = !DILocation(line: 34, column: 21, scope: !96)
!99 = !DILocation(line: 35, column: 5, scope: !96)
!100 = !DILocation(line: 33, column: 36, scope: !92)
!101 = !DILocation(line: 33, column: 5, scope: !92)
!102 = distinct !{!102, !94, !103, !104}
!103 = !DILocation(line: 35, column: 5, scope: !88)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 37, column: 22, scope: !36)
!106 = !DILocation(line: 37, column: 5, scope: !36)
!107 = !DILocation(line: 38, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !36, file: !2, line: 38, column: 9)
!109 = !DILocation(line: 38, column: 14, scope: !108)
!110 = !DILocation(line: 38, column: 9, scope: !36)
!111 = !DILocation(line: 39, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !2, line: 38, column: 20)
!113 = !DILocation(line: 39, column: 53, scope: !112)
!114 = !DILocation(line: 39, column: 9, scope: !112)
!115 = !DILocation(line: 40, column: 17, scope: !112)
!116 = !DILocation(line: 40, column: 53, scope: !112)
!117 = !DILocation(line: 40, column: 9, scope: !112)
!118 = !DILocation(line: 41, column: 5, scope: !112)
!119 = !DILocation(line: 42, column: 22, scope: !36)
!120 = !DILocation(line: 42, column: 5, scope: !36)
!121 = !DILocation(line: 44, column: 5, scope: !36)
!122 = !DILocation(line: 47, column: 9, scope: !36)
!123 = !DILocation(line: 48, column: 10, scope: !36)
!124 = !DILocation(line: 48, column: 9, scope: !36)
!125 = !DILocation(line: 49, column: 10, scope: !36)
!126 = !DILocation(line: 49, column: 9, scope: !36)
!127 = !DILocation(line: 50, column: 9, scope: !36)
!128 = !DILocation(line: 45, column: 5, scope: !36)
!129 = !DILocation(line: 52, column: 5, scope: !36)
!130 = !DILocation(line: 53, column: 5, scope: !36)
!131 = !DILocation(line: 55, column: 5, scope: !36)
