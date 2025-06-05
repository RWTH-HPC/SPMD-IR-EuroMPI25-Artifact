; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [81 x i8] c"Process %d: Execution finished, variable contents: win_base = %d, localbuf = %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@1 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@2 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@3 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@4 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@5 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@6 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@7 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@8 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@9 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@10 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@11 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@12 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@13 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@14 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@15 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@16 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@17 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@18 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@19 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@20 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@21 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@22 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1
@23 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [10 x i32], align 16
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata ptr %8, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %9, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %10, metadata !52, metadata !DIExpression()), !dbg !54
  %14 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !55
  %15 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !56
  %16 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !60
  store i32 0, ptr %11, align 4, !dbg !60
  br label %17, !dbg !61

17:                                               ; preds = %25, %2
  %18 = load i32, ptr %11, align 4, !dbg !62
  %19 = icmp slt i32 %18, 10, !dbg !64
  br i1 %19, label %20, label %28, !dbg !65

20:                                               ; preds = %17
  %21 = load i32, ptr %11, align 4, !dbg !66
  %22 = load i32, ptr %11, align 4, !dbg !68
  %23 = sext i32 %22 to i64, !dbg !69
  %24 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 %23, !dbg !69
  store i32 %21, ptr %24, align 4, !dbg !70
  br label %25, !dbg !71

25:                                               ; preds = %20
  %26 = load i32, ptr %11, align 4, !dbg !72
  %27 = add nsw i32 %26, 1, !dbg !72
  store i32 %27, ptr %11, align 4, !dbg !72
  br label %17, !dbg !73, !llvm.loop !74

28:                                               ; preds = %17
  %29 = load i32, ptr %7, align 4, !dbg !77
  %30 = icmp ne i32 %29, 2, !dbg !79
  br i1 %30, label %31, label %35, !dbg !80

31:                                               ; preds = %28
  %32 = load i32, ptr %7, align 4, !dbg !81
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32, i32 noundef 2), !dbg !83
  %34 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !84
  br label %35, !dbg !85

35:                                               ; preds = %31, %28
  %36 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, i32 469762048, i32 1140850688, ptr %10, ptr %8, i32 33, ptr @0), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %12, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 0, ptr %12, align 4, !dbg !89
  br label %37, !dbg !90

37:                                               ; preds = %45, %35
  %38 = load i32, ptr %12, align 4, !dbg !91
  %39 = icmp slt i32 %38, 10, !dbg !93
  br i1 %39, label %40, label %48, !dbg !94

40:                                               ; preds = %37
  %41 = load ptr, ptr %10, align 8, !dbg !95
  %42 = load i32, ptr %12, align 4, !dbg !97
  %43 = sext i32 %42 to i64, !dbg !95
  %44 = getelementptr inbounds i32, ptr %41, i64 %43, !dbg !95
  store i32 0, ptr %44, align 4, !dbg !98
  br label %45, !dbg !99

45:                                               ; preds = %40
  %46 = load i32, ptr %12, align 4, !dbg !100
  %47 = add nsw i32 %46, 1, !dbg !100
  store i32 %47, ptr %12, align 4, !dbg !100
  br label %37, !dbg !101, !llvm.loop !102

48:                                               ; preds = %37
  %49 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 38, ptr @1), !dbg !104
  %50 = load i32, ptr %6, align 4, !dbg !105
  %51 = icmp eq i32 %50, 0, !dbg !107
  br i1 %51, label %52, label %83, !dbg !108

52:                                               ; preds = %48
  %53 = load i32, ptr %8, align 4, !dbg !109
  %54 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %53, i32 41, ptr @2), !dbg !111
  call void @llvm.dbg.declare(metadata ptr %13, metadata !112, metadata !DIExpression()), !dbg !114
  call void @parcoach_rma_store(ptr %13, i64 32, i32 42, ptr @3), !dbg !114
  store i32 1, ptr %13, align 4, !dbg !114
  br label %55, !dbg !115

