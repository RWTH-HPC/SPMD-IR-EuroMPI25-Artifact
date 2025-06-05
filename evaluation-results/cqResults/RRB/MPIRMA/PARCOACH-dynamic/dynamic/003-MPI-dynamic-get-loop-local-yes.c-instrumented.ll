; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@1 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@2 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@3 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@4 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@5 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@6 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@7 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@8 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@9 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@10 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@11 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@12 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@13 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@14 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@15 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@16 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@17 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@18 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@19 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@20 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1
@21 = private unnamed_addr constant [100 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata ptr %8, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %9, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata ptr %10, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 1, ptr %10, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %11, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 2, ptr %11, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %12, metadata !54, metadata !DIExpression()), !dbg !55
  store ptr %10, ptr %12, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %13, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %14, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 42, ptr %14, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %15, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 10, ptr %15, align 4, !dbg !61
  %18 = load i32, ptr %4, align 4, !dbg !62
  %19 = icmp sgt i32 %18, 1, !dbg !64
  br i1 %19, label %20, label %25, !dbg !65

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8, !dbg !66
  %22 = getelementptr inbounds ptr, ptr %21, i64 1, !dbg !66
  %23 = load ptr, ptr %22, align 8, !dbg !66
  %24 = call i32 @atoi(ptr noundef %23) #4, !dbg !68
  store i32 %24, ptr %15, align 4, !dbg !69
  br label %25, !dbg !70

25:                                               ; preds = %20, %2
  %26 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !71
  %27 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !72
  %28 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !73
  %29 = load i32, ptr %7, align 4, !dbg !74
  %30 = icmp ne i32 %29, 2, !dbg !76
  br i1 %30, label %31, label %35, !dbg !77

31:                                               ; preds = %25
  %32 = load i32, ptr %7, align 4, !dbg !78
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %32, i32 noundef 2), !dbg !80
  %34 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !81
  br label %35, !dbg !82

35:                                               ; preds = %31, %25
  %36 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, i32 469762048, i32 1140850688, ptr %9, ptr %8, i32 37, ptr @0), !dbg !83
  call void @llvm.dbg.declare(metadata ptr %16, metadata !84, metadata !DIExpression()), !dbg !86
  store i32 0, ptr %16, align 4, !dbg !86
  br label %37, !dbg !87

37:                                               ; preds = %45, %35
  %38 = load i32, ptr %16, align 4, !dbg !88
  %39 = icmp slt i32 %38, 10, !dbg !90
  br i1 %39, label %40, label %48, !dbg !91

40:                                               ; preds = %37
  %41 = load ptr, ptr %9, align 8, !dbg !92
  %42 = load i32, ptr %16, align 4, !dbg !94
  %43 = sext i32 %42 to i64, !dbg !92
  %44 = getelementptr inbounds i32, ptr %41, i64 %43, !dbg !92
  store i32 0, ptr %44, align 4, !dbg !95
  br label %45, !dbg !96

45:                                               ; preds = %40
  call void @parcoach_rma_load(ptr %16, i64 32, i32 38, ptr @20), !dbg !97
  %46 = load i32, ptr %16, align 4, !dbg !97
  %47 = add nsw i32 %46, 1, !dbg !97
  call void @parcoach_rma_store(ptr %16, i64 32, i32 38, ptr @21), !dbg !97
  store i32 %47, ptr %16, align 4, !dbg !97
  br label %37, !dbg !98, !llvm.loop !99

48:                                               ; preds = %37
  %49 = load i32, ptr %8, align 4, !dbg !102
  %50 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %49, i32 42, ptr @1), !dbg !103
  call void @parcoach_rma_load(ptr %6, i64 32, i32 43, ptr @2), !dbg !104
  %51 = load i32, ptr %6, align 4, !dbg !104
  %52 = icmp eq i32 %51, 0, !dbg !106
  br i1 %52, label %53, label %65, !dbg !107

53:                                               ; preds = %48
  call void @llvm.dbg.declare(metadata ptr %17, metadata !108, metadata !DIExpression()), !dbg !111
  call void @parcoach_rma_store(ptr %17, i64 32, i32 44, ptr @3), !dbg !111
  store i32 0, ptr %17, align 4, !dbg !111
  br label %54, !dbg !112

54:                                               ; preds = %61, %53
  call void @parcoach_rma_load(ptr %17, i64 32, i32 44, ptr @14), !dbg !113
  %55 = load i32, ptr %17, align 4, !dbg !113
  call void @parcoach_rma_load(ptr %15, i64 32, i32 44, ptr @15), !dbg !115
  %56 = load i32, ptr %15, align 4, !dbg !115
  %57 = icmp slt i32 %55, %56, !dbg !116
  br i1 %57, label %58, label %64, !dbg !117

