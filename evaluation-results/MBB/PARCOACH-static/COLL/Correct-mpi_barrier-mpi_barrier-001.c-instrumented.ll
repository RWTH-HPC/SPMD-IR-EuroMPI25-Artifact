; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [90 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c\00", align 1
@1 = private unnamed_addr constant [90 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !32 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, ptr %6, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, ptr %7, align 4, !dbg !45
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !46
  %11 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !47
  %12 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !48
  %13 = load i32, ptr %6, align 4, !dbg !49
  %14 = icmp slt i32 %13, 2, !dbg !51
  br i1 %14, label %15, label %17, !dbg !52

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !53
  br label %17, !dbg !53

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !54, metadata !DIExpression()), !dbg !55
  %18 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !56
  store ptr %18, ptr %8, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  %19 = load i32, ptr %6, align 4, !dbg !59
  %20 = mul nsw i32 10, %19, !dbg !60
  %21 = sext i32 %20 to i64, !dbg !61
  %22 = call noalias ptr @calloc(i64 noundef %21, i64 noundef 4) #5, !dbg !62
  store ptr %22, ptr %9, align 8, !dbg !58
  %23 = load i32, ptr %7, align 4, !dbg !63
  %24 = icmp eq i32 %23, 0, !dbg !65
  br i1 %24, label %25, label %27, !dbg !66

25:                                               ; preds = %17
  %26 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 38, ptr @0), !dbg !67
  br label %27, !dbg !69

27:                                               ; preds = %25, %17
  %28 = load i32, ptr %7, align 4, !dbg !70
  %29 = icmp ne i32 %28, 0, !dbg !72
  br i1 %29, label %30, label %32, !dbg !73

30:                                               ; preds = %27
  %31 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 41, ptr @1), !dbg !74
  br label %32, !dbg !76

32:                                               ; preds = %30, %27
  %33 = load ptr, ptr %8, align 8, !dbg !77
  call void @free(ptr noundef %33) #6, !dbg !78
  %34 = load ptr, ptr %9, align 8, !dbg !79
  call void @free(ptr noundef %34) #6, !dbg !80
  %35 = call i32 @MPI_Finalize(), !dbg !81
  %36 = load i32, ptr %7, align 4, !dbg !82
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Barrier(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "aede514809220c69e892280c4c8ecf8b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !22, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_barrier-mpi_barrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "aede514809220c69e892280c4c8ecf8b")
!14 = !{!15, !19, !20}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{!0, !7}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"openmp", i32 50}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 2}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Debian clang version 15.0.6"}
!32 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !33, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!33 = !DISubroutineType(types: !34)
!34 = !{!21, !21, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !2, line: 22, type: !21)
!39 = !DILocation(line: 22, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !2, line: 22, type: !35)
!41 = !DILocation(line: 22, column: 27, scope: !32)
!42 = !DILocalVariable(name: "nprocs", scope: !32, file: !2, line: 23, type: !21)
!43 = !DILocation(line: 23, column: 7, scope: !32)
!44 = !DILocalVariable(name: "rank", scope: !32, file: !2, line: 24, type: !21)
!45 = !DILocation(line: 24, column: 7, scope: !32)
!46 = !DILocation(line: 26, column: 3, scope: !32)
!47 = !DILocation(line: 27, column: 3, scope: !32)
!48 = !DILocation(line: 28, column: 3, scope: !32)
!49 = !DILocation(line: 29, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !32, file: !2, line: 29, column: 7)
!51 = !DILocation(line: 29, column: 14, scope: !50)
!52 = !DILocation(line: 29, column: 7, scope: !32)
!53 = !DILocation(line: 30, column: 5, scope: !50)
!54 = !DILocalVariable(name: "buf", scope: !32, file: !2, line: 33, type: !20)
!55 = !DILocation(line: 33, column: 8, scope: !32)
!56 = !DILocation(line: 33, column: 21, scope: !32)
!57 = !DILocalVariable(name: "recv_buf", scope: !32, file: !2, line: 35, type: !20)
!58 = !DILocation(line: 35, column: 8, scope: !32)
!59 = !DILocation(line: 35, column: 38, scope: !32)
!60 = !DILocation(line: 35, column: 36, scope: !32)
!61 = !DILocation(line: 35, column: 33, scope: !32)
!62 = !DILocation(line: 35, column: 26, scope: !32)
!63 = !DILocation(line: 37, column: 7, scope: !64)
!64 = distinct !DILexicalBlock(scope: !32, file: !2, line: 37, column: 7)
!65 = !DILocation(line: 37, column: 12, scope: !64)
!66 = !DILocation(line: 37, column: 7, scope: !32)
!67 = !DILocation(line: 38, column: 5, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !2, line: 37, column: 18)
!69 = !DILocation(line: 39, column: 3, scope: !68)
!70 = !DILocation(line: 40, column: 7, scope: !71)
!71 = distinct !DILexicalBlock(scope: !32, file: !2, line: 40, column: 7)
!72 = !DILocation(line: 40, column: 12, scope: !71)
!73 = !DILocation(line: 40, column: 7, scope: !32)
!74 = !DILocation(line: 41, column: 5, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !2, line: 40, column: 18)
!76 = !DILocation(line: 42, column: 3, scope: !75)
!77 = !DILocation(line: 43, column: 8, scope: !32)
!78 = !DILocation(line: 43, column: 3, scope: !32)
!79 = !DILocation(line: 44, column: 8, scope: !32)
!80 = !DILocation(line: 44, column: 3, scope: !32)
!81 = !DILocation(line: 46, column: 3, scope: !32)
!82 = !DILocation(line: 47, column: 41, scope: !32)
!83 = !DILocation(line: 47, column: 3, scope: !32)
!84 = !DILocation(line: 48, column: 3, scope: !32)
