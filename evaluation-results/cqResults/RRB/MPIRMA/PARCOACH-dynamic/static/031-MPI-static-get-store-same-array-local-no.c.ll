; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/031-MPI-static-get-store-same-array-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/031-MPI-static-get-store-same-array-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [44 x i8] c"I have %d ranks. You should rerun with %d.\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"Process %d finished. Array element = %d.\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !36 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %13 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  %14 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !53
  %15 = load i32, ptr %7, align 4, !dbg !54
  %16 = icmp ne i32 %15, 2, !dbg !56
  br i1 %16, label %17, label %20, !dbg !57

17:                                               ; preds = %2
  %18 = load i32, ptr %7, align 4, !dbg !58
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18, i32 noundef 2), !dbg !60
  store i32 1, ptr %3, align 4, !dbg !61
  br label %55, !dbg !61

20:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %9, metadata !67, metadata !DIExpression()), !dbg !69
  %21 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %9, ptr noundef %8), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %10, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 25, ptr %10, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata ptr %11, metadata !73, metadata !DIExpression()), !dbg !74
  %22 = load ptr, ptr %9, align 8, !dbg !75
  %23 = getelementptr inbounds i32, ptr %22, i64 50, !dbg !76
  store ptr %23, ptr %11, align 8, !dbg !74
  %24 = load i32, ptr %6, align 4, !dbg !77
  %25 = icmp eq i32 %24, 0, !dbg !79
  br i1 %25, label %26, label %29, !dbg !80

26:                                               ; preds = %20
  %27 = load ptr, ptr %9, align 8, !dbg !81
  %28 = getelementptr inbounds i32, ptr %27, i64 0, !dbg !81
  store i32 0, ptr %28, align 4, !dbg !83
  br label %32, !dbg !84

29:                                               ; preds = %20
  %30 = load ptr, ptr %9, align 8, !dbg !85
  %31 = getelementptr inbounds i32, ptr %30, i64 0, !dbg !85
  store i32 1, ptr %31, align 4, !dbg !87
  br label %32

32:                                               ; preds = %29, %26
  %33 = load ptr, ptr %8, align 8, !dbg !88
  %34 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %33), !dbg !89
  %35 = load i32, ptr %6, align 4, !dbg !90
  %36 = icmp eq i32 %35, 0, !dbg !92
  br i1 %36, label %37, label %44, !dbg !93

37:                                               ; preds = %32
  %38 = load ptr, ptr %9, align 8, !dbg !94
  %39 = load i32, ptr %10, align 4, !dbg !96
  %40 = load ptr, ptr %8, align 8, !dbg !97
  %41 = call i32 @MPI_Get(ptr noundef %38, i32 noundef %39, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 1, ptr noundef @ompi_mpi_int, ptr noundef %40), !dbg !98
  %42 = load ptr, ptr %11, align 8, !dbg !99
  %43 = getelementptr inbounds i32, ptr %42, i64 0, !dbg !99
  store i32 3, ptr %43, align 4, !dbg !100
  br label %44, !dbg !101

44:                                               ; preds = %37, %32
  %45 = load ptr, ptr %8, align 8, !dbg !102
  %46 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %45), !dbg !103
  %47 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !104
  %48 = load i32, ptr %6, align 4, !dbg !105
  %49 = load ptr, ptr %9, align 8, !dbg !106
  %50 = getelementptr inbounds i32, ptr %49, i64 0, !dbg !106
  %51 = load i32, ptr %50, align 4, !dbg !106
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %48, i32 noundef %51), !dbg !107
  %53 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !108
  %54 = call i32 @MPI_Finalize(), !dbg !109
  store i32 0, ptr %3, align 4, !dbg !110
  br label %55, !dbg !110

