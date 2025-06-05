; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/026-MPI-static-mult-win-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/026-MPI-static-mult-win-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Process %d finished. Sums: sum0 = %d, sum1 = %d\0A\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !31 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata ptr %8, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %9, metadata !49, metadata !DIExpression()), !dbg !50
  store i32 50, ptr %9, align 4, !dbg !50
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %10, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !59
  %18 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %7, ptr noundef %10), !dbg !60
  %19 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %8, ptr noundef %11), !dbg !61
  call void @llvm.dbg.declare(metadata ptr %12, metadata !62, metadata !DIExpression()), !dbg !64
  store i32 0, ptr %12, align 4, !dbg !64
  br label %20, !dbg !65

20:                                               ; preds = %36, %2
  %21 = load i32, ptr %12, align 4, !dbg !66
  %22 = icmp slt i32 %21, 100, !dbg !68
  br i1 %22, label %23, label %39, !dbg !69

23:                                               ; preds = %20
  %24 = load i32, ptr %12, align 4, !dbg !70
  %25 = load i32, ptr %6, align 4, !dbg !72
  %26 = add nsw i32 %25, 1, !dbg !73
  %27 = mul nsw i32 %24, %26, !dbg !74
  %28 = load ptr, ptr %7, align 8, !dbg !75
  %29 = load i32, ptr %12, align 4, !dbg !76
  %30 = sext i32 %29 to i64, !dbg !75
  %31 = getelementptr inbounds i32, ptr %28, i64 %30, !dbg !75
  store i32 %27, ptr %31, align 4, !dbg !77
  %32 = load ptr, ptr %8, align 8, !dbg !78
  %33 = load i32, ptr %12, align 4, !dbg !79
  %34 = sext i32 %33 to i64, !dbg !78
  %35 = getelementptr inbounds i32, ptr %32, i64 %34, !dbg !78
  store i32 0, ptr %35, align 4, !dbg !80
  br label %36, !dbg !81

36:                                               ; preds = %23
  %37 = load i32, ptr %12, align 4, !dbg !82
  %38 = add nsw i32 %37, 1, !dbg !82
  store i32 %38, ptr %12, align 4, !dbg !82
  br label %20, !dbg !83, !llvm.loop !84

39:                                               ; preds = %20
  %40 = load ptr, ptr %10, align 8, !dbg !87
  %41 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %40), !dbg !88
  %42 = load ptr, ptr %11, align 8, !dbg !89
  %43 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %42), !dbg !90
  %44 = load i32, ptr %6, align 4, !dbg !91
  %45 = icmp eq i32 %44, 0, !dbg !93
  br i1 %45, label %46, label %61, !dbg !94

46:                                               ; preds = %39
  %47 = load ptr, ptr %8, align 8, !dbg !95
  %48 = load i32, ptr %9, align 4, !dbg !97
  %49 = load i32, ptr %9, align 4, !dbg !98
  %50 = load ptr, ptr %10, align 8, !dbg !99
  %51 = call i32 @MPI_Get(ptr noundef %47, i32 noundef %48, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef %49, ptr noundef @ompi_mpi_int, ptr noundef %50), !dbg !100
  %52 = load ptr, ptr %10, align 8, !dbg !101
  %53 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %52), !dbg !102
  %54 = load ptr, ptr %8, align 8, !dbg !103
  %55 = load i32, ptr %9, align 4, !dbg !104
  %56 = load i32, ptr %9, align 4, !dbg !105
  %57 = sext i32 %56 to i64, !dbg !105
  %58 = load i32, ptr %9, align 4, !dbg !106
  %59 = load ptr, ptr %10, align 8, !dbg !107
  %60 = call i32 @MPI_Get(ptr noundef %54, i32 noundef %55, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef %57, i32 noundef %58, ptr noundef @ompi_mpi_int, ptr noundef %59), !dbg !108
  br label %61, !dbg !109

61:                                               ; preds = %46, %39
  %62 = load ptr, ptr %10, align 8, !dbg !110
  %63 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %62), !dbg !111
  %64 = load ptr, ptr %11, align 8, !dbg !112
  %65 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %64), !dbg !113
  %66 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !114
  call void @llvm.dbg.declare(metadata ptr %13, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, ptr %13, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata ptr %14, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, ptr %14, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata ptr %15, metadata !119, metadata !DIExpression()), !dbg !121
  store i32 0, ptr %15, align 4, !dbg !121
  br label %67, !dbg !122

67:                                               ; preds = %85, %61
  %68 = load i32, ptr %15, align 4, !dbg !123
  %69 = icmp slt i32 %68, 100, !dbg !125
  br i1 %69, label %70, label %88, !dbg !126

