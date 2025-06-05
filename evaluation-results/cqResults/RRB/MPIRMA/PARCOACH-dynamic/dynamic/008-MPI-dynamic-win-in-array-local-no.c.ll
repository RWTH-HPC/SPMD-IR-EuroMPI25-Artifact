; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/008-MPI-dynamic-win-in-array-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/008-MPI-dynamic-win-in-array-local-no.c"
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
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [2 x ptr], align 16
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
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
  %18 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %19 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %10, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 1, ptr %10, align 4, !dbg !54
  %20 = load i32, ptr %4, align 4, !dbg !55
  %21 = icmp sgt i32 %20, 1, !dbg !57
  br i1 %21, label %22, label %27, !dbg !58

22:                                               ; preds = %2
  %23 = load ptr, ptr %5, align 8, !dbg !59
  %24 = getelementptr inbounds ptr, ptr %23, i64 1, !dbg !59
  %25 = load ptr, ptr %24, align 8, !dbg !59
  %26 = call i32 @atoi(ptr noundef %25) #4, !dbg !61
  store i32 %26, ptr %10, align 4, !dbg !62
  br label %27, !dbg !63

27:                                               ; preds = %22, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata ptr %12, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %13, metadata !71, metadata !DIExpression()), !dbg !75
  %28 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 0, !dbg !76
  %29 = load ptr, ptr %11, align 8, !dbg !77
  store ptr %29, ptr %28, align 8, !dbg !76
  %30 = getelementptr inbounds ptr, ptr %28, i64 1, !dbg !76
  %31 = load ptr, ptr %12, align 8, !dbg !78
  store ptr %31, ptr %30, align 8, !dbg !76
  %32 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 0, !dbg !79
  %33 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %7, ptr noundef %32), !dbg !80
  %34 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 1, !dbg !81
  %35 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %8, ptr noundef %34), !dbg !82
  call void @llvm.dbg.declare(metadata ptr %14, metadata !83, metadata !DIExpression()), !dbg !85
  store i32 0, ptr %14, align 4, !dbg !85
  br label %36, !dbg !86

36:                                               ; preds = %52, %27
  %37 = load i32, ptr %14, align 4, !dbg !87
  %38 = icmp slt i32 %37, 100, !dbg !89
  br i1 %38, label %39, label %55, !dbg !90

39:                                               ; preds = %36
  %40 = load i32, ptr %14, align 4, !dbg !91
  %41 = load i32, ptr %6, align 4, !dbg !93
  %42 = add nsw i32 %41, 1, !dbg !94
  %43 = mul nsw i32 %40, %42, !dbg !95
  %44 = load ptr, ptr %7, align 8, !dbg !96
  %45 = load i32, ptr %14, align 4, !dbg !97
  %46 = sext i32 %45 to i64, !dbg !96
  %47 = getelementptr inbounds i32, ptr %44, i64 %46, !dbg !96
  store i32 %43, ptr %47, align 4, !dbg !98
  %48 = load ptr, ptr %8, align 8, !dbg !99
  %49 = load i32, ptr %14, align 4, !dbg !100
  %50 = sext i32 %49 to i64, !dbg !99
  %51 = getelementptr inbounds i32, ptr %48, i64 %50, !dbg !99
  store i32 0, ptr %51, align 4, !dbg !101
  br label %52, !dbg !102

52:                                               ; preds = %39
  %53 = load i32, ptr %14, align 4, !dbg !103
  %54 = add nsw i32 %53, 1, !dbg !103
  store i32 %54, ptr %14, align 4, !dbg !103
  br label %36, !dbg !104, !llvm.loop !105

55:                                               ; preds = %36
  %56 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 0, !dbg !108
  %57 = load ptr, ptr %56, align 16, !dbg !108
  %58 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %57), !dbg !109
  %59 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 1, !dbg !110
  %60 = load ptr, ptr %59, align 8, !dbg !110
  %61 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %60), !dbg !111
  %62 = load i32, ptr %6, align 4, !dbg !112
  %63 = icmp eq i32 %62, 0, !dbg !114
  br i1 %63, label %64, label %91, !dbg !115

