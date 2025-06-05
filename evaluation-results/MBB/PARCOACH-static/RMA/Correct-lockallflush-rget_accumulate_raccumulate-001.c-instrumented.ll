; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c"
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
@0 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@1 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@2 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@3 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@4 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@5 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@6 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@7 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@8 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@9 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@10 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@11 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@12 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1
@13 = private unnamed_addr constant [106 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !56 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %10, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, ptr %10, align 4, !dbg !75
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !76
  %16 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !77
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !78
  %18 = load i32, ptr %6, align 4, !dbg !79
  %19 = icmp slt i32 %18, 2, !dbg !81
  br i1 %19, label %20, label %22, !dbg !82

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !83
  br label %22, !dbg !83

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !84, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata ptr %12, metadata !89, metadata !DIExpression()), !dbg !90
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !91
  store ptr %23, ptr %12, align 8, !dbg !90
  %24 = load ptr, ptr %12, align 8, !dbg !92
  %25 = call i32 @parcoach_rma_MPI_Win_create(ptr %24, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %11, i32 40, ptr @0), !dbg !93
  %26 = load ptr, ptr %11, align 8, !dbg !94
  %27 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, ptr %26, i32 42, ptr @1), !dbg !95
  call void @parcoach_rma_load(ptr %7, i64 32, i32 43, ptr @2), !dbg !96
  %28 = load i32, ptr %7, align 4, !dbg !96
  %29 = icmp eq i32 %28, 0, !dbg !98
  br i1 %29, label %30, label %40, !dbg !99

30:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata ptr %13, metadata !100, metadata !DIExpression()), !dbg !102
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !103
  call void @parcoach_rma_store(ptr %13, i64 64, i32 45, ptr @3), !dbg !102
  store ptr %31, ptr %13, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata ptr %14, metadata !104, metadata !DIExpression()), !dbg !105
  %32 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !106
  call void @parcoach_rma_store(ptr %14, i64 64, i32 47, ptr @4), !dbg !105
  store ptr %32, ptr %14, align 8, !dbg !105
  call void @parcoach_rma_load(ptr %13, i64 64, i32 49, ptr @5), !dbg !107
  %33 = load ptr, ptr %13, align 8, !dbg !107
  call void @parcoach_rma_load(ptr %14, i64 64, i32 49, ptr @6), !dbg !108
  %34 = load ptr, ptr %14, align 8, !dbg !108
  call void @parcoach_rma_load(ptr %11, i64 64, i32 50, ptr @7), !dbg !109
  %35 = load ptr, ptr %11, align 8, !dbg !109
  %36 = call i32 @MPI_Rget_accumulate(ptr noundef %33, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %34, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %35, ptr noundef %8), !dbg !110
  call void @parcoach_rma_load(ptr %13, i64 64, i32 51, ptr @8), !dbg !111
  %37 = load ptr, ptr %13, align 8, !dbg !111
  call void @parcoach_rma_load(ptr %11, i64 64, i32 51, ptr @9), !dbg !112
  %38 = load ptr, ptr %11, align 8, !dbg !112
  %39 = call i32 @MPI_Raccumulate(ptr noundef %37, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %38, ptr noundef %9), !dbg !113
  br label %40, !dbg !114

40:                                               ; preds = %30, %22
  call void @parcoach_rma_load(ptr %11, i64 64, i32 54, ptr @10), !dbg !115
  %41 = load ptr, ptr %11, align 8, !dbg !115
  %42 = call i32 @parcoach_rma_MPI_Win_unlock_all(ptr %41, i32 54, ptr @11), !dbg !116
  call void @parcoach_rma_load(ptr %7, i64 32, i32 55, ptr @12), !dbg !117
  %43 = load i32, ptr %7, align 4, !dbg !117
  %44 = icmp eq i32 %43, 0, !dbg !119
  br i1 %44, label %45, label %48, !dbg !120

45:                                               ; preds = %40
  %46 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !121
  %47 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !123
  br label %48, !dbg !124

