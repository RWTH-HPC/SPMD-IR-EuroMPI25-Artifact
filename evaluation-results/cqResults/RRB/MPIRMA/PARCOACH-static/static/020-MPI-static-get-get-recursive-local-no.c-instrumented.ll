; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque

@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [44 x i8] c"I have %d ranks. You should rerun with %d.\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@.str.1 = private unnamed_addr constant [39 x i8] c"Process %d finished. Array element %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@1 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@2 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@3 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@4 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@5 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@6 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@7 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@8 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@9 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@10 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@11 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@12 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@13 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@14 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@15 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@16 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@17 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@18 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@19 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@20 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@21 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1
@22 = private unnamed_addr constant [105 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @inefficient_get(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !36 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !45, metadata !DIExpression()), !dbg !46
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !47, metadata !DIExpression()), !dbg !48
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !49, metadata !DIExpression()), !dbg !50
  %7 = load ptr, ptr %5, align 8, !dbg !51
  %8 = load i32, ptr %4, align 4, !dbg !52
  %9 = sext i32 %8 to i64, !dbg !53
  %10 = getelementptr inbounds i32, ptr %7, i64 %9, !dbg !53
  %11 = load i32, ptr %4, align 4, !dbg !54
  %12 = sext i32 %11 to i64, !dbg !54
  %13 = load ptr, ptr %6, align 8, !dbg !55
  %14 = call i32 @parcoach_rma_MPI_Get(ptr %10, i32 1, ptr @ompi_mpi_int, i32 1, i64 %12, i32 1, ptr @ompi_mpi_int, ptr %13, i32 14, ptr @0), !dbg !56
  %15 = load i32, ptr %4, align 4, !dbg !57
  %16 = icmp slt i32 %15, 10, !dbg !59
  br i1 %16, label %17, label %22, !dbg !60

17:                                               ; preds = %3
  %18 = load i32, ptr %4, align 4, !dbg !61
  %19 = add nsw i32 %18, 1, !dbg !63
  %20 = load ptr, ptr %5, align 8, !dbg !64
  %21 = load ptr, ptr %6, align 8, !dbg !65
  call void @inefficient_get(i32 noundef %19, ptr noundef %20, ptr noundef %21), !dbg !66
  br label %22, !dbg !67

22:                                               ; preds = %17, %3
  ret void, !dbg !68
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !69 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !74, metadata !DIExpression()), !dbg !75
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata ptr %6, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata ptr %7, metadata !80, metadata !DIExpression()), !dbg !81
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !82
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !83
  %15 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !84
  %16 = load i32, ptr %7, align 4, !dbg !85
  %17 = icmp ne i32 %16, 2, !dbg !87
  br i1 %17, label %18, label %21, !dbg !88

18:                                               ; preds = %2
  %19 = load i32, ptr %7, align 4, !dbg !89
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %19, i32 noundef 2), !dbg !91
  store i32 1, ptr %3, align 4, !dbg !92
  br label %71, !dbg !92

21:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata ptr %9, metadata !95, metadata !DIExpression()), !dbg !96
  %22 = call i32 @parcoach_rma_MPI_Win_allocate(i64 400, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 35, ptr @1), !dbg !97
  call void @llvm.dbg.declare(metadata ptr %10, metadata !98, metadata !DIExpression()), !dbg !99
  store i32 50, ptr %10, align 4, !dbg !99
  %23 = load i32, ptr %6, align 4, !dbg !100
  %24 = icmp eq i32 %23, 0, !dbg !102
  br i1 %24, label %25, label %38, !dbg !103

25:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %11, metadata !104, metadata !DIExpression()), !dbg !107
  store i32 0, ptr %11, align 4, !dbg !107
  br label %26, !dbg !108

26:                                               ; preds = %34, %25
  call void @parcoach_rma_load(ptr %11, i64 32, i32 40, ptr @17), !dbg !109
  %27 = load i32, ptr %11, align 4, !dbg !109
  %28 = icmp slt i32 %27, 100, !dbg !111
  br i1 %28, label %29, label %37, !dbg !112

