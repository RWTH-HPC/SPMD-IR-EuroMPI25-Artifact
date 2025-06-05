; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/sync/009-MPI-sync-request-local-yes.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/sync/009-MPI-sync-request-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"value is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !54 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !60, metadata !DIExpression()), !dbg !61
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %6, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata ptr %7, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %8, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %9, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %10, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 1, ptr %10, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata ptr %11, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 2, ptr %11, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata ptr %12, metadata !80, metadata !DIExpression()), !dbg !81
  store ptr %10, ptr %12, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata ptr %13, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata ptr %14, metadata !84, metadata !DIExpression()), !dbg !85
  store i32 42, ptr %14, align 4, !dbg !85
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !86
  %18 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !87
  %19 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !88
  %20 = load i32, ptr %7, align 4, !dbg !89
  %21 = icmp ne i32 %20, 2, !dbg !91
  br i1 %21, label %22, label %26, !dbg !92

22:                                               ; preds = %2
  %23 = load i32, ptr %7, align 4, !dbg !93
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %23, i32 noundef 2), !dbg !95
  %25 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !96
  br label %26, !dbg !97

26:                                               ; preds = %22, %2
  %27 = call i32 @MPI_Win_allocate(i64 noundef 40, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %9, ptr noundef %8), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %15, metadata !99, metadata !DIExpression()), !dbg !101
  store i32 0, ptr %15, align 4, !dbg !101
  br label %28, !dbg !102

28:                                               ; preds = %36, %26
  %29 = load i32, ptr %15, align 4, !dbg !103
  %30 = icmp slt i32 %29, 10, !dbg !105
  br i1 %30, label %31, label %39, !dbg !106

31:                                               ; preds = %28
  %32 = load ptr, ptr %9, align 8, !dbg !107
  %33 = load i32, ptr %15, align 4, !dbg !109
  %34 = sext i32 %33 to i64, !dbg !107
  %35 = getelementptr inbounds i32, ptr %32, i64 %34, !dbg !107
  store i32 0, ptr %35, align 4, !dbg !110
  br label %36, !dbg !111

36:                                               ; preds = %31
  %37 = load i32, ptr %15, align 4, !dbg !112
  %38 = add nsw i32 %37, 1, !dbg !112
  store i32 %38, ptr %15, align 4, !dbg !112
  br label %28, !dbg !113, !llvm.loop !114

39:                                               ; preds = %28
  %40 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !117
  %41 = load ptr, ptr %8, align 8, !dbg !118
  %42 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %41), !dbg !119
  %43 = load i32, ptr %6, align 4, !dbg !120
  %44 = icmp eq i32 %43, 0, !dbg !122
  br i1 %44, label %45, label %51, !dbg !123

45:                                               ; preds = %39
  call void @llvm.dbg.declare(metadata ptr %16, metadata !124, metadata !DIExpression()), !dbg !129
  %46 = load ptr, ptr %8, align 8, !dbg !130
  %47 = call i32 @MPI_Rget(ptr noundef %10, i32 noundef 1, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 1, ptr noundef @ompi_mpi_int, ptr noundef %46, ptr noundef %16), !dbg !131
  %48 = load i32, ptr %10, align 4, !dbg !132
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %48), !dbg !133
  %50 = call i32 @MPI_Wait(ptr noundef %16, ptr noundef null), !dbg !134
  br label %51, !dbg !135

