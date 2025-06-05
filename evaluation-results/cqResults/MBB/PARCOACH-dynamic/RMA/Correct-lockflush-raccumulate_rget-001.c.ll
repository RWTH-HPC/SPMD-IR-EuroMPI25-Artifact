; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-raccumulate_rget-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-raccumulate_rget-001.c"
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
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !56 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !62, metadata !DIExpression()), !dbg !63
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata ptr %6, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, ptr %6, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata ptr %7, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, ptr %7, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata ptr %8, metadata !70, metadata !DIExpression()), !dbg !71
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata ptr %9, metadata !72, metadata !DIExpression()), !dbg !73
  store ptr @ompi_request_null, ptr %9, align 8, !dbg !73
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !74
  %14 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !75
  %15 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !76
  %16 = load i32, ptr %6, align 4, !dbg !77
  %17 = icmp slt i32 %16, 2, !dbg !79
  br i1 %17, label %18, label %20, !dbg !80

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !81
  br label %20, !dbg !81

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !82, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %11, metadata !87, metadata !DIExpression()), !dbg !88
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !89
  store ptr %21, ptr %11, align 8, !dbg !88
  %22 = load ptr, ptr %11, align 8, !dbg !90
  %23 = call i32 @MPI_Win_create(ptr noundef %22, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %10), !dbg !91
  %24 = load i32, ptr %7, align 4, !dbg !92
  %25 = icmp eq i32 %24, 0, !dbg !94
  br i1 %25, label %26, label %42, !dbg !95

26:                                               ; preds = %20
  %27 = load ptr, ptr %10, align 8, !dbg !96
  %28 = call i32 @MPI_Win_lock(i32 noundef 1, i32 noundef 1, i32 noundef 0, ptr noundef %27), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %12, metadata !99, metadata !DIExpression()), !dbg !100
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !101
  store ptr %29, ptr %12, align 8, !dbg !100
  %30 = load ptr, ptr %12, align 8, !dbg !102
  %31 = load ptr, ptr %10, align 8, !dbg !103
  %32 = call i32 @MPI_Raccumulate(ptr noundef %30, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %31, ptr noundef %8), !dbg !104
  %33 = load ptr, ptr %10, align 8, !dbg !105
  %34 = call i32 @MPI_Win_flush(i32 noundef 1, ptr noundef %33), !dbg !106
  %35 = load ptr, ptr %12, align 8, !dbg !107
  %36 = load ptr, ptr %10, align 8, !dbg !108
  %37 = call i32 @MPI_Rget(ptr noundef %35, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 10, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %36, ptr noundef %9), !dbg !109
  %38 = load ptr, ptr %10, align 8, !dbg !110
  %39 = call i32 @MPI_Win_unlock(i32 noundef 1, ptr noundef %38), !dbg !111
  %40 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !112
  %41 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !113
  br label %42, !dbg !114

