; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque

@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str = private unnamed_addr constant [12 x i8] c"*buf is %d\0A\00", align 1, !dbg !0
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !7
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@1 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@2 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@3 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@4 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@5 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@6 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@7 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@8 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@9 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@10 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@11 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@12 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@13 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@14 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@15 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@16 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1
@17 = private unnamed_addr constant [111 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !41 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !50, metadata !DIExpression()), !dbg !51
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load ptr, ptr %3, align 8, !dbg !54
  %6 = load ptr, ptr %4, align 8, !dbg !55
  %7 = call i32 @parcoach_rma_MPI_Get(ptr %5, i32 1, ptr @ompi_mpi_int, i32 1, i64 0, i32 1, ptr @ompi_mpi_int, ptr %6, i32 13, ptr @0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !58 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !61, metadata !DIExpression()), !dbg !62
  %5 = load ptr, ptr %3, align 8, !dbg !63
  %6 = load ptr, ptr %4, align 8, !dbg !64
  call void @deeeeeeeeep(ptr noundef %5, ptr noundef %6), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !67 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !68, metadata !DIExpression()), !dbg !69
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !70, metadata !DIExpression()), !dbg !71
  %5 = load ptr, ptr %3, align 8, !dbg !72
  %6 = load ptr, ptr %4, align 8, !dbg !73
  call void @deeeeeeeep(ptr noundef %5, ptr noundef %6), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !76 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !77, metadata !DIExpression()), !dbg !78
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !79, metadata !DIExpression()), !dbg !80
  %5 = load ptr, ptr %3, align 8, !dbg !81
  %6 = load ptr, ptr %4, align 8, !dbg !82
  call void @deeeeeeep(ptr noundef %5, ptr noundef %6), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !85 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !86, metadata !DIExpression()), !dbg !87
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !88, metadata !DIExpression()), !dbg !89
  %5 = load ptr, ptr %3, align 8, !dbg !90
  %6 = load ptr, ptr %4, align 8, !dbg !91
  call void @deeeeeep(ptr noundef %5, ptr noundef %6), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeeep(ptr noundef %0, ptr noundef %1) #0 !dbg !94 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !95, metadata !DIExpression()), !dbg !96
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !97, metadata !DIExpression()), !dbg !98
  %5 = load ptr, ptr %3, align 8, !dbg !99
  %6 = load ptr, ptr %4, align 8, !dbg !100
  call void @deeeeep(ptr noundef %5, ptr noundef %6), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deeep(ptr noundef %0, ptr noundef %1) #0 !dbg !103 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !104, metadata !DIExpression()), !dbg !105
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !106, metadata !DIExpression()), !dbg !107
  %5 = load ptr, ptr %3, align 8, !dbg !108
  %6 = load ptr, ptr %4, align 8, !dbg !109
  call void @deeeep(ptr noundef %5, ptr noundef %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @deep(ptr noundef %0, ptr noundef %1) #0 !dbg !112 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !113, metadata !DIExpression()), !dbg !114
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !115, metadata !DIExpression()), !dbg !116
  %5 = load ptr, ptr %3, align 8, !dbg !117
  %6 = load ptr, ptr %4, align 8, !dbg !118
  call void @deeep(ptr noundef %5, ptr noundef %6), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rank0(ptr noundef %0, ptr noundef %1) #0 !dbg !121 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !122, metadata !DIExpression()), !dbg !123
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !124, metadata !DIExpression()), !dbg !125
  %5 = load ptr, ptr %3, align 8, !dbg !126
  %6 = load ptr, ptr %4, align 8, !dbg !127
  call void @deep(ptr noundef %5, ptr noundef %6), !dbg !128
  %7 = load ptr, ptr %3, align 8, !dbg !129
  %8 = load i32, ptr %7, align 4, !dbg !130
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8), !dbg !131
  ret void, !dbg !132
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !133 {
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
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !138, metadata !DIExpression()), !dbg !139
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata ptr %6, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata ptr %7, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata ptr %8, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata ptr %9, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata ptr %10, metadata !150, metadata !DIExpression()), !dbg !151
  store i32 1, ptr %10, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata ptr %11, metadata !152, metadata !DIExpression()), !dbg !153
  store i32 2, ptr %11, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata ptr %12, metadata !154, metadata !DIExpression()), !dbg !155
  store ptr %10, ptr %12, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata ptr %13, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata ptr %14, metadata !158, metadata !DIExpression()), !dbg !159
  store i32 42, ptr %14, align 4, !dbg !159
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !160
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !161
  %18 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !162
  %19 = load i32, ptr %7, align 4, !dbg !163
  %20 = icmp ne i32 %19, 2, !dbg !165
  br i1 %20, label %21, label %25, !dbg !166

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !167
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %22, i32 noundef 2), !dbg !169
  %24 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !170
  br label %25, !dbg !171

