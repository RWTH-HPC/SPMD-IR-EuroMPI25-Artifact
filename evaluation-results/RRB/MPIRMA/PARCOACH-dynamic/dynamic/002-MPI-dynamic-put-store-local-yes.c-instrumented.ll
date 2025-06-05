; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@1 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@2 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@3 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@4 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@5 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@6 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@7 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@8 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@9 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@10 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@11 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@12 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@13 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@14 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@15 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@16 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@17 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1
@18 = private unnamed_addr constant [101 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
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
  %16 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %8, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 1, ptr %10, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %11, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 2, ptr %11, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata ptr %12, metadata !63, metadata !DIExpression()), !dbg !64
  store ptr %10, ptr %12, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %13, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %14, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 42, ptr %14, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata ptr %15, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 10, ptr %15, align 4, !dbg !70
  %17 = load i32, ptr %4, align 4, !dbg !71
  %18 = icmp sgt i32 %17, 1, !dbg !73
  br i1 %18, label %19, label %24, !dbg !74

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8, !dbg !75
  %21 = getelementptr inbounds ptr, ptr %20, i64 1, !dbg !75
  %22 = load ptr, ptr %21, align 8, !dbg !75
  %23 = call i32 @atoi(ptr noundef %22) #4, !dbg !77
  store i32 %23, ptr %15, align 4, !dbg !78
  br label %24, !dbg !79

24:                                               ; preds = %19, %2
  %25 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !80
  %26 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !81
  %27 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !82
  %28 = load i32, ptr %7, align 4, !dbg !83
  %29 = icmp ne i32 %28, 2, !dbg !85
  br i1 %29, label %30, label %34, !dbg !86

30:                                               ; preds = %24
  %31 = load i32, ptr %7, align 4, !dbg !87
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %31, i32 noundef 2), !dbg !89
  %33 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !90
  br label %34, !dbg !91

34:                                               ; preds = %30, %24
  %35 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 37, ptr @0), !dbg !92
  call void @llvm.dbg.declare(metadata ptr %16, metadata !93, metadata !DIExpression()), !dbg !95
  store i32 0, ptr %16, align 4, !dbg !95
  br label %36, !dbg !96

36:                                               ; preds = %44, %34
  %37 = load i32, ptr %16, align 4, !dbg !97
  %38 = icmp slt i32 %37, 10, !dbg !99
  br i1 %38, label %39, label %47, !dbg !100

39:                                               ; preds = %36
  %40 = load ptr, ptr %9, align 8, !dbg !101
  %41 = load i32, ptr %16, align 4, !dbg !103
  %42 = sext i32 %41 to i64, !dbg !101
  %43 = getelementptr inbounds i32, ptr %40, i64 %42, !dbg !101
  store i32 0, ptr %43, align 4, !dbg !104
  br label %44, !dbg !105

44:                                               ; preds = %39
  call void @parcoach_rma_load(ptr %16, i64 32, i32 38, ptr @17), !dbg !106
  %45 = load i32, ptr %16, align 4, !dbg !106
  %46 = add nsw i32 %45, 1, !dbg !106
  call void @parcoach_rma_store(ptr %16, i64 32, i32 38, ptr @18), !dbg !106
  store i32 %46, ptr %16, align 4, !dbg !106
  br label %36, !dbg !107, !llvm.loop !108

47:                                               ; preds = %36
  %48 = load ptr, ptr %8, align 8, !dbg !111
  %49 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %48, i32 42, ptr @1), !dbg !112
  call void @parcoach_rma_load(ptr %6, i64 32, i32 43, ptr @2), !dbg !113
  %50 = load i32, ptr %6, align 4, !dbg !113
  %51 = icmp eq i32 %50, 0, !dbg !115
  br i1 %51, label %52, label %58, !dbg !116

52:                                               ; preds = %47
  call void @parcoach_rma_load(ptr %15, i64 32, i32 43, ptr @3), !dbg !117
  %53 = load i32, ptr %15, align 4, !dbg !117
  %54 = icmp eq i32 %53, 5, !dbg !118
  br i1 %54, label %55, label %58, !dbg !119

