; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c"
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
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@1 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@2 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@3 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@4 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@5 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@6 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@7 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@8 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@9 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@10 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@11 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1
@12 = private unnamed_addr constant [98 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !46 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !52, metadata !DIExpression()), !dbg !53
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %6, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 -1, ptr %6, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %7, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 -1, ptr %7, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %8, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 0, ptr %8, align 4, !dbg !61
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !62
  %14 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !63
  %15 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !64
  %16 = load i32, ptr %6, align 4, !dbg !65
  %17 = icmp slt i32 %16, 2, !dbg !67
  br i1 %17, label %18, label %20, !dbg !68

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !69
  br label %20, !dbg !69

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !70, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata ptr %10, metadata !75, metadata !DIExpression()), !dbg !76
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !77
  store ptr %21, ptr %10, align 8, !dbg !76
  %22 = load ptr, ptr %10, align 8, !dbg !78
  %23 = call i32 @parcoach_rma_MPI_Win_create(ptr %22, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, i32 38, ptr @0), !dbg !79
  %24 = load i32, ptr %7, align 4, !dbg !80
  %25 = icmp eq i32 %24, 0, !dbg !82
  br i1 %25, label %26, label %41, !dbg !83

26:                                               ; preds = %20
  %27 = load ptr, ptr %9, align 8, !dbg !84
  %28 = call i32 @parcoach_rma_MPI_Win_lock(i32 1, i32 1, i32 0, ptr %27, i32 41, ptr @1), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %11, metadata !87, metadata !DIExpression()), !dbg !88
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !89
  call void @parcoach_rma_store(ptr %11, i64 64, i32 43, ptr @2), !dbg !88
  store ptr %29, ptr %11, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata ptr %12, metadata !90, metadata !DIExpression()), !dbg !91
  %30 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !92
  call void @parcoach_rma_store(ptr %12, i64 64, i32 45, ptr @3), !dbg !91
  store ptr %30, ptr %12, align 8, !dbg !91
  call void @parcoach_rma_load(ptr %11, i64 64, i32 47, ptr @4), !dbg !93
  %31 = load ptr, ptr %11, align 8, !dbg !93
  call void @parcoach_rma_load(ptr %12, i64 64, i32 47, ptr @5), !dbg !94
  %32 = load ptr, ptr %12, align 8, !dbg !94
  call void @parcoach_rma_load(ptr %9, i64 64, i32 48, ptr @6), !dbg !95
  %33 = load ptr, ptr %9, align 8, !dbg !95
  %34 = call i32 @MPI_Get_accumulate(ptr noundef %31, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %32, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %33), !dbg !96
  call void @parcoach_rma_load(ptr %11, i64 64, i32 49, ptr @7), !dbg !97
  %35 = load ptr, ptr %11, align 8, !dbg !97
  %36 = getelementptr inbounds i32, ptr %35, i64 0, !dbg !97
  call void @parcoach_rma_load(ptr %36, i64 32, i32 49, ptr @8), !dbg !97
  %37 = load i32, ptr %36, align 4, !dbg !97
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %37), !dbg !98
  call void @parcoach_rma_load(ptr %9, i64 64, i32 50, ptr @9), !dbg !99
  %39 = load ptr, ptr %9, align 8, !dbg !99
  %40 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, ptr %39, i32 50, ptr @10), !dbg !100
  br label %41, !dbg !101

41:                                               ; preds = %26, %20
  %42 = call i32 @parcoach_rma_MPI_Win_free(ptr %9, i32 52, ptr @11), !dbg !102
  %43 = call i32 @MPI_Finalize(), !dbg !103
  call void @parcoach_rma_load(ptr %7, i64 32, i32 55, ptr @12), !dbg !104
  %44 = load i32, ptr %7, align 4, !dbg !104
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %44), !dbg !105
  ret i32 0, !dbg !106
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

