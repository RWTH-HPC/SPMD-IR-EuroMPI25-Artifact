; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_reduce-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_reduce-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !31 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata ptr %6, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 -1, ptr %6, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata ptr %7, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 -1, ptr %7, align 4, !dbg !44
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !45
  %11 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !46
  %12 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !47
  %13 = load i32, ptr %6, align 4, !dbg !48
  %14 = icmp slt i32 %13, 2, !dbg !50
  br i1 %14, label %15, label %17, !dbg !51

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !52
  br label %17, !dbg !52

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !53, metadata !DIExpression()), !dbg !54
  %18 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !55
  store ptr %18, ptr %8, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %9, metadata !56, metadata !DIExpression()), !dbg !57
  %19 = load i32, ptr %6, align 4, !dbg !58
  %20 = mul nsw i32 10, %19, !dbg !59
  %21 = sext i32 %20 to i64, !dbg !60
  %22 = call noalias ptr @calloc(i64 noundef %21, i64 noundef 4) #5, !dbg !61
  store ptr %22, ptr %9, align 8, !dbg !57
  %23 = load ptr, ptr %8, align 8, !dbg !62
  %24 = load ptr, ptr %9, align 8, !dbg !63
  %25 = call i32 @MPI_Reduce(ptr noundef %23, ptr noundef %24, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef 0, i32 noundef 1140850688), !dbg !64
  %26 = load ptr, ptr %8, align 8, !dbg !65
  call void @free(ptr noundef %26) #6, !dbg !66
  %27 = load ptr, ptr %9, align 8, !dbg !67
  call void @free(ptr noundef %27) #6, !dbg !68
  %28 = call i32 @MPI_Finalize(), !dbg !69
  %29 = load i32, ptr %7, align 4, !dbg !70
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %29), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Reduce(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_reduce-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "422e4d710bba15906518bcf3f0050e22")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 42, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !21, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_reduce-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "422e4d710bba15906518bcf3f0050e22")
!14 = !{!15, !18, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!21 = !{!0, !7}
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"openmp", i32 50}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 2}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Debian clang version 15.0.6"}
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !32, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !36)
!32 = !DISubroutineType(types: !33)
!33 = !{!17, !17, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!36 = !{}
!37 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 22, type: !17)
!38 = !DILocation(line: 22, column: 14, scope: !31)
!39 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 22, type: !34)
!40 = !DILocation(line: 22, column: 27, scope: !31)
!41 = !DILocalVariable(name: "nprocs", scope: !31, file: !2, line: 23, type: !17)
!42 = !DILocation(line: 23, column: 7, scope: !31)
!43 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 24, type: !17)
!44 = !DILocation(line: 24, column: 7, scope: !31)
!45 = !DILocation(line: 26, column: 3, scope: !31)
!46 = !DILocation(line: 27, column: 3, scope: !31)
!47 = !DILocation(line: 28, column: 3, scope: !31)
!48 = !DILocation(line: 29, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !2, line: 29, column: 7)
!50 = !DILocation(line: 29, column: 14, scope: !49)
!51 = !DILocation(line: 29, column: 7, scope: !31)
!52 = !DILocation(line: 30, column: 5, scope: !49)
!53 = !DILocalVariable(name: "buf", scope: !31, file: !2, line: 33, type: !18)
!54 = !DILocation(line: 33, column: 8, scope: !31)
!55 = !DILocation(line: 33, column: 21, scope: !31)
!56 = !DILocalVariable(name: "recv_buf", scope: !31, file: !2, line: 35, type: !18)
!57 = !DILocation(line: 35, column: 8, scope: !31)
!58 = !DILocation(line: 35, column: 38, scope: !31)
!59 = !DILocation(line: 35, column: 36, scope: !31)
!60 = !DILocation(line: 35, column: 33, scope: !31)
!61 = !DILocation(line: 35, column: 26, scope: !31)
!62 = !DILocation(line: 37, column: 14, scope: !31)
!63 = !DILocation(line: 37, column: 19, scope: !31)
!64 = !DILocation(line: 37, column: 3, scope: !31)
!65 = !DILocation(line: 38, column: 8, scope: !31)
!66 = !DILocation(line: 38, column: 3, scope: !31)
!67 = !DILocation(line: 39, column: 8, scope: !31)
!68 = !DILocation(line: 39, column: 3, scope: !31)
!69 = !DILocation(line: 41, column: 3, scope: !31)
!70 = !DILocation(line: 42, column: 41, scope: !31)
!71 = !DILocation(line: 42, column: 3, scope: !31)
!72 = !DILocation(line: 43, column: 3, scope: !31)