42:                                               ; preds = %26, %20
  %43 = call i32 @MPI_Win_free(ptr noundef %10), !dbg !115
  %44 = call i32 @MPI_Finalize(), !dbg !116
  %45 = load i32, ptr %7, align 4, !dbg !117
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %45), !dbg !118
  ret i32 0, !dbg !119
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

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Raccumulate(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_flush(i32 noundef, ptr noundef) #2

declare i32 @MPI_Rget(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!47, !48, !49, !50, !51, !52, !53, !54}
!llvm.ident = !{!55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-raccumulate_rget-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9de9452f2891a53a008458f9085efd93")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 57, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !46, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-raccumulate_rget-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9de9452f2891a53a008458f9085efd93")
!14 = !{!15, !19, !20, !23, !25, !28, !31, !34}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 425, baseType: !32)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !16, line: 425, flags: DIFlagFwdDecl)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !37)
!37 = !{!38, !39, !40, !41, !42}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !36, file: !16, line: 441, baseType: !24, size: 32)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !36, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !36, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !36, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !36, file: !16, line: 449, baseType: !43, size: 64, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !{!0, !7}
!47 = !{i32 7, !"Dwarf Version", i32 5}
!48 = !{i32 2, !"Debug Info Version", i32 3}
!49 = !{i32 1, !"wchar_size", i32 4}
!50 = !{i32 7, !"openmp", i32 50}
!51 = !{i32 7, !"PIC Level", i32 2}
!52 = !{i32 7, !"PIE Level", i32 2}
!53 = !{i32 7, !"uwtable", i32 2}
!54 = !{i32 7, !"frame-pointer", i32 2}
!55 = !{!"Debian clang version 15.0.6"}
!56 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !57, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !61)
!57 = !DISubroutineType(types: !58)
!58 = !{!24, !24, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !{}
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !2, line: 22, type: !24)
!63 = !DILocation(line: 22, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !2, line: 22, type: !59)
!65 = !DILocation(line: 22, column: 27, scope: !56)
!66 = !DILocalVariable(name: "nprocs", scope: !56, file: !2, line: 23, type: !24)
!67 = !DILocation(line: 23, column: 7, scope: !56)
!68 = !DILocalVariable(name: "rank", scope: !56, file: !2, line: 24, type: !24)
!69 = !DILocation(line: 24, column: 7, scope: !56)
!70 = !DILocalVariable(name: "mpi_request_0", scope: !56, file: !2, line: 25, type: !15)
!71 = !DILocation(line: 25, column: 15, scope: !56)
!72 = !DILocalVariable(name: "mpi_request_1", scope: !56, file: !2, line: 26, type: !15)
!73 = !DILocation(line: 26, column: 15, scope: !56)
!74 = !DILocation(line: 28, column: 3, scope: !56)
!75 = !DILocation(line: 29, column: 3, scope: !56)
!76 = !DILocation(line: 30, column: 3, scope: !56)
!77 = !DILocation(line: 31, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !56, file: !2, line: 31, column: 7)
!79 = !DILocation(line: 31, column: 14, scope: !78)
!80 = !DILocation(line: 31, column: 7, scope: !56)
!81 = !DILocation(line: 32, column: 5, scope: !78)
!82 = !DILocalVariable(name: "mpi_win_0", scope: !56, file: !2, line: 35, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !84)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!86 = !DILocation(line: 35, column: 11, scope: !56)
!87 = !DILocalVariable(name: "winbuf", scope: !56, file: !2, line: 37, type: !23)
!88 = !DILocation(line: 37, column: 8, scope: !56)
!89 = !DILocation(line: 37, column: 24, scope: !56)
!90 = !DILocation(line: 39, column: 18, scope: !56)
!91 = !DILocation(line: 39, column: 3, scope: !56)
!92 = !DILocation(line: 41, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !56, file: !2, line: 41, column: 7)
!94 = !DILocation(line: 41, column: 12, scope: !93)
!95 = !DILocation(line: 41, column: 7, scope: !56)
!96 = !DILocation(line: 42, column: 44, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !2, line: 41, column: 18)
!98 = !DILocation(line: 42, column: 5, scope: !97)
!99 = !DILocalVariable(name: "buf", scope: !97, file: !2, line: 44, type: !23)
!100 = !DILocation(line: 44, column: 10, scope: !97)
!101 = !DILocation(line: 44, column: 23, scope: !97)
!102 = !DILocation(line: 46, column: 21, scope: !97)
!103 = !DILocation(line: 46, column: 67, scope: !97)
!104 = !DILocation(line: 46, column: 5, scope: !97)
!105 = !DILocation(line: 48, column: 22, scope: !97)
!106 = !DILocation(line: 48, column: 5, scope: !97)
!107 = !DILocation(line: 49, column: 14, scope: !97)
!108 = !DILocation(line: 49, column: 52, scope: !97)
!109 = !DILocation(line: 49, column: 5, scope: !97)
!110 = !DILocation(line: 50, column: 23, scope: !97)
!111 = !DILocation(line: 50, column: 5, scope: !97)
!112 = !DILocation(line: 51, column: 5, scope: !97)
!113 = !DILocation(line: 52, column: 5, scope: !97)
!114 = !DILocation(line: 53, column: 3, scope: !97)
!115 = !DILocation(line: 54, column: 3, scope: !56)
!116 = !DILocation(line: 56, column: 3, scope: !56)
!117 = !DILocation(line: 57, column: 41, scope: !56)
!118 = !DILocation(line: 57, column: 3, scope: !56)
!119 = !DILocation(line: 58, column: 3, scope: !56)
