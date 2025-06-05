; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"*buf_alias is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@1 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@2 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@3 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@4 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@5 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@6 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@7 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@8 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@9 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@10 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@11 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@12 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@13 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@14 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@15 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@16 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@17 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@18 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@19 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@20 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1
@21 = private unnamed_addr constant [104 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @aliasgenerator(ptr noundef %0) #0 !dbg !41 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !48, metadata !DIExpression()), !dbg !49
  %3 = load ptr, ptr %2, align 8, !dbg !50
  %4 = load ptr, ptr %3, align 8, !dbg !51
  ret ptr %4, !dbg !52
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !53 {
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
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !58, metadata !DIExpression()), !dbg !59
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata ptr %6, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %7, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata ptr %8, metadata !66, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %9, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %10, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 1, ptr %10, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata ptr %11, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 2, ptr %11, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata ptr %12, metadata !77, metadata !DIExpression()), !dbg !78
  store ptr %10, ptr %12, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata ptr %13, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata ptr %14, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 42, ptr %14, align 4, !dbg !82
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !83
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !84
  %20 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !85
  %21 = load i32, ptr %7, align 4, !dbg !86
  %22 = icmp ne i32 %21, 2, !dbg !88
  br i1 %22, label %23, label %27, !dbg !89

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !90
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !92
  %26 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !93
  br label %27, !dbg !94

27:                                               ; preds = %23, %2
  %28 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 33, ptr @0), !dbg !95
  call void @llvm.dbg.declare(metadata ptr %15, metadata !96, metadata !DIExpression()), !dbg !98
  store i32 0, ptr %15, align 4, !dbg !98
  br label %29, !dbg !99

29:                                               ; preds = %37, %27
  %30 = load i32, ptr %15, align 4, !dbg !100
  %31 = icmp slt i32 %30, 10, !dbg !102
  br i1 %31, label %32, label %40, !dbg !103

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !104
  %34 = load i32, ptr %15, align 4, !dbg !106
  %35 = sext i32 %34 to i64, !dbg !104
  %36 = getelementptr inbounds i32, ptr %33, i64 %35, !dbg !104
  store i32 0, ptr %36, align 4, !dbg !107
  br label %37, !dbg !108

37:                                               ; preds = %32
  call void @parcoach_rma_load(ptr %15, i64 32, i32 34, ptr @20), !dbg !109
  %38 = load i32, ptr %15, align 4, !dbg !109
  %39 = add nsw i32 %38, 1, !dbg !109
  call void @parcoach_rma_store(ptr %15, i64 32, i32 34, ptr @21), !dbg !109
  store i32 %39, ptr %15, align 4, !dbg !109
  br label %29, !dbg !110, !llvm.loop !111

40:                                               ; preds = %29
  %41 = load ptr, ptr %8, align 8, !dbg !114
  %42 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %41, i32 38, ptr @1), !dbg !115
  call void @llvm.dbg.declare(metadata ptr %16, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata ptr %17, metadata !118, metadata !DIExpression()), !dbg !119
  %43 = call ptr @aliasgenerator(ptr noundef %12), !dbg !120
  call void @parcoach_rma_store(ptr %16, i64 64, i32 43, ptr @2), !dbg !121
  store ptr %43, ptr %16, align 8, !dbg !121
  %44 = call ptr @aliasgenerator(ptr noundef %9), !dbg !122
  call void @parcoach_rma_store(ptr %17, i64 64, i32 44, ptr @3), !dbg !123
  store ptr %44, ptr %17, align 8, !dbg !123
  call void @parcoach_rma_load(ptr %6, i64 32, i32 46, ptr @4), !dbg !124
  %45 = load i32, ptr %6, align 4, !dbg !124
  %46 = icmp eq i32 %45, 0, !dbg !126
  br i1 %46, label %47, label %54, !dbg !127

