; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Process %d finished. Sums: sum0 = %d, sum1 = %d\0A\00", align 1, !dbg !0
@0 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@1 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@2 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@3 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@4 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@5 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@6 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@7 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@8 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@9 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@10 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@11 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@12 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@13 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@14 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@15 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@16 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@17 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@18 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@19 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@20 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@21 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@22 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@23 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@24 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@25 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@26 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@27 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@28 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@29 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@30 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@31 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@32 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@33 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@34 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@35 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@36 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@37 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@38 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@39 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@40 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@41 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@42 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@43 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1
@44 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !31 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [2 x ptr], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %8, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %9, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 50, ptr %9, align 4, !dbg !50
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %18 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %10, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %12, metadata !60, metadata !DIExpression()), !dbg !64
  %19 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !65
  %20 = load ptr, ptr %10, align 8, !dbg !66
  store ptr %20, ptr %19, align 8, !dbg !65
  %21 = getelementptr inbounds ptr, ptr %19, i64 1, !dbg !65
  %22 = load ptr, ptr %11, align 8, !dbg !67
  store ptr %22, ptr %21, align 8, !dbg !65
  %23 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !68
  %24 = call i32 @parcoach_rma_MPI_Win_allocate(i64 400, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %7, ptr %23, i32 21, ptr @0), !dbg !69
  %25 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !70
  %26 = call i32 @parcoach_rma_MPI_Win_allocate(i64 400, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %8, ptr %25, i32 22, ptr @1), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %13, metadata !72, metadata !DIExpression()), !dbg !74
  store i32 0, ptr %13, align 4, !dbg !74
  br label %27, !dbg !75

27:                                               ; preds = %43, %2
  %28 = load i32, ptr %13, align 4, !dbg !76
  %29 = icmp slt i32 %28, 100, !dbg !78
  br i1 %29, label %30, label %46, !dbg !79

30:                                               ; preds = %27
  %31 = load i32, ptr %13, align 4, !dbg !80
  %32 = load i32, ptr %6, align 4, !dbg !82
  %33 = add nsw i32 %32, 1, !dbg !83
  %34 = mul nsw i32 %31, %33, !dbg !84
  %35 = load ptr, ptr %7, align 8, !dbg !85
  %36 = load i32, ptr %13, align 4, !dbg !86
  %37 = sext i32 %36 to i64, !dbg !85
  %38 = getelementptr inbounds i32, ptr %35, i64 %37, !dbg !85
  store i32 %34, ptr %38, align 4, !dbg !87
  %39 = load ptr, ptr %8, align 8, !dbg !88
  %40 = load i32, ptr %13, align 4, !dbg !89
  %41 = sext i32 %40 to i64, !dbg !88
  %42 = getelementptr inbounds i32, ptr %39, i64 %41, !dbg !88
  store i32 0, ptr %42, align 4, !dbg !90
  br label %43, !dbg !91

43:                                               ; preds = %30
  call void @parcoach_rma_load(ptr %13, i64 32, i32 23, ptr @43), !dbg !92
  %44 = load i32, ptr %13, align 4, !dbg !92
  %45 = add nsw i32 %44, 1, !dbg !92
  call void @parcoach_rma_store(ptr %13, i64 32, i32 23, ptr @44), !dbg !92
  store i32 %45, ptr %13, align 4, !dbg !92
  br label %27, !dbg !93, !llvm.loop !94

46:                                               ; preds = %27
  %47 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !97
  %48 = load ptr, ptr %47, align 16, !dbg !97
  %49 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %48, i32 28, ptr @2), !dbg !98
  %50 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !99
  call void @parcoach_rma_load(ptr %50, i64 64, i32 29, ptr @3), !dbg !99
  %51 = load ptr, ptr %50, align 8, !dbg !99
  %52 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %51, i32 29, ptr @4), !dbg !100
  call void @parcoach_rma_load(ptr %6, i64 32, i32 31, ptr @5), !dbg !101
  %53 = load i32, ptr %6, align 4, !dbg !101
  %54 = icmp eq i32 %53, 0, !dbg !103
  br i1 %54, label %55, label %73, !dbg !104

