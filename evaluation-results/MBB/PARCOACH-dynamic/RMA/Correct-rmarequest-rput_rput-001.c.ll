; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rput_rput-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rput_rput-001.c"
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
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %6, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 -1, ptr %6, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %7, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, ptr %7, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata ptr %8, metadata !67, metadata !DIExpression()), !dbg !68
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata ptr %9, metadata !69, metadata !DIExpression()), !dbg !70
  store ptr @ompi_request_null, ptr %9, align 8, !dbg !70
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !71
  %14 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !72
  %15 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !73
  %16 = load i32, ptr %6, align 4, !dbg !74
  %17 = icmp slt i32 %16, 2, !dbg !76
  br i1 %17, label %18, label %20, !dbg !77

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !78
  br label %20, !dbg !78

20:                                               ; preds = %18, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !79, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata ptr %11, metadata !84, metadata !DIExpression()), !dbg !85
  %21 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !86
  store ptr %21, ptr %11, align 8, !dbg !85
  %22 = load ptr, ptr %11, align 8, !dbg !87
  %23 = call i32 @MPI_Win_create(ptr noundef %22, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %10), !dbg !88
  %24 = load ptr, ptr %10, align 8, !dbg !89
  %25 = call i32 @MPI_Win_lock_all(i32 noundef 0, ptr noundef %24), !dbg !90
  %26 = load i32, ptr %7, align 4, !dbg !91
  %27 = icmp eq i32 %26, 0, !dbg !93
  br i1 %27, label %28, label %36, !dbg !94

28:                                               ; preds = %20
  call void @llvm.dbg.declare(metadata ptr %12, metadata !95, metadata !DIExpression()), !dbg !97
  %29 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !98
  store ptr %29, ptr %12, align 8, !dbg !97
  %30 = load ptr, ptr %12, align 8, !dbg !99
  %31 = load ptr, ptr %10, align 8, !dbg !100
  %32 = call i32 @MPI_Rput(ptr noundef %30, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %31, ptr noundef %8), !dbg !101
  %33 = load ptr, ptr %12, align 8, !dbg !102
  %34 = load ptr, ptr %10, align 8, !dbg !103
  %35 = call i32 @MPI_Rput(ptr noundef %33, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %34, ptr noundef %9), !dbg !104
  br label %36, !dbg !105

36:                                               ; preds = %28, %20
  %37 = load ptr, ptr %10, align 8, !dbg !106
  %38 = call i32 @MPI_Win_unlock_all(ptr noundef %37), !dbg !107
  %39 = load i32, ptr %7, align 4, !dbg !108
  %40 = icmp eq i32 %39, 0, !dbg !110
  br i1 %40, label %41, label %44, !dbg !111

41:                                               ; preds = %36
  %42 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !112
  %43 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !114
  br label %44, !dbg !115

44:                                               ; preds = %41, %36
  %45 = call i32 @MPI_Win_free(ptr noundef %10), !dbg !116
  %46 = call i32 @MPI_Finalize(), !dbg !117
  %47 = load i32, ptr %7, align 4, !dbg !118
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %47), !dbg !119
  ret i32 0, !dbg !120
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

declare i32 @MPI_Win_lock_all(i32 noundef, ptr noundef) #2

