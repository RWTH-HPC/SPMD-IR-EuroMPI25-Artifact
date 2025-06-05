; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [81 x i8] c"Process %d: Execution finished, variable contents: win_base = %d, localbuf = %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@1 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@2 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@3 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@4 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@5 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@6 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@7 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@8 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@9 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@10 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@11 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@12 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@13 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@14 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@15 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@16 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@17 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@18 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@19 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@20 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@21 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@22 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@23 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@24 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1
@25 = private unnamed_addr constant [99 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca [10 x i32], align 16
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %8, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata ptr %10, metadata !61, metadata !DIExpression()), !dbg !63
  %14 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !64
  %15 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !65
  %16 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %11, metadata !67, metadata !DIExpression()), !dbg !69
  store i32 0, ptr %11, align 4, !dbg !69
  br label %17, !dbg !70

17:                                               ; preds = %25, %2
  %18 = load i32, ptr %11, align 4, !dbg !71
  %19 = icmp slt i32 %18, 10, !dbg !73
  br i1 %19, label %20, label %28, !dbg !74

20:                                               ; preds = %17
  %21 = load i32, ptr %11, align 4, !dbg !75
  %22 = load i32, ptr %11, align 4, !dbg !77
  %23 = sext i32 %22 to i64, !dbg !78
  %24 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 %23, !dbg !78
  store i32 %21, ptr %24, align 4, !dbg !79
  br label %25, !dbg !80

25:                                               ; preds = %20
  call void @parcoach_rma_load(ptr %11, i64 32, i32 23, ptr @24), !dbg !81
  %26 = load i32, ptr %11, align 4, !dbg !81
  %27 = add nsw i32 %26, 1, !dbg !81
  call void @parcoach_rma_store(ptr %11, i64 32, i32 23, ptr @25), !dbg !81
  store i32 %27, ptr %11, align 4, !dbg !81
  br label %17, !dbg !82, !llvm.loop !83

28:                                               ; preds = %17
  %29 = load i32, ptr %7, align 4, !dbg !86
  %30 = icmp ne i32 %29, 2, !dbg !88
  br i1 %30, label %31, label %35, !dbg !89

31:                                               ; preds = %28
  %32 = load i32, ptr %7, align 4, !dbg !90
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32, i32 noundef 2), !dbg !92
  %34 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !93
  br label %35, !dbg !94

35:                                               ; preds = %31, %28
  %36 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %10, ptr %8, i32 33, ptr @0), !dbg !95
  call void @llvm.dbg.declare(metadata ptr %12, metadata !96, metadata !DIExpression()), !dbg !98
  store i32 0, ptr %12, align 4, !dbg !98
  br label %37, !dbg !99

37:                                               ; preds = %45, %35
  %38 = load i32, ptr %12, align 4, !dbg !100
  %39 = icmp slt i32 %38, 10, !dbg !102
  br i1 %39, label %40, label %48, !dbg !103

40:                                               ; preds = %37
  %41 = load ptr, ptr %10, align 8, !dbg !104
  %42 = load i32, ptr %12, align 4, !dbg !106
  %43 = sext i32 %42 to i64, !dbg !104
  %44 = getelementptr inbounds i32, ptr %41, i64 %43, !dbg !104
  store i32 0, ptr %44, align 4, !dbg !107
  br label %45, !dbg !108

45:                                               ; preds = %40
  call void @parcoach_rma_load(ptr %12, i64 32, i32 34, ptr @22), !dbg !109
  %46 = load i32, ptr %12, align 4, !dbg !109
  %47 = add nsw i32 %46, 1, !dbg !109
  call void @parcoach_rma_store(ptr %12, i64 32, i32 34, ptr @23), !dbg !109
  store i32 %47, ptr %12, align 4, !dbg !109
  br label %37, !dbg !110, !llvm.loop !111

