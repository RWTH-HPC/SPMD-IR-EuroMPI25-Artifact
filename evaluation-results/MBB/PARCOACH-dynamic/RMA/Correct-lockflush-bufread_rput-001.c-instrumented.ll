; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@1 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@2 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@3 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@4 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@5 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@6 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@7 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@8 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@9 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1
@10 = private unnamed_addr constant [89 x i8] c"cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !58 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !64, metadata !DIExpression()), !dbg !65
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %6, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, ptr %6, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata ptr %7, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, ptr %7, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata ptr %8, metadata !72, metadata !DIExpression()), !dbg !73
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !73
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !74
  %13 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !75
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !76
  %15 = load i32, ptr %6, align 4, !dbg !77
  %16 = icmp slt i32 %15, 2, !dbg !79
  br i1 %16, label %17, label %19, !dbg !80

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !81
  br label %19, !dbg !81

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !82, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata ptr %10, metadata !87, metadata !DIExpression()), !dbg !88
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !89
  store ptr %20, ptr %10, align 8, !dbg !88
  %21 = load ptr, ptr %10, align 8, !dbg !90
  %22 = call i32 @parcoach_rma_MPI_Win_create(ptr %21, i64 80, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, i32 38, ptr @0), !dbg !91
  %23 = load i32, ptr %7, align 4, !dbg !92
  %24 = icmp eq i32 %23, 0, !dbg !94
  br i1 %24, label %25, label %39, !dbg !95

25:                                               ; preds = %19
  %26 = load ptr, ptr %9, align 8, !dbg !96
  %27 = call i32 @parcoach_rma_MPI_Win_lock(i32 1, i32 1, i32 0, ptr %26, i32 41, ptr @1), !dbg !98
  call void @llvm.dbg.declare(metadata ptr %11, metadata !99, metadata !DIExpression()), !dbg !100
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !101
  call void @parcoach_rma_store(ptr %11, i64 64, i32 43, ptr @2), !dbg !100
  store ptr %28, ptr %11, align 8, !dbg !100
  call void @parcoach_rma_load(ptr %11, i64 64, i32 45, ptr @3), !dbg !102
  %29 = load ptr, ptr %11, align 8, !dbg !102
  %30 = getelementptr inbounds i32, ptr %29, i64 0, !dbg !102
  call void @parcoach_rma_load(ptr %30, i64 32, i32 45, ptr @4), !dbg !102
  %31 = load i32, ptr %30, align 4, !dbg !102
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %31), !dbg !103
  call void @parcoach_rma_load(ptr %11, i64 64, i32 46, ptr @5), !dbg !104
  %33 = load ptr, ptr %11, align 8, !dbg !104
  call void @parcoach_rma_load(ptr %9, i64 64, i32 46, ptr @6), !dbg !105
  %34 = load ptr, ptr %9, align 8, !dbg !105
  %35 = call i32 @MPI_Rput(ptr noundef %33, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 10, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %34, ptr noundef %8), !dbg !106
  call void @parcoach_rma_load(ptr %9, i64 64, i32 47, ptr @7), !dbg !107
  %36 = load ptr, ptr %9, align 8, !dbg !107
  %37 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, ptr %36, i32 47, ptr @8), !dbg !108
  %38 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !109
  br label %39, !dbg !110

