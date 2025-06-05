; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"I have %d ranks. You should rerun with %d.\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [39 x i8] c"Process %d finished. Array element %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@1 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@2 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@3 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@4 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@5 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@6 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@7 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@8 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@9 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@10 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@11 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@12 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@13 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@14 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@15 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@16 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@17 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@18 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@19 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1
@20 = private unnamed_addr constant [106 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @inefficient_get(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !30 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 %2, ptr %6, align 4
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  %7 = load ptr, ptr %5, align 8, !dbg !42
  %8 = load i32, ptr %4, align 4, !dbg !43
  %9 = sext i32 %8 to i64, !dbg !43
  %10 = load i32, ptr %6, align 4, !dbg !44
  %11 = call i32 @parcoach_rma_MPI_Get(ptr %7, i32 1, i32 1275069445, i32 1, i64 %9, i32 1, i32 1275069445, i32 %10, i32 14, ptr @0), !dbg !45
  %12 = load i32, ptr %4, align 4, !dbg !46
  %13 = icmp slt i32 %12, 10, !dbg !48
  br i1 %13, label %14, label %19, !dbg !49

14:                                               ; preds = %3
  %15 = load i32, ptr %4, align 4, !dbg !50
  %16 = add nsw i32 %15, 1, !dbg !52
  %17 = load ptr, ptr %5, align 8, !dbg !53
  %18 = load i32, ptr %6, align 4, !dbg !54
  call void @inefficient_get(i32 noundef %16, ptr noundef %17, i32 noundef %18), !dbg !55
  br label %19, !dbg !56

19:                                               ; preds = %14, %3
  ret void, !dbg !57
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !58 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !63, metadata !DIExpression()), !dbg !64
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %6, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata ptr %7, metadata !69, metadata !DIExpression()), !dbg !70
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !71
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !72
  %15 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !73
  %16 = load i32, ptr %7, align 4, !dbg !74
  %17 = icmp ne i32 %16, 2, !dbg !76
  br i1 %17, label %18, label %22, !dbg !77

18:                                               ; preds = %2
  %19 = load i32, ptr %7, align 4, !dbg !78
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %19, i32 noundef 2), !dbg !80
  %21 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !81
  br label %22, !dbg !82

22:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata ptr %9, metadata !85, metadata !DIExpression()), !dbg !86
  %23 = call i32 @parcoach_rma_MPI_Win_allocate(i64 400, i32 4, i32 469762048, i32 1140850688, ptr %9, ptr %8, i32 35, ptr @1), !dbg !87
  call void @llvm.dbg.declare(metadata ptr %10, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 50, ptr %10, align 4, !dbg !89
  %24 = load i32, ptr %6, align 4, !dbg !90
  %25 = icmp eq i32 %24, 0, !dbg !92
  br i1 %25, label %26, label %39, !dbg !93

26:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata ptr %11, metadata !94, metadata !DIExpression()), !dbg !97
  store i32 0, ptr %11, align 4, !dbg !97
  br label %27, !dbg !98

27:                                               ; preds = %35, %26
  call void @parcoach_rma_load(ptr %11, i64 32, i32 40, ptr @15), !dbg !99
  %28 = load i32, ptr %11, align 4, !dbg !99
  %29 = icmp slt i32 %28, 100, !dbg !101
  br i1 %29, label %30, label %38, !dbg !102

30:                                               ; preds = %27
  call void @parcoach_rma_load(ptr %9, i64 64, i32 41, ptr @16), !dbg !103
  %31 = load ptr, ptr %9, align 8, !dbg !103
  call void @parcoach_rma_load(ptr %11, i64 32, i32 41, ptr @17), !dbg !105
  %32 = load i32, ptr %11, align 4, !dbg !105
  %33 = sext i32 %32 to i64, !dbg !103
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !103
  call void @parcoach_rma_store(ptr %34, i64 32, i32 41, ptr @18), !dbg !106
  store i32 0, ptr %34, align 4, !dbg !106
  br label %35, !dbg !107