55:                                               ; preds = %52
  call void @parcoach_rma_load(ptr %8, i64 64, i32 45, ptr @14), !dbg !120
  %56 = load ptr, ptr %8, align 8, !dbg !120
  %57 = call i32 @parcoach_rma_MPI_Put(ptr %10, i32 1, ptr @ompi_mpi_int, i32 1, i64 0, i32 1, ptr @ompi_mpi_int, ptr %56, i32 45, ptr @15), !dbg !122
  call void @parcoach_rma_store(ptr %10, i64 32, i32 47, ptr @16), !dbg !123
  store i32 42, ptr %10, align 4, !dbg !123
  br label %58, !dbg !124

58:                                               ; preds = %55, %52, %47
  call void @parcoach_rma_load(ptr %8, i64 64, i32 49, ptr @4), !dbg !125
  %59 = load ptr, ptr %8, align 8, !dbg !125
  %60 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %59, i32 49, ptr @5), !dbg !126
  %61 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 51, ptr @6), !dbg !127
  call void @parcoach_rma_load(ptr %6, i64 32, i32 54, ptr @7), !dbg !128
  %62 = load i32, ptr %6, align 4, !dbg !128
  call void @parcoach_rma_load(ptr %12, i64 64, i32 55, ptr @8), !dbg !129
  %63 = load ptr, ptr %12, align 8, !dbg !129
  call void @parcoach_rma_load(ptr %63, i64 32, i32 55, ptr @9), !dbg !130
  %64 = load i32, ptr %63, align 4, !dbg !130
  call void @parcoach_rma_load(ptr %11, i64 32, i32 56, ptr @10), !dbg !131
  %65 = load i32, ptr %11, align 4, !dbg !131
  call void @parcoach_rma_load(ptr %9, i64 64, i32 57, ptr @11), !dbg !132
  %66 = load ptr, ptr %9, align 8, !dbg !132
  %67 = getelementptr inbounds i32, ptr %66, i64 0, !dbg !132
  call void @parcoach_rma_load(ptr %67, i64 32, i32 57, ptr @12), !dbg !132
  %68 = load i32, ptr %67, align 4, !dbg !132
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %62, i32 noundef %64, i32 noundef %65, i32 noundef %68), !dbg !133
  %70 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 59, ptr @13), !dbg !134
  %71 = call i32 @MPI_Finalize(), !dbg !135
  ret i32 0, !dbg !136
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #2