declare i32 @MPI_Rput(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!44, !45, !46, !47, !48, !49, !50, !51}
!llvm.ident = !{!52}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rput_rput-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "78e167d446bdf4c9b7dd679090af1676")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 57, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !43, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/RMA/Correct-rmarequest-rput_rput-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "78e167d446bdf4c9b7dd679090af1676")
!14 = !{!15, !19, !20, !23, !25, !28, !31}
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
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!30 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !34)
!34 = !{!35, !36, !37, !38, !39}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !33, file: !16, line: 441, baseType: !24, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !33, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !33, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !33, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !33, file: !16, line: 449, baseType: !40, size: 64, offset: 128)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !{!0, !7}
!44 = !{i32 7, !"Dwarf Version", i32 5}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"openmp", i32 50}
!48 = !{i32 7, !"PIC Level", i32 2}
!49 = !{i32 7, !"PIE Level", i32 2}
!50 = !{i32 7, !"uwtable", i32 2}
!51 = !{i32 7, !"frame-pointer", i32 2}
!52 = !{!"Debian clang version 15.0.6"}
!53 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !54, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !58)
!54 = !DISubroutineType(types: !55)
!55 = !{!24, !24, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !{}
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !2, line: 22, type: !24)
!60 = !DILocation(line: 22, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !2, line: 22, type: !56)
!62 = !DILocation(line: 22, column: 27, scope: !53)
!63 = !DILocalVariable(name: "nprocs", scope: !53, file: !2, line: 23, type: !24)
!64 = !DILocation(line: 23, column: 7, scope: !53)
!65 = !DILocalVariable(name: "rank", scope: !53, file: !2, line: 24, type: !24)
!66 = !DILocation(line: 24, column: 7, scope: !53)
!67 = !DILocalVariable(name: "mpi_request_0", scope: !53, file: !2, line: 25, type: !15)
!68 = !DILocation(line: 25, column: 15, scope: !53)
!69 = !DILocalVariable(name: "mpi_request_1", scope: !53, file: !2, line: 26, type: !15)
!70 = !DILocation(line: 26, column: 15, scope: !53)
!71 = !DILocation(line: 28, column: 3, scope: !53)
!72 = !DILocation(line: 29, column: 3, scope: !53)
!73 = !DILocation(line: 30, column: 3, scope: !53)
!74 = !DILocation(line: 31, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !53, file: !2, line: 31, column: 7)
!76 = !DILocation(line: 31, column: 14, scope: !75)
!77 = !DILocation(line: 31, column: 7, scope: !53)
!78 = !DILocation(line: 32, column: 5, scope: !75)
!79 = !DILocalVariable(name: "mpi_win_0", scope: !53, file: !2, line: 35, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!83 = !DILocation(line: 35, column: 11, scope: !53)
!84 = !DILocalVariable(name: "winbuf", scope: !53, file: !2, line: 37, type: !23)
!85 = !DILocation(line: 37, column: 8, scope: !53)
!86 = !DILocation(line: 37, column: 24, scope: !53)
!87 = !DILocation(line: 39, column: 18, scope: !53)
!88 = !DILocation(line: 39, column: 3, scope: !53)
!89 = !DILocation(line: 41, column: 23, scope: !53)
!90 = !DILocation(line: 41, column: 3, scope: !53)
!91 = !DILocation(line: 42, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !53, file: !2, line: 42, column: 7)
!93 = !DILocation(line: 42, column: 12, scope: !92)
!94 = !DILocation(line: 42, column: 7, scope: !53)
!95 = !DILocalVariable(name: "buf", scope: !96, file: !2, line: 44, type: !23)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 42, column: 18)
!97 = !DILocation(line: 44, column: 10, scope: !96)
!98 = !DILocation(line: 44, column: 23, scope: !96)
!99 = !DILocation(line: 46, column: 14, scope: !96)
!100 = !DILocation(line: 46, column: 51, scope: !96)
!101 = !DILocation(line: 46, column: 5, scope: !96)
!102 = !DILocation(line: 47, column: 14, scope: !96)
!103 = !DILocation(line: 47, column: 51, scope: !96)
!104 = !DILocation(line: 47, column: 5, scope: !96)
!105 = !DILocation(line: 48, column: 3, scope: !96)
!106 = !DILocation(line: 49, column: 22, scope: !53)
!107 = !DILocation(line: 49, column: 3, scope: !53)
!108 = !DILocation(line: 50, column: 7, scope: !109)
!109 = distinct !DILexicalBlock(scope: !53, file: !2, line: 50, column: 7)
!110 = !DILocation(line: 50, column: 12, scope: !109)
!111 = !DILocation(line: 50, column: 7, scope: !53)
!112 = !DILocation(line: 51, column: 5, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !2, line: 50, column: 18)
!114 = !DILocation(line: 52, column: 5, scope: !113)
!115 = !DILocation(line: 53, column: 3, scope: !113)
!116 = !DILocation(line: 54, column: 3, scope: !53)
!117 = !DILocation(line: 56, column: 3, scope: !53)
!118 = !DILocation(line: 57, column: 41, scope: !53)
!119 = !DILocation(line: 57, column: 3, scope: !53)
!120 = !DILocation(line: 58, column: 3, scope: !53)