declare i32 @MPI_Get_accumulate(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!37, !38, !39, !40, !41, !42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7080a4f6ed4f407ed9c80d6082f2de94")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !36, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockflush-get_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7080a4f6ed4f407ed9c80d6082f2de94")
!19 = !{!20, !24, !25, !27, !30, !33}
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
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !21, line: 425, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !21, line: 425, flags: DIFlagFwdDecl)
!36 = !{!0, !7, !12}
!37 = !{i32 7, !"Dwarf Version", i32 5}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"openmp", i32 50}
!41 = !{i32 7, !"PIC Level", i32 2}
!42 = !{i32 7, !"PIE Level", i32 2}
!43 = !{i32 7, !"uwtable", i32 2}
!44 = !{i32 7, !"frame-pointer", i32 2}
!45 = !{!"Debian clang version 15.0.6"}
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !47, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !51)
!47 = !DISubroutineType(types: !48)
!48 = !{!26, !26, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !{}
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 22, type: !26)
!53 = !DILocation(line: 22, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 22, type: !49)
!55 = !DILocation(line: 22, column: 27, scope: !46)
!56 = !DILocalVariable(name: "nprocs", scope: !46, file: !2, line: 23, type: !26)
!57 = !DILocation(line: 23, column: 7, scope: !46)
!58 = !DILocalVariable(name: "rank", scope: !46, file: !2, line: 24, type: !26)
!59 = !DILocation(line: 24, column: 7, scope: !46)
!60 = !DILocalVariable(name: "int_0", scope: !46, file: !2, line: 25, type: !26)
!61 = !DILocation(line: 25, column: 7, scope: !46)
!62 = !DILocation(line: 27, column: 3, scope: !46)
!63 = !DILocation(line: 28, column: 3, scope: !46)
!64 = !DILocation(line: 29, column: 3, scope: !46)
!65 = !DILocation(line: 30, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !46, file: !2, line: 30, column: 7)
!67 = !DILocation(line: 30, column: 14, scope: !66)
!68 = !DILocation(line: 30, column: 7, scope: !46)
!69 = !DILocation(line: 31, column: 5, scope: !66)
!70 = !DILocalVariable(name: "mpi_win_0", scope: !46, file: !2, line: 34, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !72)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!74 = !DILocation(line: 34, column: 11, scope: !46)
!75 = !DILocalVariable(name: "winbuf", scope: !46, file: !2, line: 36, type: !25)
!76 = !DILocation(line: 36, column: 8, scope: !46)
!77 = !DILocation(line: 36, column: 24, scope: !46)
!78 = !DILocation(line: 38, column: 18, scope: !46)
!79 = !DILocation(line: 38, column: 3, scope: !46)
!80 = !DILocation(line: 40, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !46, file: !2, line: 40, column: 7)
!82 = !DILocation(line: 40, column: 12, scope: !81)
!83 = !DILocation(line: 40, column: 7, scope: !46)
!84 = !DILocation(line: 41, column: 44, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !2, line: 40, column: 18)
!86 = !DILocation(line: 41, column: 5, scope: !85)
!87 = !DILocalVariable(name: "buf", scope: !85, file: !2, line: 43, type: !25)
!88 = !DILocation(line: 43, column: 10, scope: !85)
!89 = !DILocation(line: 43, column: 23, scope: !85)
!90 = !DILocalVariable(name: "int_0", scope: !85, file: !2, line: 45, type: !25)
!91 = !DILocation(line: 45, column: 10, scope: !85)
!92 = !DILocation(line: 45, column: 25, scope: !85)
!93 = !DILocation(line: 47, column: 24, scope: !85)
!94 = !DILocation(line: 47, column: 42, scope: !85)
!95 = !DILocation(line: 48, column: 33, scope: !85)
!96 = !DILocation(line: 47, column: 5, scope: !85)
!97 = !DILocation(line: 49, column: 27, scope: !85)
!98 = !DILocation(line: 49, column: 5, scope: !85)
!99 = !DILocation(line: 50, column: 23, scope: !85)
!100 = !DILocation(line: 50, column: 5, scope: !85)
!101 = !DILocation(line: 51, column: 3, scope: !85)
!102 = !DILocation(line: 52, column: 3, scope: !46)
!103 = !DILocation(line: 54, column: 3, scope: !46)
!104 = !DILocation(line: 55, column: 41, scope: !46)
!105 = !DILocation(line: 55, column: 3, scope: !46)
!106 = !DILocation(line: 56, column: 3, scope: !46)
