; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-fetch_and_op_get_accumulate-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-fetch_and_op_get_accumulate-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_op_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@ompi_mpi_op_sum = external global %struct.ompi_predefined_op_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !41 {
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
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !47, metadata !DIExpression()), !dbg !48
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %6, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 -1, ptr %6, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 -1, ptr %7, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, ptr %8, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 0, ptr %9, align 4, !dbg !58
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !59
  %16 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !60
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !61
  %18 = load i32, ptr %6, align 4, !dbg !62
  %19 = icmp slt i32 %18, 2, !dbg !64
  br i1 %19, label %20, label %22, !dbg !65

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !66
  br label %22, !dbg !66

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !67, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %11, metadata !72, metadata !DIExpression()), !dbg !73
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !74
  store ptr %23, ptr %11, align 8, !dbg !73
  %24 = load ptr, ptr %11, align 8, !dbg !75
  %25 = call i32 @MPI_Win_create(ptr noundef %24, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %10), !dbg !76
  %26 = load ptr, ptr %10, align 8, !dbg !77
  %27 = call i32 @MPI_Win_lock_all(i32 noundef 0, ptr noundef %26), !dbg !78
  %28 = load i32, ptr %7, align 4, !dbg !79
  %29 = icmp eq i32 %28, 0, !dbg !81
  br i1 %29, label %30, label %42, !dbg !82

30:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata ptr %12, metadata !83, metadata !DIExpression()), !dbg !85
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !86
  store ptr %31, ptr %12, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata ptr %13, metadata !87, metadata !DIExpression()), !dbg !88
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !89
  store ptr %32, ptr %13, align 8, !dbg !88
  %33 = load ptr, ptr %12, align 8, !dbg !90
  %34 = load ptr, ptr %13, align 8, !dbg !91
  %35 = load ptr, ptr %10, align 8, !dbg !92
  %36 = call i32 @MPI_Fetch_and_op(ptr noundef %33, ptr noundef %34, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, ptr noundef @ompi_mpi_op_sum, ptr noundef %35), !dbg !93
  call void @llvm.dbg.declare(metadata ptr %14, metadata !94, metadata !DIExpression()), !dbg !95
  %37 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !96
  store ptr %37, ptr %14, align 8, !dbg !95
  %38 = load ptr, ptr %12, align 8, !dbg !97
  %39 = load ptr, ptr %14, align 8, !dbg !98
  %40 = load ptr, ptr %10, align 8, !dbg !99
  %41 = call i32 @MPI_Get_accumulate(ptr noundef %38, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %39, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %40), !dbg !100
  br label %42, !dbg !101

42:                                               ; preds = %30, %22
  %43 = load ptr, ptr %10, align 8, !dbg !102
  %44 = call i32 @MPI_Win_unlock_all(ptr noundef %43), !dbg !103
  %45 = call i32 @MPI_Win_free(ptr noundef %10), !dbg !104
  %46 = call i32 @MPI_Finalize(), !dbg !105
  %47 = load i32, ptr %7, align 4, !dbg !106
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %47), !dbg !107
  ret i32 0, !dbg !108
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

