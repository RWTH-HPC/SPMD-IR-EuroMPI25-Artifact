; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-get_bufread-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-get_bufread-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !43 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !49, metadata !DIExpression()), !dbg !50
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata ptr %6, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 -1, ptr %6, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %7, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 -1, ptr %7, align 4, !dbg !56
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !57
  %12 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !58
  %13 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !59
  %14 = load i32, ptr %6, align 4, !dbg !60
  %15 = icmp slt i32 %14, 2, !dbg !62
  br i1 %15, label %16, label %18, !dbg !63

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !64
  br label %18, !dbg !64

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !65, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata ptr %9, metadata !70, metadata !DIExpression()), !dbg !71
  %19 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !72
  store ptr %19, ptr %9, align 8, !dbg !71
  %20 = load ptr, ptr %9, align 8, !dbg !73
  %21 = call i32 @MPI_Win_create(ptr noundef %20, i64 noundef 80, i32 noundef 4, ptr noundef @ompi_mpi_info_null, ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !74
  %22 = load i32, ptr %7, align 4, !dbg !75
  %23 = icmp eq i32 %22, 0, !dbg !77
  br i1 %23, label %24, label %37, !dbg !78

24:                                               ; preds = %18
  %25 = load ptr, ptr %8, align 8, !dbg !79
  %26 = call i32 @MPI_Win_lock(i32 noundef 1, i32 noundef 1, i32 noundef 0, ptr noundef %25), !dbg !81
  call void @llvm.dbg.declare(metadata ptr %10, metadata !82, metadata !DIExpression()), !dbg !83
  %27 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !84
  store ptr %27, ptr %10, align 8, !dbg !83
  %28 = load ptr, ptr %10, align 8, !dbg !85
  %29 = load ptr, ptr %8, align 8, !dbg !86
  %30 = call i32 @MPI_Get(ptr noundef %28, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 1, i64 noundef 0, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %29), !dbg !87
  %31 = load ptr, ptr %8, align 8, !dbg !88
  %32 = call i32 @MPI_Win_unlock(i32 noundef 1, ptr noundef %31), !dbg !89
  %33 = load ptr, ptr %10, align 8, !dbg !90
  %34 = getelementptr inbounds i32, ptr %33, i64 0, !dbg !90
  %35 = load i32, ptr %34, align 4, !dbg !90
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %35), !dbg !91
  br label %37, !dbg !92

37:                                               ; preds = %24, %18
  %38 = call i32 @MPI_Win_free(ptr noundef %8), !dbg !93
  %39 = call i32 @MPI_Finalize(), !dbg !94
  %40 = load i32, ptr %7, align 4, !dbg !95
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %40), !dbg !96
  ret i32 0, !dbg !97
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

declare i32 @MPI_Get(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!34, !35, !36, !37, !38, !39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-get_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "4703d8e02360064f548f1fd0be651b54")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 51, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !33, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/RMA/Correct-lockunlock-get_bufread-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "4703d8e02360064f548f1fd0be651b54")
!19 = !{!20, !24, !25, !27, !30}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 419, baseType: !22)
!21 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !21, line: 419, flags: DIFlagFwdDecl)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 424, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !21, line: 424, flags: DIFlagFwdDecl)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 420, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !21, line: 420, flags: DIFlagFwdDecl)
!33 = !{!0, !7, !12}
!34 = !{i32 7, !"Dwarf Version", i32 5}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 7, !"openmp", i32 50}
!38 = !{i32 7, !"PIC Level", i32 2}
!39 = !{i32 7, !"PIE Level", i32 2}
!40 = !{i32 7, !"uwtable", i32 2}
!41 = !{i32 7, !"frame-pointer", i32 2}
!42 = !{!"Debian clang version 15.0.6"}
!43 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !44, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !48)
!44 = !DISubroutineType(types: !45)
!45 = !{!26, !26, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!48 = !{}
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !2, line: 22, type: !26)
!50 = !DILocation(line: 22, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !2, line: 22, type: !46)
!52 = !DILocation(line: 22, column: 27, scope: !43)
!53 = !DILocalVariable(name: "nprocs", scope: !43, file: !2, line: 23, type: !26)
!54 = !DILocation(line: 23, column: 7, scope: !43)
!55 = !DILocalVariable(name: "rank", scope: !43, file: !2, line: 24, type: !26)
!56 = !DILocation(line: 24, column: 7, scope: !43)
!57 = !DILocation(line: 26, column: 3, scope: !43)
!58 = !DILocation(line: 27, column: 3, scope: !43)
!59 = !DILocation(line: 28, column: 3, scope: !43)
!60 = !DILocation(line: 29, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !43, file: !2, line: 29, column: 7)
!62 = !DILocation(line: 29, column: 14, scope: !61)
!63 = !DILocation(line: 29, column: 7, scope: !43)
!64 = !DILocation(line: 30, column: 5, scope: !61)
!65 = !DILocalVariable(name: "mpi_win_0", scope: !43, file: !2, line: 33, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 429, baseType: !67)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !21, line: 429, flags: DIFlagFwdDecl)
!69 = !DILocation(line: 33, column: 11, scope: !43)
!70 = !DILocalVariable(name: "winbuf", scope: !43, file: !2, line: 35, type: !25)
!71 = !DILocation(line: 35, column: 8, scope: !43)
!72 = !DILocation(line: 35, column: 24, scope: !43)
!73 = !DILocation(line: 37, column: 18, scope: !43)
!74 = !DILocation(line: 37, column: 3, scope: !43)
!75 = !DILocation(line: 39, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !43, file: !2, line: 39, column: 7)
!77 = !DILocation(line: 39, column: 12, scope: !76)
!78 = !DILocation(line: 39, column: 7, scope: !43)
!79 = !DILocation(line: 40, column: 44, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !2, line: 39, column: 18)
!81 = !DILocation(line: 40, column: 5, scope: !80)
!82 = !DILocalVariable(name: "buf", scope: !80, file: !2, line: 42, type: !25)
!83 = !DILocation(line: 42, column: 10, scope: !80)
!84 = !DILocation(line: 42, column: 23, scope: !80)
!85 = !DILocation(line: 44, column: 13, scope: !80)
!86 = !DILocation(line: 44, column: 50, scope: !80)
!87 = !DILocation(line: 44, column: 5, scope: !80)
!88 = !DILocation(line: 45, column: 23, scope: !80)
!89 = !DILocation(line: 45, column: 5, scope: !80)
!90 = !DILocation(line: 46, column: 27, scope: !80)
!91 = !DILocation(line: 46, column: 5, scope: !80)
!92 = !DILocation(line: 47, column: 3, scope: !80)
!93 = !DILocation(line: 48, column: 3, scope: !43)
!94 = !DILocation(line: 50, column: 3, scope: !43)
!95 = !DILocation(line: 51, column: 41, scope: !43)
!96 = !DILocation(line: 51, column: 3, scope: !43)
!97 = !DILocation(line: 52, column: 3, scope: !43)
