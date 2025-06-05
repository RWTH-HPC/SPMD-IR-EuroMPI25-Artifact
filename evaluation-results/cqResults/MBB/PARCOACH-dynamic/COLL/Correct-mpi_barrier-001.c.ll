; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_barrier-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_barrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !28 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !34, metadata !DIExpression()), !dbg !35
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata ptr %6, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 -1, ptr %6, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata ptr %7, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 -1, ptr %7, align 4, !dbg !41
  %8 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !42
  %9 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !43
  %10 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !44
  %11 = load i32, ptr %6, align 4, !dbg !45
  %12 = icmp slt i32 %11, 2, !dbg !47
  br i1 %12, label %13, label %15, !dbg !48

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !49
  br label %15, !dbg !49

15:                                               ; preds = %13, %2
  %16 = call i32 @MPI_Barrier(i32 noundef 1140850688), !dbg !50
  %17 = call i32 @MPI_Finalize(), !dbg !51
  %18 = load i32, ptr %7, align 4, !dbg !52
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18), !dbg !53
  ret i32 0, !dbg !54
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Barrier(i32 noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "0b38df241a9043e55a8f4aa7097c7a02")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 36, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !18, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "0b38df241a9043e55a8f4aa7097c7a02")
!14 = !{!15}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{!0, !7}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"openmp", i32 50}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 2}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Debian clang version 15.0.6"}
!28 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !29, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !33)
!29 = !DISubroutineType(types: !30)
!30 = !{!17, !17, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!33 = !{}
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !28, file: !2, line: 22, type: !17)
!35 = !DILocation(line: 22, column: 14, scope: !28)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !28, file: !2, line: 22, type: !31)
!37 = !DILocation(line: 22, column: 27, scope: !28)
!38 = !DILocalVariable(name: "nprocs", scope: !28, file: !2, line: 23, type: !17)
!39 = !DILocation(line: 23, column: 7, scope: !28)
!40 = !DILocalVariable(name: "rank", scope: !28, file: !2, line: 24, type: !17)
!41 = !DILocation(line: 24, column: 7, scope: !28)
!42 = !DILocation(line: 26, column: 3, scope: !28)
!43 = !DILocation(line: 27, column: 3, scope: !28)
!44 = !DILocation(line: 28, column: 3, scope: !28)
!45 = !DILocation(line: 29, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !28, file: !2, line: 29, column: 7)
!47 = !DILocation(line: 29, column: 14, scope: !46)
!48 = !DILocation(line: 29, column: 7, scope: !28)
!49 = !DILocation(line: 30, column: 5, scope: !46)
!50 = !DILocation(line: 33, column: 3, scope: !28)
!51 = !DILocation(line: 35, column: 3, scope: !28)
!52 = !DILocation(line: 36, column: 41, scope: !28)
!53 = !DILocation(line: 36, column: 3, scope: !28)
!54 = !DILocation(line: 37, column: 3, scope: !28)
