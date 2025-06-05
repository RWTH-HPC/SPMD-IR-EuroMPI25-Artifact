; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_allgather-mpi_allgather-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_allgather-mpi_allgather-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !35 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !41, metadata !DIExpression()), !dbg !42
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata ptr %6, metadata !45, metadata !DIExpression()), !dbg !46
  store i32 -1, ptr %6, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata ptr %7, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 -1, ptr %7, align 4, !dbg !48
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !49
  %11 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !50
  %12 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !51
  %13 = load i32, ptr %6, align 4, !dbg !52
  %14 = icmp slt i32 %13, 2, !dbg !54
  br i1 %14, label %15, label %17, !dbg !55

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !56
  br label %17, !dbg !56

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !57, metadata !DIExpression()), !dbg !58
  %18 = load i32, ptr %6, align 4, !dbg !59
  %19 = mul nsw i32 %18, 10, !dbg !60
  %20 = sext i32 %19 to i64, !dbg !59
  %21 = call noalias ptr @calloc(i64 noundef %20, i64 noundef 4) #5, !dbg !61
  store ptr %21, ptr %8, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %9, metadata !62, metadata !DIExpression()), !dbg !63
  %22 = load i32, ptr %6, align 4, !dbg !64
  %23 = mul nsw i32 10, %22, !dbg !65
  %24 = sext i32 %23 to i64, !dbg !66
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 4) #5, !dbg !67
  store ptr %25, ptr %9, align 8, !dbg !63
  %26 = load i32, ptr %7, align 4, !dbg !68
  %27 = icmp eq i32 %26, 0, !dbg !70
  br i1 %27, label %28, label %32, !dbg !71

28:                                               ; preds = %17
  %29 = load ptr, ptr %8, align 8, !dbg !72
  %30 = load ptr, ptr %9, align 8, !dbg !74
  %31 = call i32 @MPI_Allgather(ptr noundef %29, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %30, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_comm_world), !dbg !75
  br label %32, !dbg !76

32:                                               ; preds = %28, %17
  %33 = load i32, ptr %7, align 4, !dbg !77
  %34 = icmp ne i32 %33, 0, !dbg !79
  br i1 %34, label %35, label %39, !dbg !80

35:                                               ; preds = %32
  %36 = load ptr, ptr %8, align 8, !dbg !81
  %37 = load ptr, ptr %9, align 8, !dbg !83
  %38 = call i32 @MPI_Allgather(ptr noundef %36, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %37, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_comm_world), !dbg !84
  br label %39, !dbg !85

39:                                               ; preds = %35, %32
  %40 = load ptr, ptr %8, align 8, !dbg !86
  call void @free(ptr noundef %40) #6, !dbg !87
  %41 = load ptr, ptr %9, align 8, !dbg !88
  call void @free(ptr noundef %41) #6, !dbg !89
  %42 = call i32 @MPI_Finalize(), !dbg !90
  %43 = load i32, ptr %7, align 4, !dbg !91
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %43), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Allgather(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef) #2

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
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31, !32, !33}
!llvm.ident = !{!34}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_allgather-mpi_allgather-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "da9e8aa81c2b88cc9dd0d9118c77e516")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !25, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_allgather-mpi_allgather-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "da9e8aa81c2b88cc9dd0d9118c77e516")
!14 = !{!15, !19, !20, !22}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!25 = !{!0, !7}
!26 = !{i32 7, !"Dwarf Version", i32 5}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"openmp", i32 50}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"PIE Level", i32 2}
!32 = !{i32 7, !"uwtable", i32 2}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = !{!"Debian clang version 15.0.6"}
!35 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !36, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !40)
!36 = !DISubroutineType(types: !37)
!37 = !{!21, !21, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!40 = !{}
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !2, line: 22, type: !21)
!42 = !DILocation(line: 22, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !2, line: 22, type: !38)
!44 = !DILocation(line: 22, column: 27, scope: !35)
!45 = !DILocalVariable(name: "nprocs", scope: !35, file: !2, line: 23, type: !21)
!46 = !DILocation(line: 23, column: 7, scope: !35)
!47 = !DILocalVariable(name: "rank", scope: !35, file: !2, line: 24, type: !21)
!48 = !DILocation(line: 24, column: 7, scope: !35)
!49 = !DILocation(line: 26, column: 3, scope: !35)
!50 = !DILocation(line: 27, column: 3, scope: !35)
!51 = !DILocation(line: 28, column: 3, scope: !35)
!52 = !DILocation(line: 29, column: 7, scope: !53)
!53 = distinct !DILexicalBlock(scope: !35, file: !2, line: 29, column: 7)
!54 = !DILocation(line: 29, column: 14, scope: !53)
!55 = !DILocation(line: 29, column: 7, scope: !35)
!56 = !DILocation(line: 30, column: 5, scope: !53)
!57 = !DILocalVariable(name: "buf", scope: !35, file: !2, line: 33, type: !20)
!58 = !DILocation(line: 33, column: 8, scope: !35)
!59 = !DILocation(line: 33, column: 28, scope: !35)
!60 = !DILocation(line: 33, column: 35, scope: !35)
!61 = !DILocation(line: 33, column: 21, scope: !35)
!62 = !DILocalVariable(name: "recv_buf", scope: !35, file: !2, line: 35, type: !20)
!63 = !DILocation(line: 35, column: 8, scope: !35)
!64 = !DILocation(line: 35, column: 38, scope: !35)
!65 = !DILocation(line: 35, column: 36, scope: !35)
!66 = !DILocation(line: 35, column: 33, scope: !35)
!67 = !DILocation(line: 35, column: 26, scope: !35)
!68 = !DILocation(line: 37, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !35, file: !2, line: 37, column: 7)
!70 = !DILocation(line: 37, column: 12, scope: !69)
!71 = !DILocation(line: 37, column: 7, scope: !35)
!72 = !DILocation(line: 38, column: 19, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !2, line: 37, column: 18)
!74 = !DILocation(line: 38, column: 37, scope: !73)
!75 = !DILocation(line: 38, column: 5, scope: !73)
!76 = !DILocation(line: 39, column: 3, scope: !73)
!77 = !DILocation(line: 40, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !35, file: !2, line: 40, column: 7)
!79 = !DILocation(line: 40, column: 12, scope: !78)
!80 = !DILocation(line: 40, column: 7, scope: !35)
!81 = !DILocation(line: 41, column: 19, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 40, column: 18)
!83 = !DILocation(line: 41, column: 37, scope: !82)
!84 = !DILocation(line: 41, column: 5, scope: !82)
!85 = !DILocation(line: 42, column: 3, scope: !82)
!86 = !DILocation(line: 43, column: 8, scope: !35)
!87 = !DILocation(line: 43, column: 3, scope: !35)
!88 = !DILocation(line: 44, column: 8, scope: !35)
!89 = !DILocation(line: 44, column: 3, scope: !35)
!90 = !DILocation(line: 46, column: 3, scope: !35)
!91 = !DILocation(line: 47, column: 41, scope: !35)
!92 = !DILocation(line: 47, column: 3, scope: !35)
!93 = !DILocation(line: 48, column: 3, scope: !35)