declare i32 @MPI_Init(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #3

declare i32 @MPI_Put(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Barrier(ptr noundef) #3

declare i32 @MPI_Win_free(ptr noundef) #3

declare i32 @MPI_Finalize() #3

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "36c5e075bff6f1b642c223c9628d693c")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/002-MPI-dynamic-put-store-local-yes.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "36c5e075bff6f1b642c223c9628d693c")
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
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !37, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !42)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !{}
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 13, type: !39)
!44 = !DILocation(line: 13, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 13, type: !40)
!46 = !DILocation(line: 13, column: 27, scope: !36)
!47 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 15, type: !39)
!48 = !DILocation(line: 15, column: 9, scope: !36)
!49 = !DILocalVariable(name: "size", scope: !36, file: !2, line: 15, type: !39)
!50 = !DILocation(line: 15, column: 15, scope: !36)
!51 = !DILocalVariable(name: "win", scope: !36, file: !2, line: 16, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!55 = !DILocation(line: 16, column: 13, scope: !36)
!56 = !DILocalVariable(name: "win_base", scope: !36, file: !2, line: 17, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!58 = !DILocation(line: 17, column: 10, scope: !36)
!59 = !DILocalVariable(name: "value", scope: !36, file: !2, line: 18, type: !39)
!60 = !DILocation(line: 18, column: 9, scope: !36)
!61 = !DILocalVariable(name: "value2", scope: !36, file: !2, line: 18, type: !39)
!62 = !DILocation(line: 18, column: 20, scope: !36)
!63 = !DILocalVariable(name: "buf", scope: !36, file: !2, line: 19, type: !57)
!64 = !DILocation(line: 19, column: 10, scope: !36)
!65 = !DILocalVariable(name: "result", scope: !36, file: !2, line: 20, type: !39)
!66 = !DILocation(line: 20, column: 9, scope: !36)
!67 = !DILocalVariable(name: "token", scope: !36, file: !2, line: 21, type: !39)
!68 = !DILocation(line: 21, column: 9, scope: !36)
!69 = !DILocalVariable(name: "ctrl", scope: !36, file: !2, line: 23, type: !39)
!70 = !DILocation(line: 23, column: 9, scope: !36)
!71 = !DILocation(line: 24, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !36, file: !2, line: 24, column: 9)
!73 = !DILocation(line: 24, column: 14, scope: !72)
!74 = !DILocation(line: 24, column: 9, scope: !36)
!75 = !DILocation(line: 25, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !2, line: 24, column: 19)
!77 = !DILocation(line: 25, column: 16, scope: !76)
!78 = !DILocation(line: 25, column: 14, scope: !76)
!79 = !DILocation(line: 26, column: 5, scope: !76)
!80 = !DILocation(line: 28, column: 5, scope: !36)
!81 = !DILocation(line: 29, column: 5, scope: !36)
!82 = !DILocation(line: 30, column: 5, scope: !36)
!83 = !DILocation(line: 32, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !36, file: !2, line: 32, column: 9)
!85 = !DILocation(line: 32, column: 14, scope: !84)
!86 = !DILocation(line: 32, column: 9, scope: !36)
!87 = !DILocation(line: 33, column: 69, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !2, line: 32, column: 27)
!89 = !DILocation(line: 33, column: 9, scope: !88)
!90 = !DILocation(line: 34, column: 9, scope: !88)
!91 = !DILocation(line: 35, column: 5, scope: !88)
!92 = !DILocation(line: 37, column: 5, scope: !36)
!93 = !DILocalVariable(name: "i", scope: !94, file: !2, line: 38, type: !39)
!94 = distinct !DILexicalBlock(scope: !36, file: !2, line: 38, column: 5)
!95 = !DILocation(line: 38, column: 14, scope: !94)
!96 = !DILocation(line: 38, column: 10, scope: !94)
!97 = !DILocation(line: 38, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !2, line: 38, column: 5)
!99 = !DILocation(line: 38, column: 23, scope: !98)
!100 = !DILocation(line: 38, column: 5, scope: !94)
!101 = !DILocation(line: 39, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !2, line: 38, column: 40)
!103 = !DILocation(line: 39, column: 18, scope: !102)
!104 = !DILocation(line: 39, column: 21, scope: !102)
!105 = !DILocation(line: 40, column: 5, scope: !102)
!106 = !DILocation(line: 38, column: 36, scope: !98)
!107 = !DILocation(line: 38, column: 5, scope: !98)
!108 = distinct !{!108, !100, !109, !110}
!109 = !DILocation(line: 40, column: 5, scope: !94)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 42, column: 22, scope: !36)
!112 = !DILocation(line: 42, column: 5, scope: !36)
!113 = !DILocation(line: 43, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !36, file: !2, line: 43, column: 9)
!115 = !DILocation(line: 43, column: 14, scope: !114)
!116 = !DILocation(line: 43, column: 19, scope: !114)
!117 = !DILocation(line: 43, column: 22, scope: !114)
!118 = !DILocation(line: 43, column: 27, scope: !114)
!119 = !DILocation(line: 43, column: 9, scope: !36)
!120 = !DILocation(line: 45, column: 55, scope: !121)
!121 = distinct !DILexicalBlock(scope: !114, file: !2, line: 43, column: 33)
!122 = !DILocation(line: 45, column: 9, scope: !121)
!123 = !DILocation(line: 47, column: 15, scope: !121)
!124 = !DILocation(line: 48, column: 5, scope: !121)
!125 = !DILocation(line: 49, column: 22, scope: !36)
!126 = !DILocation(line: 49, column: 5, scope: !36)
!127 = !DILocation(line: 51, column: 5, scope: !36)
!128 = !DILocation(line: 54, column: 9, scope: !36)
!129 = !DILocation(line: 55, column: 10, scope: !36)
!130 = !DILocation(line: 55, column: 9, scope: !36)
!131 = !DILocation(line: 56, column: 9, scope: !36)
!132 = !DILocation(line: 57, column: 9, scope: !36)
!133 = !DILocation(line: 52, column: 5, scope: !36)
!134 = !DILocation(line: 59, column: 5, scope: !36)
!135 = !DILocation(line: 60, column: 5, scope: !36)
!136 = !DILocation(line: 62, column: 5, scope: !36)
