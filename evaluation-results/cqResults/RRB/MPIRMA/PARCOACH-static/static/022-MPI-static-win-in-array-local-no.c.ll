; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/022-MPI-static-win-in-array-local-no.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/022-MPI-static-win-in-array-local-no.c"
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
  %12 = alloca [2 x ptr], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
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
  %17 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !51
  %18 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %10, metadata !53, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata ptr %11, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %12, metadata !60, metadata !DIExpression()), !dbg !64
  %19 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !65
  %20 = load ptr, ptr %10, align 8, !dbg !66
  store ptr %20, ptr %19, align 8, !dbg !65
  %21 = getelementptr inbounds ptr, ptr %19, i64 1, !dbg !65
  %22 = load ptr, ptr %11, align 8, !dbg !67
  store ptr %22, ptr %21, align 8, !dbg !65
  %23 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !68
  %24 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %7, ptr noundef %23), !dbg !69
  %25 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !70
  %26 = call i32 @MPI_Win_allocate(i64 noundef 400, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %8, ptr noundef %25), !dbg !71
  call void @llvm.dbg.declare(metadata ptr %13, metadata !72, metadata !DIExpression()), !dbg !74
  store i32 0, ptr %13, align 4, !dbg !74
  br label %27, !dbg !75

27:                                               ; preds = %43, %2
  %28 = load i32, ptr %13, align 4, !dbg !76
  %29 = icmp slt i32 %28, 100, !dbg !78
  br i1 %29, label %30, label %46, !dbg !79

30:                                               ; preds = %27
  %31 = load i32, ptr %13, align 4, !dbg !80
  %32 = load i32, ptr %6, align 4, !dbg !82
  %33 = add nsw i32 %32, 1, !dbg !83
  %34 = mul nsw i32 %31, %33, !dbg !84
  %35 = load ptr, ptr %7, align 8, !dbg !85
  %36 = load i32, ptr %13, align 4, !dbg !86
  %37 = sext i32 %36 to i64, !dbg !85
  %38 = getelementptr inbounds i32, ptr %35, i64 %37, !dbg !85
  store i32 %34, ptr %38, align 4, !dbg !87
  %39 = load ptr, ptr %8, align 8, !dbg !88
  %40 = load i32, ptr %13, align 4, !dbg !89
  %41 = sext i32 %40 to i64, !dbg !88
  %42 = getelementptr inbounds i32, ptr %39, i64 %41, !dbg !88
  store i32 0, ptr %42, align 4, !dbg !90
  br label %43, !dbg !91

43:                                               ; preds = %30
  %44 = load i32, ptr %13, align 4, !dbg !92
  %45 = add nsw i32 %44, 1, !dbg !92
  store i32 %45, ptr %13, align 4, !dbg !92
  br label %27, !dbg !93, !llvm.loop !94

46:                                               ; preds = %27
  %47 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !97
  %48 = load ptr, ptr %47, align 16, !dbg !97
  %49 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %48), !dbg !98
  %50 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !99
  %51 = load ptr, ptr %50, align 8, !dbg !99
  %52 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %51), !dbg !100
  %53 = load i32, ptr %6, align 4, !dbg !101
  %54 = icmp eq i32 %53, 0, !dbg !103
  br i1 %54, label %55, label %73, !dbg !104

55:                                               ; preds = %46
  %56 = load ptr, ptr %8, align 8, !dbg !105
  %57 = load i32, ptr %9, align 4, !dbg !107
  %58 = load i32, ptr %9, align 4, !dbg !108
  %59 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !109
  %60 = load ptr, ptr %59, align 16, !dbg !109
  %61 = call i32 @MPI_Get(ptr noundef %56, i32 noundef %57, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef %58, ptr noundef @ompi_mpi_int, ptr noundef %60), !dbg !110
  %62 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !111
  %63 = load ptr, ptr %62, align 16, !dbg !111
  %64 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %63), !dbg !112
  %65 = load ptr, ptr %8, align 8, !dbg !113
  %66 = load i32, ptr %9, align 4, !dbg !114
  %67 = load i32, ptr %9, align 4, !dbg !115
  %68 = sext i32 %67 to i64, !dbg !115
  %69 = load i32, ptr %9, align 4, !dbg !116
  %70 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !117
  %71 = load ptr, ptr %70, align 16, !dbg !117
  %72 = call i32 @MPI_Get(ptr noundef %65, i32 noundef %66, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef %68, i32 noundef %69, ptr noundef @ompi_mpi_int, ptr noundef %71), !dbg !118
  br label %73, !dbg !119

