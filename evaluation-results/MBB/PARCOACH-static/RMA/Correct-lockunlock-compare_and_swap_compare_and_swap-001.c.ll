; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-compare_and_swap_compare_and_swap-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-compare_and_swap_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !44, metadata !DIExpression()), !dbg !45
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, ptr %6, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -1, ptr %7, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %8, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 0, ptr %8, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %9, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 0, ptr %9, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %10, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 0, ptr %10, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 0, ptr %11, align 4, !dbg !59
  %19 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !60
  %20 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !61
  %21 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !62
  %22 = load i32, ptr %6, align 4, !dbg !63
  %23 = icmp slt i32 %22, 2, !dbg !65
  br i1 %23, label %24, label %26, !dbg !66

24:                                               ; preds = %2
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !67
  br label %26, !dbg !67

26:                                               ; preds = %24, %2
  call void @llvm.dbg.declare(metadata ptr %12, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %13, metadata !73, metadata !DIExpression()), !dbg !74
  %27 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !75
  store ptr %27, ptr %13, align 8, !dbg !74
  %28 = load ptr, ptr %13, align 8, !dbg !76
  %29 = call i32 @MPI_Win_create(ptr noundef %28, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %12), !dbg !77
  %30 = load i32, ptr %7, align 4, !dbg !78
  %31 = icmp eq i32 %30, 0, !dbg !80
  br i1 %31, label %32, label %52, !dbg !81

32:                                               ; preds = %26
  %33 = load ptr, ptr %12, align 8, !dbg !82
  %34 = call i32 @MPI_Win_lock(i32 noundef 1, i32 noundef 1, i32 noundef 0, ptr noundef %33), !dbg !84
  call void @llvm.dbg.declare(metadata ptr %14, metadata !85, metadata !DIExpression()), !dbg !86
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !87
  store ptr %35, ptr %14, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata ptr %15, metadata !88, metadata !DIExpression()), !dbg !89
  %36 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !90
  store ptr %36, ptr %15, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata ptr %16, metadata !91, metadata !DIExpression()), !dbg !92
  %37 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !93
  store ptr %37, ptr %16, align 8, !dbg !92
  %38 = load ptr, ptr %14, align 8, !dbg !94
  %39 = load ptr, ptr %16, align 8, !dbg !95
  %40 = load ptr, ptr %15, align 8, !dbg !96
  %41 = load ptr, ptr %12, align 8, !dbg !97
  %42 = call i32 @MPI_Compare_and_swap(ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, ptr noundef %41), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %17, metadata !99, metadata !DIExpression()), !dbg !100
  %43 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !101
  store ptr %43, ptr %17, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata ptr %18, metadata !102, metadata !DIExpression()), !dbg !103
  %44 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !104
  store ptr %44, ptr %18, align 8, !dbg !103
  %45 = load ptr, ptr %14, align 8, !dbg !105
  %46 = load ptr, ptr %18, align 8, !dbg !106
  %47 = load ptr, ptr %17, align 8, !dbg !107
  %48 = load ptr, ptr %12, align 8, !dbg !108
  %49 = call i32 @MPI_Compare_and_swap(ptr noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 10, ptr noundef %48), !dbg !109
  %50 = load ptr, ptr %12, align 8, !dbg !110
  %51 = call i32 @MPI_Win_unlock(i32 noundef 1, ptr noundef %50), !dbg !111
  br label %52, !dbg !112