55:                                               ; preds = %75, %52
  call void @parcoach_rma_load(ptr %13, i64 32, i32 42, ptr @10), !dbg !116
  %56 = load i32, ptr %13, align 4, !dbg !116
  %57 = icmp slt i32 %56, 10, !dbg !118
  br i1 %57, label %58, label %78, !dbg !119

58:                                               ; preds = %55
  %59 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 0, !dbg !120
  call void @parcoach_rma_load(ptr %13, i64 32, i32 43, ptr @11), !dbg !122
  %60 = load i32, ptr %13, align 4, !dbg !122
  %61 = sext i32 %60 to i64, !dbg !123
  %62 = getelementptr inbounds i32, ptr %59, i64 %61, !dbg !123
  call void @parcoach_rma_load(ptr %13, i64 32, i32 43, ptr @12), !dbg !124
  %63 = load i32, ptr %13, align 4, !dbg !124
  %64 = sext i32 %63 to i64, !dbg !124
  call void @parcoach_rma_load(ptr %8, i64 32, i32 43, ptr @13), !dbg !125
  %65 = load i32, ptr %8, align 4, !dbg !125
  %66 = call i32 @parcoach_rma_MPI_Put(ptr %62, i32 1, i32 1275069445, i32 1, i64 %64, i32 1, i32 1275069445, i32 %65, i32 43, ptr @14), !dbg !126
  call void @parcoach_rma_load(ptr %13, i64 32, i32 44, ptr @15), !dbg !127
  %67 = load i32, ptr %13, align 4, !dbg !127
  %68 = sub nsw i32 %67, 1, !dbg !128
  %69 = sext i32 %68 to i64, !dbg !129
  %70 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 %69, !dbg !129
  call void @parcoach_rma_load(ptr %70, i64 32, i32 44, ptr @16), !dbg !130
  %71 = load i32, ptr %70, align 4, !dbg !130
  %72 = add nsw i32 %71, 1, !dbg !130
  call void @parcoach_rma_store(ptr %70, i64 32, i32 44, ptr @17), !dbg !130
  store i32 %72, ptr %70, align 4, !dbg !130
  call void @parcoach_rma_load(ptr %8, i64 32, i32 45, ptr @18), !dbg !131
  %73 = load i32, ptr %8, align 4, !dbg !131
  %74 = call i32 @parcoach_rma_MPI_Win_flush(i32 1, i32 %73, i32 45, ptr @19), !dbg !132
  br label %75, !dbg !133

75:                                               ; preds = %58
  %76 = load i32, ptr %13, align 4, !dbg !134
  %77 = add nsw i32 %76, 1, !dbg !134
  store i32 %77, ptr %13, align 4, !dbg !134
  br label %55, !dbg !135, !llvm.loop !136

78:                                               ; preds = %55
  call void @parcoach_rma_load(ptr %8, i64 32, i32 47, ptr @20), !dbg !138
  %79 = load i32, ptr %8, align 4, !dbg !138
  %80 = call i32 @parcoach_rma_MPI_Win_flush(i32 1, i32 %79, i32 47, ptr @21), !dbg !139
  call void @parcoach_rma_load(ptr %8, i64 32, i32 48, ptr @22), !dbg !140
  %81 = load i32, ptr %8, align 4, !dbg !140
  %82 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %81, i32 48, ptr @23), !dbg !141
  br label %83, !dbg !142