55:                                               ; preds = %46
  call void @parcoach_rma_load(ptr %8, i64 64, i32 33, ptr @6), !dbg !105
  %56 = load ptr, ptr %8, align 8, !dbg !105
  call void @parcoach_rma_load(ptr %9, i64 32, i32 33, ptr @7), !dbg !107
  %57 = load i32, ptr %9, align 4, !dbg !107
  call void @parcoach_rma_load(ptr %9, i64 32, i32 33, ptr @8), !dbg !108
  %58 = load i32, ptr %9, align 4, !dbg !108
  %59 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !109
  call void @parcoach_rma_load(ptr %59, i64 64, i32 33, ptr @9), !dbg !109
  %60 = load ptr, ptr %59, align 16, !dbg !109
  %61 = call i32 @parcoach_rma_MPI_Get(ptr %56, i32 %57, ptr @ompi_mpi_int, i32 1, i64 0, i32 %58, ptr @ompi_mpi_int, ptr %60, i32 33, ptr @10), !dbg !110
  %62 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !111
  call void @parcoach_rma_load(ptr %62, i64 64, i32 34, ptr @11), !dbg !111
  %63 = load ptr, ptr %62, align 8, !dbg !111
  %64 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %63, i32 34, ptr @12), !dbg !112
  call void @parcoach_rma_load(ptr %8, i64 64, i32 36, ptr @13), !dbg !113
  %65 = load ptr, ptr %8, align 8, !dbg !113
  call void @parcoach_rma_load(ptr %9, i64 32, i32 36, ptr @14), !dbg !114
  %66 = load i32, ptr %9, align 4, !dbg !114
  call void @parcoach_rma_load(ptr %9, i64 32, i32 36, ptr @15), !dbg !115
  %67 = load i32, ptr %9, align 4, !dbg !115
  %68 = sext i32 %67 to i64, !dbg !115
  call void @parcoach_rma_load(ptr %9, i64 32, i32 36, ptr @16), !dbg !116
  %69 = load i32, ptr %9, align 4, !dbg !116
  %70 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !117
  call void @parcoach_rma_load(ptr %70, i64 64, i32 36, ptr @17), !dbg !117
  %71 = load ptr, ptr %70, align 16, !dbg !117
  %72 = call i32 @parcoach_rma_MPI_Get(ptr %65, i32 %66, ptr @ompi_mpi_int, i32 1, i64 %68, i32 %69, ptr @ompi_mpi_int, ptr %71, i32 36, ptr @18), !dbg !118
  br label %73, !dbg !119

73:                                               ; preds = %55, %46
  %74 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !120
  call void @parcoach_rma_load(ptr %74, i64 64, i32 39, ptr @19), !dbg !120
  %75 = load ptr, ptr %74, align 16, !dbg !120
  %76 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %75, i32 39, ptr @20), !dbg !121
  %77 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !122
  call void @parcoach_rma_load(ptr %77, i64 64, i32 40, ptr @21), !dbg !122
  %78 = load ptr, ptr %77, align 8, !dbg !122
  %79 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %78, i32 40, ptr @22), !dbg !123
  %80 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 42, ptr @23), !dbg !124
  call void @llvm.dbg.declare(metadata ptr %14, metadata !125, metadata !DIExpression()), !dbg !126
  call void @parcoach_rma_store(ptr %14, i64 32, i32 44, ptr @24), !dbg !126
  store i32 0, ptr %14, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata ptr %15, metadata !127, metadata !DIExpression()), !dbg !128
  call void @parcoach_rma_store(ptr %15, i64 32, i32 45, ptr @25), !dbg !128
  store i32 0, ptr %15, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata ptr %16, metadata !129, metadata !DIExpression()), !dbg !131
  call void @parcoach_rma_store(ptr %16, i64 32, i32 46, ptr @26), !dbg !131
  store i32 0, ptr %16, align 4, !dbg !131
  br label %81, !dbg !132