52:                                               ; preds = %32, %26
  %53 = call i32 @MPI_Win_free(ptr noundef %12), !dbg !113
  %54 = call i32 @MPI_Finalize(), !dbg !114
  %55 = load i32, ptr %7, align 4, !dbg !115
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %55), !dbg !116
  ret i32 0, !dbg !117
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

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 35, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-compare_and_swap_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c0918558490768b624947d8948699008")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 64, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !28, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-compare_and_swap_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c0918558490768b624947d8948699008")
!14 = !{!15, !19, !20, !22, !25}
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
!28 = !{!0, !7}
!29 = !{i32 7, !"Dwarf Version", i32 5}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"openmp", i32 50}
!33 = !{i32 7, !"PIC Level", i32 2}
!34 = !{i32 7, !"PIE Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 2}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{!"Debian clang version 15.0.6"}
!38 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !39, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !43)
!39 = !DISubroutineType(types: !40)
!40 = !{!21, !21, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!43 = !{}
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !2, line: 22, type: !21)
!45 = !DILocation(line: 22, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !2, line: 22, type: !41)
!47 = !DILocation(line: 22, column: 27, scope: !38)
!48 = !DILocalVariable(name: "nprocs", scope: !38, file: !2, line: 23, type: !21)
!49 = !DILocation(line: 23, column: 7, scope: !38)
!50 = !DILocalVariable(name: "rank", scope: !38, file: !2, line: 24, type: !21)
!51 = !DILocation(line: 24, column: 7, scope: !38)
!52 = !DILocalVariable(name: "int_0", scope: !38, file: !2, line: 25, type: !21)
!53 = !DILocation(line: 25, column: 7, scope: !38)
!54 = !DILocalVariable(name: "int_1", scope: !38, file: !2, line: 26, type: !21)
!55 = !DILocation(line: 26, column: 7, scope: !38)
!56 = !DILocalVariable(name: "int_2", scope: !38, file: !2, line: 27, type: !21)
!57 = !DILocation(line: 27, column: 7, scope: !38)
!58 = !DILocalVariable(name: "int_3", scope: !38, file: !2, line: 28, type: !21)
!59 = !DILocation(line: 28, column: 7, scope: !38)
!60 = !DILocation(line: 30, column: 3, scope: !38)
!61 = !DILocation(line: 31, column: 3, scope: !38)
!62 = !DILocation(line: 32, column: 3, scope: !38)
!63 = !DILocation(line: 33, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !38, file: !2, line: 33, column: 7)
!65 = !DILocation(line: 33, column: 14, scope: !64)
!66 = !DILocation(line: 33, column: 7, scope: !38)
!67 = !DILocation(line: 34, column: 5, scope: !64)
!68 = !DILocalVariable(name: "mpi_win_0", scope: !38, file: !2, line: 37, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!72 = !DILocation(line: 37, column: 11, scope: !38)
!73 = !DILocalVariable(name: "winbuf", scope: !38, file: !2, line: 39, type: !20)
!74 = !DILocation(line: 39, column: 8, scope: !38)
!75 = !DILocation(line: 39, column: 24, scope: !38)
!76 = !DILocation(line: 41, column: 18, scope: !38)
!77 = !DILocation(line: 41, column: 3, scope: !38)
!78 = !DILocation(line: 43, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !38, file: !2, line: 43, column: 7)
!80 = !DILocation(line: 43, column: 12, scope: !79)
!81 = !DILocation(line: 43, column: 7, scope: !38)
!82 = !DILocation(line: 44, column: 44, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 43, column: 18)
!84 = !DILocation(line: 44, column: 5, scope: !83)
!85 = !DILocalVariable(name: "buf", scope: !83, file: !2, line: 46, type: !20)
!86 = !DILocation(line: 46, column: 10, scope: !83)
!87 = !DILocation(line: 46, column: 23, scope: !83)
!88 = !DILocalVariable(name: "int_0", scope: !83, file: !2, line: 48, type: !20)
!89 = !DILocation(line: 48, column: 10, scope: !83)
!90 = !DILocation(line: 48, column: 25, scope: !83)
!91 = !DILocalVariable(name: "int_1", scope: !83, file: !2, line: 50, type: !20)
!92 = !DILocation(line: 50, column: 10, scope: !83)
!93 = !DILocation(line: 50, column: 25, scope: !83)
!94 = !DILocation(line: 52, column: 26, scope: !83)
!95 = !DILocation(line: 52, column: 31, scope: !83)
!96 = !DILocation(line: 52, column: 38, scope: !83)
!97 = !DILocation(line: 52, column: 60, scope: !83)
!98 = !DILocation(line: 52, column: 5, scope: !83)
!99 = !DILocalVariable(name: "int_2", scope: !83, file: !2, line: 54, type: !20)
!100 = !DILocation(line: 54, column: 10, scope: !83)
!101 = !DILocation(line: 54, column: 25, scope: !83)
!102 = !DILocalVariable(name: "int_3", scope: !83, file: !2, line: 56, type: !20)
!103 = !DILocation(line: 56, column: 10, scope: !83)
!104 = !DILocation(line: 56, column: 25, scope: !83)
!105 = !DILocation(line: 58, column: 26, scope: !83)
!106 = !DILocation(line: 58, column: 31, scope: !83)
!107 = !DILocation(line: 58, column: 38, scope: !83)
!108 = !DILocation(line: 58, column: 61, scope: !83)
!109 = !DILocation(line: 58, column: 5, scope: !83)
!110 = !DILocation(line: 59, column: 23, scope: !83)
!111 = !DILocation(line: 59, column: 5, scope: !83)
!112 = !DILocation(line: 60, column: 3, scope: !83)
!113 = !DILocation(line: 61, column: 3, scope: !38)
!114 = !DILocation(line: 63, column: 3, scope: !38)
!115 = !DILocation(line: 64, column: 41, scope: !38)
!116 = !DILocation(line: 64, column: 3, scope: !38)
!117 = !DILocation(line: 65, column: 3, scope: !38)