25:                                               ; preds = %21, %2
  %26 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 53, ptr @1), !dbg !172
  call void @llvm.dbg.declare(metadata ptr %15, metadata !173, metadata !DIExpression()), !dbg !175
  store i32 0, ptr %15, align 4, !dbg !175
  br label %27, !dbg !176

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !177
  %29 = icmp slt i32 %28, 10, !dbg !179
  br i1 %29, label %30, label %38, !dbg !180

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !181
  %32 = load i32, ptr %15, align 4, !dbg !183
  %33 = sext i32 %32 to i64, !dbg !181
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !181
  store i32 0, ptr %34, align 4, !dbg !184
  br label %35, !dbg !185

35:                                               ; preds = %30
  call void @parcoach_rma_load(ptr %15, i64 32, i32 54, ptr @16), !dbg !186
  %36 = load i32, ptr %15, align 4, !dbg !186
  %37 = add nsw i32 %36, 1, !dbg !186
  call void @parcoach_rma_store(ptr %15, i64 32, i32 54, ptr @17), !dbg !186
  store i32 %37, ptr %15, align 4, !dbg !186
  br label %27, !dbg !187, !llvm.loop !188

38:                                               ; preds = %27
  %39 = load ptr, ptr %8, align 8, !dbg !191
  %40 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %39, i32 58, ptr @2), !dbg !192
  call void @parcoach_rma_load(ptr %6, i64 32, i32 60, ptr @3), !dbg !193
  %41 = load i32, ptr %6, align 4, !dbg !193
  %42 = icmp eq i32 %41, 0, !dbg !195
  br i1 %42, label %43, label %46, !dbg !196

43:                                               ; preds = %38
  call void @parcoach_rma_load(ptr %12, i64 64, i32 61, ptr @4), !dbg !197
  %44 = load ptr, ptr %12, align 8, !dbg !197
  call void @parcoach_rma_load(ptr %8, i64 64, i32 61, ptr @5), !dbg !199
  %45 = load ptr, ptr %8, align 8, !dbg !199
  call void @rank0(ptr noundef %44, ptr noundef %45), !dbg !200
  br label %46, !dbg !201