48:                                               ; preds = %37
  %49 = load ptr, ptr %8, align 8, !dbg !113
  %50 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %49, i32 38, ptr @1), !dbg !114
  call void @parcoach_rma_load(ptr %6, i64 32, i32 40, ptr @2), !dbg !115
  %51 = load i32, ptr %6, align 4, !dbg !115
  %52 = icmp eq i32 %51, 0, !dbg !117
  br i1 %52, label %53, label %75, !dbg !118

53:                                               ; preds = %48
  call void @llvm.dbg.declare(metadata ptr %13, metadata !119, metadata !DIExpression()), !dbg !122
  call void @parcoach_rma_store(ptr %13, i64 32, i32 41, ptr @3), !dbg !122
  store i32 0, ptr %13, align 4, !dbg !122
  br label %54, !dbg !123

54:                                               ; preds = %71, %53
  call void @parcoach_rma_load(ptr %13, i64 32, i32 41, ptr @12), !dbg !124
  %55 = load i32, ptr %13, align 4, !dbg !124
  %56 = icmp slt i32 %55, 9, !dbg !126
  br i1 %56, label %57, label %74, !dbg !127

57:                                               ; preds = %54
  call void @parcoach_rma_load(ptr %13, i64 32, i32 43, ptr @13), !dbg !128
  %58 = load i32, ptr %13, align 4, !dbg !128
  %59 = sext i32 %58 to i64, !dbg !130
  %60 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 %59, !dbg !130
  call void @parcoach_rma_load(ptr %13, i64 32, i32 43, ptr @14), !dbg !131
  %61 = load i32, ptr %13, align 4, !dbg !131
  %62 = sext i32 %61 to i64, !dbg !131
  call void @parcoach_rma_load(ptr %8, i64 64, i32 43, ptr @15), !dbg !132
  %63 = load ptr, ptr %8, align 8, !dbg !132
  %64 = call i32 @parcoach_rma_MPI_Put(ptr %60, i32 1, ptr @ompi_mpi_int, i32 1, i64 %62, i32 1, ptr @ompi_mpi_int, ptr %63, i32 43, ptr @16), !dbg !133
  call void @parcoach_rma_load(ptr %13, i64 32, i32 45, ptr @17), !dbg !134
  %65 = load i32, ptr %13, align 4, !dbg !134
  %66 = add nsw i32 %65, 1, !dbg !135
  %67 = sext i32 %66 to i64, !dbg !136
  %68 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 %67, !dbg !136
  call void @parcoach_rma_load(ptr %68, i64 32, i32 45, ptr @18), !dbg !137
  %69 = load i32, ptr %68, align 4, !dbg !137
  %70 = add nsw i32 %69, 1, !dbg !137
  call void @parcoach_rma_store(ptr %68, i64 32, i32 45, ptr @19), !dbg !137
  store i32 %70, ptr %68, align 4, !dbg !137
  br label %71, !dbg !138

71:                                               ; preds = %57
  call void @parcoach_rma_load(ptr %13, i64 32, i32 41, ptr @20), !dbg !139
  %72 = load i32, ptr %13, align 4, !dbg !139
  %73 = add nsw i32 %72, 1, !dbg !139
  call void @parcoach_rma_store(ptr %13, i64 32, i32 41, ptr @21), !dbg !139
  store i32 %73, ptr %13, align 4, !dbg !139
  br label %54, !dbg !140, !llvm.loop !141

74:                                               ; preds = %54
  br label %75, !dbg !143

