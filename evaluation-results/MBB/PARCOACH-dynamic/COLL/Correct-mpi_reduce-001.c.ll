; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_reduce-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_reduce-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque
%struct.ompi_predefined_op_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@ompi_mpi_op_sum = external global %struct.ompi_predefined_op_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !38 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !44, metadata !DIExpression()), !dbg !45
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata ptr %6, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, ptr %6, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata ptr %7, metadata !50, metadata !DIExpression()), !dbg !51
  store i32 -1, ptr %7, align 4, !dbg !51
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !52
  %11 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !53
  %12 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !54
  %13 = load i32, ptr %6, align 4, !dbg !55
  %14 = icmp slt i32 %13, 2, !dbg !57
  br i1 %14, label %15, label %17, !dbg !58

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !59
  br label %17, !dbg !59

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !60, metadata !DIExpression()), !dbg !61
  %18 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !62
  store ptr %18, ptr %8, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata ptr %9, metadata !63, metadata !DIExpression()), !dbg !64
  %19 = load i32, ptr %6, align 4, !dbg !65
  %20 = mul nsw i32 10, %19, !dbg !66
  %21 = sext i32 %20 to i64, !dbg !67
  %22 = call noalias ptr @calloc(i64 noundef %21, i64 noundef 4) #5, !dbg !68
  store ptr %22, ptr %9, align 8, !dbg !64
  %23 = load ptr, ptr %8, align 8, !dbg !69
  %24 = load ptr, ptr %9, align 8, !dbg !70
  %25 = call i32 @MPI_Reduce(ptr noundef %23, ptr noundef %24, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef @ompi_mpi_op_sum, i32 noundef 0, ptr noundef @ompi_mpi_comm_world), !dbg !71
  %26 = load ptr, ptr %8, align 8, !dbg !72
  call void @free(ptr noundef %26) #6, !dbg !73
  %27 = load ptr, ptr %9, align 8, !dbg !74
  call void @free(ptr noundef %27) #6, !dbg !75
  %28 = call i32 @MPI_Finalize(), !dbg !76
  %29 = load i32, ptr %7, align 4, !dbg !77
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %29), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Reduce(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

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
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_reduce-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "422e4d710bba15906518bcf3f0050e22")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 42, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !28, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_reduce-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "422e4d710bba15906518bcf3f0050e22")
!14 = !{!15, !19, !20, !22, !25}
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
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 425, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_op_t", file: !16, line: 425, flags: DIFlagFwdDecl)
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
!40 = !{!21, !21, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!43 = !{}
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !2, line: 22, type: !21)
!45 = !DILocation(line: 22, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !2, line: 22, type: !41)
!47 = !DILocation(line: 22, column: 27, scope: !38)
!48 = !DILocalVariable(name: "nprocs", scope: !38, file: !2, line: 23, type: !21)
!49 = !DILocation(line: 23, column: 7, scope: !38)
!50 = !DILocalVariable(name: "rank", scope: !38, file: !2, line: 24, type: !21)
!51 = !DILocation(line: 24, column: 7, scope: !38)
!52 = !DILocation(line: 26, column: 3, scope: !38)
!53 = !DILocation(line: 27, column: 3, scope: !38)
!54 = !DILocation(line: 28, column: 3, scope: !38)
!55 = !DILocation(line: 29, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !38, file: !2, line: 29, column: 7)
!57 = !DILocation(line: 29, column: 14, scope: !56)
!58 = !DILocation(line: 29, column: 7, scope: !38)
!59 = !DILocation(line: 30, column: 5, scope: !56)
!60 = !DILocalVariable(name: "buf", scope: !38, file: !2, line: 33, type: !20)
!61 = !DILocation(line: 33, column: 8, scope: !38)
!62 = !DILocation(line: 33, column: 21, scope: !38)
!63 = !DILocalVariable(name: "recv_buf", scope: !38, file: !2, line: 35, type: !20)
!64 = !DILocation(line: 35, column: 8, scope: !38)
!65 = !DILocation(line: 35, column: 38, scope: !38)
!66 = !DILocation(line: 35, column: 36, scope: !38)
!67 = !DILocation(line: 35, column: 33, scope: !38)
!68 = !DILocation(line: 35, column: 26, scope: !38)
!69 = !DILocation(line: 37, column: 14, scope: !38)
!70 = !DILocation(line: 37, column: 19, scope: !38)
!71 = !DILocation(line: 37, column: 3, scope: !38)
!72 = !DILocation(line: 38, column: 8, scope: !38)
!73 = !DILocation(line: 38, column: 3, scope: !38)
!74 = !DILocation(line: 39, column: 8, scope: !38)
!75 = !DILocation(line: 39, column: 3, scope: !38)
!76 = !DILocation(line: 41, column: 3, scope: !38)
!77 = !DILocation(line: 42, column: 41, scope: !38)
!78 = !DILocation(line: 42, column: 3, scope: !38)
!79 = !DILocation(line: 43, column: 3, scope: !38)
