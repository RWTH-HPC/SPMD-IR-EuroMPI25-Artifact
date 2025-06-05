; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c"
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
@0 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@1 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@2 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@3 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@4 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@5 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@6 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@7 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@8 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@9 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@10 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@11 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@12 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@13 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@14 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1
@15 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c\00", align 1

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
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %11, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 0, ptr %11, align 4, !dbg !77
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !78
  %18 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !79
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !80
  %20 = load i32, ptr %6, align 4, !dbg !81
  %21 = icmp slt i32 %20, 2, !dbg !83
  br i1 %21, label %22, label %24, !dbg !84

22:                                               ; preds = %2
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !85
  br label %24, !dbg !85

24:                                               ; preds = %22, %2
  call void @llvm.dbg.declare(metadata ptr %12, metadata !86, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata ptr %13, metadata !91, metadata !DIExpression()), !dbg !92
  %25 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !93
  store ptr %25, ptr %13, align 8, !dbg !92
  %26 = load ptr, ptr %13, align 8, !dbg !94
  %27 = call i32 @parcoach_rma_MPI_Win_create(ptr %26, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %12, i32 41, ptr @0), !dbg !95
  %28 = load ptr, ptr %12, align 8, !dbg !96
  %29 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, ptr %28, i32 43, ptr @1), !dbg !97
  call void @parcoach_rma_load(ptr %7, i64 32, i32 44, ptr @2), !dbg !98
  %30 = load i32, ptr %7, align 4, !dbg !98
  %31 = icmp eq i32 %30, 0, !dbg !100
  br i1 %31, label %32, label %44, !dbg !101

32:                                               ; preds = %24
  call void @llvm.dbg.declare(metadata ptr %14, metadata !102, metadata !DIExpression()), !dbg !104
  %33 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !105
  call void @parcoach_rma_store(ptr %14, i64 64, i32 46, ptr @3), !dbg !104
  store ptr %33, ptr %14, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata ptr %15, metadata !106, metadata !DIExpression()), !dbg !107
  %34 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !108
  call void @parcoach_rma_store(ptr %15, i64 64, i32 48, ptr @4), !dbg !107
  store ptr %34, ptr %15, align 8, !dbg !107
  call void @parcoach_rma_load(ptr %14, i64 64, i32 50, ptr @5), !dbg !109
  %35 = load ptr, ptr %14, align 8, !dbg !109
  call void @parcoach_rma_load(ptr %15, i64 64, i32 50, ptr @6), !dbg !110
  %36 = load ptr, ptr %15, align 8, !dbg !110
  call void @parcoach_rma_load(ptr %12, i64 64, i32 51, ptr @7), !dbg !111
  %37 = load ptr, ptr %12, align 8, !dbg !111
  %38 = call i32 @MPI_Rget_accumulate(ptr noundef %35, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %36, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %37, ptr noundef %8), !dbg !112
  call void @llvm.dbg.declare(metadata ptr %16, metadata !113, metadata !DIExpression()), !dbg !114
  %39 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !115
  call void @parcoach_rma_store(ptr %16, i64 64, i32 53, ptr @8), !dbg !114
  store ptr %39, ptr %16, align 8, !dbg !114
  call void @parcoach_rma_load(ptr %14, i64 64, i32 55, ptr @9), !dbg !116
  %40 = load ptr, ptr %14, align 8, !dbg !116
  call void @parcoach_rma_load(ptr %16, i64 64, i32 55, ptr @10), !dbg !117
  %41 = load ptr, ptr %16, align 8, !dbg !117
  call void @parcoach_rma_load(ptr %12, i64 64, i32 56, ptr @11), !dbg !118
  %42 = load ptr, ptr %12, align 8, !dbg !118
  %43 = call i32 @MPI_Rget_accumulate(ptr noundef %40, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %41, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %42, ptr noundef %9), !dbg !119
  br label %44, !dbg !120

44:                                               ; preds = %32, %24
  call void @parcoach_rma_load(ptr %12, i64 64, i32 58, ptr @12), !dbg !121
  %45 = load ptr, ptr %12, align 8, !dbg !121
  %46 = call i32 @parcoach_rma_MPI_Win_unlock_all(ptr %45, i32 58, ptr @13), !dbg !122
  call void @parcoach_rma_load(ptr %7, i64 32, i32 59, ptr @14), !dbg !123
  %47 = load i32, ptr %7, align 4, !dbg !123
  %48 = icmp eq i32 %47, 0, !dbg !125
  br i1 %48, label %49, label %52, !dbg !126

49:                                               ; preds = %44
  %50 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !127
  %51 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !129
  br label %52, !dbg !130

52:                                               ; preds = %49, %44
  %53 = call i32 @parcoach_rma_MPI_Win_free(ptr %12, i32 63, ptr @15), !dbg !131
  %54 = call i32 @MPI_Finalize(), !dbg !132
  %55 = load i32, ptr %7, align 4, !dbg !133
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %55), !dbg !134
  ret i32 0, !dbg !135
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
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c8d809a977e29c527030d4f25e711fe4")
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
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockallflush-rget_accumulate_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "c8d809a977e29c527030d4f25e711fe4")
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
!76 = !DILocalVariable(name: "int_1", scope: !56, file: !2, line: 28, type: !24)
!77 = !DILocation(line: 28, column: 7, scope: !56)
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
!109 = !DILocation(line: 50, column: 25, scope: !103)
!110 = !DILocation(line: 50, column: 43, scope: !103)
!111 = !DILocation(line: 51, column: 34, scope: !103)
!112 = !DILocation(line: 50, column: 5, scope: !103)
!113 = !DILocalVariable(name: "int_1", scope: !103, file: !2, line: 53, type: !23)
!114 = !DILocation(line: 53, column: 10, scope: !103)
!115 = !DILocation(line: 53, column: 25, scope: !103)
!116 = !DILocation(line: 55, column: 25, scope: !103)
!117 = !DILocation(line: 55, column: 43, scope: !103)
!118 = !DILocation(line: 56, column: 34, scope: !103)
!119 = !DILocation(line: 55, column: 5, scope: !103)
!120 = !DILocation(line: 57, column: 3, scope: !103)
!121 = !DILocation(line: 58, column: 22, scope: !56)
!122 = !DILocation(line: 58, column: 3, scope: !56)
!123 = !DILocation(line: 59, column: 7, scope: !124)
!124 = distinct !DILexicalBlock(scope: !56, file: !2, line: 59, column: 7)
!125 = !DILocation(line: 59, column: 12, scope: !124)
!126 = !DILocation(line: 59, column: 7, scope: !56)
!127 = !DILocation(line: 60, column: 5, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !2, line: 59, column: 18)
!129 = !DILocation(line: 61, column: 5, scope: !128)
!130 = !DILocation(line: 62, column: 3, scope: !128)
!131 = !DILocation(line: 63, column: 3, scope: !56)
!132 = !DILocation(line: 65, column: 3, scope: !56)
!133 = !DILocation(line: 66, column: 41, scope: !56)
!134 = !DILocation(line: 66, column: 3, scope: !56)
!135 = !DILocation(line: 67, column: 3, scope: !56)
