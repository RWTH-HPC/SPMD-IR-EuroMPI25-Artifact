; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c"
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
@0 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@1 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@2 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@3 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@4 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@5 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@6 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@7 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@8 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@9 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@10 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@11 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@12 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1
@13 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !61 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %9, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, ptr %9, align 4, !dbg !78
  %14 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !79
  %15 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !80
  %16 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !81
  %17 = load i32, ptr %6, align 4, !dbg !82
  %18 = icmp slt i32 %17, 2, !dbg !84
  br i1 %18, label %19, label %21, !dbg !85

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !86
  br label %21, !dbg !86

21:                                               ; preds = %19, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !87, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata ptr %11, metadata !92, metadata !DIExpression()), !dbg !93
  %22 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !94
  store ptr %22, ptr %11, align 8, !dbg !93
  %23 = load ptr, ptr %11, align 8, !dbg !95
  %24 = call i32 @parcoach_rma_MPI_Win_create(ptr %23, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %10, i32 39, ptr @0), !dbg !96
  %25 = load ptr, ptr %10, align 8, !dbg !97
  %26 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, ptr %25, i32 41, ptr @1), !dbg !98
  call void @parcoach_rma_load(ptr %7, i64 32, i32 42, ptr @2), !dbg !99
  %27 = load i32, ptr %7, align 4, !dbg !99
  %28 = icmp eq i32 %27, 0, !dbg !101
  br i1 %28, label %29, label %40, !dbg !102

29:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %12, metadata !103, metadata !DIExpression()), !dbg !105
  %30 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !106
  call void @parcoach_rma_store(ptr %12, i64 64, i32 44, ptr @3), !dbg !105
  store ptr %30, ptr %12, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata ptr %13, metadata !107, metadata !DIExpression()), !dbg !108
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !109
  call void @parcoach_rma_store(ptr %13, i64 64, i32 46, ptr @4), !dbg !108
  store ptr %31, ptr %13, align 8, !dbg !108
  call void @parcoach_rma_load(ptr %12, i64 64, i32 48, ptr @5), !dbg !110
  %32 = load ptr, ptr %12, align 8, !dbg !110
  call void @parcoach_rma_load(ptr %13, i64 64, i32 48, ptr @6), !dbg !111
  %33 = load ptr, ptr %13, align 8, !dbg !111
  call void @parcoach_rma_load(ptr %10, i64 64, i32 49, ptr @7), !dbg !112
  %34 = load ptr, ptr %10, align 8, !dbg !112
  %35 = call i32 @MPI_Rget_accumulate(ptr noundef %32, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %33, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, ptr noundef %34, ptr noundef %8), !dbg !113
  call void @parcoach_rma_load(ptr %12, i64 64, i32 50, ptr @8), !dbg !114
  %36 = load ptr, ptr %12, align 8, !dbg !114
  %37 = getelementptr inbounds i32, ptr %36, i64 0, !dbg !114
  call void @parcoach_rma_load(ptr %37, i64 32, i32 50, ptr @9), !dbg !114
  %38 = load i32, ptr %37, align 4, !dbg !114
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %38), !dbg !115
  br label %40, !dbg !116

40:                                               ; preds = %29, %21
  call void @parcoach_rma_load(ptr %10, i64 64, i32 52, ptr @10), !dbg !117
  %41 = load ptr, ptr %10, align 8, !dbg !117
  %42 = call i32 @parcoach_rma_MPI_Win_unlock_all(ptr %41, i32 52, ptr @11), !dbg !118
  call void @parcoach_rma_load(ptr %7, i64 32, i32 53, ptr @12), !dbg !119
  %43 = load i32, ptr %7, align 4, !dbg !119
  %44 = icmp eq i32 %43, 0, !dbg !121
  br i1 %44, label %45, label %47, !dbg !122

45:                                               ; preds = %40
  %46 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !123
  br label %47, !dbg !125

