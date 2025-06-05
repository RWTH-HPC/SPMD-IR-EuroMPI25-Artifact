; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/038-MPI-static-loop-array-bounds-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/038-MPI-static-loop-array-bounds-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [44 x i8] c"I have %d ranks. You should rerun with %d.\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_float = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"Process %d finished. Array element = %f.\0A\00", align 1, !dbg !7

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
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !43, metadata !DIExpression()), !dbg !44
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %6, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !50
  %13 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  %15 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !53
  %16 = load i32, ptr %7, align 4, !dbg !54
  %17 = icmp ne i32 %16, 2, !dbg !56
  br i1 %17, label %18, label %21, !dbg !57

18:                                               ; preds = %2
  %19 = load i32, ptr %7, align 4, !dbg !58
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %19, i32 noundef 2), !dbg !60
  store i32 1, ptr %3, align 4, !dbg !61
  br label %67, !dbg !61

21:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !62, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata ptr %9, metadata !67, metadata !DIExpression()), !dbg !70
  %22 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %9, ptr noundef %8), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %10, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 25, ptr %10, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata ptr %11, metadata !74, metadata !DIExpression()), !dbg !75
  %23 = load ptr, ptr %9, align 8, !dbg !76
  %24 = getelementptr inbounds float, ptr %23, i64 50, !dbg !77
  store ptr %24, ptr %11, align 8, !dbg !75
  %25 = load i32, ptr %6, align 4, !dbg !78
  %26 = icmp eq i32 %25, 0, !dbg !80
  br i1 %26, label %27, label %30, !dbg !81

27:                                               ; preds = %21
  %28 = load ptr, ptr %9, align 8, !dbg !82
  %29 = getelementptr inbounds float, ptr %28, i64 0, !dbg !82
  store float 0.000000e+00, ptr %29, align 4, !dbg !84
  br label %33, !dbg !85

30:                                               ; preds = %21
  %31 = load ptr, ptr %9, align 8, !dbg !86
  %32 = getelementptr inbounds float, ptr %31, i64 0, !dbg !86
  store float 1.000000e+00, ptr %32, align 4, !dbg !88
  br label %33

33:                                               ; preds = %30, %27
  %34 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !89
  %35 = load i32, ptr %6, align 4, !dbg !90
  %36 = icmp eq i32 %35, 0, !dbg !92
  br i1 %36, label %37, label %55, !dbg !93

37:                                               ; preds = %33
  call void @llvm.dbg.declare(metadata ptr %12, metadata !94, metadata !DIExpression()), !dbg !97
  store i32 0, ptr %12, align 4, !dbg !97
  br label %38, !dbg !98

38:                                               ; preds = %49, %37
  %39 = load i32, ptr %12, align 4, !dbg !99
  %40 = load i32, ptr %10, align 4, !dbg !101
  %41 = icmp slt i32 %39, %40, !dbg !102
  br i1 %41, label %42, label %52, !dbg !103

42:                                               ; preds = %38
  %43 = load ptr, ptr %9, align 8, !dbg !104
  %44 = load i32, ptr %12, align 4, !dbg !105
  %45 = sext i32 %44 to i64, !dbg !106
  %46 = getelementptr inbounds float, ptr %43, i64 %45, !dbg !106
  %47 = load ptr, ptr %8, align 8, !dbg !107
  %48 = call i32 @MPI_Get(ptr noundef %46, i32 noundef 1, ptr noundef @ompi_mpi_float, i32 noundef 1, i64 noundef 0, i32 noundef 1, ptr noundef @ompi_mpi_float, ptr noundef %47), !dbg !108
  br label %49, !dbg !108

49:                                               ; preds = %42
  %50 = load i32, ptr %12, align 4, !dbg !109
  %51 = add nsw i32 %50, 1, !dbg !109
  store i32 %51, ptr %12, align 4, !dbg !109
  br label %38, !dbg !110, !llvm.loop !111

52:                                               ; preds = %38
  %53 = load ptr, ptr %11, align 8, !dbg !114
  %54 = getelementptr inbounds float, ptr %53, i64 0, !dbg !114
  store float 3.000000e+00, ptr %54, align 4, !dbg !115
  br label %55, !dbg !116

