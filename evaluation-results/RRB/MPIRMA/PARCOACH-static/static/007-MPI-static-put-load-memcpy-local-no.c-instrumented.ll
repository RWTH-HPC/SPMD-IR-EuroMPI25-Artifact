; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c"
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
@0 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@1 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@2 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@3 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@4 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@5 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@6 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@7 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@8 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@9 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@10 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@11 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@12 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@13 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@14 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@15 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@16 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@17 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@18 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1
@19 = private unnamed_addr constant [103 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !41 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !48, metadata !DIExpression()), !dbg !49
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %6, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata ptr %7, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %8, metadata !56, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata ptr %9, metadata !61, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata ptr %10, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 1, ptr %10, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata ptr %11, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 2, ptr %11, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata ptr %12, metadata !68, metadata !DIExpression()), !dbg !69
  store ptr %10, ptr %12, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata ptr %13, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %14, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 42, ptr %14, align 4, !dbg !73
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !74
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !75
  %20 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !76
  %21 = load i32, ptr %7, align 4, !dbg !77
  %22 = icmp ne i32 %21, 2, !dbg !79
  br i1 %22, label %23, label %27, !dbg !80

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !81
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !83
  %26 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !84
  br label %27, !dbg !85

27:                                               ; preds = %23, %2
  %28 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 32, ptr @0), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %15, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 0, ptr %15, align 4, !dbg !89
  br label %29, !dbg !90

29:                                               ; preds = %37, %27
  %30 = load i32, ptr %15, align 4, !dbg !91
  %31 = icmp slt i32 %30, 10, !dbg !93
  br i1 %31, label %32, label %40, !dbg !94

32:                                               ; preds = %29
  %33 = load ptr, ptr %9, align 8, !dbg !95
  %34 = load i32, ptr %15, align 4, !dbg !97
  %35 = sext i32 %34 to i64, !dbg !95
  %36 = getelementptr inbounds i32, ptr %33, i64 %35, !dbg !95
  store i32 0, ptr %36, align 4, !dbg !98
  br label %37, !dbg !99

37:                                               ; preds = %32
  call void @parcoach_rma_load(ptr %15, i64 32, i32 33, ptr @18), !dbg !100
  %38 = load i32, ptr %15, align 4, !dbg !100
  %39 = add nsw i32 %38, 1, !dbg !100
  call void @parcoach_rma_store(ptr %15, i64 32, i32 33, ptr @19), !dbg !100
  store i32 %39, ptr %15, align 4, !dbg !100
  br label %29, !dbg !101, !llvm.loop !102

40:                                               ; preds = %29
  %41 = load ptr, ptr %8, align 8, !dbg !105
  %42 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %41, i32 37, ptr @1), !dbg !106
  call void @llvm.dbg.declare(metadata ptr %16, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata ptr %17, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %16, ptr align 8 %12, i64 8, i1 false), !dbg !111
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %17, ptr align 8 %9, i64 8, i1 false), !dbg !112
  call void @parcoach_rma_load(ptr %6, i64 32, i32 45, ptr @2), !dbg !113
  %43 = load i32, ptr %6, align 4, !dbg !113
  %44 = icmp eq i32 %43, 0, !dbg !115
  br i1 %44, label %45, label %52, !dbg !116

45:                                               ; preds = %40
  call void @parcoach_rma_load(ptr %12, i64 64, i32 46, ptr @3), !dbg !117
  %46 = load ptr, ptr %12, align 8, !dbg !117
  call void @parcoach_rma_load(ptr %8, i64 64, i32 46, ptr @4), !dbg !119
  %47 = load ptr, ptr %8, align 8, !dbg !119
  %48 = call i32 @parcoach_rma_MPI_Put(ptr %46, i32 1, ptr @ompi_mpi_int, i32 1, i64 0, i32 1, ptr @ompi_mpi_int, ptr %47, i32 46, ptr @5), !dbg !120
  call void @parcoach_rma_load(ptr %16, i64 64, i32 47, ptr @6), !dbg !121
  %49 = load ptr, ptr %16, align 8, !dbg !121
  call void @parcoach_rma_load(ptr %49, i64 32, i32 47, ptr @7), !dbg !122
  %50 = load i32, ptr %49, align 4, !dbg !122
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %50), !dbg !123
  br label %52, !dbg !124

