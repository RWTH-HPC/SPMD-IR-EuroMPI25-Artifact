; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-raccumulate_bufread-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-raccumulate_bufread-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_op_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@ompi_mpi_op_sum = external global %struct.ompi_predefined_op_t, align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !61 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !67, metadata !DIExpression()), !dbg !68
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %6, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, ptr %6, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata ptr %7, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, ptr %7, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata ptr %8, metadata !75, metadata !DIExpression()), !dbg !76
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !76
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !77
  %13 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !78
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !79
  %15 = load i32, ptr %6, align 4, !dbg !80
  %16 = icmp slt i32 %15, 2, !dbg !82
  br i1 %16, label %17, label %19, !dbg !83

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !84
  br label %19, !dbg !84

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !85, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata ptr %10, metadata !90, metadata !DIExpression()), !dbg !91
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !92
  store ptr %20, ptr %10, align 8, !dbg !91
  %21 = load ptr, ptr %10, align 8, !dbg !93
  %22 = call i32 @MPI_Win_create(ptr noundef %21, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %9), !dbg !94
  %23 = load ptr, ptr %9, align 8, !dbg !95
  %24 = call i32 @MPI_Win_lock_all(i32 noundef 0, ptr noundef %23), !dbg !96
  %25 = load i32, ptr %7, align 4, !dbg !97
  %26 = icmp eq i32 %25, 0, !dbg !99
  br i1 %26, label %27, label %36, !dbg !100

27:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %11, metadata !101, metadata !DIExpression()), !dbg !103
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !104
  store ptr %28, ptr %11, align 8, !dbg !103
  %29 = load ptr, ptr %11, align 8, !dbg !105
  %30 = load ptr, ptr %9, align 8, !dbg !106
  %31 = call i32 @MPI_Raccumulate(ptr noundef %29, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %30, ptr noundef %8), !dbg !107
  %32 = load ptr, ptr %11, align 8, !dbg !108
  %33 = getelementptr inbounds i32, ptr %32, i64 0, !dbg !108
  %34 = load i32, ptr %33, align 4, !dbg !108
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %34), !dbg !109
  br label %36, !dbg !110

36:                                               ; preds = %27, %19
  %37 = load ptr, ptr %9, align 8, !dbg !111
  %38 = call i32 @MPI_Win_unlock_all(ptr noundef %37), !dbg !112
  %39 = load i32, ptr %7, align 4, !dbg !113
  %40 = icmp eq i32 %39, 0, !dbg !115
  br i1 %40, label %41, label %43, !dbg !116

41:                                               ; preds = %36
  %42 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !117
  br label %43, !dbg !119