70:                                               ; preds = %67
  %71 = load ptr, ptr %7, align 8, !dbg !127
  %72 = load i32, ptr %15, align 4, !dbg !129
  %73 = sext i32 %72 to i64, !dbg !127
  %74 = getelementptr inbounds i32, ptr %71, i64 %73, !dbg !127
  %75 = load i32, ptr %74, align 4, !dbg !127
  %76 = load i32, ptr %13, align 4, !dbg !130
  %77 = add nsw i32 %76, %75, !dbg !130
  store i32 %77, ptr %13, align 4, !dbg !130
  %78 = load ptr, ptr %8, align 8, !dbg !131
  %79 = load i32, ptr %15, align 4, !dbg !132
  %80 = sext i32 %79 to i64, !dbg !131
  %81 = getelementptr inbounds i32, ptr %78, i64 %80, !dbg !131
  %82 = load i32, ptr %81, align 4, !dbg !131
  %83 = load i32, ptr %14, align 4, !dbg !133
  %84 = add nsw i32 %83, %82, !dbg !133
  store i32 %84, ptr %14, align 4, !dbg !133
  br label %85, !dbg !134

85:                                               ; preds = %70
  %86 = load i32, ptr %15, align 4, !dbg !135
  %87 = add nsw i32 %86, 1, !dbg !135
  store i32 %87, ptr %15, align 4, !dbg !135
  br label %67, !dbg !136, !llvm.loop !137