81:                                               ; preds = %99, %73
  call void @parcoach_rma_load(ptr %16, i64 32, i32 46, ptr @27), !dbg !133
  %82 = load i32, ptr %16, align 4, !dbg !133
  %83 = icmp slt i32 %82, 100, !dbg !135
  br i1 %83, label %84, label %102, !dbg !136

84:                                               ; preds = %81
  call void @parcoach_rma_load(ptr %7, i64 64, i32 47, ptr @28), !dbg !137
  %85 = load ptr, ptr %7, align 8, !dbg !137
  call void @parcoach_rma_load(ptr %16, i64 32, i32 47, ptr @29), !dbg !139
  %86 = load i32, ptr %16, align 4, !dbg !139
  %87 = sext i32 %86 to i64, !dbg !137
  %88 = getelementptr inbounds i32, ptr %85, i64 %87, !dbg !137
  call void @parcoach_rma_load(ptr %88, i64 32, i32 47, ptr @30), !dbg !137
  %89 = load i32, ptr %88, align 4, !dbg !137
  call void @parcoach_rma_load(ptr %14, i64 32, i32 47, ptr @31), !dbg !140
  %90 = load i32, ptr %14, align 4, !dbg !140
  %91 = add nsw i32 %90, %89, !dbg !140
  call void @parcoach_rma_store(ptr %14, i64 32, i32 47, ptr @32), !dbg !140
  store i32 %91, ptr %14, align 4, !dbg !140
  call void @parcoach_rma_load(ptr %8, i64 64, i32 48, ptr @33), !dbg !141
  %92 = load ptr, ptr %8, align 8, !dbg !141
  call void @parcoach_rma_load(ptr %16, i64 32, i32 48, ptr @34), !dbg !142
  %93 = load i32, ptr %16, align 4, !dbg !142
  %94 = sext i32 %93 to i64, !dbg !141
  %95 = getelementptr inbounds i32, ptr %92, i64 %94, !dbg !141
  call void @parcoach_rma_load(ptr %95, i64 32, i32 48, ptr @35), !dbg !141
  %96 = load i32, ptr %95, align 4, !dbg !141
  call void @parcoach_rma_load(ptr %15, i64 32, i32 48, ptr @36), !dbg !143
  %97 = load i32, ptr %15, align 4, !dbg !143
  %98 = add nsw i32 %97, %96, !dbg !143
  call void @parcoach_rma_store(ptr %15, i64 32, i32 48, ptr @37), !dbg !143
  store i32 %98, ptr %15, align 4, !dbg !143
  br label %99, !dbg !144

99:                                               ; preds = %84
  call void @parcoach_rma_load(ptr %16, i64 32, i32 46, ptr @41), !dbg !145
  %100 = load i32, ptr %16, align 4, !dbg !145
  %101 = add nsw i32 %100, 1, !dbg !145
  call void @parcoach_rma_store(ptr %16, i64 32, i32 46, ptr @42), !dbg !145
  store i32 %101, ptr %16, align 4, !dbg !145
  br label %81, !dbg !146, !llvm.loop !147