64:                                               ; preds = %55
  %65 = load ptr, ptr %8, align 8, !dbg !116
  %66 = load i32, ptr %9, align 4, !dbg !118
  %67 = load i32, ptr %9, align 4, !dbg !119
  %68 = load i32, ptr %10, align 4, !dbg !120
  %69 = sub nsw i32 1, %68, !dbg !121
  %70 = sext i32 %69 to i64, !dbg !122
  %71 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 %70, !dbg !122
  %72 = load ptr, ptr %71, align 8, !dbg !122
  %73 = call i32 @MPI_Get(ptr noundef %65, i32 noundef %66, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef %67, ptr noundef @ompi_mpi_int, ptr noundef %72), !dbg !123
  %74 = load i32, ptr %10, align 4, !dbg !124
  %75 = sub nsw i32 1, %74, !dbg !125
  %76 = sext i32 %75 to i64, !dbg !126
  %77 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 %76, !dbg !126
  %78 = load ptr, ptr %77, align 8, !dbg !126
  %79 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %78), !dbg !127
  %80 = load ptr, ptr %8, align 8, !dbg !128
  %81 = load i32, ptr %9, align 4, !dbg !129
  %82 = load i32, ptr %9, align 4, !dbg !130
  %83 = sext i32 %82 to i64, !dbg !130
  %84 = load i32, ptr %9, align 4, !dbg !131
  %85 = load i32, ptr %10, align 4, !dbg !132
  %86 = sub nsw i32 1, %85, !dbg !133
  %87 = sext i32 %86 to i64, !dbg !134
  %88 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 %87, !dbg !134
  %89 = load ptr, ptr %88, align 8, !dbg !134
  %90 = call i32 @MPI_Get(ptr noundef %80, i32 noundef %81, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef %83, i32 noundef %84, ptr noundef @ompi_mpi_int, ptr noundef %89), !dbg !135
  br label %98, !dbg !136

91:                                               ; preds = %55
  %92 = load i32, ptr %10, align 4, !dbg !137
  %93 = sub nsw i32 1, %92, !dbg !139
  %94 = sext i32 %93 to i64, !dbg !140
  %95 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 %94, !dbg !140
  %96 = load ptr, ptr %95, align 8, !dbg !140
  %97 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %96), !dbg !141
  br label %98

98:                                               ; preds = %91, %64
  %99 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 0, !dbg !142
  %100 = load ptr, ptr %99, align 16, !dbg !142
  %101 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %100), !dbg !143
  %102 = getelementptr inbounds [2 x ptr], ptr %13, i64 0, i64 1, !dbg !144
  %103 = load ptr, ptr %102, align 8, !dbg !144
  %104 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %103), !dbg !145
  %105 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !146
  call void @llvm.dbg.declare(metadata ptr %15, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 0, ptr %15, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata ptr %16, metadata !149, metadata !DIExpression()), !dbg !150
  store i32 0, ptr %16, align 4, !dbg !150
  call void @llvm.dbg.declare(metadata ptr %17, metadata !151, metadata !DIExpression()), !dbg !153
  store i32 0, ptr %17, align 4, !dbg !153
  br label %106, !dbg !154

106:                                              ; preds = %124, %98
  %107 = load i32, ptr %17, align 4, !dbg !155
  %108 = icmp slt i32 %107, 100, !dbg !157
  br i1 %108, label %109, label %127, !dbg !158

109:                                              ; preds = %106
  %110 = load ptr, ptr %7, align 8, !dbg !159
  %111 = load i32, ptr %17, align 4, !dbg !161
  %112 = sext i32 %111 to i64, !dbg !159
  %113 = getelementptr inbounds i32, ptr %110, i64 %112, !dbg !159
  %114 = load i32, ptr %113, align 4, !dbg !159
  %115 = load i32, ptr %15, align 4, !dbg !162
  %116 = add nsw i32 %115, %114, !dbg !162
  store i32 %116, ptr %15, align 4, !dbg !162
  %117 = load ptr, ptr %8, align 8, !dbg !163
  %118 = load i32, ptr %17, align 4, !dbg !164
  %119 = sext i32 %118 to i64, !dbg !163
  %120 = getelementptr inbounds i32, ptr %117, i64 %119, !dbg !163
  %121 = load i32, ptr %120, align 4, !dbg !163
  %122 = load i32, ptr %16, align 4, !dbg !165
  %123 = add nsw i32 %122, %121, !dbg !165
  store i32 %123, ptr %16, align 4, !dbg !165
  br label %124, !dbg !166

124:                                              ; preds = %109
  %125 = load i32, ptr %17, align 4, !dbg !167
  %126 = add nsw i32 %125, 1, !dbg !167
  store i32 %126, ptr %17, align 4, !dbg !167
  br label %106, !dbg !168, !llvm.loop !169