73:                                               ; preds = %55, %46
  %74 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !120
  %75 = load ptr, ptr %74, align 16, !dbg !120
  %76 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %75), !dbg !121
  %77 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !122
  %78 = load ptr, ptr %77, align 8, !dbg !122
  %79 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %78), !dbg !123
  %80 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 0, !dbg !124
  %81 = load ptr, ptr %80, align 16, !dbg !124
  %82 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %81), !dbg !125
  %83 = getelementptr inbounds [2 x ptr], ptr %12, i64 0, i64 1, !dbg !126
  %84 = load ptr, ptr %83, align 8, !dbg !126
  %85 = call i32 @MPI_Win_fence(i32 noundef 0, ptr noundef %84), !dbg !127
  %86 = call i32 @MPI_Barrier(ptr noundef @ompi_mpi_comm_world), !dbg !128
  call void @llvm.dbg.declare(metadata ptr %14, metadata !129, metadata !DIExpression()), !dbg !130
  store i32 0, ptr %14, align 4, !dbg !130
  call void @llvm.dbg.declare(metadata ptr %15, metadata !131, metadata !DIExpression()), !dbg !132
  store i32 0, ptr %15, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata ptr %16, metadata !133, metadata !DIExpression()), !dbg !135
  store i32 0, ptr %16, align 4, !dbg !135
  br label %87, !dbg !136

87:                                               ; preds = %105, %73
  %88 = load i32, ptr %16, align 4, !dbg !137
  %89 = icmp slt i32 %88, 100, !dbg !139
  br i1 %89, label %90, label %108, !dbg !140

90:                                               ; preds = %87
  %91 = load ptr, ptr %7, align 8, !dbg !141
  %92 = load i32, ptr %16, align 4, !dbg !143
  %93 = sext i32 %92 to i64, !dbg !141
  %94 = getelementptr inbounds i32, ptr %91, i64 %93, !dbg !141
  %95 = load i32, ptr %94, align 4, !dbg !141
  %96 = load i32, ptr %14, align 4, !dbg !144
  %97 = add nsw i32 %96, %95, !dbg !144
  store i32 %97, ptr %14, align 4, !dbg !144
  %98 = load ptr, ptr %8, align 8, !dbg !145
  %99 = load i32, ptr %16, align 4, !dbg !146
  %100 = sext i32 %99 to i64, !dbg !145
  %101 = getelementptr inbounds i32, ptr %98, i64 %100, !dbg !145
  %102 = load i32, ptr %101, align 4, !dbg !145
  %103 = load i32, ptr %15, align 4, !dbg !147
  %104 = add nsw i32 %103, %102, !dbg !147
  store i32 %104, ptr %15, align 4, !dbg !147
  br label %105, !dbg !148

105:                                              ; preds = %90
  %106 = load i32, ptr %16, align 4, !dbg !149
  %107 = add nsw i32 %106, 1, !dbg !149
  store i32 %107, ptr %16, align 4, !dbg !149
  br label %87, !dbg !150, !llvm.loop !151

