; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"*buf_alias is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@1 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@2 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@3 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@4 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@5 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@6 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@7 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@8 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@9 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@10 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@11 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@12 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@13 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@14 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@15 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@16 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@17 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@18 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@19 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@20 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1
@21 = private unnamed_addr constant [103 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @aliasgenerator(ptr noundef %0) #0 !dbg !35 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !41, metadata !DIExpression()), !dbg !42
  %3 = load ptr, ptr %2, align 8, !dbg !43
  %4 = load ptr, ptr %3, align 8, !dbg !44
  ret ptr %4, !dbg !45
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !46 {
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
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !51, metadata !DIExpression()), !dbg !52
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata ptr %6, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %7, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %8, metadata !59, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata ptr %9, metadata !62, metadata !DIExpression()), !dbg !63
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
  %19 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !75
  %20 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !76
  %21 = load i32, ptr %7, align 4, !dbg !77
  %22 = icmp ne i32 %21, 2, !dbg !79
  br i1 %22, label %23, label %27, !dbg !80

23:                                               ; preds = %2
  %24 = load i32, ptr %7, align 4, !dbg !81
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24, i32 noundef 2), !dbg !83
  %26 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !84
  br label %27, !dbg !85

27:                                               ; preds = %23, %2
  %28 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, i32 469762048, i32 1140850688, ptr %9, ptr %8, i32 33, ptr @0), !dbg !86
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
  call void @parcoach_rma_load(ptr %15, i64 32, i32 34, ptr @20), !dbg !100
  %38 = load i32, ptr %15, align 4, !dbg !100
  %39 = add nsw i32 %38, 1, !dbg !100
  call void @parcoach_rma_store(ptr %15, i64 32, i32 34, ptr @21), !dbg !100
  store i32 %39, ptr %15, align 4, !dbg !100
  br label %29, !dbg !101, !llvm.loop !102

40:                                               ; preds = %29
  %41 = load i32, ptr %8, align 4, !dbg !105
  %42 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %41, i32 38, ptr @1), !dbg !106
  call void @llvm.dbg.declare(metadata ptr %16, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata ptr %17, metadata !109, metadata !DIExpression()), !dbg !110
  %43 = call ptr @aliasgenerator(ptr noundef %12), !dbg !111
  call void @parcoach_rma_store(ptr %16, i64 64, i32 43, ptr @2), !dbg !112
  store ptr %43, ptr %16, align 8, !dbg !112
  %44 = call ptr @aliasgenerator(ptr noundef %9), !dbg !113
  call void @parcoach_rma_store(ptr %17, i64 64, i32 44, ptr @3), !dbg !114
  store ptr %44, ptr %17, align 8, !dbg !114
  call void @parcoach_rma_load(ptr %6, i64 32, i32 46, ptr @4), !dbg !115
  %45 = load i32, ptr %6, align 4, !dbg !115
  %46 = icmp eq i32 %45, 0, !dbg !117
  br i1 %46, label %47, label %54, !dbg !118

47:                                               ; preds = %40
  call void @parcoach_rma_load(ptr %12, i64 64, i32 47, ptr @5), !dbg !119
  %48 = load ptr, ptr %12, align 8, !dbg !119
  call void @parcoach_rma_load(ptr %8, i64 32, i32 47, ptr @6), !dbg !121
  %49 = load i32, ptr %8, align 4, !dbg !121
  %50 = call i32 @parcoach_rma_MPI_Put(ptr %48, i32 1, i32 1275069445, i32 1, i64 0, i32 1, i32 1275069445, i32 %49, i32 47, ptr @7), !dbg !122
  call void @parcoach_rma_load(ptr %16, i64 64, i32 48, ptr @8), !dbg !123
  %51 = load ptr, ptr %16, align 8, !dbg !123
  call void @parcoach_rma_load(ptr %51, i64 32, i32 48, ptr @9), !dbg !124
  %52 = load i32, ptr %51, align 4, !dbg !124
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %52), !dbg !125
  br label %54, !dbg !126