83:                                               ; preds = %78, %48
  %84 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 51, ptr @4), !dbg !143
  call void @parcoach_rma_load(ptr %6, i64 32, i32 52, ptr @5), !dbg !144
  %85 = load i32, ptr %6, align 4, !dbg !144
  call void @parcoach_rma_load(ptr %10, i64 64, i32 52, ptr @6), !dbg !145
  %86 = load ptr, ptr %10, align 8, !dbg !145
  %87 = getelementptr inbounds i32, ptr %86, i64 0, !dbg !145
  call void @parcoach_rma_load(ptr %87, i64 32, i32 52, ptr @7), !dbg !145
  %88 = load i32, ptr %87, align 4, !dbg !145
  %89 = getelementptr inbounds [10 x i32], ptr %9, i64 0, i64 0, !dbg !146
  call void @parcoach_rma_load(ptr %89, i64 32, i32 52, ptr @8), !dbg !146
  %90 = load i32, ptr %89, align 16, !dbg !146
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %85, i32 noundef %88, i32 noundef %90), !dbg !147
  %92 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 54, ptr @9), !dbg !148
  %93 = call i32 @MPI_Finalize(), !dbg !149
  ret i32 0, !dbg !150
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_flush(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, i32, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_flush(i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, i32, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "837b73e342569ba92d2db38a3c6c800c")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 52, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 648, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 81)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/static/035-MPI-static-index-loop-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "837b73e342569ba92d2db38a3c6c800c")
!14 = !{!15, !18, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!20 = !{!0, !7}
!21 = !{i32 7, !"Dwarf Version", i32 5}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"openmp", i32 50}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Debian clang version 15.0.6"}
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !31, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 12, type: !17)
!37 = !DILocation(line: 12, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 12, type: !33)
!39 = !DILocation(line: 12, column: 27, scope: !30)
!40 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 14, type: !17)
!41 = !DILocation(line: 14, column: 9, scope: !30)
!42 = !DILocalVariable(name: "size", scope: !30, file: !2, line: 14, type: !17)
!43 = !DILocation(line: 14, column: 15, scope: !30)
!44 = !DILocalVariable(name: "win", scope: !30, file: !2, line: 15, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!46 = !DILocation(line: 15, column: 13, scope: !30)
!47 = !DILocalVariable(name: "localbuf", scope: !30, file: !2, line: 16, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 10)
!51 = !DILocation(line: 16, column: 9, scope: !30)
!52 = !DILocalVariable(name: "win_base", scope: !30, file: !2, line: 17, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!54 = !DILocation(line: 17, column: 10, scope: !30)
!55 = !DILocation(line: 19, column: 5, scope: !30)
!56 = !DILocation(line: 20, column: 5, scope: !30)
!57 = !DILocation(line: 21, column: 5, scope: !30)
!58 = !DILocalVariable(name: "i", scope: !59, file: !2, line: 23, type: !17)
!59 = distinct !DILexicalBlock(scope: !30, file: !2, line: 23, column: 5)
!60 = !DILocation(line: 23, column: 14, scope: !59)
!61 = !DILocation(line: 23, column: 10, scope: !59)
!62 = !DILocation(line: 23, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !2, line: 23, column: 5)
!64 = !DILocation(line: 23, column: 23, scope: !63)
!65 = !DILocation(line: 23, column: 5, scope: !59)
!66 = !DILocation(line: 24, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !2, line: 23, column: 40)
!68 = !DILocation(line: 24, column: 18, scope: !67)
!69 = !DILocation(line: 24, column: 9, scope: !67)
!70 = !DILocation(line: 24, column: 21, scope: !67)
!71 = !DILocation(line: 25, column: 5, scope: !67)
!72 = !DILocation(line: 23, column: 36, scope: !63)
!73 = !DILocation(line: 23, column: 5, scope: !63)
!74 = distinct !{!74, !65, !75, !76}
!75 = !DILocation(line: 25, column: 5, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 28, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !30, file: !2, line: 28, column: 9)
!79 = !DILocation(line: 28, column: 14, scope: !78)
!80 = !DILocation(line: 28, column: 9, scope: !30)
!81 = !DILocation(line: 29, column: 69, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 28, column: 27)
!83 = !DILocation(line: 29, column: 9, scope: !82)
!84 = !DILocation(line: 30, column: 9, scope: !82)
!85 = !DILocation(line: 31, column: 5, scope: !82)
!86 = !DILocation(line: 33, column: 5, scope: !30)
!87 = !DILocalVariable(name: "i", scope: !88, file: !2, line: 34, type: !17)
!88 = distinct !DILexicalBlock(scope: !30, file: !2, line: 34, column: 5)
!89 = !DILocation(line: 34, column: 14, scope: !88)
!90 = !DILocation(line: 34, column: 10, scope: !88)
!91 = !DILocation(line: 34, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 34, column: 5)
!93 = !DILocation(line: 34, column: 23, scope: !92)
!94 = !DILocation(line: 34, column: 5, scope: !88)
!95 = !DILocation(line: 35, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 34, column: 40)
!97 = !DILocation(line: 35, column: 18, scope: !96)
!98 = !DILocation(line: 35, column: 21, scope: !96)
!99 = !DILocation(line: 36, column: 5, scope: !96)
!100 = !DILocation(line: 34, column: 36, scope: !92)
!101 = !DILocation(line: 34, column: 5, scope: !92)
!102 = distinct !{!102, !94, !103, !76}
!103 = !DILocation(line: 36, column: 5, scope: !88)
!104 = !DILocation(line: 38, column: 5, scope: !30)
!105 = !DILocation(line: 40, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !30, file: !2, line: 40, column: 9)
!107 = !DILocation(line: 40, column: 14, scope: !106)
!108 = !DILocation(line: 40, column: 9, scope: !30)
!109 = !DILocation(line: 41, column: 48, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !2, line: 40, column: 20)
!111 = !DILocation(line: 41, column: 9, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !113, file: !2, line: 42, type: !17)
!113 = distinct !DILexicalBlock(scope: !110, file: !2, line: 42, column: 9)
!114 = !DILocation(line: 42, column: 18, scope: !113)
!115 = !DILocation(line: 42, column: 14, scope: !113)
!116 = !DILocation(line: 42, column: 25, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !2, line: 42, column: 9)
!118 = !DILocation(line: 42, column: 27, scope: !117)
!119 = !DILocation(line: 42, column: 9, scope: !113)
!120 = !DILocation(line: 43, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !2, line: 42, column: 44)
!122 = !DILocation(line: 43, column: 32, scope: !121)
!123 = !DILocation(line: 43, column: 30, scope: !121)
!124 = !DILocation(line: 43, column: 50, scope: !121)
!125 = !DILocation(line: 43, column: 65, scope: !121)
!126 = !DILocation(line: 43, column: 13, scope: !121)
!127 = !DILocation(line: 44, column: 22, scope: !121)
!128 = !DILocation(line: 44, column: 23, scope: !121)
!129 = !DILocation(line: 44, column: 13, scope: !121)
!130 = !DILocation(line: 44, column: 26, scope: !121)
!131 = !DILocation(line: 45, column: 30, scope: !121)
!132 = !DILocation(line: 45, column: 13, scope: !121)
!133 = !DILocation(line: 46, column: 9, scope: !121)
!134 = !DILocation(line: 42, column: 40, scope: !117)
!135 = !DILocation(line: 42, column: 9, scope: !117)
!136 = distinct !{!136, !119, !137, !76}
!137 = !DILocation(line: 46, column: 9, scope: !113)
!138 = !DILocation(line: 47, column: 26, scope: !110)
!139 = !DILocation(line: 47, column: 9, scope: !110)
!140 = !DILocation(line: 48, column: 27, scope: !110)
!141 = !DILocation(line: 48, column: 9, scope: !110)
!142 = !DILocation(line: 49, column: 5, scope: !110)
!143 = !DILocation(line: 51, column: 5, scope: !30)
!144 = !DILocation(line: 52, column: 97, scope: !30)
!145 = !DILocation(line: 52, column: 103, scope: !30)
!146 = !DILocation(line: 52, column: 116, scope: !30)
!147 = !DILocation(line: 52, column: 5, scope: !30)
!148 = !DILocation(line: 54, column: 5, scope: !30)
!149 = !DILocation(line: 55, column: 5, scope: !30)
!150 = !DILocation(line: 57, column: 5, scope: !30)