35:                                               ; preds = %30
  call void @parcoach_rma_load(ptr %11, i64 32, i32 40, ptr @19), !dbg !108
  %36 = load i32, ptr %11, align 4, !dbg !108
  %37 = add nsw i32 %36, 1, !dbg !108
  call void @parcoach_rma_store(ptr %11, i64 32, i32 40, ptr @20), !dbg !108
  store i32 %37, ptr %11, align 4, !dbg !108
  br label %27, !dbg !109, !llvm.loop !110

38:                                               ; preds = %27
  br label %53, !dbg !113

39:                                               ; preds = %22
  call void @llvm.dbg.declare(metadata ptr %12, metadata !114, metadata !DIExpression()), !dbg !117
  store i32 0, ptr %12, align 4, !dbg !117
  br label %40, !dbg !118

40:                                               ; preds = %49, %39
  %41 = load i32, ptr %12, align 4, !dbg !119
  %42 = icmp slt i32 %41, 100, !dbg !121
  br i1 %42, label %43, label %52, !dbg !122

43:                                               ; preds = %40
  %44 = load i32, ptr %12, align 4, !dbg !123
  %45 = load ptr, ptr %9, align 8, !dbg !125
  %46 = load i32, ptr %12, align 4, !dbg !126
  %47 = sext i32 %46 to i64, !dbg !125
  %48 = getelementptr inbounds i32, ptr %45, i64 %47, !dbg !125
  store i32 %44, ptr %48, align 4, !dbg !127
  br label %49, !dbg !128

49:                                               ; preds = %43
  call void @parcoach_rma_load(ptr %12, i64 32, i32 44, ptr @13), !dbg !129
  %50 = load i32, ptr %12, align 4, !dbg !129
  %51 = add nsw i32 %50, 1, !dbg !129
  call void @parcoach_rma_store(ptr %12, i64 32, i32 44, ptr @14), !dbg !129
  store i32 %51, ptr %12, align 4, !dbg !129
  br label %40, !dbg !130, !llvm.loop !131

52:                                               ; preds = %40
  br label %53

53:                                               ; preds = %52, %38
  %54 = load i32, ptr %8, align 4, !dbg !133
  %55 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %54, i32 49, ptr @2), !dbg !134
  call void @parcoach_rma_load(ptr %6, i64 32, i32 51, ptr @3), !dbg !135
  %56 = load i32, ptr %6, align 4, !dbg !135
  %57 = icmp eq i32 %56, 0, !dbg !137
  br i1 %57, label %58, label %61, !dbg !138

58:                                               ; preds = %53
  call void @parcoach_rma_load(ptr %9, i64 64, i32 52, ptr @4), !dbg !139
  %59 = load ptr, ptr %9, align 8, !dbg !139
  call void @parcoach_rma_load(ptr %8, i64 32, i32 52, ptr @5), !dbg !141
  %60 = load i32, ptr %8, align 4, !dbg !141
  call void @inefficient_get(i32 noundef 0, ptr noundef %59, i32 noundef %60), !dbg !142
  br label %61, !dbg !143