47:                                               ; preds = %40
  call void @parcoach_rma_load(ptr %12, i64 64, i32 49, ptr @5), !dbg !128
  %48 = load ptr, ptr %12, align 8, !dbg !128
  call void @parcoach_rma_load(ptr %8, i64 64, i32 49, ptr @6), !dbg !130
  %49 = load ptr, ptr %8, align 8, !dbg !130
  %50 = call i32 @parcoach_rma_MPI_Get(ptr %48, i32 1, ptr @ompi_mpi_int, i32 1, i64 0, i32 1, ptr @ompi_mpi_int, ptr %49, i32 49, ptr @7), !dbg !131
  call void @parcoach_rma_load(ptr %16, i64 64, i32 51, ptr @8), !dbg !132
  %51 = load ptr, ptr %16, align 8, !dbg !132
  call void @parcoach_rma_load(ptr %51, i64 32, i32 51, ptr @9), !dbg !133
  %52 = load i32, ptr %51, align 4, !dbg !133
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %52), !dbg !134
  br label %54, !dbg !135

54:                                               ; preds = %47, %40
  call void @parcoach_rma_load(ptr %8, i64 64, i32 54, ptr @10), !dbg !136
  %55 = load ptr, ptr %8, align 8, !dbg !136
  %56 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %55, i32 54, ptr @11), !dbg !137
  %57 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 56, ptr @12), !dbg !138
  call void @parcoach_rma_load(ptr %6, i64 32, i32 59, ptr @13), !dbg !139
  %58 = load i32, ptr %6, align 4, !dbg !139
  call void @parcoach_rma_load(ptr %12, i64 64, i32 60, ptr @14), !dbg !140
  %59 = load ptr, ptr %12, align 8, !dbg !140
  call void @parcoach_rma_load(ptr %59, i64 32, i32 60, ptr @15), !dbg !141
  %60 = load i32, ptr %59, align 4, !dbg !141
  call void @parcoach_rma_load(ptr %11, i64 32, i32 61, ptr @16), !dbg !142
  %61 = load i32, ptr %11, align 4, !dbg !142
  call void @parcoach_rma_load(ptr %9, i64 64, i32 62, ptr @17), !dbg !143
  %62 = load ptr, ptr %9, align 8, !dbg !143
  %63 = getelementptr inbounds i32, ptr %62, i64 0, !dbg !143
  call void @parcoach_rma_load(ptr %63, i64 32, i32 62, ptr @18), !dbg !143
  %64 = load i32, ptr %63, align 4, !dbg !143
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %58, i32 noundef %60, i32 noundef %61, i32 noundef %64), !dbg !144
  %66 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 64, ptr @19), !dbg !145
  %67 = call i32 @MPI_Finalize(), !dbg !146
  ret i32 0, !dbg !147
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Get(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "4119d9995b8cf3874f9cca256e7b1432")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 51, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 18)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !31, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/006-MPI-static-get-load-retval-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "4119d9995b8cf3874f9cca256e7b1432")
!19 = !{!20, !24, !25, !28}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
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
!41 = distinct !DISubprogram(name: "aliasgenerator", scope: !2, file: !2, line: 9, type: !42, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !47)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !46}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!47 = !{}
!48 = !DILocalVariable(name: "x", arg: 1, scope: !41, file: !2, line: 9, type: !46)
!49 = !DILocation(line: 9, column: 53, scope: !41)
!50 = !DILocation(line: 9, column: 66, scope: !41)
!51 = !DILocation(line: 9, column: 65, scope: !41)
!52 = !DILocation(line: 9, column: 58, scope: !41)
!53 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !54, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !47)
!54 = !DISubroutineType(types: !55)
!55 = !{!45, !45, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !2, line: 14, type: !45)
!59 = !DILocation(line: 14, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !2, line: 14, type: !56)
!61 = !DILocation(line: 14, column: 27, scope: !53)
!62 = !DILocalVariable(name: "rank", scope: !53, file: !2, line: 16, type: !45)
!63 = !DILocation(line: 16, column: 9, scope: !53)
!64 = !DILocalVariable(name: "size", scope: !53, file: !2, line: 16, type: !45)
!65 = !DILocation(line: 16, column: 15, scope: !53)
!66 = !DILocalVariable(name: "win", scope: !53, file: !2, line: 17, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!70 = !DILocation(line: 17, column: 13, scope: !53)
!71 = !DILocalVariable(name: "win_base", scope: !53, file: !2, line: 18, type: !44)
!72 = !DILocation(line: 18, column: 10, scope: !53)
!73 = !DILocalVariable(name: "value", scope: !53, file: !2, line: 19, type: !45)
!74 = !DILocation(line: 19, column: 9, scope: !53)
!75 = !DILocalVariable(name: "value2", scope: !53, file: !2, line: 19, type: !45)
!76 = !DILocation(line: 19, column: 20, scope: !53)
!77 = !DILocalVariable(name: "buf", scope: !53, file: !2, line: 20, type: !44)
!78 = !DILocation(line: 20, column: 10, scope: !53)
!79 = !DILocalVariable(name: "result", scope: !53, file: !2, line: 21, type: !45)
!80 = !DILocation(line: 21, column: 9, scope: !53)
!81 = !DILocalVariable(name: "token", scope: !53, file: !2, line: 22, type: !45)
!82 = !DILocation(line: 22, column: 9, scope: !53)
!83 = !DILocation(line: 24, column: 5, scope: !53)
!84 = !DILocation(line: 25, column: 5, scope: !53)
!85 = !DILocation(line: 26, column: 5, scope: !53)
!86 = !DILocation(line: 28, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !53, file: !2, line: 28, column: 9)
!88 = !DILocation(line: 28, column: 14, scope: !87)
!89 = !DILocation(line: 28, column: 9, scope: !53)
!90 = !DILocation(line: 29, column: 69, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !2, line: 28, column: 27)
!92 = !DILocation(line: 29, column: 9, scope: !91)
!93 = !DILocation(line: 30, column: 9, scope: !91)
!94 = !DILocation(line: 31, column: 5, scope: !91)
!95 = !DILocation(line: 33, column: 5, scope: !53)
!96 = !DILocalVariable(name: "i", scope: !97, file: !2, line: 34, type: !45)
!97 = distinct !DILexicalBlock(scope: !53, file: !2, line: 34, column: 5)
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
!111 = distinct !{!111, !103, !112, !113}
!112 = !DILocation(line: 36, column: 5, scope: !97)
!113 = !{!"llvm.loop.mustprogress"}
!114 = !DILocation(line: 38, column: 22, scope: !53)
!115 = !DILocation(line: 38, column: 5, scope: !53)
!116 = !DILocalVariable(name: "buf_alias", scope: !53, file: !2, line: 40, type: !44)
!117 = !DILocation(line: 40, column: 10, scope: !53)
!118 = !DILocalVariable(name: "win_base_alias", scope: !53, file: !2, line: 41, type: !44)
!119 = !DILocation(line: 41, column: 10, scope: !53)
!120 = !DILocation(line: 43, column: 17, scope: !53)
!121 = !DILocation(line: 43, column: 15, scope: !53)
!122 = !DILocation(line: 44, column: 22, scope: !53)
!123 = !DILocation(line: 44, column: 20, scope: !53)
!124 = !DILocation(line: 46, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !53, file: !2, line: 46, column: 9)
!126 = !DILocation(line: 46, column: 14, scope: !125)
!127 = !DILocation(line: 46, column: 9, scope: !53)
!128 = !DILocation(line: 49, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !2, line: 46, column: 20)
!130 = !DILocation(line: 49, column: 52, scope: !129)
!131 = !DILocation(line: 49, column: 9, scope: !129)
!132 = !DILocation(line: 51, column: 39, scope: !129)
!133 = !DILocation(line: 51, column: 38, scope: !129)
!134 = !DILocation(line: 51, column: 9, scope: !129)
!135 = !DILocation(line: 52, column: 5, scope: !129)
!136 = !DILocation(line: 54, column: 22, scope: !53)
!137 = !DILocation(line: 54, column: 5, scope: !53)
!138 = !DILocation(line: 56, column: 5, scope: !53)
!139 = !DILocation(line: 59, column: 9, scope: !53)
!140 = !DILocation(line: 60, column: 10, scope: !53)
!141 = !DILocation(line: 60, column: 9, scope: !53)
!142 = !DILocation(line: 61, column: 9, scope: !53)
!143 = !DILocation(line: 62, column: 9, scope: !53)
!144 = !DILocation(line: 57, column: 5, scope: !53)
!145 = !DILocation(line: 64, column: 5, scope: !53)
!146 = !DILocation(line: 65, column: 5, scope: !53)
!147 = !DILocation(line: 67, column: 5, scope: !53)
