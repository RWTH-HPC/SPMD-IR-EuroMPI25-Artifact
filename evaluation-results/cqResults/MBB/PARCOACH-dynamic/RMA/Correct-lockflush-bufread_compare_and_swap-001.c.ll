; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_compare_and_swap-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_compare_and_swap-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !43 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !49, metadata !DIExpression()), !dbg !50
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %6, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 -1, ptr %6, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %7, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 -1, ptr %7, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata ptr %8, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 0, ptr %8, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %9, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 0, ptr %9, align 4, !dbg !60
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !61
  %16 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !62
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !63
  %18 = load i32, ptr %6, align 4, !dbg !64
  %19 = icmp slt i32 %18, 2, !dbg !66
  br i1 %19, label %20, label %22, !dbg !67

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !68
  br label %22, !dbg !68

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !69, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata ptr %11, metadata !74, metadata !DIExpression()), !dbg !75
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !76
  store ptr %23, ptr %11, align 8, !dbg !75
  %24 = load ptr, ptr %11, align 8, !dbg !77
  %25 = call i32 @MPI_Win_create(ptr noundef %24, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %10), !dbg !78
  %26 = load i32, ptr %7, align 4, !dbg !79
  %27 = icmp eq i32 %26, 0, !dbg !81
  br i1 %27, label %28, label %45, !dbg !82

28:                                               ; preds = %22
  %29 = load ptr, ptr %10, align 8, !dbg !83
  %30 = call i32 @MPI_Win_lock(i32 noundef 1, i32 noundef 1, i32 noundef 0, ptr noundef %29), !dbg !85
  call void @llvm.dbg.declare(metadata ptr %12, metadata !86, metadata !DIExpression()), !dbg !87
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !88
  store ptr %31, ptr %12, align 8, !dbg !87
  %32 = load ptr, ptr %12, align 8, !dbg !89
  %33 = getelementptr inbounds i32, ptr %32, i64 0, !dbg !89
  %34 = load i32, ptr %33, align 4, !dbg !89
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %34), !dbg !90
  call void @llvm.dbg.declare(metadata ptr %13, metadata !91, metadata !DIExpression()), !dbg !92
  %36 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !93
  store ptr %36, ptr %13, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata ptr %14, metadata !94, metadata !DIExpression()), !dbg !95
  %37 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !96
  store ptr %37, ptr %14, align 8, !dbg !95
  %38 = load ptr, ptr %12, align 8, !dbg !97
  %39 = load ptr, ptr %14, align 8, !dbg !98
  %40 = load ptr, ptr %13, align 8, !dbg !99
  %41 = load ptr, ptr %10, align 8, !dbg !100
  %42 = call i32 @MPI_Compare_and_swap(ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 10, ptr noundef %41), !dbg !101
  %43 = load ptr, ptr %10, align 8, !dbg !102
  %44 = call i32 @MPI_Win_unlock(i32 noundef 1, ptr noundef %43), !dbg !103
  br label %45, !dbg !104