75:                                               ; preds = %74, %48
  call void @parcoach_rma_load(ptr %8, i64 64, i32 49, ptr @4), !dbg !144
  %76 = load ptr, ptr %8, align 8, !dbg !144
  %77 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %76, i32 49, ptr @5), !dbg !145
  %78 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 51, ptr @6), !dbg !146
  call void @parcoach_rma_load(ptr %6, i64 32, i32 52, ptr @7), !dbg !147
  %79 = load i32, ptr %6, align 4, !dbg !147
  call void @parcoach_rma_load(ptr %10, i64 64, i32 52, ptr @8), !dbg !148
  %80 = load ptr, ptr %10, align 8, !dbg !148
  %81 = getelementptr inbounds i32, ptr %80, i64 0, !dbg !148
  call void @parcoach_rma_load(ptr %81, i64 32, i32 52, ptr @9), !dbg !148
  %82 = load i32, ptr %81, align 4, !dbg !148
  %83 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 0, !dbg !149
  call void @parcoach_rma_load(ptr %83, i64 32, i32 52, ptr @10), !dbg !149
  %84 = load i32, ptr %83, align 16, !dbg !149
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %79, i32 noundef %82, i32 noundef %84), !dbg !150
  %86 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 54, ptr @11), !dbg !151
  %87 = call i32 @MPI_Finalize(), !dbg !152
  ret i32 0, !dbg !153
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9381a4d5976e44d83f41c048606c9484")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 52, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 648, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 81)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/036-MPI-static-index-loop-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "9381a4d5976e44d83f41c048606c9484")
!14 = !{!15, !19, !20, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!26 = !{!0, !7}
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"openmp", i32 50}
!31 = !{i32 7, !"PIC Level", i32 2}
!32 = !{i32 7, !"PIE Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Debian clang version 15.0.6"}
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !37, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !42)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !{}
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 12, type: !39)
!44 = !DILocation(line: 12, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 12, type: !40)
!46 = !DILocation(line: 12, column: 27, scope: !36)
!47 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 14, type: !39)
!48 = !DILocation(line: 14, column: 9, scope: !36)
!49 = !DILocalVariable(name: "size", scope: !36, file: !2, line: 14, type: !39)
!50 = !DILocation(line: 14, column: 15, scope: !36)
!51 = !DILocalVariable(name: "win", scope: !36, file: !2, line: 15, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!55 = !DILocation(line: 15, column: 13, scope: !36)
!56 = !DILocalVariable(name: "localbuf", scope: !36, file: !2, line: 16, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 320, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 10)
!60 = !DILocation(line: 16, column: 9, scope: !36)
!61 = !DILocalVariable(name: "win_base", scope: !36, file: !2, line: 17, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!63 = !DILocation(line: 17, column: 10, scope: !36)
!64 = !DILocation(line: 19, column: 5, scope: !36)
!65 = !DILocation(line: 20, column: 5, scope: !36)
!66 = !DILocation(line: 21, column: 5, scope: !36)
!67 = !DILocalVariable(name: "i", scope: !68, file: !2, line: 23, type: !39)
!68 = distinct !DILexicalBlock(scope: !36, file: !2, line: 23, column: 5)
!69 = !DILocation(line: 23, column: 14, scope: !68)
!70 = !DILocation(line: 23, column: 10, scope: !68)
!71 = !DILocation(line: 23, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !2, line: 23, column: 5)
!73 = !DILocation(line: 23, column: 23, scope: !72)
!74 = !DILocation(line: 23, column: 5, scope: !68)
!75 = !DILocation(line: 24, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !2, line: 23, column: 40)
!77 = !DILocation(line: 24, column: 18, scope: !76)
!78 = !DILocation(line: 24, column: 9, scope: !76)
!79 = !DILocation(line: 24, column: 21, scope: !76)
!80 = !DILocation(line: 25, column: 5, scope: !76)
!81 = !DILocation(line: 23, column: 36, scope: !72)
!82 = !DILocation(line: 23, column: 5, scope: !72)
!83 = distinct !{!83, !74, !84, !85}
!84 = !DILocation(line: 25, column: 5, scope: !68)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 28, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !36, file: !2, line: 28, column: 9)
!88 = !DILocation(line: 28, column: 14, scope: !87)
!89 = !DILocation(line: 28, column: 9, scope: !36)
!90 = !DILocation(line: 29, column: 69, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !2, line: 28, column: 27)
!92 = !DILocation(line: 29, column: 9, scope: !91)
!93 = !DILocation(line: 30, column: 9, scope: !91)
!94 = !DILocation(line: 31, column: 5, scope: !91)
!95 = !DILocation(line: 33, column: 5, scope: !36)
!96 = !DILocalVariable(name: "i", scope: !97, file: !2, line: 34, type: !39)
!97 = distinct !DILexicalBlock(scope: !36, file: !2, line: 34, column: 5)
!98 = !DILocation(line: 34, column: 14, scope: !97)
!99 = !DILocation(line: 34, column: 10, scope: !97)
!100 = !DILocation(line: 34, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !2, line: 34, column: 5)
!102 = !DILocation(line: 34, column: 23, scope: !101)
!103 = !DILocation(line: 34, column: 5, scope: !97)
!104 = !DILocation(line: 35, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !2, line: 34, column: 40)
!106 = !DILocation(line: 35, column: 18, scope: !105)
!107 = !DILocation(line: 35, column: 21, scope: !105)
!108 = !DILocation(line: 36, column: 5, scope: !105)
!109 = !DILocation(line: 34, column: 36, scope: !101)
!110 = !DILocation(line: 34, column: 5, scope: !101)
!111 = distinct !{!111, !103, !112, !85}
!112 = !DILocation(line: 36, column: 5, scope: !97)
!113 = !DILocation(line: 38, column: 22, scope: !36)
!114 = !DILocation(line: 38, column: 5, scope: !36)
!115 = !DILocation(line: 40, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !36, file: !2, line: 40, column: 9)
!117 = !DILocation(line: 40, column: 14, scope: !116)
!118 = !DILocation(line: 40, column: 9, scope: !36)
!119 = !DILocalVariable(name: "i", scope: !120, file: !2, line: 41, type: !39)
!120 = distinct !DILexicalBlock(scope: !121, file: !2, line: 41, column: 9)
!121 = distinct !DILexicalBlock(scope: !116, file: !2, line: 40, column: 20)
!122 = !DILocation(line: 41, column: 18, scope: !120)
!123 = !DILocation(line: 41, column: 14, scope: !120)
!124 = !DILocation(line: 41, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !2, line: 41, column: 9)
!126 = !DILocation(line: 41, column: 27, scope: !125)
!127 = !DILocation(line: 41, column: 9, scope: !120)
!128 = !DILocation(line: 43, column: 32, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !2, line: 41, column: 46)
!130 = !DILocation(line: 43, column: 23, scope: !129)
!131 = !DILocation(line: 43, column: 52, scope: !129)
!132 = !DILocation(line: 43, column: 67, scope: !129)
!133 = !DILocation(line: 43, column: 13, scope: !129)
!134 = !DILocation(line: 45, column: 22, scope: !129)
!135 = !DILocation(line: 45, column: 23, scope: !129)
!136 = !DILocation(line: 45, column: 13, scope: !129)
!137 = !DILocation(line: 45, column: 26, scope: !129)
!138 = !DILocation(line: 46, column: 9, scope: !129)
!139 = !DILocation(line: 41, column: 42, scope: !125)
!140 = !DILocation(line: 41, column: 9, scope: !125)
!141 = distinct !{!141, !127, !142, !85}
!142 = !DILocation(line: 46, column: 9, scope: !120)
!143 = !DILocation(line: 47, column: 5, scope: !121)
!144 = !DILocation(line: 49, column: 22, scope: !36)
!145 = !DILocation(line: 49, column: 5, scope: !36)
!146 = !DILocation(line: 51, column: 5, scope: !36)
!147 = !DILocation(line: 52, column: 97, scope: !36)
!148 = !DILocation(line: 52, column: 103, scope: !36)
!149 = !DILocation(line: 52, column: 116, scope: !36)
!150 = !DILocation(line: 52, column: 5, scope: !36)
!151 = !DILocation(line: 54, column: 5, scope: !36)
!152 = !DILocation(line: 55, column: 5, scope: !36)
!153 = !DILocation(line: 57, column: 5, scope: !36)