52:                                               ; preds = %45, %40
  call void @parcoach_rma_load(ptr %8, i64 64, i32 50, ptr @8), !dbg !125
  %53 = load ptr, ptr %8, align 8, !dbg !125
  %54 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %53, i32 50, ptr @9), !dbg !126
  %55 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 52, ptr @10), !dbg !127
  call void @parcoach_rma_load(ptr %6, i64 32, i32 55, ptr @11), !dbg !128
  %56 = load i32, ptr %6, align 4, !dbg !128
  call void @parcoach_rma_load(ptr %12, i64 64, i32 56, ptr @12), !dbg !129
  %57 = load ptr, ptr %12, align 8, !dbg !129
  call void @parcoach_rma_load(ptr %57, i64 32, i32 56, ptr @13), !dbg !130
  %58 = load i32, ptr %57, align 4, !dbg !130
  call void @parcoach_rma_load(ptr %11, i64 32, i32 57, ptr @14), !dbg !131
  %59 = load i32, ptr %11, align 4, !dbg !131
  call void @parcoach_rma_load(ptr %9, i64 64, i32 58, ptr @15), !dbg !132
  %60 = load ptr, ptr %9, align 8, !dbg !132
  %61 = getelementptr inbounds i32, ptr %60, i64 0, !dbg !132
  call void @parcoach_rma_load(ptr %61, i64 32, i32 58, ptr @16), !dbg !132
  %62 = load i32, ptr %61, align 4, !dbg !132
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %56, i32 noundef %58, i32 noundef %59, i32 noundef %62), !dbg !133
  %64 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 60, ptr @17), !dbg !134
  %65 = call i32 @MPI_Finalize(), !dbg !135
  ret i32 0, !dbg !136
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @MPI_Put(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "110554e20f6c8ac43257487489093c5b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 18)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 54, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !31, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/007-MPI-static-put-load-memcpy-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "110554e20f6c8ac43257487489093c5b")
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
!41 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !42, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !47)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!47 = !{}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 13, type: !44)
!49 = !DILocation(line: 13, column: 14, scope: !41)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 13, type: !45)
!51 = !DILocation(line: 13, column: 27, scope: !41)
!52 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 15, type: !44)
!53 = !DILocation(line: 15, column: 9, scope: !41)
!54 = !DILocalVariable(name: "size", scope: !41, file: !2, line: 15, type: !44)
!55 = !DILocation(line: 15, column: 15, scope: !41)
!56 = !DILocalVariable(name: "win", scope: !41, file: !2, line: 16, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!60 = !DILocation(line: 16, column: 13, scope: !41)
!61 = !DILocalVariable(name: "win_base", scope: !41, file: !2, line: 17, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!63 = !DILocation(line: 17, column: 10, scope: !41)
!64 = !DILocalVariable(name: "value", scope: !41, file: !2, line: 18, type: !44)
!65 = !DILocation(line: 18, column: 9, scope: !41)
!66 = !DILocalVariable(name: "value2", scope: !41, file: !2, line: 18, type: !44)
!67 = !DILocation(line: 18, column: 20, scope: !41)
!68 = !DILocalVariable(name: "buf", scope: !41, file: !2, line: 19, type: !62)
!69 = !DILocation(line: 19, column: 10, scope: !41)
!70 = !DILocalVariable(name: "result", scope: !41, file: !2, line: 20, type: !44)
!71 = !DILocation(line: 20, column: 9, scope: !41)
!72 = !DILocalVariable(name: "token", scope: !41, file: !2, line: 21, type: !44)
!73 = !DILocation(line: 21, column: 9, scope: !41)
!74 = !DILocation(line: 23, column: 5, scope: !41)
!75 = !DILocation(line: 24, column: 5, scope: !41)
!76 = !DILocation(line: 25, column: 5, scope: !41)
!77 = !DILocation(line: 27, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !41, file: !2, line: 27, column: 9)
!79 = !DILocation(line: 27, column: 14, scope: !78)
!80 = !DILocation(line: 27, column: 9, scope: !41)
!81 = !DILocation(line: 28, column: 69, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 27, column: 27)
!83 = !DILocation(line: 28, column: 9, scope: !82)
!84 = !DILocation(line: 29, column: 9, scope: !82)
!85 = !DILocation(line: 30, column: 5, scope: !82)
!86 = !DILocation(line: 32, column: 5, scope: !41)
!87 = !DILocalVariable(name: "i", scope: !88, file: !2, line: 33, type: !44)
!88 = distinct !DILexicalBlock(scope: !41, file: !2, line: 33, column: 5)
!89 = !DILocation(line: 33, column: 14, scope: !88)
!90 = !DILocation(line: 33, column: 10, scope: !88)
!91 = !DILocation(line: 33, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 33, column: 5)
!93 = !DILocation(line: 33, column: 23, scope: !92)
!94 = !DILocation(line: 33, column: 5, scope: !88)
!95 = !DILocation(line: 34, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 33, column: 40)
!97 = !DILocation(line: 34, column: 18, scope: !96)
!98 = !DILocation(line: 34, column: 21, scope: !96)
!99 = !DILocation(line: 35, column: 5, scope: !96)
!100 = !DILocation(line: 33, column: 36, scope: !92)
!101 = !DILocation(line: 33, column: 5, scope: !92)
!102 = distinct !{!102, !94, !103, !104}
!103 = !DILocation(line: 35, column: 5, scope: !88)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 37, column: 22, scope: !41)
!106 = !DILocation(line: 37, column: 5, scope: !41)
!107 = !DILocalVariable(name: "buf_alias", scope: !41, file: !2, line: 39, type: !62)
!108 = !DILocation(line: 39, column: 10, scope: !41)
!109 = !DILocalVariable(name: "win_base_alias", scope: !41, file: !2, line: 40, type: !62)
!110 = !DILocation(line: 40, column: 10, scope: !41)
!111 = !DILocation(line: 42, column: 5, scope: !41)
!112 = !DILocation(line: 43, column: 5, scope: !41)
!113 = !DILocation(line: 45, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !41, file: !2, line: 45, column: 9)
!115 = !DILocation(line: 45, column: 14, scope: !114)
!116 = !DILocation(line: 45, column: 9, scope: !41)
!117 = !DILocation(line: 46, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !2, line: 45, column: 20)
!119 = !DILocation(line: 46, column: 52, scope: !118)
!120 = !DILocation(line: 46, column: 9, scope: !118)
!121 = !DILocation(line: 47, column: 39, scope: !118)
!122 = !DILocation(line: 47, column: 38, scope: !118)
!123 = !DILocation(line: 47, column: 9, scope: !118)
!124 = !DILocation(line: 48, column: 5, scope: !118)
!125 = !DILocation(line: 50, column: 22, scope: !41)
!126 = !DILocation(line: 50, column: 5, scope: !41)
!127 = !DILocation(line: 52, column: 5, scope: !41)
!128 = !DILocation(line: 55, column: 9, scope: !41)
!129 = !DILocation(line: 56, column: 10, scope: !41)
!130 = !DILocation(line: 56, column: 9, scope: !41)
!131 = !DILocation(line: 57, column: 9, scope: !41)
!132 = !DILocation(line: 58, column: 9, scope: !41)
!133 = !DILocation(line: 53, column: 5, scope: !41)
!134 = !DILocation(line: 60, column: 5, scope: !41)
!135 = !DILocation(line: 61, column: 5, scope: !41)
!136 = !DILocation(line: 63, column: 5, scope: !41)