58:                                               ; preds = %54
  call void @parcoach_rma_load(ptr %8, i64 32, i32 46, ptr @16), !dbg !118
  %59 = load i32, ptr %8, align 4, !dbg !118
  %60 = call i32 @parcoach_rma_MPI_Get(ptr %10, i32 1, i32 1275069445, i32 1, i64 0, i32 1, i32 1275069445, i32 %59, i32 46, ptr @17), !dbg !120
  br label %61, !dbg !121

61:                                               ; preds = %58
  call void @parcoach_rma_load(ptr %17, i64 32, i32 44, ptr @18), !dbg !122
  %62 = load i32, ptr %17, align 4, !dbg !122
  %63 = add nsw i32 %62, 1, !dbg !122
  call void @parcoach_rma_store(ptr %17, i64 32, i32 44, ptr @19), !dbg !122
  store i32 %63, ptr %17, align 4, !dbg !122
  br label %54, !dbg !123, !llvm.loop !124

64:                                               ; preds = %54
  br label %65, !dbg !126

65:                                               ; preds = %64, %48
  call void @parcoach_rma_load(ptr %8, i64 32, i32 49, ptr @4), !dbg !127
  %66 = load i32, ptr %8, align 4, !dbg !127
  %67 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %66, i32 49, ptr @5), !dbg !128
  %68 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 51, ptr @6), !dbg !129
  call void @parcoach_rma_load(ptr %6, i64 32, i32 54, ptr @7), !dbg !130
  %69 = load i32, ptr %6, align 4, !dbg !130
  call void @parcoach_rma_load(ptr %12, i64 64, i32 55, ptr @8), !dbg !131
  %70 = load ptr, ptr %12, align 8, !dbg !131
  call void @parcoach_rma_load(ptr %70, i64 32, i32 55, ptr @9), !dbg !132
  %71 = load i32, ptr %70, align 4, !dbg !132
  call void @parcoach_rma_load(ptr %11, i64 32, i32 56, ptr @10), !dbg !133
  %72 = load i32, ptr %11, align 4, !dbg !133
  call void @parcoach_rma_load(ptr %9, i64 64, i32 57, ptr @11), !dbg !134
  %73 = load ptr, ptr %9, align 8, !dbg !134
  %74 = getelementptr inbounds i32, ptr %73, i64 0, !dbg !134
  call void @parcoach_rma_load(ptr %74, i64 32, i32 57, ptr @12), !dbg !134
  %75 = load i32, ptr %74, align 4, !dbg !134
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %69, i32 noundef %71, i32 noundef %72, i32 noundef %75), !dbg !135
  %77 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 59, ptr @13), !dbg !136
  %78 = call i32 @MPI_Finalize(), !dbg !137
  ret i32 0, !dbg !138
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #2

declare i32 @MPI_Init(ptr noundef, ptr noundef) #3

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #3

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #3

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @MPI_Barrier(i32 noundef) #3

declare i32 @MPI_Win_free(ptr noundef) #3