46:                                               ; preds = %43, %38
  call void @parcoach_rma_load(ptr %8, i64 64, i32 63, ptr @6), !dbg !202
  %47 = load ptr, ptr %8, align 8, !dbg !202
  %48 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %47, i32 63, ptr @7), !dbg !203
  %49 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 65, ptr @8), !dbg !204
  call void @parcoach_rma_load(ptr %6, i64 32, i32 68, ptr @9), !dbg !205
  %50 = load i32, ptr %6, align 4, !dbg !205
  call void @parcoach_rma_load(ptr %12, i64 64, i32 69, ptr @10), !dbg !206
  %51 = load ptr, ptr %12, align 8, !dbg !206
  call void @parcoach_rma_load(ptr %51, i64 32, i32 69, ptr @11), !dbg !207
  %52 = load i32, ptr %51, align 4, !dbg !207
  call void @parcoach_rma_load(ptr %11, i64 32, i32 70, ptr @12), !dbg !208
  %53 = load i32, ptr %11, align 4, !dbg !208
  call void @parcoach_rma_load(ptr %9, i64 64, i32 71, ptr @13), !dbg !209
  %54 = load ptr, ptr %9, align 8, !dbg !209
  %55 = getelementptr inbounds i32, ptr %54, i64 0, !dbg !209
  call void @parcoach_rma_load(ptr %55, i64 32, i32 71, ptr @14), !dbg !209
  %56 = load i32, ptr %55, align 4, !dbg !209
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %50, i32 noundef %52, i32 noundef %53, i32 noundef %56), !dbg !210
  %58 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 73, ptr @15), !dbg !211
  %59 = call i32 @MPI_Finalize(), !dbg !212
  ret i32 0, !dbg !213
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #2

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

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3503028d0af23dd77d5c99b554f735fb")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 12)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 49)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 67, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !31, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/002-MPI-static-get-load-deep-nesting-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3503028d0af23dd77d5c99b554f735fb")
!19 = !{!20, !24, !25, !28}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!31 = !{!0, !7, !12}
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"openmp", i32 50}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 2}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = !{!"Debian clang version 15.0.6"}
!41 = distinct !DISubprogram(name: "deeeeeeeeep", scope: !2, file: !2, line: 9, type: !42, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44, !46}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!49 = !{}
!50 = !DILocalVariable(name: "buf", arg: 1, scope: !41, file: !2, line: 9, type: !44)
!51 = !DILocation(line: 9, column: 49, scope: !41)
!52 = !DILocalVariable(name: "win", arg: 2, scope: !41, file: !2, line: 9, type: !46)
!53 = !DILocation(line: 9, column: 62, scope: !41)
!54 = !DILocation(line: 13, column: 13, scope: !41)
!55 = !DILocation(line: 13, column: 48, scope: !41)
!56 = !DILocation(line: 13, column: 5, scope: !41)
!57 = !DILocation(line: 14, column: 1, scope: !41)
!58 = distinct !DISubprogram(name: "deeeeeeeep", scope: !2, file: !2, line: 16, type: !42, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!59 = !DILocalVariable(name: "buf", arg: 1, scope: !58, file: !2, line: 16, type: !44)
!60 = !DILocation(line: 16, column: 48, scope: !58)
!61 = !DILocalVariable(name: "win", arg: 2, scope: !58, file: !2, line: 16, type: !46)
!62 = !DILocation(line: 16, column: 61, scope: !58)
!63 = !DILocation(line: 16, column: 80, scope: !58)
!64 = !DILocation(line: 16, column: 85, scope: !58)
!65 = !DILocation(line: 16, column: 68, scope: !58)
!66 = !DILocation(line: 16, column: 91, scope: !58)
!67 = distinct !DISubprogram(name: "deeeeeeep", scope: !2, file: !2, line: 17, type: !42, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!68 = !DILocalVariable(name: "buf", arg: 1, scope: !67, file: !2, line: 17, type: !44)
!69 = !DILocation(line: 17, column: 47, scope: !67)
!70 = !DILocalVariable(name: "win", arg: 2, scope: !67, file: !2, line: 17, type: !46)
!71 = !DILocation(line: 17, column: 60, scope: !67)
!72 = !DILocation(line: 17, column: 78, scope: !67)
!73 = !DILocation(line: 17, column: 83, scope: !67)
!74 = !DILocation(line: 17, column: 67, scope: !67)
!75 = !DILocation(line: 17, column: 89, scope: !67)
!76 = distinct !DISubprogram(name: "deeeeeep", scope: !2, file: !2, line: 18, type: !42, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!77 = !DILocalVariable(name: "buf", arg: 1, scope: !76, file: !2, line: 18, type: !44)
!78 = !DILocation(line: 18, column: 46, scope: !76)
!79 = !DILocalVariable(name: "win", arg: 2, scope: !76, file: !2, line: 18, type: !46)
!80 = !DILocation(line: 18, column: 59, scope: !76)
!81 = !DILocation(line: 18, column: 76, scope: !76)
!82 = !DILocation(line: 18, column: 81, scope: !76)
!83 = !DILocation(line: 18, column: 66, scope: !76)
!84 = !DILocation(line: 18, column: 87, scope: !76)
!85 = distinct !DISubprogram(name: "deeeeep", scope: !2, file: !2, line: 19, type: !42, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!86 = !DILocalVariable(name: "buf", arg: 1, scope: !85, file: !2, line: 19, type: !44)
!87 = !DILocation(line: 19, column: 45, scope: !85)
!88 = !DILocalVariable(name: "win", arg: 2, scope: !85, file: !2, line: 19, type: !46)
!89 = !DILocation(line: 19, column: 58, scope: !85)
!90 = !DILocation(line: 19, column: 74, scope: !85)
!91 = !DILocation(line: 19, column: 79, scope: !85)
!92 = !DILocation(line: 19, column: 65, scope: !85)
!93 = !DILocation(line: 19, column: 85, scope: !85)
!94 = distinct !DISubprogram(name: "deeeep", scope: !2, file: !2, line: 20, type: !42, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!95 = !DILocalVariable(name: "buf", arg: 1, scope: !94, file: !2, line: 20, type: !44)
!96 = !DILocation(line: 20, column: 44, scope: !94)
!97 = !DILocalVariable(name: "win", arg: 2, scope: !94, file: !2, line: 20, type: !46)
!98 = !DILocation(line: 20, column: 57, scope: !94)
!99 = !DILocation(line: 20, column: 72, scope: !94)
!100 = !DILocation(line: 20, column: 77, scope: !94)
!101 = !DILocation(line: 20, column: 64, scope: !94)
!102 = !DILocation(line: 20, column: 83, scope: !94)
!103 = distinct !DISubprogram(name: "deeep", scope: !2, file: !2, line: 21, type: !42, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!104 = !DILocalVariable(name: "buf", arg: 1, scope: !103, file: !2, line: 21, type: !44)
!105 = !DILocation(line: 21, column: 43, scope: !103)
!106 = !DILocalVariable(name: "win", arg: 2, scope: !103, file: !2, line: 21, type: !46)
!107 = !DILocation(line: 21, column: 56, scope: !103)
!108 = !DILocation(line: 21, column: 70, scope: !103)
!109 = !DILocation(line: 21, column: 75, scope: !103)
!110 = !DILocation(line: 21, column: 63, scope: !103)
!111 = !DILocation(line: 21, column: 81, scope: !103)
!112 = distinct !DISubprogram(name: "deep", scope: !2, file: !2, line: 22, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!113 = !DILocalVariable(name: "buf", arg: 1, scope: !112, file: !2, line: 22, type: !44)
!114 = !DILocation(line: 22, column: 42, scope: !112)
!115 = !DILocalVariable(name: "win", arg: 2, scope: !112, file: !2, line: 22, type: !46)
!116 = !DILocation(line: 22, column: 55, scope: !112)
!117 = !DILocation(line: 22, column: 68, scope: !112)
!118 = !DILocation(line: 22, column: 73, scope: !112)
!119 = !DILocation(line: 22, column: 62, scope: !112)
!120 = !DILocation(line: 22, column: 79, scope: !112)
!121 = distinct !DISubprogram(name: "rank0", scope: !2, file: !2, line: 24, type: !42, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!122 = !DILocalVariable(name: "buf", arg: 1, scope: !121, file: !2, line: 24, type: !44)
!123 = !DILocation(line: 24, column: 17, scope: !121)
!124 = !DILocalVariable(name: "win", arg: 2, scope: !121, file: !2, line: 24, type: !46)
!125 = !DILocation(line: 24, column: 30, scope: !121)
!126 = !DILocation(line: 26, column: 10, scope: !121)
!127 = !DILocation(line: 26, column: 15, scope: !121)
!128 = !DILocation(line: 26, column: 5, scope: !121)
!129 = !DILocation(line: 28, column: 29, scope: !121)
!130 = !DILocation(line: 28, column: 28, scope: !121)
!131 = !DILocation(line: 28, column: 5, scope: !121)
!132 = !DILocation(line: 29, column: 1, scope: !121)
!133 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 34, type: !134, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !49)
!134 = !DISubroutineType(types: !135)
!135 = !{!45, !45, !136}
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!138 = !DILocalVariable(name: "argc", arg: 1, scope: !133, file: !2, line: 34, type: !45)
!139 = !DILocation(line: 34, column: 14, scope: !133)
!140 = !DILocalVariable(name: "argv", arg: 2, scope: !133, file: !2, line: 34, type: !136)
!141 = !DILocation(line: 34, column: 27, scope: !133)
!142 = !DILocalVariable(name: "rank", scope: !133, file: !2, line: 36, type: !45)
!143 = !DILocation(line: 36, column: 9, scope: !133)
!144 = !DILocalVariable(name: "size", scope: !133, file: !2, line: 36, type: !45)
!145 = !DILocation(line: 36, column: 15, scope: !133)
!146 = !DILocalVariable(name: "win", scope: !133, file: !2, line: 37, type: !46)
!147 = !DILocation(line: 37, column: 13, scope: !133)
!148 = !DILocalVariable(name: "win_base", scope: !133, file: !2, line: 38, type: !44)
!149 = !DILocation(line: 38, column: 10, scope: !133)
!150 = !DILocalVariable(name: "value", scope: !133, file: !2, line: 39, type: !45)
!151 = !DILocation(line: 39, column: 9, scope: !133)
!152 = !DILocalVariable(name: "value2", scope: !133, file: !2, line: 39, type: !45)
!153 = !DILocation(line: 39, column: 20, scope: !133)
!154 = !DILocalVariable(name: "buf", scope: !133, file: !2, line: 40, type: !44)
!155 = !DILocation(line: 40, column: 10, scope: !133)
!156 = !DILocalVariable(name: "result", scope: !133, file: !2, line: 41, type: !45)
!157 = !DILocation(line: 41, column: 9, scope: !133)
!158 = !DILocalVariable(name: "token", scope: !133, file: !2, line: 42, type: !45)
!159 = !DILocation(line: 42, column: 9, scope: !133)
!160 = !DILocation(line: 44, column: 5, scope: !133)
!161 = !DILocation(line: 45, column: 5, scope: !133)
!162 = !DILocation(line: 46, column: 5, scope: !133)
!163 = !DILocation(line: 48, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !133, file: !2, line: 48, column: 9)
!165 = !DILocation(line: 48, column: 14, scope: !164)
!166 = !DILocation(line: 48, column: 9, scope: !133)
!167 = !DILocation(line: 49, column: 69, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !2, line: 48, column: 27)
!169 = !DILocation(line: 49, column: 9, scope: !168)
!170 = !DILocation(line: 50, column: 9, scope: !168)
!171 = !DILocation(line: 51, column: 5, scope: !168)
!172 = !DILocation(line: 53, column: 5, scope: !133)
!173 = !DILocalVariable(name: "i", scope: !174, file: !2, line: 54, type: !45)
!174 = distinct !DILexicalBlock(scope: !133, file: !2, line: 54, column: 5)
!175 = !DILocation(line: 54, column: 14, scope: !174)
!176 = !DILocation(line: 54, column: 10, scope: !174)
!177 = !DILocation(line: 54, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !2, line: 54, column: 5)
!179 = !DILocation(line: 54, column: 23, scope: !178)
!180 = !DILocation(line: 54, column: 5, scope: !174)
!181 = !DILocation(line: 55, column: 9, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !2, line: 54, column: 40)
!183 = !DILocation(line: 55, column: 18, scope: !182)
!184 = !DILocation(line: 55, column: 21, scope: !182)
!185 = !DILocation(line: 56, column: 5, scope: !182)
!186 = !DILocation(line: 54, column: 36, scope: !178)
!187 = !DILocation(line: 54, column: 5, scope: !178)
!188 = distinct !{!188, !180, !189, !190}
!189 = !DILocation(line: 56, column: 5, scope: !174)
!190 = !{!"llvm.loop.mustprogress"}
!191 = !DILocation(line: 58, column: 22, scope: !133)
!192 = !DILocation(line: 58, column: 5, scope: !133)
!193 = !DILocation(line: 60, column: 9, scope: !194)
!194 = distinct !DILexicalBlock(scope: !133, file: !2, line: 60, column: 9)
!195 = !DILocation(line: 60, column: 14, scope: !194)
!196 = !DILocation(line: 60, column: 9, scope: !133)
!197 = !DILocation(line: 61, column: 15, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !2, line: 60, column: 20)
!199 = !DILocation(line: 61, column: 20, scope: !198)
!200 = !DILocation(line: 61, column: 9, scope: !198)
!201 = !DILocation(line: 62, column: 5, scope: !198)
!202 = !DILocation(line: 63, column: 22, scope: !133)
!203 = !DILocation(line: 63, column: 5, scope: !133)
!204 = !DILocation(line: 65, column: 5, scope: !133)
!205 = !DILocation(line: 68, column: 9, scope: !133)
!206 = !DILocation(line: 69, column: 10, scope: !133)
!207 = !DILocation(line: 69, column: 9, scope: !133)
!208 = !DILocation(line: 70, column: 9, scope: !133)
!209 = !DILocation(line: 71, column: 9, scope: !133)
!210 = !DILocation(line: 66, column: 5, scope: !133)
!211 = !DILocation(line: 73, column: 5, scope: !133)
!212 = !DILocation(line: 74, column: 5, scope: !133)
!213 = !DILocation(line: 76, column: 5, scope: !133)