54:                                               ; preds = %47, %40
  call void @parcoach_rma_load(ptr %8, i64 32, i32 51, ptr @10), !dbg !127
  %55 = load i32, ptr %8, align 4, !dbg !127
  %56 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %55, i32 51, ptr @11), !dbg !128
  %57 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 53, ptr @12), !dbg !129
  call void @parcoach_rma_load(ptr %6, i64 32, i32 56, ptr @13), !dbg !130
  %58 = load i32, ptr %6, align 4, !dbg !130
  call void @parcoach_rma_load(ptr %12, i64 64, i32 57, ptr @14), !dbg !131
  %59 = load ptr, ptr %12, align 8, !dbg !131
  call void @parcoach_rma_load(ptr %59, i64 32, i32 57, ptr @15), !dbg !132
  %60 = load i32, ptr %59, align 4, !dbg !132
  call void @parcoach_rma_load(ptr %11, i64 32, i32 58, ptr @16), !dbg !133
  %61 = load i32, ptr %11, align 4, !dbg !133
  call void @parcoach_rma_load(ptr %9, i64 64, i32 59, ptr @17), !dbg !134
  %62 = load ptr, ptr %9, align 8, !dbg !134
  %63 = getelementptr inbounds i32, ptr %62, i64 0, !dbg !134
  call void @parcoach_rma_load(ptr %63, i64 32, i32 59, ptr @18), !dbg !134
  %64 = load i32, ptr %63, align 4, !dbg !134
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %58, i32 noundef %60, i32 noundef %61, i32 noundef %64), !dbg !135
  %66 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 61, ptr @19), !dbg !136
  %67 = call i32 @MPI_Finalize(), !dbg !137
  ret i32 0, !dbg !138
}

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, i32, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "827eb4124a634992edc92e5e75b61b05")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 18)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 94)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !25, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/005-MPI-static-put-load-retval-local-no.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "827eb4124a634992edc92e5e75b61b05")
!19 = !{!20, !23, !24}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!25 = !{!0, !7, !12}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"openmp", i32 50}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"PIE Level", i32 2}
!32 = !{i32 7, !"uwtable", i32 2}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = !{!"Debian clang version 15.0.6"}
!35 = distinct !DISubprogram(name: "aliasgenerator", scope: !2, file: !2, line: 9, type: !36, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !39}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!40 = !{}
!41 = !DILocalVariable(name: "x", arg: 1, scope: !35, file: !2, line: 9, type: !39)
!42 = !DILocation(line: 9, column: 53, scope: !35)
!43 = !DILocation(line: 9, column: 66, scope: !35)
!44 = !DILocation(line: 9, column: 65, scope: !35)
!45 = !DILocation(line: 9, column: 58, scope: !35)
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 14, type: !47, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !40)
!47 = !DISubroutineType(types: !48)
!48 = !{!22, !22, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 14, type: !22)
!52 = !DILocation(line: 14, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 14, type: !49)
!54 = !DILocation(line: 14, column: 27, scope: !46)
!55 = !DILocalVariable(name: "rank", scope: !46, file: !2, line: 16, type: !22)
!56 = !DILocation(line: 16, column: 9, scope: !46)
!57 = !DILocalVariable(name: "size", scope: !46, file: !2, line: 16, type: !22)
!58 = !DILocation(line: 16, column: 15, scope: !46)
!59 = !DILocalVariable(name: "win", scope: !46, file: !2, line: 17, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!61 = !DILocation(line: 17, column: 13, scope: !46)
!62 = !DILocalVariable(name: "win_base", scope: !46, file: !2, line: 18, type: !38)
!63 = !DILocation(line: 18, column: 10, scope: !46)
!64 = !DILocalVariable(name: "value", scope: !46, file: !2, line: 19, type: !22)
!65 = !DILocation(line: 19, column: 9, scope: !46)
!66 = !DILocalVariable(name: "value2", scope: !46, file: !2, line: 19, type: !22)
!67 = !DILocation(line: 19, column: 20, scope: !46)
!68 = !DILocalVariable(name: "buf", scope: !46, file: !2, line: 20, type: !38)
!69 = !DILocation(line: 20, column: 10, scope: !46)
!70 = !DILocalVariable(name: "result", scope: !46, file: !2, line: 21, type: !22)
!71 = !DILocation(line: 21, column: 9, scope: !46)
!72 = !DILocalVariable(name: "token", scope: !46, file: !2, line: 22, type: !22)
!73 = !DILocation(line: 22, column: 9, scope: !46)
!74 = !DILocation(line: 24, column: 5, scope: !46)
!75 = !DILocation(line: 25, column: 5, scope: !46)
!76 = !DILocation(line: 26, column: 5, scope: !46)
!77 = !DILocation(line: 28, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !46, file: !2, line: 28, column: 9)
!79 = !DILocation(line: 28, column: 14, scope: !78)
!80 = !DILocation(line: 28, column: 9, scope: !46)
!81 = !DILocation(line: 29, column: 69, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 28, column: 27)
!83 = !DILocation(line: 29, column: 9, scope: !82)
!84 = !DILocation(line: 30, column: 9, scope: !82)
!85 = !DILocation(line: 31, column: 5, scope: !82)
!86 = !DILocation(line: 33, column: 5, scope: !46)
!87 = !DILocalVariable(name: "i", scope: !88, file: !2, line: 34, type: !22)
!88 = distinct !DILexicalBlock(scope: !46, file: !2, line: 34, column: 5)
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
!102 = distinct !{!102, !94, !103, !104}
!103 = !DILocation(line: 36, column: 5, scope: !88)
!104 = !{!"llvm.loop.mustprogress"}
!105 = !DILocation(line: 38, column: 22, scope: !46)
!106 = !DILocation(line: 38, column: 5, scope: !46)
!107 = !DILocalVariable(name: "buf_alias", scope: !46, file: !2, line: 40, type: !38)
!108 = !DILocation(line: 40, column: 10, scope: !46)
!109 = !DILocalVariable(name: "win_base_alias", scope: !46, file: !2, line: 41, type: !38)
!110 = !DILocation(line: 41, column: 10, scope: !46)
!111 = !DILocation(line: 43, column: 17, scope: !46)
!112 = !DILocation(line: 43, column: 15, scope: !46)
!113 = !DILocation(line: 44, column: 22, scope: !46)
!114 = !DILocation(line: 44, column: 20, scope: !46)
!115 = !DILocation(line: 46, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !46, file: !2, line: 46, column: 9)
!117 = !DILocation(line: 46, column: 14, scope: !116)
!118 = !DILocation(line: 46, column: 9, scope: !46)
!119 = !DILocation(line: 47, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !2, line: 46, column: 20)
!121 = !DILocation(line: 47, column: 52, scope: !120)
!122 = !DILocation(line: 47, column: 9, scope: !120)
!123 = !DILocation(line: 48, column: 39, scope: !120)
!124 = !DILocation(line: 48, column: 38, scope: !120)
!125 = !DILocation(line: 48, column: 9, scope: !120)
!126 = !DILocation(line: 49, column: 5, scope: !120)
!127 = !DILocation(line: 51, column: 22, scope: !46)
!128 = !DILocation(line: 51, column: 5, scope: !46)
!129 = !DILocation(line: 53, column: 5, scope: !46)
!130 = !DILocation(line: 56, column: 9, scope: !46)
!131 = !DILocation(line: 57, column: 10, scope: !46)
!132 = !DILocation(line: 57, column: 9, scope: !46)
!133 = !DILocation(line: 58, column: 9, scope: !46)
!134 = !DILocation(line: 59, column: 9, scope: !46)
!135 = !DILocation(line: 54, column: 5, scope: !46)
!136 = !DILocation(line: 61, column: 5, scope: !46)
!137 = !DILocation(line: 62, column: 5, scope: !46)
!138 = !DILocation(line: 64, column: 5, scope: !46)
