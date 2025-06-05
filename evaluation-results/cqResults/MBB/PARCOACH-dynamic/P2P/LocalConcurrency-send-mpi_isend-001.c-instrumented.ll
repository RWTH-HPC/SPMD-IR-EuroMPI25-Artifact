; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/P2P/LocalConcurrency-send-mpi_isend-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/P2P/LocalConcurrency-send-mpi_isend-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !50 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !56, metadata !DIExpression()), !dbg !57
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %6, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 -1, ptr %6, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata ptr %7, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 -1, ptr %7, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata ptr %8, metadata !64, metadata !DIExpression()), !dbg !65
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !65
  %10 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !66
  %11 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !67
  %12 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !68
  %13 = load i32, ptr %6, align 4, !dbg !69
  %14 = icmp slt i32 %13, 2, !dbg !71
  br i1 %14, label %15, label %17, !dbg !72

15:                                               ; preds = %2
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !73
  br label %17, !dbg !73

17:                                               ; preds = %15, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !74, metadata !DIExpression()), !dbg !75
  %18 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !76
  store ptr %18, ptr %9, align 8, !dbg !75
  %19 = load i32, ptr %7, align 4, !dbg !77
  %20 = icmp eq i32 %19, 0, !dbg !79
  br i1 %20, label %21, label %25, !dbg !80

21:                                               ; preds = %17
  %22 = load ptr, ptr %9, align 8, !dbg !81
  %23 = call i32 @MPI_Irecv(ptr noundef %22, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !83
  %24 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !84
  br label %25, !dbg !85

25:                                               ; preds = %21, %17
  %26 = load i32, ptr %7, align 4, !dbg !86
  %27 = icmp eq i32 %26, 1, !dbg !88
  br i1 %27, label %28, label %34, !dbg !89

28:                                               ; preds = %25
  %29 = load ptr, ptr %9, align 8, !dbg !90
  %30 = call i32 @MPI_Isend(ptr noundef %29, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !92
  %31 = load ptr, ptr %9, align 8, !dbg !93
  %32 = getelementptr inbounds i32, ptr %31, i64 2, !dbg !93
  store i32 1, ptr %32, align 4, !dbg !94
  %33 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !95
  br label %34, !dbg !96

34:                                               ; preds = %28, %25
  %35 = load ptr, ptr %9, align 8, !dbg !97
  call void @free(ptr noundef %35) #6, !dbg !98
  %36 = call i32 @MPI_Finalize(), !dbg !99
  %37 = load i32, ptr %7, align 4, !dbg !100
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %37), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Irecv(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Isend(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

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
!llvm.module.flags = !{!41, !42, !43, !44, !45, !46, !47, !48}
!llvm.ident = !{!49}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/P2P/LocalConcurrency-send-mpi_isend-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "687c0fe2f74cbdf56ae1f322e38c1560")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !40, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/P2P/LocalConcurrency-send-mpi_isend-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "687c0fe2f74cbdf56ae1f322e38c1560")
!14 = !{!15, !19, !20, !23, !25, !28}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !31)
!31 = !{!32, !33, !34, !35, !36}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !30, file: !16, line: 441, baseType: !24, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !30, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !30, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !30, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !30, file: !16, line: 449, baseType: !37, size: 64, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !{!0, !7}
!41 = !{i32 7, !"Dwarf Version", i32 5}
!42 = !{i32 2, !"Debug Info Version", i32 3}
!43 = !{i32 1, !"wchar_size", i32 4}
!44 = !{i32 7, !"openmp", i32 50}
!45 = !{i32 7, !"PIC Level", i32 2}
!46 = !{i32 7, !"PIE Level", i32 2}
!47 = !{i32 7, !"uwtable", i32 2}
!48 = !{i32 7, !"frame-pointer", i32 2}
!49 = !{!"Debian clang version 15.0.6"}
!50 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !51, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !55)
!51 = !DISubroutineType(types: !52)
!52 = !{!24, !24, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !{}
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !2, line: 22, type: !24)
!57 = !DILocation(line: 22, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !2, line: 22, type: !53)
!59 = !DILocation(line: 22, column: 27, scope: !50)
!60 = !DILocalVariable(name: "nprocs", scope: !50, file: !2, line: 23, type: !24)
!61 = !DILocation(line: 23, column: 7, scope: !50)
!62 = !DILocalVariable(name: "rank", scope: !50, file: !2, line: 24, type: !24)
!63 = !DILocation(line: 24, column: 7, scope: !50)
!64 = !DILocalVariable(name: "mpi_request_0", scope: !50, file: !2, line: 25, type: !15)
!65 = !DILocation(line: 25, column: 15, scope: !50)
!66 = !DILocation(line: 27, column: 3, scope: !50)
!67 = !DILocation(line: 28, column: 3, scope: !50)
!68 = !DILocation(line: 29, column: 3, scope: !50)
!69 = !DILocation(line: 30, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !50, file: !2, line: 30, column: 7)
!71 = !DILocation(line: 30, column: 14, scope: !70)
!72 = !DILocation(line: 30, column: 7, scope: !50)
!73 = !DILocation(line: 31, column: 5, scope: !70)
!74 = !DILocalVariable(name: "buf", scope: !50, file: !2, line: 34, type: !23)
!75 = !DILocation(line: 34, column: 8, scope: !50)
!76 = !DILocation(line: 34, column: 21, scope: !50)
!77 = !DILocation(line: 36, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !50, file: !2, line: 36, column: 7)
!79 = !DILocation(line: 36, column: 12, scope: !78)
!80 = !DILocation(line: 36, column: 7, scope: !50)
!81 = !DILocation(line: 37, column: 15, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 36, column: 18)
!83 = !DILocation(line: 37, column: 5, scope: !82)
!84 = !DILocation(line: 38, column: 5, scope: !82)
!85 = !DILocation(line: 39, column: 3, scope: !82)
!86 = !DILocation(line: 40, column: 7, scope: !87)
!87 = distinct !DILexicalBlock(scope: !50, file: !2, line: 40, column: 7)
!88 = !DILocation(line: 40, column: 12, scope: !87)
!89 = !DILocation(line: 40, column: 7, scope: !50)
!90 = !DILocation(line: 41, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !2, line: 40, column: 18)
!92 = !DILocation(line: 41, column: 24, scope: !91)
!93 = !DILocation(line: 43, column: 24, scope: !91)
!94 = !DILocation(line: 43, column: 31, scope: !91)
!95 = !DILocation(line: 44, column: 5, scope: !91)
!96 = !DILocation(line: 45, column: 3, scope: !91)
!97 = !DILocation(line: 46, column: 8, scope: !50)
!98 = !DILocation(line: 46, column: 3, scope: !50)
!99 = !DILocation(line: 48, column: 3, scope: !50)
!100 = !DILocation(line: 49, column: 41, scope: !50)
!101 = !DILocation(line: 49, column: 3, scope: !50)
!102 = !DILocation(line: 50, column: 3, scope: !50)