51:                                               ; preds = %45, %39
  %52 = load ptr, ptr %8, align 8, !dbg !136
  %53 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %52), !dbg !137
  %54 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !138
  %55 = load i32, ptr %6, align 4, !dbg !139
  %56 = load ptr, ptr %12, align 8, !dbg !140
  %57 = load i32, ptr %56, align 4, !dbg !141
  %58 = load i32, ptr %11, align 4, !dbg !142
  %59 = load ptr, ptr %9, align 8, !dbg !143
  %60 = getelementptr inbounds i32, ptr %59, i64 0, !dbg !143
  %61 = load i32, ptr %60, align 4, !dbg !143
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %55, i32 noundef %57, i32 noundef %58, i32 noundef %61), !dbg !144
  %63 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !145
  %64 = call i32 @MPI_Finalize(), !dbg !146
  ret i32 0, !dbg !147
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Rget(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!45, !46, !47, !48, !49, !50, !51, !52}
!llvm.ident = !{!53}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 40, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/sync/009-MPI-sync-request-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1c105d3f9c3270b3b719f992a83ec1e2")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 57, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 13)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 65, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !44, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/sync/009-MPI-sync-request-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1c105d3f9c3270b3b719f992a83ec1e2")
!19 = !{!20, !24, !25, !28, !31}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !21, line: 428, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !21, line: 438, size: 192, elements: !34)
!34 = !{!35, !37, !38, !39, !40}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !33, file: !21, line: 441, baseType: !36, size: 32)
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !33, file: !21, line: 442, baseType: !36, size: 32, offset: 32)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !33, file: !21, line: 443, baseType: !36, size: 32, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !33, file: !21, line: 448, baseType: !36, size: 32, offset: 96)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !33, file: !21, line: 449, baseType: !41, size: 64, offset: 128)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !{!0, !7, !12}
!45 = !{i32 7, !"Dwarf Version", i32 5}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{i32 7, !"openmp", i32 50}
!49 = !{i32 7, !"PIC Level", i32 2}
!50 = !{i32 7, !"PIE Level", i32 2}
!51 = !{i32 7, !"uwtable", i32 2}
!52 = !{i32 7, !"frame-pointer", i32 2}
!53 = !{!"Debian clang version 15.0.6"}
!54 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 25, type: !55, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !59)
!55 = !DISubroutineType(types: !56)
!56 = !{!36, !36, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !{}
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !2, line: 25, type: !36)
!61 = !DILocation(line: 25, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !2, line: 25, type: !57)
!63 = !DILocation(line: 25, column: 27, scope: !54)
!64 = !DILocalVariable(name: "rank", scope: !54, file: !2, line: 27, type: !36)
!65 = !DILocation(line: 27, column: 9, scope: !54)
!66 = !DILocalVariable(name: "size", scope: !54, file: !2, line: 27, type: !36)
!67 = !DILocation(line: 27, column: 15, scope: !54)
!68 = !DILocalVariable(name: "win", scope: !54, file: !2, line: 28, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!72 = !DILocation(line: 28, column: 13, scope: !54)
!73 = !DILocalVariable(name: "win_base", scope: !54, file: !2, line: 29, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!75 = !DILocation(line: 29, column: 10, scope: !54)
!76 = !DILocalVariable(name: "value", scope: !54, file: !2, line: 30, type: !36)
!77 = !DILocation(line: 30, column: 9, scope: !54)
!78 = !DILocalVariable(name: "value2", scope: !54, file: !2, line: 30, type: !36)
!79 = !DILocation(line: 30, column: 20, scope: !54)
!80 = !DILocalVariable(name: "buf", scope: !54, file: !2, line: 31, type: !74)
!81 = !DILocation(line: 31, column: 10, scope: !54)
!82 = !DILocalVariable(name: "result", scope: !54, file: !2, line: 32, type: !36)
!83 = !DILocation(line: 32, column: 9, scope: !54)
!84 = !DILocalVariable(name: "token", scope: !54, file: !2, line: 33, type: !36)
!85 = !DILocation(line: 33, column: 9, scope: !54)
!86 = !DILocation(line: 35, column: 5, scope: !54)
!87 = !DILocation(line: 36, column: 5, scope: !54)
!88 = !DILocation(line: 37, column: 5, scope: !54)
!89 = !DILocation(line: 39, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !54, file: !2, line: 39, column: 9)
!91 = !DILocation(line: 39, column: 14, scope: !90)
!92 = !DILocation(line: 39, column: 9, scope: !54)
!93 = !DILocation(line: 40, column: 69, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !2, line: 39, column: 27)
!95 = !DILocation(line: 40, column: 9, scope: !94)
!96 = !DILocation(line: 41, column: 9, scope: !94)
!97 = !DILocation(line: 42, column: 5, scope: !94)
!98 = !DILocation(line: 44, column: 5, scope: !54)
!99 = !DILocalVariable(name: "i", scope: !100, file: !2, line: 45, type: !36)
!100 = distinct !DILexicalBlock(scope: !54, file: !2, line: 45, column: 5)
!101 = !DILocation(line: 45, column: 14, scope: !100)
!102 = !DILocation(line: 45, column: 10, scope: !100)
!103 = !DILocation(line: 45, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 45, column: 5)
!105 = !DILocation(line: 45, column: 23, scope: !104)
!106 = !DILocation(line: 45, column: 5, scope: !100)
!107 = !DILocation(line: 46, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !2, line: 45, column: 40)
!109 = !DILocation(line: 46, column: 18, scope: !108)
!110 = !DILocation(line: 46, column: 21, scope: !108)
!111 = !DILocation(line: 47, column: 5, scope: !108)
!112 = !DILocation(line: 45, column: 36, scope: !104)
!113 = !DILocation(line: 45, column: 5, scope: !104)
!114 = distinct !{!114, !106, !115, !116}
!115 = !DILocation(line: 47, column: 5, scope: !100)
!116 = !{!"llvm.loop.mustprogress"}
!117 = !DILocation(line: 49, column: 5, scope: !54)
!118 = !DILocation(line: 51, column: 22, scope: !54)
!119 = !DILocation(line: 51, column: 5, scope: !54)
!120 = !DILocation(line: 52, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !54, file: !2, line: 52, column: 9)
!122 = !DILocation(line: 52, column: 14, scope: !121)
!123 = !DILocation(line: 52, column: 9, scope: !54)
!124 = !DILocalVariable(name: "req", scope: !125, file: !2, line: 53, type: !126)
!125 = distinct !DILexicalBlock(scope: !121, file: !2, line: 52, column: 20)
!126 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !21, line: 426, baseType: !127)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !21, line: 426, flags: DIFlagFwdDecl)
!129 = !DILocation(line: 53, column: 21, scope: !125)
!130 = !DILocation(line: 55, column: 56, scope: !125)
!131 = !DILocation(line: 55, column: 9, scope: !125)
!132 = !DILocation(line: 57, column: 33, scope: !125)
!133 = !DILocation(line: 57, column: 9, scope: !125)
!134 = !DILocation(line: 58, column: 9, scope: !125)
!135 = !DILocation(line: 59, column: 5, scope: !125)
!136 = !DILocation(line: 61, column: 22, scope: !54)
!137 = !DILocation(line: 61, column: 5, scope: !54)
!138 = !DILocation(line: 63, column: 5, scope: !54)
!139 = !DILocation(line: 66, column: 9, scope: !54)
!140 = !DILocation(line: 67, column: 10, scope: !54)
!141 = !DILocation(line: 67, column: 9, scope: !54)
!142 = !DILocation(line: 68, column: 9, scope: !54)
!143 = !DILocation(line: 69, column: 9, scope: !54)
!144 = !DILocation(line: 64, column: 5, scope: !54)
!145 = !DILocation(line: 71, column: 5, scope: !54)
!146 = !DILocation(line: 72, column: 5, scope: !54)
!147 = !DILocation(line: 74, column: 5, scope: !54)