127:                                              ; preds = %106
  %128 = load i32, ptr %6, align 4, !dbg !171
  %129 = load i32, ptr %15, align 4, !dbg !172
  %130 = load i32, ptr %16, align 4, !dbg !173
  %131 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %128, i32 noundef %129, i32 noundef %130), !dbg !174
  %132 = call i32 @MPI_Finalize(), !dbg !175
  ret i32 0, !dbg !176
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #3

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 57, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/008-MPI-dynamic-win-in-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "597bd5647cb417fecfb98c2bd7d8d30b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, globals: !21, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-dynamic/dynamic/008-MPI-dynamic-win-in-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "597bd5647cb417fecfb98c2bd7d8d30b")
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
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !32, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !37)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 13, type: !34)
!39 = !DILocation(line: 13, column: 14, scope: !31)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 13, type: !35)
!41 = !DILocation(line: 13, column: 27, scope: !31)
!42 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 14, type: !34)
!43 = !DILocation(line: 14, column: 9, scope: !31)
!44 = !DILocalVariable(name: "arr0", scope: !31, file: !2, line: 15, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!46 = !DILocation(line: 15, column: 10, scope: !31)
!47 = !DILocalVariable(name: "arr1", scope: !31, file: !2, line: 15, type: !45)
!48 = !DILocation(line: 15, column: 17, scope: !31)
!49 = !DILocalVariable(name: "packet_size", scope: !31, file: !2, line: 16, type: !34)
!50 = !DILocation(line: 16, column: 9, scope: !31)
!51 = !DILocation(line: 18, column: 5, scope: !31)
!52 = !DILocation(line: 19, column: 5, scope: !31)
!53 = !DILocalVariable(name: "ctrl", scope: !31, file: !2, line: 21, type: !34)
!54 = !DILocation(line: 21, column: 9, scope: !31)
!55 = !DILocation(line: 22, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !31, file: !2, line: 22, column: 9)
!57 = !DILocation(line: 22, column: 14, scope: !56)
!58 = !DILocation(line: 22, column: 9, scope: !31)
!59 = !DILocation(line: 23, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !2, line: 22, column: 19)
!61 = !DILocation(line: 23, column: 16, scope: !60)
!62 = !DILocation(line: 23, column: 14, scope: !60)
!63 = !DILocation(line: 24, column: 5, scope: !60)
!64 = !DILocalVariable(name: "win0", scope: !31, file: !2, line: 26, type: !65)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !11, line: 429, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !11, line: 429, flags: DIFlagFwdDecl)
!68 = !DILocation(line: 26, column: 13, scope: !31)
!69 = !DILocalVariable(name: "win1", scope: !31, file: !2, line: 26, type: !65)
!70 = !DILocation(line: 26, column: 19, scope: !31)
!71 = !DILocalVariable(name: "wins", scope: !31, file: !2, line: 27, type: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 128, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 2)
!75 = !DILocation(line: 27, column: 13, scope: !31)
!76 = !DILocation(line: 27, column: 23, scope: !31)
!77 = !DILocation(line: 27, column: 24, scope: !31)
!78 = !DILocation(line: 27, column: 30, scope: !31)
!79 = !DILocation(line: 28, column: 98, scope: !31)
!80 = !DILocation(line: 28, column: 5, scope: !31)
!81 = !DILocation(line: 29, column: 98, scope: !31)
!82 = !DILocation(line: 29, column: 5, scope: !31)
!83 = !DILocalVariable(name: "i", scope: !84, file: !2, line: 30, type: !34)
!84 = distinct !DILexicalBlock(scope: !31, file: !2, line: 30, column: 5)
!85 = !DILocation(line: 30, column: 14, scope: !84)
!86 = !DILocation(line: 30, column: 10, scope: !84)
!87 = !DILocation(line: 30, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !2, line: 30, column: 5)
!89 = !DILocation(line: 30, column: 23, scope: !88)
!90 = !DILocation(line: 30, column: 5, scope: !84)
!91 = !DILocation(line: 31, column: 19, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 30, column: 40)
!93 = !DILocation(line: 31, column: 24, scope: !92)
!94 = !DILocation(line: 31, column: 29, scope: !92)
!95 = !DILocation(line: 31, column: 21, scope: !92)
!96 = !DILocation(line: 31, column: 9, scope: !92)
!97 = !DILocation(line: 31, column: 14, scope: !92)
!98 = !DILocation(line: 31, column: 17, scope: !92)
!99 = !DILocation(line: 32, column: 9, scope: !92)
!100 = !DILocation(line: 32, column: 14, scope: !92)
!101 = !DILocation(line: 32, column: 17, scope: !92)
!102 = !DILocation(line: 33, column: 5, scope: !92)
!103 = !DILocation(line: 30, column: 36, scope: !88)
!104 = !DILocation(line: 30, column: 5, scope: !88)
!105 = distinct !{!105, !90, !106, !107}
!106 = !DILocation(line: 33, column: 5, scope: !84)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 35, column: 22, scope: !31)
!109 = !DILocation(line: 35, column: 5, scope: !31)
!110 = !DILocation(line: 36, column: 22, scope: !31)
!111 = !DILocation(line: 36, column: 5, scope: !31)
!112 = !DILocation(line: 38, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !31, file: !2, line: 38, column: 9)
!114 = !DILocation(line: 38, column: 14, scope: !113)
!115 = !DILocation(line: 38, column: 9, scope: !31)
!116 = !DILocation(line: 39, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !2, line: 38, column: 20)
!118 = !DILocation(line: 39, column: 23, scope: !117)
!119 = !DILocation(line: 39, column: 51, scope: !117)
!120 = !DILocation(line: 39, column: 82, scope: !117)
!121 = !DILocation(line: 39, column: 80, scope: !117)
!122 = !DILocation(line: 39, column: 73, scope: !117)
!123 = !DILocation(line: 39, column: 9, scope: !117)
!124 = !DILocation(line: 40, column: 35, scope: !117)
!125 = !DILocation(line: 40, column: 33, scope: !117)
!126 = !DILocation(line: 40, column: 26, scope: !117)
!127 = !DILocation(line: 40, column: 9, scope: !117)
!128 = !DILocation(line: 41, column: 17, scope: !117)
!129 = !DILocation(line: 41, column: 23, scope: !117)
!130 = !DILocation(line: 41, column: 48, scope: !117)
!131 = !DILocation(line: 41, column: 61, scope: !117)
!132 = !DILocation(line: 41, column: 92, scope: !117)
!133 = !DILocation(line: 41, column: 90, scope: !117)
!134 = !DILocation(line: 41, column: 83, scope: !117)
!135 = !DILocation(line: 41, column: 9, scope: !117)
!136 = !DILocation(line: 42, column: 5, scope: !117)
!137 = !DILocation(line: 43, column: 35, scope: !138)
!138 = distinct !DILexicalBlock(scope: !113, file: !2, line: 42, column: 12)
!139 = !DILocation(line: 43, column: 33, scope: !138)
!140 = !DILocation(line: 43, column: 26, scope: !138)
!141 = !DILocation(line: 43, column: 9, scope: !138)
!142 = !DILocation(line: 46, column: 22, scope: !31)
!143 = !DILocation(line: 46, column: 5, scope: !31)
!144 = !DILocation(line: 47, column: 22, scope: !31)
!145 = !DILocation(line: 47, column: 5, scope: !31)
!146 = !DILocation(line: 49, column: 5, scope: !31)
!147 = !DILocalVariable(name: "sum0", scope: !31, file: !2, line: 51, type: !34)
!148 = !DILocation(line: 51, column: 9, scope: !31)
!149 = !DILocalVariable(name: "sum1", scope: !31, file: !2, line: 52, type: !34)
!150 = !DILocation(line: 52, column: 9, scope: !31)
!151 = !DILocalVariable(name: "i", scope: !152, file: !2, line: 53, type: !34)
!152 = distinct !DILexicalBlock(scope: !31, file: !2, line: 53, column: 5)
!153 = !DILocation(line: 53, column: 14, scope: !152)
!154 = !DILocation(line: 53, column: 10, scope: !152)
!155 = !DILocation(line: 53, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !2, line: 53, column: 5)
!157 = !DILocation(line: 53, column: 23, scope: !156)
!158 = !DILocation(line: 53, column: 5, scope: !152)
!159 = !DILocation(line: 54, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !2, line: 53, column: 40)
!161 = !DILocation(line: 54, column: 22, scope: !160)
!162 = !DILocation(line: 54, column: 14, scope: !160)
!163 = !DILocation(line: 55, column: 17, scope: !160)
!164 = !DILocation(line: 55, column: 22, scope: !160)
!165 = !DILocation(line: 55, column: 14, scope: !160)
!166 = !DILocation(line: 56, column: 5, scope: !160)
!167 = !DILocation(line: 53, column: 36, scope: !156)
!168 = !DILocation(line: 53, column: 5, scope: !156)
!169 = distinct !{!169, !158, !170, !107}
!170 = !DILocation(line: 56, column: 5, scope: !152)
!171 = !DILocation(line: 57, column: 65, scope: !31)
!172 = !DILocation(line: 57, column: 71, scope: !31)
!173 = !DILocation(line: 57, column: 77, scope: !31)
!174 = !DILocation(line: 57, column: 5, scope: !31)
!175 = !DILocation(line: 59, column: 5, scope: !31)
!176 = !DILocation(line: 61, column: 5, scope: !31)