48:                                               ; preds = %45, %40
  %49 = call i32 @parcoach_rma_MPI_Win_free(ptr %11, i32 59, ptr @13), !dbg !125
  %50 = call i32 @MPI_Finalize(), !dbg !126
  %51 = load i32, ptr %7, align 4, !dbg !127
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %51), !dbg !128
  ret i32 0, !dbg !129
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

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Raccumulate(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!47, !48, !49, !50, !51, !52, !53, !54}
!llvm.ident = !{!55}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5ad20799be71120e23ae8af4ca303aa6")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 62, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !46, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockallflush-rget_accumulate_raccumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5ad20799be71120e23ae8af4ca303aa6")
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
!74 = !DILocalVariable(name: "int_0", scope: !56, file: !2, line: 27, type: !24)
!75 = !DILocation(line: 27, column: 7, scope: !56)
!76 = !DILocation(line: 29, column: 3, scope: !56)
!77 = !DILocation(line: 30, column: 3, scope: !56)
!78 = !DILocation(line: 31, column: 3, scope: !56)
!79 = !DILocation(line: 32, column: 7, scope: !80)
!80 = distinct !DILexicalBlock(scope: !56, file: !2, line: 32, column: 7)
!81 = !DILocation(line: 32, column: 14, scope: !80)
!82 = !DILocation(line: 32, column: 7, scope: !56)
!83 = !DILocation(line: 33, column: 5, scope: !80)
!84 = !DILocalVariable(name: "mpi_win_0", scope: !56, file: !2, line: 36, type: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !86)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!88 = !DILocation(line: 36, column: 11, scope: !56)
!89 = !DILocalVariable(name: "winbuf", scope: !56, file: !2, line: 38, type: !23)
!90 = !DILocation(line: 38, column: 8, scope: !56)
!91 = !DILocation(line: 38, column: 24, scope: !56)
!92 = !DILocation(line: 40, column: 18, scope: !56)
!93 = !DILocation(line: 40, column: 3, scope: !56)
!94 = !DILocation(line: 42, column: 23, scope: !56)
!95 = !DILocation(line: 42, column: 3, scope: !56)
!96 = !DILocation(line: 43, column: 7, scope: !97)
!97 = distinct !DILexicalBlock(scope: !56, file: !2, line: 43, column: 7)
!98 = !DILocation(line: 43, column: 12, scope: !97)
!99 = !DILocation(line: 43, column: 7, scope: !56)
!100 = !DILocalVariable(name: "buf", scope: !101, file: !2, line: 45, type: !23)
!101 = distinct !DILexicalBlock(scope: !97, file: !2, line: 43, column: 18)
!102 = !DILocation(line: 45, column: 10, scope: !101)
!103 = !DILocation(line: 45, column: 23, scope: !101)
!104 = !DILocalVariable(name: "int_0", scope: !101, file: !2, line: 47, type: !23)
!105 = !DILocation(line: 47, column: 10, scope: !101)
!106 = !DILocation(line: 47, column: 25, scope: !101)
!107 = !DILocation(line: 49, column: 25, scope: !101)
!108 = !DILocation(line: 49, column: 43, scope: !101)
!109 = !DILocation(line: 50, column: 34, scope: !101)
!110 = !DILocation(line: 49, column: 5, scope: !101)
!111 = !DILocation(line: 51, column: 21, scope: !101)
!112 = !DILocation(line: 51, column: 67, scope: !101)
!113 = !DILocation(line: 51, column: 5, scope: !101)
!114 = !DILocation(line: 53, column: 3, scope: !101)
!115 = !DILocation(line: 54, column: 22, scope: !56)
!116 = !DILocation(line: 54, column: 3, scope: !56)
!117 = !DILocation(line: 55, column: 7, scope: !118)
!118 = distinct !DILexicalBlock(scope: !56, file: !2, line: 55, column: 7)
!119 = !DILocation(line: 55, column: 12, scope: !118)
!120 = !DILocation(line: 55, column: 7, scope: !56)
!121 = !DILocation(line: 56, column: 5, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !2, line: 55, column: 18)
!123 = !DILocation(line: 57, column: 5, scope: !122)
!124 = !DILocation(line: 58, column: 3, scope: !122)
!125 = !DILocation(line: 59, column: 3, scope: !56)
!126 = !DILocation(line: 61, column: 3, scope: !56)
!127 = !DILocation(line: 62, column: 41, scope: !56)
!128 = !DILocation(line: 62, column: 3, scope: !56)
!129 = !DILocation(line: 63, column: 3, scope: !56)
