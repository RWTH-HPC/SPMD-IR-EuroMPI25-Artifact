; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c"
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
@0 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@1 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@2 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@3 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@4 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@5 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@6 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@7 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@8 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@9 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@10 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@11 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@12 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@13 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@14 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@15 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@16 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1
@17 = private unnamed_addr constant [112 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !56 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
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
  store i32 0, ptr %8, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata ptr %9, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 0, ptr %9, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata ptr %10, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, ptr %10, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata ptr %11, metadata !76, metadata !DIExpression()), !dbg !77
  store ptr @ompi_request_null, ptr %11, align 8, !dbg !77
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !78
  %19 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !79
  %20 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !80
  %21 = load i32, ptr %6, align 4, !dbg !81
  %22 = icmp slt i32 %21, 2, !dbg !83
  br i1 %22, label %23, label %25, !dbg !84

23:                                               ; preds = %2
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !85
  br label %25, !dbg !85

25:                                               ; preds = %23, %2
  call void @llvm.dbg.declare(metadata ptr %12, metadata !86, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata ptr %13, metadata !91, metadata !DIExpression()), !dbg !92
  %26 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !93
  store ptr %26, ptr %13, align 8, !dbg !92
  %27 = load ptr, ptr %13, align 8, !dbg !94
  %28 = call i32 @parcoach_rma_MPI_Win_create(ptr %27, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %12, i32 41, ptr @0), !dbg !95
  %29 = load ptr, ptr %12, align 8, !dbg !96
  %30 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, ptr %29, i32 43, ptr @1), !dbg !97
  call void @parcoach_rma_load(ptr %7, i64 32, i32 44, ptr @2), !dbg !98
  %31 = load i32, ptr %7, align 4, !dbg !98
  %32 = icmp eq i32 %31, 0, !dbg !100
  br i1 %32, label %33, label %47, !dbg !101

33:                                               ; preds = %25
  call void @llvm.dbg.declare(metadata ptr %14, metadata !102, metadata !DIExpression()), !dbg !104
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !105
  call void @parcoach_rma_store(ptr %14, i64 64, i32 46, ptr @3), !dbg !104
  store ptr %34, ptr %14, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata ptr %15, metadata !106, metadata !DIExpression()), !dbg !107
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !108
  call void @parcoach_rma_store(ptr %15, i64 64, i32 48, ptr @4), !dbg !107
  store ptr %35, ptr %15, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata ptr %16, metadata !109, metadata !DIExpression()), !dbg !110
  %36 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !111
  call void @parcoach_rma_store(ptr %16, i64 64, i32 50, ptr @5), !dbg !110
  store ptr %36, ptr %16, align 8, !dbg !110
  call void @parcoach_rma_load(ptr %14, i64 64, i32 52, ptr @6), !dbg !112
  %37 = load ptr, ptr %14, align 8, !dbg !112
  call void @parcoach_rma_load(ptr %16, i64 64, i32 52, ptr @7), !dbg !113
  %38 = load ptr, ptr %16, align 8, !dbg !113
  call void @parcoach_rma_load(ptr %15, i64 64, i32 52, ptr @8), !dbg !114
  %39 = load ptr, ptr %15, align 8, !dbg !114
  call void @parcoach_rma_load(ptr %12, i64 64, i32 52, ptr @9), !dbg !115
  %40 = load ptr, ptr %12, align 8, !dbg !115
  %41 = call i32 @MPI_Compare_and_swap(ptr noundef %37, ptr noundef %38, ptr noundef %39, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, ptr noundef %40), !dbg !116
  call void @llvm.dbg.declare(metadata ptr %17, metadata !117, metadata !DIExpression()), !dbg !118
  %42 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !119
  call void @parcoach_rma_store(ptr %17, i64 64, i32 54, ptr @10), !dbg !118
  store ptr %42, ptr %17, align 8, !dbg !118
  call void @parcoach_rma_load(ptr %14, i64 64, i32 56, ptr @11), !dbg !120
  %43 = load ptr, ptr %14, align 8, !dbg !120
  call void @parcoach_rma_load(ptr %17, i64 64, i32 56, ptr @12), !dbg !121
  %44 = load ptr, ptr %17, align 8, !dbg !121
  call void @parcoach_rma_load(ptr %12, i64 64, i32 57, ptr @13), !dbg !122
  %45 = load ptr, ptr %12, align 8, !dbg !122
  %46 = call i32 @MPI_Rget_accumulate(ptr noundef %43, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %44, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %45, ptr noundef %11), !dbg !123
  br label %47, !dbg !124

47:                                               ; preds = %33, %25
  call void @parcoach_rma_load(ptr %12, i64 64, i32 59, ptr @14), !dbg !125
  %48 = load ptr, ptr %12, align 8, !dbg !125
  %49 = call i32 @parcoach_rma_MPI_Win_unlock_all(ptr %48, i32 59, ptr @15), !dbg !126
  call void @parcoach_rma_load(ptr %7, i64 32, i32 60, ptr @16), !dbg !127
  %50 = load i32, ptr %7, align 4, !dbg !127
  %51 = icmp eq i32 %50, 0, !dbg !129
  br i1 %51, label %52, label %54, !dbg !130

52:                                               ; preds = %47
  %53 = call i32 @MPI_Wait(ptr noundef %11, ptr noundef null), !dbg !131
  br label %54, !dbg !133

