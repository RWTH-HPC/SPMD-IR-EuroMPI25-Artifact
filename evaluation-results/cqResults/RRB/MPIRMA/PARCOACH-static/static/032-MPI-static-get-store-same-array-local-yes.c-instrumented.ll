; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"I have %d ranks. You should rerun with %d.\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [42 x i8] c"Process %d finished. Array element = %d.\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@1 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@2 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@3 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@4 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@5 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@6 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@7 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@8 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@9 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@10 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@11 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@12 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@13 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@14 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@15 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1
@16 = private unnamed_addr constant [109 x i8] c"cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c\00", align 1

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
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !44
  %13 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %6), !dbg !45
  %14 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %7), !dbg !46
  %15 = load i32, ptr %7, align 4, !dbg !47
  %16 = icmp ne i32 %15, 2, !dbg !49
  br i1 %16, label %17, label %21, !dbg !50

17:                                               ; preds = %2
  %18 = load i32, ptr %7, align 4, !dbg !51
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18, i32 noundef 2), !dbg !53
  %20 = call i32 @MPI_Abort(i32 noundef 1140850688, i32 noundef 1), !dbg !54
  br label %21, !dbg !55

21:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %9, metadata !59, metadata !DIExpression()), !dbg !61
  %22 = call i32 @parcoach_rma_MPI_Win_allocate(i64 400, i32 4, i32 469762048, i32 1140850688, ptr %9, ptr %8, i32 27, ptr @0), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %10, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 25, ptr %10, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %11, metadata !65, metadata !DIExpression()), !dbg !66
  %23 = load ptr, ptr %9, align 8, !dbg !67
  %24 = getelementptr inbounds i32, ptr %23, i64 1, !dbg !68
  store ptr %24, ptr %11, align 8, !dbg !66
  %25 = load i32, ptr %6, align 4, !dbg !69
  %26 = icmp eq i32 %25, 0, !dbg !71
  br i1 %26, label %27, label %30, !dbg !72

27:                                               ; preds = %21
  %28 = load ptr, ptr %9, align 8, !dbg !73
  %29 = getelementptr inbounds i32, ptr %28, i64 0, !dbg !73
  store i32 0, ptr %29, align 4, !dbg !75
  br label %33, !dbg !76

30:                                               ; preds = %21
  %31 = load ptr, ptr %9, align 8, !dbg !77
  %32 = getelementptr inbounds i32, ptr %31, i64 0, !dbg !77
  store i32 1, ptr %32, align 4, !dbg !79
  br label %33

33:                                               ; preds = %30, %27
  %34 = load i32, ptr %8, align 4, !dbg !80
  %35 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %34, i32 38, ptr @1), !dbg !81
  call void @parcoach_rma_load(ptr %6, i64 32, i32 40, ptr @2), !dbg !82
  %36 = load i32, ptr %6, align 4, !dbg !82
  %37 = icmp eq i32 %36, 0, !dbg !84
  br i1 %37, label %38, label %46, !dbg !85

38:                                               ; preds = %33
  call void @parcoach_rma_load(ptr %9, i64 64, i32 42, ptr @3), !dbg !86
  %39 = load ptr, ptr %9, align 8, !dbg !86
  call void @parcoach_rma_load(ptr %10, i64 32, i32 42, ptr @4), !dbg !88
  %40 = load i32, ptr %10, align 4, !dbg !88
  call void @parcoach_rma_load(ptr %10, i64 32, i32 42, ptr @5), !dbg !89
  %41 = load i32, ptr %10, align 4, !dbg !89
  call void @parcoach_rma_load(ptr %8, i64 32, i32 42, ptr @6), !dbg !90
  %42 = load i32, ptr %8, align 4, !dbg !90
  %43 = call i32 @parcoach_rma_MPI_Get(ptr %39, i32 %40, i32 1275069445, i32 1, i64 0, i32 %41, i32 1275069445, i32 %42, i32 42, ptr @7), !dbg !91
  call void @parcoach_rma_load(ptr %11, i64 64, i32 44, ptr @8), !dbg !92
  %44 = load ptr, ptr %11, align 8, !dbg !92
  %45 = getelementptr inbounds i32, ptr %44, i64 1, !dbg !92
  call void @parcoach_rma_store(ptr %45, i64 32, i32 44, ptr @9), !dbg !93
  store i32 3, ptr %45, align 4, !dbg !93
  br label %46, !dbg !94