43:                                               ; preds = %41, %36
  %44 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !120
  %45 = call i32 @MPI_Finalize(), !dbg !121
  %46 = load i32, ptr %7, align 4, !dbg !122
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %46), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Win_create(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_lock_all(i32 noundef, ptr noundef) #2

declare i32 @MPI_Raccumulate(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!52, !53, !54, !55, !56, !57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-raccumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "bfab55dddecefd7a45e540d222618c43")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !51, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-raccumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "bfab55dddecefd7a45e540d222618c43")
!19 = !{!20, !24, !25, !28, !30, !33, !36, !39}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !21, line: 426, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !21, line: 426, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !21, line: 425, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !21, line: 425, flags: DIFlagFwdDecl)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !21, line: 428, baseType: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !21, line: 438, size: 192, elements: !42)
!42 = !{!43, !44, !45, !46, !47}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !41, file: !21, line: 441, baseType: !29, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !41, file: !21, line: 442, baseType: !29, size: 32, offset: 32)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !41, file: !21, line: 443, baseType: !29, size: 32, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !41, file: !21, line: 448, baseType: !29, size: 32, offset: 96)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !41, file: !21, line: 449, baseType: !48, size: 64, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !{!0, !7, !12}
!52 = !{i32 7, !"Dwarf Version", i32 5}
!53 = !{i32 2, !"Debug Info Version", i32 3}
!54 = !{i32 1, !"wchar_size", i32 4}
!55 = !{i32 7, !"openmp", i32 50}
!56 = !{i32 7, !"PIC Level", i32 2}
!57 = !{i32 7, !"PIE Level", i32 2}
!58 = !{i32 7, !"uwtable", i32 2}
!59 = !{i32 7, !"frame-pointer", i32 2}
!60 = !{!"Debian clang version 15.0.6"}
!61 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !62, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !66)
!62 = !DISubroutineType(types: !63)
!63 = !{!29, !29, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!66 = !{}
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !2, line: 22, type: !29)
!68 = !DILocation(line: 22, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !2, line: 22, type: !64)
!70 = !DILocation(line: 22, column: 27, scope: !61)
!71 = !DILocalVariable(name: "nprocs", scope: !61, file: !2, line: 23, type: !29)
!72 = !DILocation(line: 23, column: 7, scope: !61)
!73 = !DILocalVariable(name: "rank", scope: !61, file: !2, line: 24, type: !29)
!74 = !DILocation(line: 24, column: 7, scope: !61)
!75 = !DILocalVariable(name: "mpi_request_0", scope: !61, file: !2, line: 25, type: !20)
!76 = !DILocation(line: 25, column: 15, scope: !61)
!77 = !DILocation(line: 27, column: 3, scope: !61)
!78 = !DILocation(line: 28, column: 3, scope: !61)
!79 = !DILocation(line: 29, column: 3, scope: !61)
!80 = !DILocation(line: 30, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !61, file: !2, line: 30, column: 7)
!82 = !DILocation(line: 30, column: 14, scope: !81)
!83 = !DILocation(line: 30, column: 7, scope: !61)
!84 = !DILocation(line: 31, column: 5, scope: !81)
!85 = !DILocalVariable(name: "mpi_win_0", scope: !61, file: !2, line: 34, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!89 = !DILocation(line: 34, column: 11, scope: !61)
!90 = !DILocalVariable(name: "winbuf", scope: !61, file: !2, line: 36, type: !28)
!91 = !DILocation(line: 36, column: 8, scope: !61)
!92 = !DILocation(line: 36, column: 24, scope: !61)
!93 = !DILocation(line: 38, column: 18, scope: !61)
!94 = !DILocation(line: 38, column: 3, scope: !61)
!95 = !DILocation(line: 40, column: 23, scope: !61)
!96 = !DILocation(line: 40, column: 3, scope: !61)
!97 = !DILocation(line: 41, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !61, file: !2, line: 41, column: 7)
!99 = !DILocation(line: 41, column: 12, scope: !98)
!100 = !DILocation(line: 41, column: 7, scope: !61)
!101 = !DILocalVariable(name: "buf", scope: !102, file: !2, line: 43, type: !28)
!102 = distinct !DILexicalBlock(scope: !98, file: !2, line: 41, column: 18)
!103 = !DILocation(line: 43, column: 10, scope: !102)
!104 = !DILocation(line: 43, column: 23, scope: !102)
!105 = !DILocation(line: 45, column: 21, scope: !102)
!106 = !DILocation(line: 45, column: 67, scope: !102)
!107 = !DILocation(line: 45, column: 5, scope: !102)
!108 = !DILocation(line: 47, column: 27, scope: !102)
!109 = !DILocation(line: 47, column: 5, scope: !102)
!110 = !DILocation(line: 48, column: 3, scope: !102)
!111 = !DILocation(line: 49, column: 22, scope: !61)
!112 = !DILocation(line: 49, column: 3, scope: !61)
!113 = !DILocation(line: 50, column: 7, scope: !114)
!114 = distinct !DILexicalBlock(scope: !61, file: !2, line: 50, column: 7)
!115 = !DILocation(line: 50, column: 12, scope: !114)
!116 = !DILocation(line: 50, column: 7, scope: !61)
!117 = !DILocation(line: 51, column: 5, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !2, line: 50, column: 18)
!119 = !DILocation(line: 52, column: 3, scope: !118)
!120 = !DILocation(line: 53, column: 3, scope: !61)
!121 = !DILocation(line: 55, column: 3, scope: !61)
!122 = !DILocation(line: 56, column: 41, scope: !61)
!123 = !DILocation(line: 56, column: 3, scope: !61)
!124 = !DILocation(line: 57, column: 3, scope: !61)
