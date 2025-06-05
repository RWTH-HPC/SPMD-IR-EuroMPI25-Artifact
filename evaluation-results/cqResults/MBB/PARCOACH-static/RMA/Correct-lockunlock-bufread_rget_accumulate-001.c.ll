; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-bufread_rget_accumulate-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-bufread_rget_accumulate-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !47 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !53, metadata !DIExpression()), !dbg !54
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %6, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 -1, ptr %6, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %7, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, ptr %7, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 738197504, ptr %8, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata ptr %9, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 0, ptr %9, align 4, !dbg !64
  %14 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !65
  %15 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !66
  %16 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !67
  %17 = load i32, ptr %6, align 4, !dbg !68
  %18 = icmp slt i32 %17, 2, !dbg !70
  br i1 %18, label %19, label %21, !dbg !71

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !72
  br label %21, !dbg !72

21:                                               ; preds = %19, %2
  call void @llvm.dbg.declare(metadata ptr %10, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata ptr %11, metadata !76, metadata !DIExpression()), !dbg !77
  %22 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !78
  store ptr %22, ptr %11, align 8, !dbg !77
  %23 = load ptr, ptr %11, align 8, !dbg !79
  %24 = call i32 @MPI_Win_create(ptr noundef %23, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %10), !dbg !80
  %25 = load i32, ptr %7, align 4, !dbg !81
  %26 = icmp eq i32 %25, 0, !dbg !83
  br i1 %26, label %27, label %43, !dbg !84

27:                                               ; preds = %21
  %28 = load i32, ptr %10, align 4, !dbg !85
  %29 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %28), !dbg !87
  call void @llvm.dbg.declare(metadata ptr %12, metadata !88, metadata !DIExpression()), !dbg !89
  %30 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !90
  store ptr %30, ptr %12, align 8, !dbg !89
  %31 = load ptr, ptr %12, align 8, !dbg !91
  %32 = getelementptr inbounds i32, ptr %31, i64 0, !dbg !91
  %33 = load i32, ptr %32, align 4, !dbg !91
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %33), !dbg !92
  call void @llvm.dbg.declare(metadata ptr %13, metadata !93, metadata !DIExpression()), !dbg !94
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !95
  store ptr %35, ptr %13, align 8, !dbg !94
  %36 = load ptr, ptr %12, align 8, !dbg !96
  %37 = load ptr, ptr %13, align 8, !dbg !97
  %38 = load i32, ptr %10, align 4, !dbg !98
  %39 = call i32 @MPI_Rget_accumulate(ptr noundef %36, i32 noundef 10, i32 noundef 1275069445, ptr noundef %37, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %38, ptr noundef %8), !dbg !99
  %40 = load i32, ptr %10, align 4, !dbg !100
  %41 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %40), !dbg !101
  %42 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !102
  br label %43, !dbg !103

