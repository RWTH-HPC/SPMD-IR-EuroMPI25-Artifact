; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_bcast-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_bcast-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !37
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata ptr %6, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 -1, ptr %6, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata ptr %7, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, ptr %7, align 4, !dbg !43
  %9 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !44
  %10 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !45
  %11 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !46
  %12 = load i32, ptr %6, align 4, !dbg !47
  %13 = icmp slt i32 %12, 2, !dbg !49
  br i1 %13, label %14, label %16, !dbg !50

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !51
  br label %16, !dbg !51

16:                                               ; preds = %14, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !52, metadata !DIExpression()), !dbg !53
  %17 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !54
  store ptr %17, ptr %8, align 8, !dbg !53
  %18 = load ptr, ptr %8, align 8, !dbg !55
  %19 = call i32 @MPI_Bcast(ptr noundef %18, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 1140850688), !dbg !56
  %20 = load ptr, ptr %8, align 8, !dbg !57
  call void @free(ptr noundef %20) #6, !dbg !58
  %21 = call i32 @MPI_Finalize(), !dbg !59
  %22 = load i32, ptr %7, align 4, !dbg !60
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %22), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Bcast(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_bcast-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3d33eecb17cac2ca1e8f1978c4000a6d")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 39, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/COLL/Correct-mpi_bcast-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "3d33eecb17cac2ca1e8f1978c4000a6d")
!14 = !{!15, !18, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
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
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !31, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !35)
!31 = !DISubroutineType(types: !32)
!32 = !{!17, !17, !33}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 22, type: !17)
!37 = !DILocation(line: 22, column: 14, scope: !30)
!38 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 22, type: !33)
!39 = !DILocation(line: 22, column: 27, scope: !30)
!40 = !DILocalVariable(name: "nprocs", scope: !30, file: !2, line: 23, type: !17)
!41 = !DILocation(line: 23, column: 7, scope: !30)
!42 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 24, type: !17)
!43 = !DILocation(line: 24, column: 7, scope: !30)
!44 = !DILocation(line: 26, column: 3, scope: !30)
!45 = !DILocation(line: 27, column: 3, scope: !30)
!46 = !DILocation(line: 28, column: 3, scope: !30)
!47 = !DILocation(line: 29, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !30, file: !2, line: 29, column: 7)
!49 = !DILocation(line: 29, column: 14, scope: !48)
!50 = !DILocation(line: 29, column: 7, scope: !30)
!51 = !DILocation(line: 30, column: 5, scope: !48)
!52 = !DILocalVariable(name: "buf", scope: !30, file: !2, line: 33, type: !18)
!53 = !DILocation(line: 33, column: 8, scope: !30)
!54 = !DILocation(line: 33, column: 21, scope: !30)
!55 = !DILocation(line: 35, column: 13, scope: !30)
!56 = !DILocation(line: 35, column: 3, scope: !30)
!57 = !DILocation(line: 36, column: 8, scope: !30)
!58 = !DILocation(line: 36, column: 3, scope: !30)
!59 = !DILocation(line: 38, column: 3, scope: !30)
!60 = !DILocation(line: 39, column: 41, scope: !30)
!61 = !DILocation(line: 39, column: 3, scope: !30)
!62 = !DILocation(line: 40, column: 3, scope: !30)