declare i32 @MPI_Fetch_and_op(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Get_accumulate(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-fetch_and_op_get_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d6b346931eba41277a50492682dc4ac3")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 59, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-fetch_and_op_get_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d6b346931eba41277a50492682dc4ac3")
!14 = !{!15, !19, !20, !22, !25, !28}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 425, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !16, line: 425, flags: DIFlagFwdDecl)
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
!41 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !46)
!42 = !DISubroutineType(types: !43)
!43 = !{!21, !21, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !{}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 22, type: !21)
!48 = !DILocation(line: 22, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 22, type: !44)
!50 = !DILocation(line: 22, column: 27, scope: !41)
!51 = !DILocalVariable(name: "nprocs", scope: !41, file: !2, line: 23, type: !21)
!52 = !DILocation(line: 23, column: 7, scope: !41)
!53 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 24, type: !21)
!54 = !DILocation(line: 24, column: 7, scope: !41)
!55 = !DILocalVariable(name: "int_0", scope: !41, file: !2, line: 25, type: !21)
!56 = !DILocation(line: 25, column: 7, scope: !41)
!57 = !DILocalVariable(name: "int_1", scope: !41, file: !2, line: 26, type: !21)
!58 = !DILocation(line: 26, column: 7, scope: !41)
!59 = !DILocation(line: 28, column: 3, scope: !41)
!60 = !DILocation(line: 29, column: 3, scope: !41)
!61 = !DILocation(line: 30, column: 3, scope: !41)
!62 = !DILocation(line: 31, column: 7, scope: !63)
!63 = distinct !DILexicalBlock(scope: !41, file: !2, line: 31, column: 7)
!64 = !DILocation(line: 31, column: 14, scope: !63)
!65 = !DILocation(line: 31, column: 7, scope: !41)
!66 = !DILocation(line: 32, column: 5, scope: !63)
!67 = !DILocalVariable(name: "mpi_win_0", scope: !41, file: !2, line: 35, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!71 = !DILocation(line: 35, column: 11, scope: !41)
!72 = !DILocalVariable(name: "winbuf", scope: !41, file: !2, line: 37, type: !20)
!73 = !DILocation(line: 37, column: 8, scope: !41)
!74 = !DILocation(line: 37, column: 24, scope: !41)
!75 = !DILocation(line: 39, column: 18, scope: !41)
!76 = !DILocation(line: 39, column: 3, scope: !41)
!77 = !DILocation(line: 41, column: 23, scope: !41)
!78 = !DILocation(line: 41, column: 3, scope: !41)
!79 = !DILocation(line: 42, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !41, file: !2, line: 42, column: 7)
!81 = !DILocation(line: 42, column: 12, scope: !80)
!82 = !DILocation(line: 42, column: 7, scope: !41)
!83 = !DILocalVariable(name: "buf", scope: !84, file: !2, line: 44, type: !20)
!84 = distinct !DILexicalBlock(scope: !80, file: !2, line: 42, column: 18)
!85 = !DILocation(line: 44, column: 10, scope: !84)
!86 = !DILocation(line: 44, column: 23, scope: !84)
!87 = !DILocalVariable(name: "int_0", scope: !84, file: !2, line: 46, type: !20)
!88 = !DILocation(line: 46, column: 10, scope: !84)
!89 = !DILocation(line: 46, column: 25, scope: !84)
!90 = !DILocation(line: 48, column: 22, scope: !84)
!91 = !DILocation(line: 48, column: 27, scope: !84)
!92 = !DILocation(line: 48, column: 58, scope: !84)
!93 = !DILocation(line: 48, column: 5, scope: !84)
!94 = !DILocalVariable(name: "int_1", scope: !84, file: !2, line: 50, type: !20)
!95 = !DILocation(line: 50, column: 10, scope: !84)
!96 = !DILocation(line: 50, column: 25, scope: !84)
!97 = !DILocation(line: 52, column: 24, scope: !84)
!98 = !DILocation(line: 52, column: 42, scope: !84)
!99 = !DILocation(line: 53, column: 33, scope: !84)
!100 = !DILocation(line: 52, column: 5, scope: !84)
!101 = !DILocation(line: 54, column: 3, scope: !84)
!102 = !DILocation(line: 55, column: 22, scope: !41)
!103 = !DILocation(line: 55, column: 3, scope: !41)
!104 = !DILocation(line: 56, column: 3, scope: !41)
!105 = !DILocation(line: 58, column: 3, scope: !41)
!106 = !DILocation(line: 59, column: 41, scope: !41)
!107 = !DILocation(line: 59, column: 3, scope: !41)
!108 = !DILocation(line: 60, column: 3, scope: !41)