43:                                               ; preds = %27, %21
  %44 = call i32 @MPI_Win_free(ptr noundef %10), !dbg !104
  %45 = call i32 @MPI_Finalize(), !dbg !105
  %46 = load i32, ptr %7, align 4, !dbg !106
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %46), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Win_create(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_lock(i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!38, !39, !40, !41, !42, !43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-bufread_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7bbb4269aff7252f82a6443b32fb35a2")
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
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 58, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !37, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-bufread_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7bbb4269aff7252f82a6443b32fb35a2")
!19 = !{!20, !23, !24, !25, !26, !27, !28}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !21, line: 451, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !21, line: 303, baseType: !22)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !21, line: 593, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !21, line: 587, size: 160, elements: !31)
!31 = !{!32, !33, !34, !35, !36}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !30, file: !21, line: 588, baseType: !22, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !30, file: !21, line: 589, baseType: !22, size: 32, offset: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !30, file: !21, line: 590, baseType: !22, size: 32, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !30, file: !21, line: 591, baseType: !22, size: 32, offset: 96)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !30, file: !21, line: 592, baseType: !22, size: 32, offset: 128)
!37 = !{!0, !7, !12}
!38 = !{i32 7, !"Dwarf Version", i32 5}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"openmp", i32 50}
!42 = !{i32 7, !"PIC Level", i32 2}
!43 = !{i32 7, !"PIE Level", i32 2}
!44 = !{i32 7, !"uwtable", i32 2}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = !{!"Debian clang version 15.0.6"}
!47 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !48, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !52)
!48 = !DISubroutineType(types: !49)
!49 = !{!22, !22, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !{}
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !2, line: 22, type: !22)
!54 = !DILocation(line: 22, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !2, line: 22, type: !50)
!56 = !DILocation(line: 22, column: 27, scope: !47)
!57 = !DILocalVariable(name: "nprocs", scope: !47, file: !2, line: 23, type: !22)
!58 = !DILocation(line: 23, column: 7, scope: !47)
!59 = !DILocalVariable(name: "rank", scope: !47, file: !2, line: 24, type: !22)
!60 = !DILocation(line: 24, column: 7, scope: !47)
!61 = !DILocalVariable(name: "mpi_request_0", scope: !47, file: !2, line: 25, type: !20)
!62 = !DILocation(line: 25, column: 15, scope: !47)
!63 = !DILocalVariable(name: "int_0", scope: !47, file: !2, line: 26, type: !22)
!64 = !DILocation(line: 26, column: 7, scope: !47)
!65 = !DILocation(line: 28, column: 3, scope: !47)
!66 = !DILocation(line: 29, column: 3, scope: !47)
!67 = !DILocation(line: 30, column: 3, scope: !47)
!68 = !DILocation(line: 31, column: 7, scope: !69)
!69 = distinct !DILexicalBlock(scope: !47, file: !2, line: 31, column: 7)
!70 = !DILocation(line: 31, column: 14, scope: !69)
!71 = !DILocation(line: 31, column: 7, scope: !47)
!72 = !DILocation(line: 32, column: 5, scope: !69)
!73 = !DILocalVariable(name: "mpi_win_0", scope: !47, file: !2, line: 35, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!75 = !DILocation(line: 35, column: 11, scope: !47)
!76 = !DILocalVariable(name: "winbuf", scope: !47, file: !2, line: 37, type: !24)
!77 = !DILocation(line: 37, column: 8, scope: !47)
!78 = !DILocation(line: 37, column: 24, scope: !47)
!79 = !DILocation(line: 39, column: 18, scope: !47)
!80 = !DILocation(line: 39, column: 3, scope: !47)
!81 = !DILocation(line: 41, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !47, file: !2, line: 41, column: 7)
!83 = !DILocation(line: 41, column: 12, scope: !82)
!84 = !DILocation(line: 41, column: 7, scope: !47)
!85 = !DILocation(line: 42, column: 44, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 41, column: 18)
!87 = !DILocation(line: 42, column: 5, scope: !86)
!88 = !DILocalVariable(name: "buf", scope: !86, file: !2, line: 44, type: !24)
!89 = !DILocation(line: 44, column: 10, scope: !86)
!90 = !DILocation(line: 44, column: 23, scope: !86)
!91 = !DILocation(line: 46, column: 27, scope: !86)
!92 = !DILocation(line: 46, column: 5, scope: !86)
!93 = !DILocalVariable(name: "int_0", scope: !86, file: !2, line: 48, type: !24)
!94 = !DILocation(line: 48, column: 10, scope: !86)
!95 = !DILocation(line: 48, column: 25, scope: !86)
!96 = !DILocation(line: 50, column: 25, scope: !86)
!97 = !DILocation(line: 50, column: 43, scope: !86)
!98 = !DILocation(line: 51, column: 43, scope: !86)
!99 = !DILocation(line: 50, column: 5, scope: !86)
!100 = !DILocation(line: 52, column: 23, scope: !86)
!101 = !DILocation(line: 52, column: 5, scope: !86)
!102 = !DILocation(line: 53, column: 5, scope: !86)
!103 = !DILocation(line: 54, column: 3, scope: !86)
!104 = !DILocation(line: 55, column: 3, scope: !47)
!105 = !DILocation(line: 57, column: 3, scope: !47)
!106 = !DILocation(line: 58, column: 41, scope: !47)
!107 = !DILocation(line: 58, column: 3, scope: !47)
!108 = !DILocation(line: 59, column: 3, scope: !47)