45:                                               ; preds = %28, %22
  %46 = call i32 @MPI_Win_free(ptr noundef %10), !dbg !105
  %47 = call i32 @MPI_Finalize(), !dbg !106
  %48 = load i32, ptr %7, align 4, !dbg !107
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %48), !dbg !108
  ret i32 0, !dbg !109
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

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!34, !35, !36, !37, !38, !39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e8429743290c4092dd9201d62f7c29ec")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !33, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_compare_and_swap-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "e8429743290c4092dd9201d62f7c29ec")
!19 = !{!20, !24, !25, !27, !30}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!33 = !{!0, !7, !12}
!34 = !{i32 7, !"Dwarf Version", i32 5}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 7, !"openmp", i32 50}
!38 = !{i32 7, !"PIC Level", i32 2}
!39 = !{i32 7, !"PIE Level", i32 2}
!40 = !{i32 7, !"uwtable", i32 2}
!41 = !{i32 7, !"frame-pointer", i32 2}
!42 = !{!"Debian clang version 15.0.6"}
!43 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !44, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !48)
!44 = !DISubroutineType(types: !45)
!45 = !{!26, !26, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!48 = !{}
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !2, line: 22, type: !26)
!50 = !DILocation(line: 22, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !2, line: 22, type: !46)
!52 = !DILocation(line: 22, column: 27, scope: !43)
!53 = !DILocalVariable(name: "nprocs", scope: !43, file: !2, line: 23, type: !26)
!54 = !DILocation(line: 23, column: 7, scope: !43)
!55 = !DILocalVariable(name: "rank", scope: !43, file: !2, line: 24, type: !26)
!56 = !DILocation(line: 24, column: 7, scope: !43)
!57 = !DILocalVariable(name: "int_0", scope: !43, file: !2, line: 25, type: !26)
!58 = !DILocation(line: 25, column: 7, scope: !43)
!59 = !DILocalVariable(name: "int_1", scope: !43, file: !2, line: 26, type: !26)
!60 = !DILocation(line: 26, column: 7, scope: !43)
!61 = !DILocation(line: 28, column: 3, scope: !43)
!62 = !DILocation(line: 29, column: 3, scope: !43)
!63 = !DILocation(line: 30, column: 3, scope: !43)
!64 = !DILocation(line: 31, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !43, file: !2, line: 31, column: 7)
!66 = !DILocation(line: 31, column: 14, scope: !65)
!67 = !DILocation(line: 31, column: 7, scope: !43)
!68 = !DILocation(line: 32, column: 5, scope: !65)
!69 = !DILocalVariable(name: "mpi_win_0", scope: !43, file: !2, line: 35, type: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!73 = !DILocation(line: 35, column: 11, scope: !43)
!74 = !DILocalVariable(name: "winbuf", scope: !43, file: !2, line: 37, type: !25)
!75 = !DILocation(line: 37, column: 8, scope: !43)
!76 = !DILocation(line: 37, column: 24, scope: !43)
!77 = !DILocation(line: 39, column: 18, scope: !43)
!78 = !DILocation(line: 39, column: 3, scope: !43)
!79 = !DILocation(line: 41, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !43, file: !2, line: 41, column: 7)
!81 = !DILocation(line: 41, column: 12, scope: !80)
!82 = !DILocation(line: 41, column: 7, scope: !43)
!83 = !DILocation(line: 42, column: 44, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !2, line: 41, column: 18)
!85 = !DILocation(line: 42, column: 5, scope: !84)
!86 = !DILocalVariable(name: "buf", scope: !84, file: !2, line: 44, type: !25)
!87 = !DILocation(line: 44, column: 10, scope: !84)
!88 = !DILocation(line: 44, column: 23, scope: !84)
!89 = !DILocation(line: 46, column: 27, scope: !84)
!90 = !DILocation(line: 46, column: 5, scope: !84)
!91 = !DILocalVariable(name: "int_0", scope: !84, file: !2, line: 48, type: !25)
!92 = !DILocation(line: 48, column: 10, scope: !84)
!93 = !DILocation(line: 48, column: 25, scope: !84)
!94 = !DILocalVariable(name: "int_1", scope: !84, file: !2, line: 50, type: !25)
!95 = !DILocation(line: 50, column: 10, scope: !84)
!96 = !DILocation(line: 50, column: 25, scope: !84)
!97 = !DILocation(line: 52, column: 26, scope: !84)
!98 = !DILocation(line: 52, column: 31, scope: !84)
!99 = !DILocation(line: 52, column: 38, scope: !84)
!100 = !DILocation(line: 52, column: 61, scope: !84)
!101 = !DILocation(line: 52, column: 5, scope: !84)
!102 = !DILocation(line: 53, column: 23, scope: !84)
!103 = !DILocation(line: 53, column: 5, scope: !84)
!104 = !DILocation(line: 54, column: 3, scope: !84)
!105 = !DILocation(line: 55, column: 3, scope: !43)
!106 = !DILocation(line: 57, column: 3, scope: !43)
!107 = !DILocation(line: 58, column: 41, scope: !43)
!108 = !DILocation(line: 58, column: 3, scope: !43)
!109 = !DILocation(line: 59, column: 3, scope: !43)
