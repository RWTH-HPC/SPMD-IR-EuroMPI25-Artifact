; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/LocalConcurrency-send-mpi_bsend_init-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/LocalConcurrency-send-mpi_bsend_init-001.c"
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
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !51 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
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
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !66
  %13 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !67
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !68
  %15 = load i32, ptr %6, align 4, !dbg !69
  %16 = icmp slt i32 %15, 2, !dbg !71
  br i1 %16, label %17, label %19, !dbg !72

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !73
  br label %19, !dbg !73

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !74, metadata !DIExpression()), !dbg !75
  %20 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !76
  store ptr %20, ptr %9, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata ptr %10, metadata !77, metadata !DIExpression()), !dbg !78
  %21 = call noalias ptr @calloc(i64 noundef 168, i64 noundef 1) #5, !dbg !79
  store ptr %21, ptr %10, align 8, !dbg !78
  %22 = load ptr, ptr %10, align 8, !dbg !80
  %23 = call i32 @MPI_Buffer_attach(ptr noundef %22, i32 noundef 168), !dbg !81
  %24 = load i32, ptr %7, align 4, !dbg !82
  %25 = icmp eq i32 %24, 0, !dbg !84
  br i1 %25, label %26, label %30, !dbg !85

26:                                               ; preds = %19
  %27 = load ptr, ptr %9, align 8, !dbg !86
  %28 = call i32 @MPI_Irecv(ptr noundef %27, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !88
  %29 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !89
  br label %30, !dbg !90

30:                                               ; preds = %26, %19
  %31 = load i32, ptr %7, align 4, !dbg !91
  %32 = icmp eq i32 %31, 1, !dbg !93
  br i1 %32, label %33, label %40, !dbg !94

33:                                               ; preds = %30
  %34 = load ptr, ptr %9, align 8, !dbg !95
  %35 = call i32 @MPI_Bsend_init(ptr noundef %34, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !97
  %36 = call i32 @MPI_Start(ptr noundef %8), !dbg !98
  %37 = load ptr, ptr %9, align 8, !dbg !99
  %38 = getelementptr inbounds i32, ptr %37, i64 2, !dbg !99
  store i32 1, ptr %38, align 4, !dbg !100
  %39 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !101
  br label %40, !dbg !102

40:                                               ; preds = %33, %30
  call void @llvm.dbg.declare(metadata ptr %11, metadata !103, metadata !DIExpression()), !dbg !104
  %41 = load ptr, ptr %10, align 8, !dbg !105
  %42 = call i32 @MPI_Buffer_detach(ptr noundef %41, ptr noundef %11), !dbg !106
  %43 = load ptr, ptr %10, align 8, !dbg !107
  call void @free(ptr noundef %43) #6, !dbg !108
  %44 = load ptr, ptr %9, align 8, !dbg !109
  call void @free(ptr noundef %44) #6, !dbg !110
  %45 = load i32, ptr %7, align 4, !dbg !111
  %46 = icmp eq i32 %45, 1, !dbg !113
  br i1 %46, label %47, label %49, !dbg !114

47:                                               ; preds = %40
  %48 = call i32 @MPI_Request_free(ptr noundef %8), !dbg !115
  br label %49, !dbg !117

49:                                               ; preds = %47, %40
  %50 = call i32 @MPI_Finalize(), !dbg !118
  %51 = load i32, ptr %7, align 4, !dbg !119
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %51), !dbg !120
  ret i32 0, !dbg !121
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Buffer_attach(ptr noundef, i32 noundef) #2

declare i32 @MPI_Irecv(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Bsend_init(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Start(ptr noundef) #2

declare i32 @MPI_Buffer_detach(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Request_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!42, !43, !44, !45, !46, !47, !48, !49}
!llvm.ident = !{!50}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/P2P/LocalConcurrency-send-mpi_bsend_init-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d0d04a4d9d4a3a2fea75f54a045724db")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 60, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !41, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/LocalConcurrency-send-mpi_bsend_init-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d0d04a4d9d4a3a2fea75f54a045724db")
!14 = !{!15, !19, !20, !23, !25, !26, !29}
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
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !32)
!32 = !{!33, !34, !35, !36, !37}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !31, file: !16, line: 441, baseType: !24, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !31, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !31, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !31, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !31, file: !16, line: 449, baseType: !38, size: 64, offset: 128)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !{!0, !7}
!42 = !{i32 7, !"Dwarf Version", i32 5}
!43 = !{i32 2, !"Debug Info Version", i32 3}
!44 = !{i32 1, !"wchar_size", i32 4}
!45 = !{i32 7, !"openmp", i32 50}
!46 = !{i32 7, !"PIC Level", i32 2}
!47 = !{i32 7, !"PIE Level", i32 2}
!48 = !{i32 7, !"uwtable", i32 2}
!49 = !{i32 7, !"frame-pointer", i32 2}
!50 = !{!"Debian clang version 15.0.6"}
!51 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !52, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !55)
!52 = !DISubroutineType(types: !53)
!53 = !{!24, !24, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!55 = !{}
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !2, line: 22, type: !24)
!57 = !DILocation(line: 22, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !2, line: 22, type: !54)
!59 = !DILocation(line: 22, column: 27, scope: !51)
!60 = !DILocalVariable(name: "nprocs", scope: !51, file: !2, line: 23, type: !24)
!61 = !DILocation(line: 23, column: 7, scope: !51)
!62 = !DILocalVariable(name: "rank", scope: !51, file: !2, line: 24, type: !24)
!63 = !DILocation(line: 24, column: 7, scope: !51)
!64 = !DILocalVariable(name: "mpi_request_0", scope: !51, file: !2, line: 25, type: !15)
!65 = !DILocation(line: 25, column: 15, scope: !51)
!66 = !DILocation(line: 27, column: 3, scope: !51)
!67 = !DILocation(line: 28, column: 3, scope: !51)
!68 = !DILocation(line: 29, column: 3, scope: !51)
!69 = !DILocation(line: 30, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !51, file: !2, line: 30, column: 7)
!71 = !DILocation(line: 30, column: 14, scope: !70)
!72 = !DILocation(line: 30, column: 7, scope: !51)
!73 = !DILocation(line: 31, column: 5, scope: !70)
!74 = !DILocalVariable(name: "buf", scope: !51, file: !2, line: 34, type: !23)
!75 = !DILocation(line: 34, column: 8, scope: !51)
!76 = !DILocation(line: 34, column: 21, scope: !51)
!77 = !DILocalVariable(name: "mpi_buf", scope: !51, file: !2, line: 36, type: !25)
!78 = !DILocation(line: 36, column: 9, scope: !51)
!79 = !DILocation(line: 37, column: 15, scope: !51)
!80 = !DILocation(line: 39, column: 21, scope: !51)
!81 = !DILocation(line: 39, column: 3, scope: !51)
!82 = !DILocation(line: 40, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !51, file: !2, line: 40, column: 7)
!84 = !DILocation(line: 40, column: 12, scope: !83)
!85 = !DILocation(line: 40, column: 7, scope: !51)
!86 = !DILocation(line: 41, column: 15, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !2, line: 40, column: 18)
!88 = !DILocation(line: 41, column: 5, scope: !87)
!89 = !DILocation(line: 42, column: 5, scope: !87)
!90 = !DILocation(line: 43, column: 3, scope: !87)
!91 = !DILocation(line: 44, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !51, file: !2, line: 44, column: 7)
!93 = !DILocation(line: 44, column: 12, scope: !92)
!94 = !DILocation(line: 44, column: 7, scope: !51)
!95 = !DILocation(line: 45, column: 39, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 44, column: 18)
!97 = !DILocation(line: 45, column: 24, scope: !96)
!98 = !DILocation(line: 47, column: 5, scope: !96)
!99 = !DILocation(line: 48, column: 24, scope: !96)
!100 = !DILocation(line: 48, column: 31, scope: !96)
!101 = !DILocation(line: 49, column: 5, scope: !96)
!102 = !DILocation(line: 50, column: 3, scope: !96)
!103 = !DILocalVariable(name: "freed_size", scope: !51, file: !2, line: 51, type: !24)
!104 = !DILocation(line: 51, column: 7, scope: !51)
!105 = !DILocation(line: 52, column: 21, scope: !51)
!106 = !DILocation(line: 52, column: 3, scope: !51)
!107 = !DILocation(line: 53, column: 8, scope: !51)
!108 = !DILocation(line: 53, column: 3, scope: !51)
!109 = !DILocation(line: 54, column: 8, scope: !51)
!110 = !DILocation(line: 54, column: 3, scope: !51)
!111 = !DILocation(line: 55, column: 7, scope: !112)
!112 = distinct !DILexicalBlock(scope: !51, file: !2, line: 55, column: 7)
!113 = !DILocation(line: 55, column: 12, scope: !112)
!114 = !DILocation(line: 55, column: 7, scope: !51)
!115 = !DILocation(line: 56, column: 5, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !2, line: 55, column: 18)
!117 = !DILocation(line: 57, column: 3, scope: !116)
!118 = !DILocation(line: 59, column: 3, scope: !51)
!119 = !DILocation(line: 60, column: 41, scope: !51)
!120 = !DILocation(line: 60, column: 3, scope: !51)
!121 = !DILocation(line: 61, column: 3, scope: !51)