61:                                               ; preds = %58, %53
  call void @parcoach_rma_load(ptr %8, i64 32, i32 55, ptr @6), !dbg !144
  %62 = load i32, ptr %8, align 4, !dbg !144
  %63 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %62, i32 55, ptr @7), !dbg !145
  %64 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 57, ptr @8), !dbg !146
  call void @parcoach_rma_load(ptr %6, i64 32, i32 58, ptr @9), !dbg !147
  %65 = load i32, ptr %6, align 4, !dbg !147
  call void @parcoach_rma_load(ptr %9, i64 64, i32 58, ptr @10), !dbg !148
  %66 = load ptr, ptr %9, align 8, !dbg !148
  %67 = getelementptr inbounds i32, ptr %66, i64 1, !dbg !148
  call void @parcoach_rma_load(ptr %67, i64 32, i32 58, ptr @11), !dbg !148
  %68 = load i32, ptr %67, align 4, !dbg !148
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %65, i32 noundef %68), !dbg !149
  %70 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 60, ptr @12), !dbg !150
  %71 = call i32 @MPI_Finalize(), !dbg !151
  ret i32 0, !dbg !152
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Get(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7b3ef8e587935e790c0031b6fc5599dc")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 44)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 39)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/019-MPI-static-get-get-recursive-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7b3ef8e587935e790c0031b6fc5599dc")
!14 = !{!15, !18, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
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
!30 = distinct !DISubprogram(name: "inefficient_get", scope: !2, file: !2, line: 12, type: !31, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{null, !17, !33, !34}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!35 = !{}
!36 = !DILocalVariable(name: "iteration", arg: 1, scope: !30, file: !2, line: 12, type: !17)
!37 = !DILocation(line: 12, column: 26, scope: !30)
!38 = !DILocalVariable(name: "arr_base", arg: 2, scope: !30, file: !2, line: 12, type: !33)
!39 = !DILocation(line: 12, column: 42, scope: !30)
!40 = !DILocalVariable(name: "win", arg: 3, scope: !30, file: !2, line: 12, type: !34)
!41 = !DILocation(line: 12, column: 60, scope: !30)
!42 = !DILocation(line: 14, column: 13, scope: !30)
!43 = !DILocation(line: 14, column: 38, scope: !30)
!44 = !DILocation(line: 14, column: 61, scope: !30)
!45 = !DILocation(line: 14, column: 5, scope: !30)
!46 = !DILocation(line: 15, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !30, file: !2, line: 15, column: 9)
!48 = !DILocation(line: 15, column: 19, scope: !47)
!49 = !DILocation(line: 15, column: 9, scope: !30)
!50 = !DILocation(line: 16, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !2, line: 15, column: 25)
!52 = !DILocation(line: 16, column: 35, scope: !51)
!53 = !DILocation(line: 16, column: 40, scope: !51)
!54 = !DILocation(line: 16, column: 50, scope: !51)
!55 = !DILocation(line: 16, column: 9, scope: !51)
!56 = !DILocation(line: 17, column: 5, scope: !51)
!57 = !DILocation(line: 18, column: 1, scope: !30)
!58 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 20, type: !59, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!59 = !DISubroutineType(types: !60)
!60 = !{!17, !17, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !2, line: 20, type: !17)
!64 = !DILocation(line: 20, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !2, line: 20, type: !61)
!66 = !DILocation(line: 20, column: 27, scope: !58)
!67 = !DILocalVariable(name: "rank", scope: !58, file: !2, line: 21, type: !17)
!68 = !DILocation(line: 21, column: 9, scope: !58)
!69 = !DILocalVariable(name: "size", scope: !58, file: !2, line: 22, type: !17)
!70 = !DILocation(line: 22, column: 9, scope: !58)
!71 = !DILocation(line: 24, column: 5, scope: !58)
!72 = !DILocation(line: 25, column: 5, scope: !58)
!73 = !DILocation(line: 26, column: 5, scope: !58)
!74 = !DILocation(line: 28, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !58, file: !2, line: 28, column: 9)
!76 = !DILocation(line: 28, column: 14, scope: !75)
!77 = !DILocation(line: 28, column: 9, scope: !58)
!78 = !DILocation(line: 29, column: 64, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 28, column: 27)
!80 = !DILocation(line: 29, column: 9, scope: !79)
!81 = !DILocation(line: 30, column: 9, scope: !79)
!82 = !DILocation(line: 31, column: 5, scope: !79)
!83 = !DILocalVariable(name: "win", scope: !58, file: !2, line: 33, type: !34)
!84 = !DILocation(line: 33, column: 13, scope: !58)
!85 = !DILocalVariable(name: "arr_base", scope: !58, file: !2, line: 34, type: !33)
!86 = !DILocation(line: 34, column: 10, scope: !58)
!87 = !DILocation(line: 35, column: 5, scope: !58)
!88 = !DILocalVariable(name: "packet_size", scope: !58, file: !2, line: 37, type: !17)
!89 = !DILocation(line: 37, column: 9, scope: !58)
!90 = !DILocation(line: 39, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !58, file: !2, line: 39, column: 9)
!92 = !DILocation(line: 39, column: 14, scope: !91)
!93 = !DILocation(line: 39, column: 9, scope: !58)
!94 = !DILocalVariable(name: "i", scope: !95, file: !2, line: 40, type: !17)
!95 = distinct !DILexicalBlock(scope: !96, file: !2, line: 40, column: 9)
!96 = distinct !DILexicalBlock(scope: !91, file: !2, line: 39, column: 20)
!97 = !DILocation(line: 40, column: 18, scope: !95)
!98 = !DILocation(line: 40, column: 14, scope: !95)
!99 = !DILocation(line: 40, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !2, line: 40, column: 9)
!101 = !DILocation(line: 40, column: 27, scope: !100)
!102 = !DILocation(line: 40, column: 9, scope: !95)
!103 = !DILocation(line: 41, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !2, line: 40, column: 44)
!105 = !DILocation(line: 41, column: 22, scope: !104)
!106 = !DILocation(line: 41, column: 25, scope: !104)
!107 = !DILocation(line: 42, column: 9, scope: !104)
!108 = !DILocation(line: 40, column: 40, scope: !100)
!109 = !DILocation(line: 40, column: 9, scope: !100)
!110 = distinct !{!110, !102, !111, !112}
!111 = !DILocation(line: 42, column: 9, scope: !95)
!112 = !{!"llvm.loop.mustprogress"}
!113 = !DILocation(line: 43, column: 5, scope: !96)
!114 = !DILocalVariable(name: "i", scope: !115, file: !2, line: 44, type: !17)
!115 = distinct !DILexicalBlock(scope: !116, file: !2, line: 44, column: 9)
!116 = distinct !DILexicalBlock(scope: !91, file: !2, line: 43, column: 12)
!117 = !DILocation(line: 44, column: 18, scope: !115)
!118 = !DILocation(line: 44, column: 14, scope: !115)
!119 = !DILocation(line: 44, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !115, file: !2, line: 44, column: 9)
!121 = !DILocation(line: 44, column: 27, scope: !120)
!122 = !DILocation(line: 44, column: 9, scope: !115)
!123 = !DILocation(line: 45, column: 27, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 44, column: 44)
!125 = !DILocation(line: 45, column: 13, scope: !124)
!126 = !DILocation(line: 45, column: 22, scope: !124)
!127 = !DILocation(line: 45, column: 25, scope: !124)
!128 = !DILocation(line: 46, column: 9, scope: !124)
!129 = !DILocation(line: 44, column: 40, scope: !120)
!130 = !DILocation(line: 44, column: 9, scope: !120)
!131 = distinct !{!131, !122, !132, !112}
!132 = !DILocation(line: 46, column: 9, scope: !115)
!133 = !DILocation(line: 49, column: 22, scope: !58)
!134 = !DILocation(line: 49, column: 5, scope: !58)
!135 = !DILocation(line: 51, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !58, file: !2, line: 51, column: 9)
!137 = !DILocation(line: 51, column: 14, scope: !136)
!138 = !DILocation(line: 51, column: 9, scope: !58)
!139 = !DILocation(line: 52, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !2, line: 51, column: 20)
!141 = !DILocation(line: 52, column: 38, scope: !140)
!142 = !DILocation(line: 52, column: 9, scope: !140)
!143 = !DILocation(line: 53, column: 5, scope: !140)
!144 = !DILocation(line: 55, column: 22, scope: !58)
!145 = !DILocation(line: 55, column: 5, scope: !58)
!146 = !DILocation(line: 57, column: 5, scope: !58)
!147 = !DILocation(line: 58, column: 55, scope: !58)
!148 = !DILocation(line: 58, column: 61, scope: !58)
!149 = !DILocation(line: 58, column: 5, scope: !58)
!150 = !DILocation(line: 60, column: 5, scope: !58)
!151 = !DILocation(line: 61, column: 5, scope: !58)
!152 = !DILocation(line: 63, column: 5, scope: !58)