39:                                               ; preds = %25, %19
  %40 = call i32 @parcoach_rma_MPI_Win_free(ptr %9, i32 50, ptr @9), !dbg !111
  %41 = call i32 @MPI_Finalize(), !dbg !112
  call void @parcoach_rma_load(ptr %7, i64 32, i32 53, ptr @10), !dbg !113
  %42 = load i32, ptr %7, align 4, !dbg !113
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %42), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Win_create(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Rput(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!49, !50, !51, !52, !53, !54, !55, !56}
!llvm.ident = !{!57}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "495bb3845bdd47ce6b3d678b458e5355")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 45, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !48, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-bufread_rput-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "495bb3845bdd47ce6b3d678b458e5355")
!19 = !{!20, !24, !25, !28, !30, !33, !36}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !21, line: 426, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !21, line: 426, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !21, line: 428, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !21, line: 438, size: 192, elements: !39)
!39 = !{!40, !41, !42, !43, !44}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !38, file: !21, line: 441, baseType: !29, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !38, file: !21, line: 442, baseType: !29, size: 32, offset: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !38, file: !21, line: 443, baseType: !29, size: 32, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !38, file: !21, line: 448, baseType: !29, size: 32, offset: 96)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !38, file: !21, line: 449, baseType: !45, size: 64, offset: 128)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !{!0, !7, !12}
!49 = !{i32 7, !"Dwarf Version", i32 5}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{i32 1, !"wchar_size", i32 4}
!52 = !{i32 7, !"openmp", i32 50}
!53 = !{i32 7, !"PIC Level", i32 2}
!54 = !{i32 7, !"PIE Level", i32 2}
!55 = !{i32 7, !"uwtable", i32 2}
!56 = !{i32 7, !"frame-pointer", i32 2}
!57 = !{!"Debian clang version 15.0.6"}
!58 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !59, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !63)
!59 = !DISubroutineType(types: !60)
!60 = !{!29, !29, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!63 = !{}
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !2, line: 22, type: !29)
!65 = !DILocation(line: 22, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !2, line: 22, type: !61)
!67 = !DILocation(line: 22, column: 27, scope: !58)
!68 = !DILocalVariable(name: "nprocs", scope: !58, file: !2, line: 23, type: !29)
!69 = !DILocation(line: 23, column: 7, scope: !58)
!70 = !DILocalVariable(name: "rank", scope: !58, file: !2, line: 24, type: !29)
!71 = !DILocation(line: 24, column: 7, scope: !58)
!72 = !DILocalVariable(name: "mpi_request_0", scope: !58, file: !2, line: 25, type: !20)
!73 = !DILocation(line: 25, column: 15, scope: !58)
!74 = !DILocation(line: 27, column: 3, scope: !58)
!75 = !DILocation(line: 28, column: 3, scope: !58)
!76 = !DILocation(line: 29, column: 3, scope: !58)
!77 = !DILocation(line: 30, column: 7, scope: !78)
!78 = distinct !DILexicalBlock(scope: !58, file: !2, line: 30, column: 7)
!79 = !DILocation(line: 30, column: 14, scope: !78)
!80 = !DILocation(line: 30, column: 7, scope: !58)
!81 = !DILocation(line: 31, column: 5, scope: !78)
!82 = !DILocalVariable(name: "mpi_win_0", scope: !58, file: !2, line: 34, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !84)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!86 = !DILocation(line: 34, column: 11, scope: !58)
!87 = !DILocalVariable(name: "winbuf", scope: !58, file: !2, line: 36, type: !28)
!88 = !DILocation(line: 36, column: 8, scope: !58)
!89 = !DILocation(line: 36, column: 24, scope: !58)
!90 = !DILocation(line: 38, column: 18, scope: !58)
!91 = !DILocation(line: 38, column: 3, scope: !58)
!92 = !DILocation(line: 40, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !58, file: !2, line: 40, column: 7)
!94 = !DILocation(line: 40, column: 12, scope: !93)
!95 = !DILocation(line: 40, column: 7, scope: !58)
!96 = !DILocation(line: 41, column: 44, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !2, line: 40, column: 18)
!98 = !DILocation(line: 41, column: 5, scope: !97)
!99 = !DILocalVariable(name: "buf", scope: !97, file: !2, line: 43, type: !28)
!100 = !DILocation(line: 43, column: 10, scope: !97)
!101 = !DILocation(line: 43, column: 23, scope: !97)
!102 = !DILocation(line: 45, column: 27, scope: !97)
!103 = !DILocation(line: 45, column: 5, scope: !97)
!104 = !DILocation(line: 46, column: 14, scope: !97)
!105 = !DILocation(line: 46, column: 52, scope: !97)
!106 = !DILocation(line: 46, column: 5, scope: !97)
!107 = !DILocation(line: 47, column: 23, scope: !97)
!108 = !DILocation(line: 47, column: 5, scope: !97)
!109 = !DILocation(line: 48, column: 5, scope: !97)
!110 = !DILocation(line: 49, column: 3, scope: !97)
!111 = !DILocation(line: 50, column: 3, scope: !58)
!112 = !DILocation(line: 52, column: 3, scope: !58)
!113 = !DILocation(line: 53, column: 41, scope: !58)
!114 = !DILocation(line: 53, column: 3, scope: !58)
!115 = !DILocation(line: 54, column: 3, scope: !58)