55:                                               ; preds = %44, %17
  %56 = load i32, ptr %3, align 4, !dbg !111
  ret i32 %56, !dbg !111
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 21, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/031-MPI-static-get-store-same-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5731c954304c6e1c17f11d709be53aee")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 44)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 42)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/031-MPI-static-get-store-same-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "5731c954304c6e1c17f11d709be53aee")
!14 = !{!15, !19, !20, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!26 = !{!0, !7}
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"openmp", i32 50}
!31 = !{i32 7, !"PIC Level", i32 2}
!32 = !{i32 7, !"PIE Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Debian clang version 15.0.6"}
!36 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !37, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !42)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!42 = !{}
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !2, line: 12, type: !39)
!44 = !DILocation(line: 12, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !2, line: 12, type: !40)
!46 = !DILocation(line: 12, column: 27, scope: !36)
!47 = !DILocalVariable(name: "rank", scope: !36, file: !2, line: 13, type: !39)
!48 = !DILocation(line: 13, column: 9, scope: !36)
!49 = !DILocalVariable(name: "size", scope: !36, file: !2, line: 14, type: !39)
!50 = !DILocation(line: 14, column: 9, scope: !36)
!51 = !DILocation(line: 16, column: 5, scope: !36)
!52 = !DILocation(line: 17, column: 5, scope: !36)
!53 = !DILocation(line: 18, column: 5, scope: !36)
!54 = !DILocation(line: 20, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !36, file: !2, line: 20, column: 9)
!56 = !DILocation(line: 20, column: 14, scope: !55)
!57 = !DILocation(line: 20, column: 9, scope: !36)
!58 = !DILocation(line: 21, column: 64, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !2, line: 20, column: 27)
!60 = !DILocation(line: 21, column: 9, scope: !59)
!61 = !DILocation(line: 22, column: 9, scope: !59)
!62 = !DILocalVariable(name: "win", scope: !36, file: !2, line: 25, type: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!66 = !DILocation(line: 25, column: 13, scope: !36)
!67 = !DILocalVariable(name: "arr_base", scope: !36, file: !2, line: 26, type: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!69 = !DILocation(line: 26, column: 10, scope: !36)
!70 = !DILocation(line: 27, column: 5, scope: !36)
!71 = !DILocalVariable(name: "packet_size", scope: !36, file: !2, line: 29, type: !39)
!72 = !DILocation(line: 29, column: 9, scope: !36)
!73 = !DILocalVariable(name: "arr_midp", scope: !36, file: !2, line: 30, type: !68)
!74 = !DILocation(line: 30, column: 10, scope: !36)
!75 = !DILocation(line: 30, column: 21, scope: !36)
!76 = !DILocation(line: 30, column: 30, scope: !36)
!77 = !DILocation(line: 32, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !36, file: !2, line: 32, column: 9)
!79 = !DILocation(line: 32, column: 14, scope: !78)
!80 = !DILocation(line: 32, column: 9, scope: !36)
!81 = !DILocation(line: 33, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !2, line: 32, column: 20)
!83 = !DILocation(line: 33, column: 21, scope: !82)
!84 = !DILocation(line: 34, column: 5, scope: !82)
!85 = !DILocation(line: 35, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !2, line: 34, column: 12)
!87 = !DILocation(line: 35, column: 21, scope: !86)
!88 = !DILocation(line: 38, column: 22, scope: !36)
!89 = !DILocation(line: 38, column: 5, scope: !36)
!90 = !DILocation(line: 40, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !36, file: !2, line: 40, column: 9)
!92 = !DILocation(line: 40, column: 14, scope: !91)
!93 = !DILocation(line: 40, column: 9, scope: !36)
!94 = !DILocation(line: 42, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !2, line: 40, column: 20)
!96 = !DILocation(line: 42, column: 27, scope: !95)
!97 = !DILocation(line: 42, column: 67, scope: !95)
!98 = !DILocation(line: 42, column: 9, scope: !95)
!99 = !DILocation(line: 43, column: 9, scope: !95)
!100 = !DILocation(line: 43, column: 21, scope: !95)
!101 = !DILocation(line: 44, column: 5, scope: !95)
!102 = !DILocation(line: 46, column: 22, scope: !36)
!103 = !DILocation(line: 46, column: 5, scope: !36)
!104 = !DILocation(line: 48, column: 5, scope: !36)
!105 = !DILocation(line: 49, column: 58, scope: !36)
!106 = !DILocation(line: 49, column: 64, scope: !36)
!107 = !DILocation(line: 49, column: 5, scope: !36)
!108 = !DILocation(line: 51, column: 5, scope: !36)
!109 = !DILocation(line: 52, column: 5, scope: !36)
!110 = !DILocation(line: 54, column: 5, scope: !36)
!111 = !DILocation(line: 55, column: 1, scope: !36)