54:                                               ; preds = %52, %47
  %55 = call i32 @parcoach_rma_MPI_Win_free(ptr %12, i32 63, ptr @17), !dbg !134
  %56 = call i32 @MPI_Finalize(), !dbg !135
  %57 = load i32, ptr %7, align 4, !dbg !136
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %57), !dbg !137
  ret i32 0, !dbg !138
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

declare i32 @MPI_Compare_and_swap(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i64 noundef, ptr noundef) #2

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 35, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "263041b636cd24e8ad1db552ff23e887")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 66, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !46, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-compare_and_swap_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "263041b636cd24e8ad1db552ff23e887")
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
!70 = !DILocalVariable(name: "int_0", scope: !56, file: !2, line: 25, type: !24)
!71 = !DILocation(line: 25, column: 7, scope: !56)
!72 = !DILocalVariable(name: "int_1", scope: !56, file: !2, line: 26, type: !24)
!73 = !DILocation(line: 26, column: 7, scope: !56)
!74 = !DILocalVariable(name: "int_2", scope: !56, file: !2, line: 27, type: !24)
!75 = !DILocation(line: 27, column: 7, scope: !56)
!76 = !DILocalVariable(name: "mpi_request_0", scope: !56, file: !2, line: 28, type: !15)
!77 = !DILocation(line: 28, column: 15, scope: !56)
!78 = !DILocation(line: 30, column: 3, scope: !56)
!79 = !DILocation(line: 31, column: 3, scope: !56)
!80 = !DILocation(line: 32, column: 3, scope: !56)
!81 = !DILocation(line: 33, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !56, file: !2, line: 33, column: 7)
!83 = !DILocation(line: 33, column: 14, scope: !82)
!84 = !DILocation(line: 33, column: 7, scope: !56)
!85 = !DILocation(line: 34, column: 5, scope: !82)
!86 = !DILocalVariable(name: "mpi_win_0", scope: !56, file: !2, line: 37, type: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!90 = !DILocation(line: 37, column: 11, scope: !56)
!91 = !DILocalVariable(name: "winbuf", scope: !56, file: !2, line: 39, type: !23)
!92 = !DILocation(line: 39, column: 8, scope: !56)
!93 = !DILocation(line: 39, column: 24, scope: !56)
!94 = !DILocation(line: 41, column: 18, scope: !56)
!95 = !DILocation(line: 41, column: 3, scope: !56)
!96 = !DILocation(line: 43, column: 23, scope: !56)
!97 = !DILocation(line: 43, column: 3, scope: !56)
!98 = !DILocation(line: 44, column: 7, scope: !99)
!99 = distinct !DILexicalBlock(scope: !56, file: !2, line: 44, column: 7)
!100 = !DILocation(line: 44, column: 12, scope: !99)
!101 = !DILocation(line: 44, column: 7, scope: !56)
!102 = !DILocalVariable(name: "buf", scope: !103, file: !2, line: 46, type: !23)
!103 = distinct !DILexicalBlock(scope: !99, file: !2, line: 44, column: 18)
!104 = !DILocation(line: 46, column: 10, scope: !103)
!105 = !DILocation(line: 46, column: 23, scope: !103)
!106 = !DILocalVariable(name: "int_0", scope: !103, file: !2, line: 48, type: !23)
!107 = !DILocation(line: 48, column: 10, scope: !103)
!108 = !DILocation(line: 48, column: 25, scope: !103)
!109 = !DILocalVariable(name: "int_1", scope: !103, file: !2, line: 50, type: !23)
!110 = !DILocation(line: 50, column: 10, scope: !103)
!111 = !DILocation(line: 50, column: 25, scope: !103)
!112 = !DILocation(line: 52, column: 26, scope: !103)
!113 = !DILocation(line: 52, column: 31, scope: !103)
!114 = !DILocation(line: 52, column: 38, scope: !103)
!115 = !DILocation(line: 52, column: 60, scope: !103)
!116 = !DILocation(line: 52, column: 5, scope: !103)
!117 = !DILocalVariable(name: "int_2", scope: !103, file: !2, line: 54, type: !23)
!118 = !DILocation(line: 54, column: 10, scope: !103)
!119 = !DILocation(line: 54, column: 25, scope: !103)
!120 = !DILocation(line: 56, column: 25, scope: !103)
!121 = !DILocation(line: 56, column: 43, scope: !103)
!122 = !DILocation(line: 57, column: 34, scope: !103)
!123 = !DILocation(line: 56, column: 5, scope: !103)
!124 = !DILocation(line: 58, column: 3, scope: !103)
!125 = !DILocation(line: 59, column: 22, scope: !56)
!126 = !DILocation(line: 59, column: 3, scope: !56)
!127 = !DILocation(line: 60, column: 7, scope: !128)
!128 = distinct !DILexicalBlock(scope: !56, file: !2, line: 60, column: 7)
!129 = !DILocation(line: 60, column: 12, scope: !128)
!130 = !DILocation(line: 60, column: 7, scope: !56)
!131 = !DILocation(line: 61, column: 5, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !2, line: 60, column: 18)
!133 = !DILocation(line: 62, column: 3, scope: !132)
!134 = !DILocation(line: 63, column: 3, scope: !56)
!135 = !DILocation(line: 65, column: 3, scope: !56)
!136 = !DILocation(line: 66, column: 41, scope: !56)
!137 = !DILocation(line: 66, column: 3, scope: !56)
!138 = !DILocation(line: 67, column: 3, scope: !56)
