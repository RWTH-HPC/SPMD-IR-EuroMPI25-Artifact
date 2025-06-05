; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-rget_bufread-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-rget_bufread-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !46 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !52, metadata !DIExpression()), !dbg !53
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata ptr %6, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 -1, ptr %6, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %7, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 -1, ptr %7, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %8, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 738197504, ptr %8, align 4, !dbg !61
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !62
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !63
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !64
  %15 = load i32, ptr %6, align 4, !dbg !65
  %16 = icmp slt i32 %15, 2, !dbg !67
  br i1 %16, label %17, label %19, !dbg !68

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !69
  br label %19, !dbg !69

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %10, metadata !73, metadata !DIExpression()), !dbg !74
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !75
  store ptr %20, ptr %10, align 8, !dbg !74
  %21 = load ptr, ptr %10, align 8, !dbg !76
  %22 = call i32 @MPI_Win_create(ptr noundef %21, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9), !dbg !77
  %23 = load i32, ptr %7, align 4, !dbg !78
  %24 = icmp eq i32 %23, 0, !dbg !80
  br i1 %24, label %25, label %41, !dbg !81

25:                                               ; preds = %19
  %26 = load i32, ptr %9, align 4, !dbg !82
  %27 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %26), !dbg !84
  call void @llvm.dbg.declare(metadata ptr %11, metadata !85, metadata !DIExpression()), !dbg !86
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !87
  store ptr %28, ptr %11, align 8, !dbg !86
  %29 = load ptr, ptr %11, align 8, !dbg !88
  %30 = load i32, ptr %9, align 4, !dbg !89
  %31 = call i32 @MPI_Rget(ptr noundef %29, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef %30, ptr noundef %8), !dbg !90
  %32 = load i32, ptr %9, align 4, !dbg !91
  %33 = call i32 @MPI_Win_flush(i32 noundef 1, i32 noundef %32), !dbg !92
  %34 = load ptr, ptr %11, align 8, !dbg !93
  %35 = getelementptr inbounds i32, ptr %34, i64 0, !dbg !93
  %36 = load i32, ptr %35, align 4, !dbg !93
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36), !dbg !94
  %38 = load i32, ptr %9, align 4, !dbg !95
  %39 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %38), !dbg !96
  %40 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !97
  br label %41, !dbg !98

41:                                               ; preds = %25, %19
  %42 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !99
  %43 = call i32 @MPI_Finalize(), !dbg !100
  %44 = load i32, ptr %7, align 4, !dbg !101
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %44), !dbg !102
  ret i32 0, !dbg !103
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

declare i32 @MPI_Rget(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_flush(i32 noundef, i32 noundef) #2

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
!llvm.module.flags = !{!37, !38, !39, !40, !41, !42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-rget_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "be8378d54bc2f9abf6f76f3144d58c57")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 47, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 54, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !36, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockflush-rget_bufread-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "be8378d54bc2f9abf6f76f3144d58c57")
!19 = !{!20, !23, !24, !25, !26, !27}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !21, line: 451, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !21, line: 278, baseType: !22)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !21, line: 528, baseType: !22)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !21, line: 104, baseType: !22)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !21, line: 593, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !21, line: 587, size: 160, elements: !30)
!30 = !{!31, !32, !33, !34, !35}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !29, file: !21, line: 588, baseType: !22, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !29, file: !21, line: 589, baseType: !22, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !29, file: !21, line: 590, baseType: !22, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !29, file: !21, line: 591, baseType: !22, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !29, file: !21, line: 592, baseType: !22, size: 32, offset: 128)
!36 = !{!0, !7, !12}
!37 = !{i32 7, !"Dwarf Version", i32 5}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"openmp", i32 50}
!41 = !{i32 7, !"PIC Level", i32 2}
!42 = !{i32 7, !"PIE Level", i32 2}
!43 = !{i32 7, !"uwtable", i32 2}
!44 = !{i32 7, !"frame-pointer", i32 2}
!45 = !{!"Debian clang version 15.0.6"}
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !47, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !51)
!47 = !DISubroutineType(types: !48)
!48 = !{!22, !22, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !{}
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 22, type: !22)
!53 = !DILocation(line: 22, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 22, type: !49)
!55 = !DILocation(line: 22, column: 27, scope: !46)
!56 = !DILocalVariable(name: "nprocs", scope: !46, file: !2, line: 23, type: !22)
!57 = !DILocation(line: 23, column: 7, scope: !46)
!58 = !DILocalVariable(name: "rank", scope: !46, file: !2, line: 24, type: !22)
!59 = !DILocation(line: 24, column: 7, scope: !46)
!60 = !DILocalVariable(name: "mpi_request_0", scope: !46, file: !2, line: 25, type: !20)
!61 = !DILocation(line: 25, column: 15, scope: !46)
!62 = !DILocation(line: 27, column: 3, scope: !46)
!63 = !DILocation(line: 28, column: 3, scope: !46)
!64 = !DILocation(line: 29, column: 3, scope: !46)
!65 = !DILocation(line: 30, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !46, file: !2, line: 30, column: 7)
!67 = !DILocation(line: 30, column: 14, scope: !66)
!68 = !DILocation(line: 30, column: 7, scope: !46)
!69 = !DILocation(line: 31, column: 5, scope: !66)
!70 = !DILocalVariable(name: "mpi_win_0", scope: !46, file: !2, line: 34, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!72 = !DILocation(line: 34, column: 11, scope: !46)
!73 = !DILocalVariable(name: "winbuf", scope: !46, file: !2, line: 36, type: !24)
!74 = !DILocation(line: 36, column: 8, scope: !46)
!75 = !DILocation(line: 36, column: 24, scope: !46)
!76 = !DILocation(line: 38, column: 18, scope: !46)
!77 = !DILocation(line: 38, column: 3, scope: !46)
!78 = !DILocation(line: 40, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !46, file: !2, line: 40, column: 7)
!80 = !DILocation(line: 40, column: 12, scope: !79)
!81 = !DILocation(line: 40, column: 7, scope: !46)
!82 = !DILocation(line: 41, column: 44, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 40, column: 18)
!84 = !DILocation(line: 41, column: 5, scope: !83)
!85 = !DILocalVariable(name: "buf", scope: !83, file: !2, line: 43, type: !24)
!86 = !DILocation(line: 43, column: 10, scope: !83)
!87 = !DILocation(line: 43, column: 23, scope: !83)
!88 = !DILocation(line: 45, column: 14, scope: !83)
!89 = !DILocation(line: 45, column: 51, scope: !83)
!90 = !DILocation(line: 45, column: 5, scope: !83)
!91 = !DILocation(line: 46, column: 22, scope: !83)
!92 = !DILocation(line: 46, column: 5, scope: !83)
!93 = !DILocation(line: 47, column: 27, scope: !83)
!94 = !DILocation(line: 47, column: 5, scope: !83)
!95 = !DILocation(line: 48, column: 23, scope: !83)
!96 = !DILocation(line: 48, column: 5, scope: !83)
!97 = !DILocation(line: 49, column: 5, scope: !83)
!98 = !DILocation(line: 50, column: 3, scope: !83)
!99 = !DILocation(line: 51, column: 3, scope: !46)
!100 = !DILocation(line: 53, column: 3, scope: !46)
!101 = !DILocation(line: 54, column: 41, scope: !46)
!102 = !DILocation(line: 54, column: 3, scope: !46)
!103 = !DILocation(line: 55, column: 3, scope: !46)