88:                                               ; preds = %67
  %89 = load i32, ptr %6, align 4, !dbg !139
  %90 = load i32, ptr %13, align 4, !dbg !140
  %91 = load i32, ptr %14, align 4, !dbg !141
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %89, i32 noundef %90, i32 noundef %91), !dbg !142
  %93 = call i32 @MPI_Finalize(), !dbg !143
  ret i32 0, !dbg !144
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/026-MPI-static-mult-win-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "61f5b11633293a2ea9159d004141f7a4")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, globals: !21, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/026-MPI-static-mult-win-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "61f5b11633293a2ea9159d004141f7a4")
!9 = !{!10, !14, !15, !18}
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !11, line: 419, baseType: !12)
!11 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !11, line: 419, flags: DIFlagFwdDecl)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !11, line: 424, baseType: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !11, line: 424, flags: DIFlagFwdDecl)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !11, line: 420, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !11, line: 420, flags: DIFlagFwdDecl)
!21 = !{!0}
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"openmp", i32 50}
!26 = !{i32 7, !"PIC Level", i32 2}
!27 = !{i32 7, !"PIE Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 2}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Debian clang version 15.0.6"}
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !32, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !37)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 12, type: !34)
!39 = !DILocation(line: 12, column: 14, scope: !31)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 12, type: !35)
!41 = !DILocation(line: 12, column: 27, scope: !31)
!42 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 13, type: !34)
!43 = !DILocation(line: 13, column: 9, scope: !31)
!44 = !DILocalVariable(name: "arr0", scope: !31, file: !2, line: 14, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!46 = !DILocation(line: 14, column: 10, scope: !31)
!47 = !DILocalVariable(name: "arr1", scope: !31, file: !2, line: 14, type: !45)
!48 = !DILocation(line: 14, column: 17, scope: !31)
!49 = !DILocalVariable(name: "packet_size", scope: !31, file: !2, line: 15, type: !34)
!50 = !DILocation(line: 15, column: 9, scope: !31)
!51 = !DILocation(line: 17, column: 5, scope: !31)
!52 = !DILocation(line: 18, column: 5, scope: !31)
!53 = !DILocalVariable(name: "win0", scope: !31, file: !2, line: 20, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !11, line: 429, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !11, line: 429, flags: DIFlagFwdDecl)
!57 = !DILocation(line: 20, column: 13, scope: !31)
!58 = !DILocalVariable(name: "win1", scope: !31, file: !2, line: 20, type: !54)
!59 = !DILocation(line: 20, column: 19, scope: !31)
!60 = !DILocation(line: 21, column: 5, scope: !31)
!61 = !DILocation(line: 22, column: 5, scope: !31)
!62 = !DILocalVariable(name: "i", scope: !63, file: !2, line: 23, type: !34)
!63 = distinct !DILexicalBlock(scope: !31, file: !2, line: 23, column: 5)
!64 = !DILocation(line: 23, column: 14, scope: !63)
!65 = !DILocation(line: 23, column: 10, scope: !63)
!66 = !DILocation(line: 23, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !2, line: 23, column: 5)
!68 = !DILocation(line: 23, column: 23, scope: !67)
!69 = !DILocation(line: 23, column: 5, scope: !63)
!70 = !DILocation(line: 24, column: 19, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !2, line: 23, column: 40)
!72 = !DILocation(line: 24, column: 24, scope: !71)
!73 = !DILocation(line: 24, column: 29, scope: !71)
!74 = !DILocation(line: 24, column: 21, scope: !71)
!75 = !DILocation(line: 24, column: 9, scope: !71)
!76 = !DILocation(line: 24, column: 14, scope: !71)
!77 = !DILocation(line: 24, column: 17, scope: !71)
!78 = !DILocation(line: 25, column: 9, scope: !71)
!79 = !DILocation(line: 25, column: 14, scope: !71)
!80 = !DILocation(line: 25, column: 17, scope: !71)
!81 = !DILocation(line: 26, column: 5, scope: !71)
!82 = !DILocation(line: 23, column: 36, scope: !67)
!83 = !DILocation(line: 23, column: 5, scope: !67)
!84 = distinct !{!84, !69, !85, !86}
!85 = !DILocation(line: 26, column: 5, scope: !63)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 28, column: 22, scope: !31)
!88 = !DILocation(line: 28, column: 5, scope: !31)
!89 = !DILocation(line: 29, column: 22, scope: !31)
!90 = !DILocation(line: 29, column: 5, scope: !31)
!91 = !DILocation(line: 31, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !31, file: !2, line: 31, column: 9)
!93 = !DILocation(line: 31, column: 14, scope: !92)
!94 = !DILocation(line: 31, column: 9, scope: !31)
!95 = !DILocation(line: 33, column: 17, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !2, line: 31, column: 20)
!97 = !DILocation(line: 33, column: 23, scope: !96)
!98 = !DILocation(line: 33, column: 51, scope: !96)
!99 = !DILocation(line: 33, column: 73, scope: !96)
!100 = !DILocation(line: 33, column: 9, scope: !96)
!101 = !DILocation(line: 34, column: 26, scope: !96)
!102 = !DILocation(line: 34, column: 9, scope: !96)
!103 = !DILocation(line: 35, column: 17, scope: !96)
!104 = !DILocation(line: 35, column: 23, scope: !96)
!105 = !DILocation(line: 35, column: 48, scope: !96)
!106 = !DILocation(line: 35, column: 61, scope: !96)
!107 = !DILocation(line: 35, column: 83, scope: !96)
!108 = !DILocation(line: 35, column: 9, scope: !96)
!109 = !DILocation(line: 36, column: 5, scope: !96)
!110 = !DILocation(line: 38, column: 22, scope: !31)
!111 = !DILocation(line: 38, column: 5, scope: !31)
!112 = !DILocation(line: 39, column: 22, scope: !31)
!113 = !DILocation(line: 39, column: 5, scope: !31)
!114 = !DILocation(line: 41, column: 5, scope: !31)
!115 = !DILocalVariable(name: "sum0", scope: !31, file: !2, line: 43, type: !34)
!116 = !DILocation(line: 43, column: 9, scope: !31)
!117 = !DILocalVariable(name: "sum1", scope: !31, file: !2, line: 44, type: !34)
!118 = !DILocation(line: 44, column: 9, scope: !31)
!119 = !DILocalVariable(name: "i", scope: !120, file: !2, line: 45, type: !34)
!120 = distinct !DILexicalBlock(scope: !31, file: !2, line: 45, column: 5)
!121 = !DILocation(line: 45, column: 14, scope: !120)
!122 = !DILocation(line: 45, column: 10, scope: !120)
!123 = !DILocation(line: 45, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 45, column: 5)
!125 = !DILocation(line: 45, column: 23, scope: !124)
!126 = !DILocation(line: 45, column: 5, scope: !120)
!127 = !DILocation(line: 46, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !2, line: 45, column: 40)
!129 = !DILocation(line: 46, column: 22, scope: !128)
!130 = !DILocation(line: 46, column: 14, scope: !128)
!131 = !DILocation(line: 47, column: 17, scope: !128)
!132 = !DILocation(line: 47, column: 22, scope: !128)
!133 = !DILocation(line: 47, column: 14, scope: !128)
!134 = !DILocation(line: 48, column: 5, scope: !128)
!135 = !DILocation(line: 45, column: 36, scope: !124)
!136 = !DILocation(line: 45, column: 5, scope: !124)
!137 = distinct !{!137, !126, !138, !86}
!138 = !DILocation(line: 48, column: 5, scope: !120)
!139 = !DILocation(line: 49, column: 65, scope: !31)
!140 = !DILocation(line: 49, column: 71, scope: !31)
!141 = !DILocation(line: 49, column: 77, scope: !31)
!142 = !DILocation(line: 49, column: 5, scope: !31)
!143 = !DILocation(line: 51, column: 5, scope: !31)
!144 = !DILocation(line: 53, column: 5, scope: !31)