declare i32 @MPI_Finalize() #3

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Get(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f640b9f1b15ae9c65a8ab4f4319b8de5")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-dynamic/dynamic/003-MPI-dynamic-get-loop-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "f640b9f1b15ae9c65a8ab4f4319b8de5")
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
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !31, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 13, type: !17)
!37 = !DILocation(line: 13, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 13, type: !33)
!39 = !DILocation(line: 13, column: 27, scope: !30)
!40 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 15, type: !17)
!41 = !DILocation(line: 15, column: 9, scope: !30)
!42 = !DILocalVariable(name: "size", scope: !30, file: !2, line: 15, type: !17)
!43 = !DILocation(line: 15, column: 15, scope: !30)
!44 = !DILocalVariable(name: "win", scope: !30, file: !2, line: 16, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!46 = !DILocation(line: 16, column: 13, scope: !30)
!47 = !DILocalVariable(name: "win_base", scope: !30, file: !2, line: 17, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!49 = !DILocation(line: 17, column: 10, scope: !30)
!50 = !DILocalVariable(name: "value", scope: !30, file: !2, line: 18, type: !17)
!51 = !DILocation(line: 18, column: 9, scope: !30)
!52 = !DILocalVariable(name: "value2", scope: !30, file: !2, line: 18, type: !17)
!53 = !DILocation(line: 18, column: 20, scope: !30)
!54 = !DILocalVariable(name: "buf", scope: !30, file: !2, line: 19, type: !48)
!55 = !DILocation(line: 19, column: 10, scope: !30)
!56 = !DILocalVariable(name: "result", scope: !30, file: !2, line: 20, type: !17)
!57 = !DILocation(line: 20, column: 9, scope: !30)
!58 = !DILocalVariable(name: "token", scope: !30, file: !2, line: 21, type: !17)
!59 = !DILocation(line: 21, column: 9, scope: !30)
!60 = !DILocalVariable(name: "ctrl", scope: !30, file: !2, line: 23, type: !17)
!61 = !DILocation(line: 23, column: 9, scope: !30)
!62 = !DILocation(line: 24, column: 9, scope: !63)
!63 = distinct !DILexicalBlock(scope: !30, file: !2, line: 24, column: 9)
!64 = !DILocation(line: 24, column: 14, scope: !63)
!65 = !DILocation(line: 24, column: 9, scope: !30)
!66 = !DILocation(line: 25, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !2, line: 24, column: 19)
!68 = !DILocation(line: 25, column: 16, scope: !67)
!69 = !DILocation(line: 25, column: 14, scope: !67)
!70 = !DILocation(line: 26, column: 5, scope: !67)
!71 = !DILocation(line: 28, column: 5, scope: !30)
!72 = !DILocation(line: 29, column: 5, scope: !30)
!73 = !DILocation(line: 30, column: 5, scope: !30)
!74 = !DILocation(line: 32, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !30, file: !2, line: 32, column: 9)
!76 = !DILocation(line: 32, column: 14, scope: !75)
!77 = !DILocation(line: 32, column: 9, scope: !30)
!78 = !DILocation(line: 33, column: 69, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 32, column: 27)
!80 = !DILocation(line: 33, column: 9, scope: !79)
!81 = !DILocation(line: 34, column: 9, scope: !79)
!82 = !DILocation(line: 35, column: 5, scope: !79)
!83 = !DILocation(line: 37, column: 5, scope: !30)
!84 = !DILocalVariable(name: "i", scope: !85, file: !2, line: 38, type: !17)
!85 = distinct !DILexicalBlock(scope: !30, file: !2, line: 38, column: 5)
!86 = !DILocation(line: 38, column: 14, scope: !85)
!87 = !DILocation(line: 38, column: 10, scope: !85)
!88 = !DILocation(line: 38, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !2, line: 38, column: 5)
!90 = !DILocation(line: 38, column: 23, scope: !89)
!91 = !DILocation(line: 38, column: 5, scope: !85)
!92 = !DILocation(line: 39, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !2, line: 38, column: 40)
!94 = !DILocation(line: 39, column: 18, scope: !93)
!95 = !DILocation(line: 39, column: 21, scope: !93)
!96 = !DILocation(line: 40, column: 5, scope: !93)
!97 = !DILocation(line: 38, column: 36, scope: !89)
!98 = !DILocation(line: 38, column: 5, scope: !89)
!99 = distinct !{!99, !91, !100, !101}
!100 = !DILocation(line: 40, column: 5, scope: !85)
!101 = !{!"llvm.loop.mustprogress"}
!102 = !DILocation(line: 42, column: 22, scope: !30)
!103 = !DILocation(line: 42, column: 5, scope: !30)
!104 = !DILocation(line: 43, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !30, file: !2, line: 43, column: 9)
!106 = !DILocation(line: 43, column: 14, scope: !105)
!107 = !DILocation(line: 43, column: 9, scope: !30)
!108 = !DILocalVariable(name: "i", scope: !109, file: !2, line: 44, type: !17)
!109 = distinct !DILexicalBlock(scope: !110, file: !2, line: 44, column: 9)
!110 = distinct !DILexicalBlock(scope: !105, file: !2, line: 43, column: 20)
!111 = !DILocation(line: 44, column: 18, scope: !109)
!112 = !DILocation(line: 44, column: 14, scope: !109)
!113 = !DILocation(line: 44, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !2, line: 44, column: 9)
!115 = !DILocation(line: 44, column: 29, scope: !114)
!116 = !DILocation(line: 44, column: 27, scope: !114)
!117 = !DILocation(line: 44, column: 9, scope: !109)
!118 = !DILocation(line: 46, column: 59, scope: !119)
!119 = distinct !DILexicalBlock(scope: !114, file: !2, line: 44, column: 40)
!120 = !DILocation(line: 46, column: 13, scope: !119)
!121 = !DILocation(line: 47, column: 9, scope: !119)
!122 = !DILocation(line: 44, column: 36, scope: !114)
!123 = !DILocation(line: 44, column: 9, scope: !114)
!124 = distinct !{!124, !117, !125, !101}
!125 = !DILocation(line: 47, column: 9, scope: !109)
!126 = !DILocation(line: 48, column: 5, scope: !110)
!127 = !DILocation(line: 49, column: 22, scope: !30)
!128 = !DILocation(line: 49, column: 5, scope: !30)
!129 = !DILocation(line: 51, column: 5, scope: !30)
!130 = !DILocation(line: 54, column: 9, scope: !30)
!131 = !DILocation(line: 55, column: 10, scope: !30)
!132 = !DILocation(line: 55, column: 9, scope: !30)
!133 = !DILocation(line: 56, column: 9, scope: !30)
!134 = !DILocation(line: 57, column: 9, scope: !30)
!135 = !DILocation(line: 52, column: 5, scope: !30)
!136 = !DILocation(line: 59, column: 5, scope: !30)
!137 = !DILocation(line: 60, column: 5, scope: !30)
!138 = !DILocation(line: 62, column: 5, scope: !30)