29:                                               ; preds = %26
  call void @parcoach_rma_load(ptr %9, i64 64, i32 41, ptr @18), !dbg !113
  %30 = load ptr, ptr %9, align 8, !dbg !113
  call void @parcoach_rma_load(ptr %11, i64 32, i32 41, ptr @19), !dbg !115
  %31 = load i32, ptr %11, align 4, !dbg !115
  %32 = sext i32 %31 to i64, !dbg !113
  %33 = getelementptr inbounds i32, ptr %30, i64 %32, !dbg !113
  call void @parcoach_rma_store(ptr %33, i64 32, i32 41, ptr @20), !dbg !116
  store i32 0, ptr %33, align 4, !dbg !116
  br label %34, !dbg !117

34:                                               ; preds = %29
  call void @parcoach_rma_load(ptr %11, i64 32, i32 40, ptr @21), !dbg !118
  %35 = load i32, ptr %11, align 4, !dbg !118
  %36 = add nsw i32 %35, 1, !dbg !118
  call void @parcoach_rma_store(ptr %11, i64 32, i32 40, ptr @22), !dbg !118
  store i32 %36, ptr %11, align 4, !dbg !118
  br label %26, !dbg !119, !llvm.loop !120

37:                                               ; preds = %26
  br label %52, !dbg !123

38:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %12, metadata !124, metadata !DIExpression()), !dbg !127
  store i32 0, ptr %12, align 4, !dbg !127
  br label %39, !dbg !128

39:                                               ; preds = %48, %38
  %40 = load i32, ptr %12, align 4, !dbg !129
  %41 = icmp slt i32 %40, 100, !dbg !131
  br i1 %41, label %42, label %51, !dbg !132

42:                                               ; preds = %39
  %43 = load i32, ptr %12, align 4, !dbg !133
  %44 = load ptr, ptr %9, align 8, !dbg !135
  %45 = load i32, ptr %12, align 4, !dbg !136
  %46 = sext i32 %45 to i64, !dbg !135
  %47 = getelementptr inbounds i32, ptr %44, i64 %46, !dbg !135
  store i32 %43, ptr %47, align 4, !dbg !137
  br label %48, !dbg !138

48:                                               ; preds = %42
  call void @parcoach_rma_load(ptr %12, i64 32, i32 44, ptr @15), !dbg !139
  %49 = load i32, ptr %12, align 4, !dbg !139
  %50 = add nsw i32 %49, 1, !dbg !139
  call void @parcoach_rma_store(ptr %12, i64 32, i32 44, ptr @16), !dbg !139
  store i32 %50, ptr %12, align 4, !dbg !139
  br label %39, !dbg !140, !llvm.loop !141

51:                                               ; preds = %39
  br label %52

52:                                               ; preds = %51, %37
  %53 = load ptr, ptr %8, align 8, !dbg !143
  %54 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %53, i32 49, ptr @2), !dbg !144
  call void @parcoach_rma_load(ptr %6, i64 32, i32 51, ptr @3), !dbg !145
  %55 = load i32, ptr %6, align 4, !dbg !145
  %56 = icmp eq i32 %55, 0, !dbg !147
  br i1 %56, label %57, label %60, !dbg !148

57:                                               ; preds = %52
  call void @parcoach_rma_load(ptr %9, i64 64, i32 53, ptr @4), !dbg !149
  %58 = load ptr, ptr %9, align 8, !dbg !149
  call void @parcoach_rma_load(ptr %8, i64 64, i32 53, ptr @5), !dbg !151
  %59 = load ptr, ptr %8, align 8, !dbg !151
  call void @inefficient_get(i32 noundef 0, ptr noundef %58, ptr noundef %59), !dbg !152
  br label %60, !dbg !153

60:                                               ; preds = %57, %52
  call void @parcoach_rma_load(ptr %8, i64 64, i32 56, ptr @6), !dbg !154
  %61 = load ptr, ptr %8, align 8, !dbg !154
  %62 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %61, i32 56, ptr @7), !dbg !155
  %63 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 58, ptr @8), !dbg !156
  call void @parcoach_rma_load(ptr %6, i64 32, i32 59, ptr @9), !dbg !157
  %64 = load i32, ptr %6, align 4, !dbg !157
  call void @parcoach_rma_load(ptr %9, i64 64, i32 59, ptr @10), !dbg !158
  %65 = load ptr, ptr %9, align 8, !dbg !158
  %66 = getelementptr inbounds i32, ptr %65, i64 1, !dbg !158
  call void @parcoach_rma_load(ptr %66, i64 32, i32 59, ptr @11), !dbg !158
  %67 = load i32, ptr %66, align 4, !dbg !158
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %64, i32 noundef %67), !dbg !159
  %69 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 61, ptr @12), !dbg !160
  %70 = call i32 @MPI_Finalize(), !dbg !161
  call void @parcoach_rma_store(ptr %3, i64 32, i32 64, ptr @13), !dbg !162
  store i32 0, ptr %3, align 4, !dbg !162
  br label %71, !dbg !162

