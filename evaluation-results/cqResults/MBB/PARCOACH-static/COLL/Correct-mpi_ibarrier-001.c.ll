; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !44, metadata !DIExpression()), !dbg !45
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, ptr %6, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -1, ptr %7, align 4, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %8, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 738197504, ptr %8, align 4, !dbg !53
  %9 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !54
  %10 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !55
  %11 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !56
  %12 = load i32, ptr %6, align 4, !dbg !57
  %13 = icmp slt i32 %12, 2, !dbg !59
  br i1 %13, label %14, label %16, !dbg !60

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !61
  br label %16, !dbg !61

16:                                               ; preds = %14, %2
  %17 = call i32 @MPI_Ibarrier(i32 noundef 1140850688, ptr noundef %8), !dbg !62
  %18 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !63
  %19 = call i32 @MPI_Finalize(), !dbg !64
  %20 = load i32, ptr %7, align 4, !dbg !65
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %20), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Ibarrier(i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "20d095f000001561cdd55ae5af1e409b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 38, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !28, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "20d095f000001561cdd55ae5af1e409b")
!14 = !{!15, !18, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !22)
!22 = !{!23, !24, !25, !26, !27}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !21, file: !16, line: 588, baseType: !17, size: 32)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !21, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !21, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !21, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !21, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!28 = !{!0, !7}
!29 = !{i32 7, !"Dwarf Version", i32 5}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"openmp", i32 50}
!33 = !{i32 7, !"PIC Level", i32 2}
!34 = !{i32 7, !"PIE Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 2}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{!"Debian clang version 15.0.6"}
!38 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !39, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !43)
!39 = !DISubroutineType(types: !40)
!40 = !{!17, !17, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!43 = !{}
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !2, line: 22, type: !17)
!45 = !DILocation(line: 22, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !2, line: 22, type: !41)
!47 = !DILocation(line: 22, column: 27, scope: !38)
!48 = !DILocalVariable(name: "nprocs", scope: !38, file: !2, line: 23, type: !17)
!49 = !DILocation(line: 23, column: 7, scope: !38)
!50 = !DILocalVariable(name: "rank", scope: !38, file: !2, line: 24, type: !17)
!51 = !DILocation(line: 24, column: 7, scope: !38)
!52 = !DILocalVariable(name: "mpi_request_0", scope: !38, file: !2, line: 25, type: !15)
!53 = !DILocation(line: 25, column: 15, scope: !38)
!54 = !DILocation(line: 27, column: 3, scope: !38)
!55 = !DILocation(line: 28, column: 3, scope: !38)
!56 = !DILocation(line: 29, column: 3, scope: !38)
!57 = !DILocation(line: 30, column: 7, scope: !58)
!58 = distinct !DILexicalBlock(scope: !38, file: !2, line: 30, column: 7)
!59 = !DILocation(line: 30, column: 14, scope: !58)
!60 = !DILocation(line: 30, column: 7, scope: !38)
!61 = !DILocation(line: 31, column: 5, scope: !58)
!62 = !DILocation(line: 34, column: 3, scope: !38)
!63 = !DILocation(line: 35, column: 3, scope: !38)
!64 = !DILocation(line: 37, column: 3, scope: !38)
!65 = !DILocation(line: 38, column: 41, scope: !38)
!66 = !DILocation(line: 38, column: 3, scope: !38)
!67 = !DILocation(line: 39, column: 3, scope: !38)