102:                                              ; preds = %81
  call void @parcoach_rma_load(ptr %6, i64 32, i32 50, ptr @38), !dbg !149
  %103 = load i32, ptr %6, align 4, !dbg !149
  call void @parcoach_rma_load(ptr %14, i64 32, i32 50, ptr @39), !dbg !150
  %104 = load i32, ptr %14, align 4, !dbg !150
  call void @parcoach_rma_load(ptr %15, i64 32, i32 50, ptr @40), !dbg !151
  %105 = load i32, ptr %15, align 4, !dbg !151
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %103, i32 noundef %104, i32 noundef %105), !dbg !152
  %107 = call i32 @MPI_Finalize(), !dbg !153
  ret i32 0, !dbg !154
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Get(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f3a509d1ab85d2fd41c17ddd2b02d776")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, globals: !21, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/021-MPI-static-win-in-array-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f3a509d1ab85d2fd41c17ddd2b02d776")
!9 = !{!10, !14, !15, !18}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !11, line: 419, baseType: !12)
!11 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !11, line: 419, flags: DIFlagFwdDecl)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !11, line: 424, baseType: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !11, line: 424, flags: DIFlagFwdDecl)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !11, line: 420, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !11, line: 420, flags: DIFlagFwdDecl)
!21 = !{!0}
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"openmp", i32 50}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 2}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Debian clang version 15.0.6"}
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 11, type: !32, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !37)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 11, type: !34)
!39 = !DILocation(line: 11, column: 14, scope: !31)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 11, type: !35)
!41 = !DILocation(line: 11, column: 27, scope: !31)
!42 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 12, type: !34)
!43 = !DILocation(line: 12, column: 9, scope: !31)
!44 = !DILocalVariable(name: "arr0", scope: !31, file: !2, line: 13, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!46 = !DILocation(line: 13, column: 10, scope: !31)
!47 = !DILocalVariable(name: "arr1", scope: !31, file: !2, line: 13, type: !45)
!48 = !DILocation(line: 13, column: 17, scope: !31)
!49 = !DILocalVariable(name: "packet_size", scope: !31, file: !2, line: 14, type: !34)
!50 = !DILocation(line: 14, column: 9, scope: !31)
!51 = !DILocation(line: 16, column: 5, scope: !31)
!52 = !DILocation(line: 17, column: 5, scope: !31)
!53 = !DILocalVariable(name: "win0", scope: !31, file: !2, line: 19, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !11, line: 429, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !11, line: 429, flags: DIFlagFwdDecl)
!57 = !DILocation(line: 19, column: 13, scope: !31)
!58 = !DILocalVariable(name: "win1", scope: !31, file: !2, line: 19, type: !54)
!59 = !DILocation(line: 19, column: 19, scope: !31)
!60 = !DILocalVariable(name: "wins", scope: !31, file: !2, line: 20, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 128, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 2)
!64 = !DILocation(line: 20, column: 13, scope: !31)
!65 = !DILocation(line: 20, column: 23, scope: !31)
!66 = !DILocation(line: 20, column: 24, scope: !31)
!67 = !DILocation(line: 20, column: 30, scope: !31)
!68 = !DILocation(line: 21, column: 98, scope: !31)
!69 = !DILocation(line: 21, column: 5, scope: !31)
!70 = !DILocation(line: 22, column: 98, scope: !31)
!71 = !DILocation(line: 22, column: 5, scope: !31)
!72 = !DILocalVariable(name: "i", scope: !73, file: !2, line: 23, type: !34)
!73 = distinct !DILexicalBlock(scope: !31, file: !2, line: 23, column: 5)
!74 = !DILocation(line: 23, column: 14, scope: !73)
!75 = !DILocation(line: 23, column: 10, scope: !73)
!76 = !DILocation(line: 23, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 23, column: 5)
!78 = !DILocation(line: 23, column: 23, scope: !77)
!79 = !DILocation(line: 23, column: 5, scope: !73)
!80 = !DILocation(line: 24, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !2, line: 23, column: 40)
!82 = !DILocation(line: 24, column: 24, scope: !81)
!83 = !DILocation(line: 24, column: 29, scope: !81)
!84 = !DILocation(line: 24, column: 21, scope: !81)
!85 = !DILocation(line: 24, column: 9, scope: !81)
!86 = !DILocation(line: 24, column: 14, scope: !81)
!87 = !DILocation(line: 24, column: 17, scope: !81)
!88 = !DILocation(line: 25, column: 9, scope: !81)
!89 = !DILocation(line: 25, column: 14, scope: !81)
!90 = !DILocation(line: 25, column: 17, scope: !81)
!91 = !DILocation(line: 26, column: 5, scope: !81)
!92 = !DILocation(line: 23, column: 36, scope: !77)
!93 = !DILocation(line: 23, column: 5, scope: !77)
!94 = distinct !{!94, !79, !95, !96}
!95 = !DILocation(line: 26, column: 5, scope: !73)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 28, column: 22, scope: !31)
!98 = !DILocation(line: 28, column: 5, scope: !31)
!99 = !DILocation(line: 29, column: 22, scope: !31)
!100 = !DILocation(line: 29, column: 5, scope: !31)
!101 = !DILocation(line: 31, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !31, file: !2, line: 31, column: 9)
!103 = !DILocation(line: 31, column: 14, scope: !102)
!104 = !DILocation(line: 31, column: 9, scope: !31)
!105 = !DILocation(line: 33, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !2, line: 31, column: 20)
!107 = !DILocation(line: 33, column: 23, scope: !106)
!108 = !DILocation(line: 33, column: 51, scope: !106)
!109 = !DILocation(line: 33, column: 73, scope: !106)
!110 = !DILocation(line: 33, column: 9, scope: !106)
!111 = !DILocation(line: 34, column: 26, scope: !106)
!112 = !DILocation(line: 34, column: 9, scope: !106)
!113 = !DILocation(line: 36, column: 17, scope: !106)
!114 = !DILocation(line: 36, column: 23, scope: !106)
!115 = !DILocation(line: 36, column: 48, scope: !106)
!116 = !DILocation(line: 36, column: 61, scope: !106)
!117 = !DILocation(line: 36, column: 83, scope: !106)
!118 = !DILocation(line: 36, column: 9, scope: !106)
!119 = !DILocation(line: 37, column: 5, scope: !106)
!120 = !DILocation(line: 39, column: 22, scope: !31)
!121 = !DILocation(line: 39, column: 5, scope: !31)
!122 = !DILocation(line: 40, column: 22, scope: !31)
!123 = !DILocation(line: 40, column: 5, scope: !31)
!124 = !DILocation(line: 42, column: 5, scope: !31)
!125 = !DILocalVariable(name: "sum0", scope: !31, file: !2, line: 44, type: !34)
!126 = !DILocation(line: 44, column: 9, scope: !31)
!127 = !DILocalVariable(name: "sum1", scope: !31, file: !2, line: 45, type: !34)
!128 = !DILocation(line: 45, column: 9, scope: !31)
!129 = !DILocalVariable(name: "i", scope: !130, file: !2, line: 46, type: !34)
!130 = distinct !DILexicalBlock(scope: !31, file: !2, line: 46, column: 5)
!131 = !DILocation(line: 46, column: 14, scope: !130)
!132 = !DILocation(line: 46, column: 10, scope: !130)
!133 = !DILocation(line: 46, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !2, line: 46, column: 5)
!135 = !DILocation(line: 46, column: 23, scope: !134)
!136 = !DILocation(line: 46, column: 5, scope: !130)
!137 = !DILocation(line: 47, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !2, line: 46, column: 40)
!139 = !DILocation(line: 47, column: 22, scope: !138)
!140 = !DILocation(line: 47, column: 14, scope: !138)
!141 = !DILocation(line: 48, column: 17, scope: !138)
!142 = !DILocation(line: 48, column: 22, scope: !138)
!143 = !DILocation(line: 48, column: 14, scope: !138)
!144 = !DILocation(line: 49, column: 5, scope: !138)
!145 = !DILocation(line: 46, column: 36, scope: !134)
!146 = !DILocation(line: 46, column: 5, scope: !134)
!147 = distinct !{!147, !136, !148, !96}
!148 = !DILocation(line: 49, column: 5, scope: !130)
!149 = !DILocation(line: 50, column: 65, scope: !31)
!150 = !DILocation(line: 50, column: 71, scope: !31)
!151 = !DILocation(line: 50, column: 77, scope: !31)
!152 = !DILocation(line: 50, column: 5, scope: !31)
!153 = !DILocation(line: 52, column: 5, scope: !31)
!154 = !DILocation(line: 54, column: 5, scope: !31)