55:                                               ; preds = %52, %33
  %56 = load ptr, ptr %8, align 8, !dbg !117
  %57 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %56), !dbg !118
  %58 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !119
  %59 = load i32, ptr %6, align 4, !dbg !120
  %60 = load ptr, ptr %9, align 8, !dbg !121
  %61 = getelementptr inbounds float, ptr %60, i64 0, !dbg !121
  %62 = load float, ptr %61, align 4, !dbg !121
  %63 = fpext float %62 to double, !dbg !121
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %59, double noundef %63), !dbg !122
  %65 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !123
  %66 = call i32 @MPI_Finalize(), !dbg !124
  store i32 0, ptr %3, align 4, !dbg !125
  br label %67, !dbg !125

67:                                               ; preds = %55, %18
  %68 = load i32, ptr %3, align 4, !dbg !126
  ret i32 %68, !dbg !126
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

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
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/038-MPI-static-loop-array-bounds-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "33cc5b4c129be2ba89ddef84c80bb2c1")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 44)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 42)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !26, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/static/038-MPI-static-loop-array-bounds-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "33cc5b4c129be2ba89ddef84c80bb2c1")
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
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!70 = !DILocation(line: 26, column: 12, scope: !36)
!71 = !DILocation(line: 27, column: 5, scope: !36)
!72 = !DILocalVariable(name: "packet_size", scope: !36, file: !2, line: 29, type: !39)
!73 = !DILocation(line: 29, column: 9, scope: !36)
!74 = !DILocalVariable(name: "arr_midp", scope: !36, file: !2, line: 30, type: !68)
!75 = !DILocation(line: 30, column: 12, scope: !36)
!76 = !DILocation(line: 30, column: 23, scope: !36)
!77 = !DILocation(line: 30, column: 32, scope: !36)
!78 = !DILocation(line: 32, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !36, file: !2, line: 32, column: 9)
!80 = !DILocation(line: 32, column: 14, scope: !79)
!81 = !DILocation(line: 32, column: 9, scope: !36)
!82 = !DILocation(line: 33, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 32, column: 20)
!84 = !DILocation(line: 33, column: 21, scope: !83)
!85 = !DILocation(line: 34, column: 5, scope: !83)
!86 = !DILocation(line: 35, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !2, line: 34, column: 12)
!88 = !DILocation(line: 35, column: 21, scope: !87)
!89 = !DILocation(line: 38, column: 5, scope: !36)
!90 = !DILocation(line: 40, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !36, file: !2, line: 40, column: 9)
!92 = !DILocation(line: 40, column: 14, scope: !91)
!93 = !DILocation(line: 40, column: 9, scope: !36)
!94 = !DILocalVariable(name: "i", scope: !95, file: !2, line: 41, type: !39)
!95 = distinct !DILexicalBlock(scope: !96, file: !2, line: 41, column: 9)
!96 = distinct !DILexicalBlock(scope: !91, file: !2, line: 40, column: 20)
!97 = !DILocation(line: 41, column: 18, scope: !95)
!98 = !DILocation(line: 41, column: 14, scope: !95)
!99 = !DILocation(line: 41, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !2, line: 41, column: 9)
!101 = !DILocation(line: 41, column: 29, scope: !100)
!102 = !DILocation(line: 41, column: 27, scope: !100)
!103 = !DILocation(line: 41, column: 9, scope: !95)
!104 = !DILocation(line: 42, column: 21, scope: !100)
!105 = !DILocation(line: 42, column: 32, scope: !100)
!106 = !DILocation(line: 42, column: 30, scope: !100)
!107 = !DILocation(line: 42, column: 69, scope: !100)
!108 = !DILocation(line: 42, column: 13, scope: !100)
!109 = !DILocation(line: 41, column: 43, scope: !100)
!110 = !DILocation(line: 41, column: 9, scope: !100)
!111 = distinct !{!111, !103, !112, !113}
!112 = !DILocation(line: 42, column: 72, scope: !95)
!113 = !{!"llvm.loop.mustprogress"}
!114 = !DILocation(line: 43, column: 9, scope: !96)
!115 = !DILocation(line: 43, column: 21, scope: !96)
!116 = !DILocation(line: 44, column: 5, scope: !96)
!117 = !DILocation(line: 46, column: 22, scope: !36)
!118 = !DILocation(line: 46, column: 5, scope: !36)
!119 = !DILocation(line: 48, column: 5, scope: !36)
!120 = !DILocation(line: 50, column: 58, scope: !36)
!121 = !DILocation(line: 50, column: 64, scope: !36)
!122 = !DILocation(line: 50, column: 5, scope: !36)
!123 = !DILocation(line: 52, column: 5, scope: !36)
!124 = !DILocation(line: 53, column: 5, scope: !36)
!125 = !DILocation(line: 55, column: 5, scope: !36)
!126 = !DILocation(line: 56, column: 1, scope: !36)