47:                                               ; preds = %45, %40
  %48 = call i32 @parcoach_rma_MPI_Win_free(ptr %10, i32 56, ptr @13), !dbg !126
  %49 = call i32 @MPI_Finalize(), !dbg !127
  %50 = load i32, ptr %7, align 4, !dbg !128
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %50), !dbg !129
  ret i32 0, !dbg !130
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

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!52, !53, !54, !55, !56, !57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "34c86cb1a74b588a61d9bdbf048ff693")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 59, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !51, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rget_accumulate_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "34c86cb1a74b588a61d9bdbf048ff693")
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
!77 = !DILocalVariable(name: "int_0", scope: !61, file: !2, line: 26, type: !29)
!78 = !DILocation(line: 26, column: 7, scope: !61)
!79 = !DILocation(line: 28, column: 3, scope: !61)
!80 = !DILocation(line: 29, column: 3, scope: !61)
!81 = !DILocation(line: 30, column: 3, scope: !61)
!82 = !DILocation(line: 31, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !61, file: !2, line: 31, column: 7)
!84 = !DILocation(line: 31, column: 14, scope: !83)
!85 = !DILocation(line: 31, column: 7, scope: !61)
!86 = !DILocation(line: 32, column: 5, scope: !83)
!87 = !DILocalVariable(name: "mpi_win_0", scope: !61, file: !2, line: 35, type: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!91 = !DILocation(line: 35, column: 11, scope: !61)
!92 = !DILocalVariable(name: "winbuf", scope: !61, file: !2, line: 37, type: !28)
!93 = !DILocation(line: 37, column: 8, scope: !61)
!94 = !DILocation(line: 37, column: 24, scope: !61)
!95 = !DILocation(line: 39, column: 18, scope: !61)
!96 = !DILocation(line: 39, column: 3, scope: !61)
!97 = !DILocation(line: 41, column: 23, scope: !61)
!98 = !DILocation(line: 41, column: 3, scope: !61)
!99 = !DILocation(line: 42, column: 7, scope: !100)
!100 = distinct !DILexicalBlock(scope: !61, file: !2, line: 42, column: 7)
!101 = !DILocation(line: 42, column: 12, scope: !100)
!102 = !DILocation(line: 42, column: 7, scope: !61)
!103 = !DILocalVariable(name: "buf", scope: !104, file: !2, line: 44, type: !28)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 42, column: 18)
!105 = !DILocation(line: 44, column: 10, scope: !104)
!106 = !DILocation(line: 44, column: 23, scope: !104)
!107 = !DILocalVariable(name: "int_0", scope: !104, file: !2, line: 46, type: !28)
!108 = !DILocation(line: 46, column: 10, scope: !104)
!109 = !DILocation(line: 46, column: 25, scope: !104)
!110 = !DILocation(line: 48, column: 25, scope: !104)
!111 = !DILocation(line: 48, column: 43, scope: !104)
!112 = !DILocation(line: 49, column: 34, scope: !104)
!113 = !DILocation(line: 48, column: 5, scope: !104)
!114 = !DILocation(line: 50, column: 27, scope: !104)
!115 = !DILocation(line: 50, column: 5, scope: !104)
!116 = !DILocation(line: 51, column: 3, scope: !104)
!117 = !DILocation(line: 52, column: 22, scope: !61)
!118 = !DILocation(line: 52, column: 3, scope: !61)
!119 = !DILocation(line: 53, column: 7, scope: !120)
!120 = distinct !DILexicalBlock(scope: !61, file: !2, line: 53, column: 7)
!121 = !DILocation(line: 53, column: 12, scope: !120)
!122 = !DILocation(line: 53, column: 7, scope: !61)
!123 = !DILocation(line: 54, column: 5, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 53, column: 18)
!125 = !DILocation(line: 55, column: 3, scope: !124)
!126 = !DILocation(line: 56, column: 3, scope: !61)
!127 = !DILocation(line: 58, column: 3, scope: !61)
!128 = !DILocation(line: 59, column: 41, scope: !61)
!129 = !DILocation(line: 59, column: 3, scope: !61)
!130 = !DILocation(line: 60, column: 3, scope: !61)