71:                                               ; preds = %60, %18
  call void @parcoach_rma_load(ptr %3, i64 32, i32 65, ptr @14), !dbg !163
  %72 = load i32, ptr %3, align 4, !dbg !163
  ret i32 %72, !dbg !163
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Get(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "bb24176b8c8caea92fa35582fcdf6170")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 44)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 59, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 39)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/020-MPI-static-get-get-recursive-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "bb24176b8c8caea92fa35582fcdf6170")
!14 = !{!15, !19, !20, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
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
!36 = distinct !DISubprogram(name: "inefficient_get", scope: !2, file: !2, line: 12, type: !37, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !44)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39, !40, !41}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!44 = !{}
!45 = !DILocalVariable(name: "iteration", arg: 1, scope: !36, file: !2, line: 12, type: !39)
!46 = !DILocation(line: 12, column: 26, scope: !36)
!47 = !DILocalVariable(name: "arr_base", arg: 2, scope: !36, file: !2, line: 12, type: !40)
!48 = !DILocation(line: 12, column: 42, scope: !36)
!49 = !DILocalVariable(name: "win", arg: 3, scope: !36, file: !2, line: 12, type: !41)
!50 = !DILocation(line: 12, column: 60, scope: !36)
!51 = !DILocation(line: 14, column: 13, scope: !36)
!52 = !DILocation(line: 14, column: 24, scope: !36)
!53 = !DILocation(line: 14, column: 22, scope: !36)
!54 = !DILocation(line: 14, column: 50, scope: !36)
!55 = !DILocation(line: 14, column: 73, scope: !36)
!56 = !DILocation(line: 14, column: 5, scope: !36)
!57 = !DILocation(line: 15, column: 9, scope: !58)
!58 = distinct !DILexicalBlock(scope: !36, file: !2, line: 15, column: 9)
!59 = !DILocation(line: 15, column: 19, scope: !58)
!60 = !DILocation(line: 15, column: 9, scope: !36)
!61 = !DILocation(line: 16, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !2, line: 15, column: 25)
!63 = !DILocation(line: 16, column: 35, scope: !62)
!64 = !DILocation(line: 16, column: 40, scope: !62)
!65 = !DILocation(line: 16, column: 50, scope: !62)
!66 = !DILocation(line: 16, column: 9, scope: !62)
!67 = !DILocation(line: 17, column: 5, scope: !62)
!68 = !DILocation(line: 18, column: 1, scope: !36)
!69 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 20, type: !70, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !44)
!70 = !DISubroutineType(types: !71)
!71 = !{!39, !39, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !2, line: 20, type: !39)
!75 = !DILocation(line: 20, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !2, line: 20, type: !72)
!77 = !DILocation(line: 20, column: 27, scope: !69)
!78 = !DILocalVariable(name: "rank", scope: !69, file: !2, line: 21, type: !39)
!79 = !DILocation(line: 21, column: 9, scope: !69)
!80 = !DILocalVariable(name: "size", scope: !69, file: !2, line: 22, type: !39)
!81 = !DILocation(line: 22, column: 9, scope: !69)
!82 = !DILocation(line: 24, column: 5, scope: !69)
!83 = !DILocation(line: 25, column: 5, scope: !69)
!84 = !DILocation(line: 26, column: 5, scope: !69)
!85 = !DILocation(line: 28, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !69, file: !2, line: 28, column: 9)
!87 = !DILocation(line: 28, column: 14, scope: !86)
!88 = !DILocation(line: 28, column: 9, scope: !69)
!89 = !DILocation(line: 29, column: 64, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !2, line: 28, column: 27)
!91 = !DILocation(line: 29, column: 9, scope: !90)
!92 = !DILocation(line: 30, column: 9, scope: !90)
!93 = !DILocalVariable(name: "win", scope: !69, file: !2, line: 33, type: !41)
!94 = !DILocation(line: 33, column: 13, scope: !69)
!95 = !DILocalVariable(name: "arr_base", scope: !69, file: !2, line: 34, type: !40)
!96 = !DILocation(line: 34, column: 10, scope: !69)
!97 = !DILocation(line: 35, column: 5, scope: !69)
!98 = !DILocalVariable(name: "packet_size", scope: !69, file: !2, line: 37, type: !39)
!99 = !DILocation(line: 37, column: 9, scope: !69)
!100 = !DILocation(line: 39, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !69, file: !2, line: 39, column: 9)
!102 = !DILocation(line: 39, column: 14, scope: !101)
!103 = !DILocation(line: 39, column: 9, scope: !69)
!104 = !DILocalVariable(name: "i", scope: !105, file: !2, line: 40, type: !39)
!105 = distinct !DILexicalBlock(scope: !106, file: !2, line: 40, column: 9)
!106 = distinct !DILexicalBlock(scope: !101, file: !2, line: 39, column: 20)
!107 = !DILocation(line: 40, column: 18, scope: !105)
!108 = !DILocation(line: 40, column: 14, scope: !105)
!109 = !DILocation(line: 40, column: 25, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !2, line: 40, column: 9)
!111 = !DILocation(line: 40, column: 27, scope: !110)
!112 = !DILocation(line: 40, column: 9, scope: !105)
!113 = !DILocation(line: 41, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !2, line: 40, column: 44)
!115 = !DILocation(line: 41, column: 22, scope: !114)
!116 = !DILocation(line: 41, column: 25, scope: !114)
!117 = !DILocation(line: 42, column: 9, scope: !114)
!118 = !DILocation(line: 40, column: 40, scope: !110)
!119 = !DILocation(line: 40, column: 9, scope: !110)
!120 = distinct !{!120, !112, !121, !122}
!121 = !DILocation(line: 42, column: 9, scope: !105)
!122 = !{!"llvm.loop.mustprogress"}
!123 = !DILocation(line: 43, column: 5, scope: !106)
!124 = !DILocalVariable(name: "i", scope: !125, file: !2, line: 44, type: !39)
!125 = distinct !DILexicalBlock(scope: !126, file: !2, line: 44, column: 9)
!126 = distinct !DILexicalBlock(scope: !101, file: !2, line: 43, column: 12)
!127 = !DILocation(line: 44, column: 18, scope: !125)
!128 = !DILocation(line: 44, column: 14, scope: !125)
!129 = !DILocation(line: 44, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !2, line: 44, column: 9)
!131 = !DILocation(line: 44, column: 27, scope: !130)
!132 = !DILocation(line: 44, column: 9, scope: !125)
!133 = !DILocation(line: 45, column: 27, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !2, line: 44, column: 44)
!135 = !DILocation(line: 45, column: 13, scope: !134)
!136 = !DILocation(line: 45, column: 22, scope: !134)
!137 = !DILocation(line: 45, column: 25, scope: !134)
!138 = !DILocation(line: 46, column: 9, scope: !134)
!139 = !DILocation(line: 44, column: 40, scope: !130)
!140 = !DILocation(line: 44, column: 9, scope: !130)
!141 = distinct !{!141, !132, !142, !122}
!142 = !DILocation(line: 46, column: 9, scope: !125)
!143 = !DILocation(line: 49, column: 22, scope: !69)
!144 = !DILocation(line: 49, column: 5, scope: !69)
!145 = !DILocation(line: 51, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !69, file: !2, line: 51, column: 9)
!147 = !DILocation(line: 51, column: 14, scope: !146)
!148 = !DILocation(line: 51, column: 9, scope: !69)
!149 = !DILocation(line: 53, column: 28, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !2, line: 51, column: 20)
!151 = !DILocation(line: 53, column: 38, scope: !150)
!152 = !DILocation(line: 53, column: 9, scope: !150)
!153 = !DILocation(line: 54, column: 5, scope: !150)
!154 = !DILocation(line: 56, column: 22, scope: !69)
!155 = !DILocation(line: 56, column: 5, scope: !69)
!156 = !DILocation(line: 58, column: 5, scope: !69)
!157 = !DILocation(line: 59, column: 55, scope: !69)
!158 = !DILocation(line: 59, column: 61, scope: !69)
!159 = !DILocation(line: 59, column: 5, scope: !69)
!160 = !DILocation(line: 61, column: 5, scope: !69)
!161 = !DILocation(line: 62, column: 5, scope: !69)
!162 = !DILocation(line: 64, column: 5, scope: !69)
!163 = !DILocation(line: 65, column: 1, scope: !69)