46:                                               ; preds = %38, %33
  call void @parcoach_rma_load(ptr %8, i64 32, i32 47, ptr @10), !dbg !95
  %47 = load i32, ptr %8, align 4, !dbg !95
  %48 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, i32 %47, i32 47, ptr @11), !dbg !96
  %49 = call i32 @parcoach_rma_MPI_Barrier(i32 1140850688, i32 49, ptr @12), !dbg !97
  call void @parcoach_rma_load(ptr %6, i64 32, i32 50, ptr @13), !dbg !98
  %50 = load i32, ptr %6, align 4, !dbg !98
  call void @parcoach_rma_load(ptr %9, i64 64, i32 50, ptr @14), !dbg !99
  %51 = load ptr, ptr %9, align 8, !dbg !99
  %52 = getelementptr inbounds i32, ptr %51, i64 0, !dbg !99
  call void @parcoach_rma_load(ptr %52, i64 32, i32 50, ptr @15), !dbg !99
  %53 = load i32, ptr %52, align 4, !dbg !99
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %50, i32 noundef %53), !dbg !100
  %55 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 52, ptr @16), !dbg !101
  %56 = call i32 @MPI_Finalize(), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, i32, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Get(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 21, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1cd8fdd97978ed9d9cd2652ea12d51cc")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 44)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 42)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/RRB/MPIRMA/PARCOACH-static/static/032-MPI-static-get-store-same-array-local-yes.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "1cd8fdd97978ed9d9cd2652ea12d51cc")
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
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !31, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 12, type: !17)
!37 = !DILocation(line: 12, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 12, type: !33)
!39 = !DILocation(line: 12, column: 27, scope: !30)
!40 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 13, type: !17)
!41 = !DILocation(line: 13, column: 9, scope: !30)
!42 = !DILocalVariable(name: "size", scope: !30, file: !2, line: 14, type: !17)
!43 = !DILocation(line: 14, column: 9, scope: !30)
!44 = !DILocation(line: 16, column: 5, scope: !30)
!45 = !DILocation(line: 17, column: 5, scope: !30)
!46 = !DILocation(line: 18, column: 5, scope: !30)
!47 = !DILocation(line: 20, column: 9, scope: !48)
!48 = distinct !DILexicalBlock(scope: !30, file: !2, line: 20, column: 9)
!49 = !DILocation(line: 20, column: 14, scope: !48)
!50 = !DILocation(line: 20, column: 9, scope: !30)
!51 = !DILocation(line: 21, column: 64, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !2, line: 20, column: 27)
!53 = !DILocation(line: 21, column: 9, scope: !52)
!54 = !DILocation(line: 22, column: 9, scope: !52)
!55 = !DILocation(line: 23, column: 5, scope: !52)
!56 = !DILocalVariable(name: "win", scope: !30, file: !2, line: 25, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!58 = !DILocation(line: 25, column: 13, scope: !30)
!59 = !DILocalVariable(name: "arr_base", scope: !30, file: !2, line: 26, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!61 = !DILocation(line: 26, column: 10, scope: !30)
!62 = !DILocation(line: 27, column: 5, scope: !30)
!63 = !DILocalVariable(name: "packet_size", scope: !30, file: !2, line: 29, type: !17)
!64 = !DILocation(line: 29, column: 9, scope: !30)
!65 = !DILocalVariable(name: "arr_midp", scope: !30, file: !2, line: 30, type: !60)
!66 = !DILocation(line: 30, column: 10, scope: !30)
!67 = !DILocation(line: 30, column: 21, scope: !30)
!68 = !DILocation(line: 30, column: 30, scope: !30)
!69 = !DILocation(line: 32, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !30, file: !2, line: 32, column: 9)
!71 = !DILocation(line: 32, column: 14, scope: !70)
!72 = !DILocation(line: 32, column: 9, scope: !30)
!73 = !DILocation(line: 33, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !2, line: 32, column: 20)
!75 = !DILocation(line: 33, column: 21, scope: !74)
!76 = !DILocation(line: 34, column: 5, scope: !74)
!77 = !DILocation(line: 35, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !2, line: 34, column: 12)
!79 = !DILocation(line: 35, column: 21, scope: !78)
!80 = !DILocation(line: 38, column: 22, scope: !30)
!81 = !DILocation(line: 38, column: 5, scope: !30)
!82 = !DILocation(line: 40, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !30, file: !2, line: 40, column: 9)
!84 = !DILocation(line: 40, column: 14, scope: !83)
!85 = !DILocation(line: 40, column: 9, scope: !30)
!86 = !DILocation(line: 42, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !2, line: 40, column: 20)
!88 = !DILocation(line: 42, column: 27, scope: !87)
!89 = !DILocation(line: 42, column: 55, scope: !87)
!90 = !DILocation(line: 42, column: 77, scope: !87)
!91 = !DILocation(line: 42, column: 9, scope: !87)
!92 = !DILocation(line: 44, column: 9, scope: !87)
!93 = !DILocation(line: 44, column: 21, scope: !87)
!94 = !DILocation(line: 45, column: 5, scope: !87)
!95 = !DILocation(line: 47, column: 22, scope: !30)
!96 = !DILocation(line: 47, column: 5, scope: !30)
!97 = !DILocation(line: 49, column: 5, scope: !30)
!98 = !DILocation(line: 50, column: 58, scope: !30)
!99 = !DILocation(line: 50, column: 64, scope: !30)
!100 = !DILocation(line: 50, column: 5, scope: !30)
!101 = !DILocation(line: 52, column: 5, scope: !30)
!102 = !DILocation(line: 53, column: 5, scope: !30)
!103 = !DILocation(line: 55, column: 5, scope: !30)