108:                                              ; preds = %87
  %109 = load i32, ptr %6, align 4, !dbg !153
  %110 = load i32, ptr %14, align 4, !dbg !154
  %111 = load i32, ptr %15, align 4, !dbg !155
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %109, i32 noundef %110, i32 noundef %111), !dbg !156
  %113 = call i32 @MPI_Finalize(), !dbg !157
  ret i32 0, !dbg !158
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
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 52, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/022-MPI-static-win-in-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "af1a3581a9ae05461a68b5325ed84d93")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, globals: !21, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/static/022-MPI-static-win-in-array-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "af1a3581a9ae05461a68b5325ed84d93")
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
!31 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 11, type: !32, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !37)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !35}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !31, file: !2, line: 11, type: !34)
!39 = !DILocation(line: 11, column: 14, scope: !31)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !31, file: !2, line: 11, type: !35)
!41 = !DILocation(line: 11, column: 27, scope: !31)
!42 = !DILocalVariable(name: "rank", scope: !31, file: !2, line: 12, type: !34)
!43 = !DILocation(line: 12, column: 9, scope: !31)
!44 = !DILocalVariable(name: "arr0", scope: !31, file: !2, line: 13, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!46 = !DILocation(line: 13, column: 10, scope: !31)
!47 = !DILocalVariable(name: "arr1", scope: !31, file: !2, line: 13, type: !45)
!48 = !DILocation(line: 13, column: 17, scope: !31)
!49 = !DILocalVariable(name: "packet_size", scope: !31, file: !2, line: 14, type: !34)
!50 = !DILocation(line: 14, column: 9, scope: !31)
!51 = !DILocation(line: 16, column: 5, scope: !31)
!52 = !DILocation(line: 17, column: 5, scope: !31)
!53 = !DILocalVariable(name: "win0", scope: !31, file: !2, line: 19, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !11, line: 429, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !11, line: 429, flags: DIFlagFwdDecl)
!57 = !DILocation(line: 19, column: 13, scope: !31)
!58 = !DILocalVariable(name: "win1", scope: !31, file: !2, line: 19, type: !54)
!59 = !DILocation(line: 19, column: 19, scope: !31)
!60 = !DILocalVariable(name: "wins", scope: !31, file: !2, line: 20, type: !61)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !54, size: 128, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 2)
!64 = !DILocation(line: 20, column: 13, scope: !31)
!65 = !DILocation(line: 20, column: 23, scope: !31)
!66 = !DILocation(line: 20, column: 24, scope: !31)
!67 = !DILocation(line: 20, column: 30, scope: !31)
!68 = !DILocation(line: 21, column: 98, scope: !31)
!69 = !DILocation(line: 21, column: 5, scope: !31)
!70 = !DILocation(line: 22, column: 98, scope: !31)
!71 = !DILocation(line: 22, column: 5, scope: !31)
!72 = !DILocalVariable(name: "i", scope: !73, file: !2, line: 23, type: !34)
!73 = distinct !DILexicalBlock(scope: !31, file: !2, line: 23, column: 5)
!74 = !DILocation(line: 23, column: 14, scope: !73)
!75 = !DILocation(line: 23, column: 10, scope: !73)
!76 = !DILocation(line: 23, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 23, column: 5)
!78 = !DILocation(line: 23, column: 23, scope: !77)
!79 = !DILocation(line: 23, column: 5, scope: !73)
!80 = !DILocation(line: 24, column: 19, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !2, line: 23, column: 40)
!82 = !DILocation(line: 24, column: 24, scope: !81)
!83 = !DILocation(line: 24, column: 29, scope: !81)
!84 = !DILocation(line: 24, column: 21, scope: !81)
!85 = !DILocation(line: 24, column: 9, scope: !81)
!86 = !DILocation(line: 24, column: 14, scope: !81)
!87 = !DILocation(line: 24, column: 17, scope: !81)
!88 = !DILocation(line: 25, column: 9, scope: !81)
!89 = !DILocation(line: 25, column: 14, scope: !81)
!90 = !DILocation(line: 25, column: 17, scope: !81)
!91 = !DILocation(line: 26, column: 5, scope: !81)
!92 = !DILocation(line: 23, column: 36, scope: !77)
!93 = !DILocation(line: 23, column: 5, scope: !77)
!94 = distinct !{!94, !79, !95, !96}
!95 = !DILocation(line: 26, column: 5, scope: !73)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 28, column: 22, scope: !31)
!98 = !DILocation(line: 28, column: 5, scope: !31)
!99 = !DILocation(line: 29, column: 22, scope: !31)
!100 = !DILocation(line: 29, column: 5, scope: !31)
!101 = !DILocation(line: 31, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !31, file: !2, line: 31, column: 9)
!103 = !DILocation(line: 31, column: 14, scope: !102)
!104 = !DILocation(line: 31, column: 9, scope: !31)
!105 = !DILocation(line: 33, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !2, line: 31, column: 20)
!107 = !DILocation(line: 33, column: 23, scope: !106)
!108 = !DILocation(line: 33, column: 51, scope: !106)
!109 = !DILocation(line: 33, column: 73, scope: !106)
!110 = !DILocation(line: 33, column: 9, scope: !106)
!111 = !DILocation(line: 34, column: 26, scope: !106)
!112 = !DILocation(line: 34, column: 9, scope: !106)
!113 = !DILocation(line: 35, column: 17, scope: !106)
!114 = !DILocation(line: 35, column: 23, scope: !106)
!115 = !DILocation(line: 35, column: 48, scope: !106)
!116 = !DILocation(line: 35, column: 61, scope: !106)
!117 = !DILocation(line: 35, column: 83, scope: !106)
!118 = !DILocation(line: 35, column: 9, scope: !106)
!119 = !DILocation(line: 36, column: 5, scope: !106)
!120 = !DILocation(line: 38, column: 22, scope: !31)
!121 = !DILocation(line: 38, column: 5, scope: !31)
!122 = !DILocation(line: 39, column: 22, scope: !31)
!123 = !DILocation(line: 39, column: 5, scope: !31)
!124 = !DILocation(line: 41, column: 22, scope: !31)
!125 = !DILocation(line: 41, column: 5, scope: !31)
!126 = !DILocation(line: 42, column: 22, scope: !31)
!127 = !DILocation(line: 42, column: 5, scope: !31)
!128 = !DILocation(line: 44, column: 5, scope: !31)
!129 = !DILocalVariable(name: "sum0", scope: !31, file: !2, line: 46, type: !34)
!130 = !DILocation(line: 46, column: 9, scope: !31)
!131 = !DILocalVariable(name: "sum1", scope: !31, file: !2, line: 47, type: !34)
!132 = !DILocation(line: 47, column: 9, scope: !31)
!133 = !DILocalVariable(name: "i", scope: !134, file: !2, line: 48, type: !34)
!134 = distinct !DILexicalBlock(scope: !31, file: !2, line: 48, column: 5)
!135 = !DILocation(line: 48, column: 14, scope: !134)
!136 = !DILocation(line: 48, column: 10, scope: !134)
!137 = !DILocation(line: 48, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !2, line: 48, column: 5)
!139 = !DILocation(line: 48, column: 23, scope: !138)
!140 = !DILocation(line: 48, column: 5, scope: !134)
!141 = !DILocation(line: 49, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !2, line: 48, column: 40)
!143 = !DILocation(line: 49, column: 22, scope: !142)
!144 = !DILocation(line: 49, column: 14, scope: !142)
!145 = !DILocation(line: 50, column: 17, scope: !142)
!146 = !DILocation(line: 50, column: 22, scope: !142)
!147 = !DILocation(line: 50, column: 14, scope: !142)
!148 = !DILocation(line: 51, column: 5, scope: !142)
!149 = !DILocation(line: 48, column: 36, scope: !138)
!150 = !DILocation(line: 48, column: 5, scope: !138)
!151 = distinct !{!151, !140, !152, !96}
!152 = !DILocation(line: 51, column: 5, scope: !134)
!153 = !DILocation(line: 52, column: 65, scope: !31)
!154 = !DILocation(line: 52, column: 71, scope: !31)
!155 = !DILocation(line: 52, column: 77, scope: !31)
!156 = !DILocation(line: 52, column: 5, scope: !31)
!157 = !DILocation(line: 54, column: 5, scope: !31)
!158 = !DILocation(line: 56, column: 5, scope: !31)
