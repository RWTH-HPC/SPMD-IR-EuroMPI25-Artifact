; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-rput_put-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-rput_put-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !41 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !47, metadata !DIExpression()), !dbg !48
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata ptr %6, metadata !51, metadata !DIExpression()), !dbg !52
  store i32 -1, ptr %6, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata ptr %7, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 -1, ptr %7, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %8, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 738197504, ptr %8, align 4, !dbg !56
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !57
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !58
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !59
  %15 = load i32, ptr %6, align 4, !dbg !60
  %16 = icmp slt i32 %15, 2, !dbg !62
  br i1 %16, label %17, label %19, !dbg !63

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !64
  br label %19, !dbg !64

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !65, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %10, metadata !68, metadata !DIExpression()), !dbg !69
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !70
  store ptr %20, ptr %10, align 8, !dbg !69
  %21 = load ptr, ptr %10, align 8, !dbg !71
  %22 = call i32 @MPI_Win_create(ptr noundef %21, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9), !dbg !72
  %23 = load i32, ptr %9, align 4, !dbg !73
  %24 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %23), !dbg !74
  %25 = load i32, ptr %7, align 4, !dbg !75
  %26 = icmp eq i32 %25, 0, !dbg !77
  br i1 %26, label %27, label %35, !dbg !78

27:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %11, metadata !79, metadata !DIExpression()), !dbg !81
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !82
  store ptr %28, ptr %11, align 8, !dbg !81
  %29 = load ptr, ptr %11, align 8, !dbg !83
  %30 = load i32, ptr %9, align 4, !dbg !84
  %31 = call i32 @MPI_Rput(ptr noundef %29, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef %30, ptr noundef %8), !dbg !85
  %32 = load ptr, ptr %11, align 8, !dbg !86
  %33 = load i32, ptr %9, align 4, !dbg !87
  %34 = call i32 @MPI_Put(ptr noundef %32, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef %33), !dbg !88
  br label %35, !dbg !89

35:                                               ; preds = %27, %19
  %36 = load i32, ptr %9, align 4, !dbg !90
  %37 = call i32 @MPI_Win_fence(i32 noundef 0, i32 noundef %36), !dbg !91
  %38 = load i32, ptr %7, align 4, !dbg !92
  %39 = icmp eq i32 %38, 0, !dbg !94
  br i1 %39, label %40, label %42, !dbg !95

40:                                               ; preds = %35
  %41 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !96
  br label %42, !dbg !98

42:                                               ; preds = %40, %35
  %43 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !99
  %44 = call i32 @MPI_Finalize(), !dbg !100
  %45 = load i32, ptr %7, align 4, !dbg !101
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %45), !dbg !102
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

declare i32 @MPI_Win_fence(i32 noundef, i32 noundef) #2

declare i32 @MPI_Rput(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-rput_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "dc46f103ce55de4fd52b2cf80af19c0b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-fence-rput_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "dc46f103ce55de4fd52b2cf80af19c0b")
!14 = !{!15, !18, !19, !20, !21, !22}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !25)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !24, file: !16, line: 588, baseType: !17, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !24, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !24, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !24, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !24, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!31 = !{!0, !7}
!32 = !{i32 7, !"Dwarf Version", i32 5}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"openmp", i32 50}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"PIE Level", i32 2}
!38 = !{i32 7, !"uwtable", i32 2}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = !{!"Debian clang version 15.0.6"}
!41 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !42, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !46)
!42 = !DISubroutineType(types: !43)
!43 = !{!17, !17, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !{}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !2, line: 22, type: !17)
!48 = !DILocation(line: 22, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !2, line: 22, type: !44)
!50 = !DILocation(line: 22, column: 27, scope: !41)
!51 = !DILocalVariable(name: "nprocs", scope: !41, file: !2, line: 23, type: !17)
!52 = !DILocation(line: 23, column: 7, scope: !41)
!53 = !DILocalVariable(name: "rank", scope: !41, file: !2, line: 24, type: !17)
!54 = !DILocation(line: 24, column: 7, scope: !41)
!55 = !DILocalVariable(name: "mpi_request_0", scope: !41, file: !2, line: 25, type: !15)
!56 = !DILocation(line: 25, column: 15, scope: !41)
!57 = !DILocation(line: 27, column: 3, scope: !41)
!58 = !DILocation(line: 28, column: 3, scope: !41)
!59 = !DILocation(line: 29, column: 3, scope: !41)
!60 = !DILocation(line: 30, column: 7, scope: !61)
!61 = distinct !DILexicalBlock(scope: !41, file: !2, line: 30, column: 7)
!62 = !DILocation(line: 30, column: 14, scope: !61)
!63 = !DILocation(line: 30, column: 7, scope: !41)
!64 = !DILocation(line: 31, column: 5, scope: !61)
!65 = !DILocalVariable(name: "mpi_win_0", scope: !41, file: !2, line: 34, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!67 = !DILocation(line: 34, column: 11, scope: !41)
!68 = !DILocalVariable(name: "winbuf", scope: !41, file: !2, line: 36, type: !19)
!69 = !DILocation(line: 36, column: 8, scope: !41)
!70 = !DILocation(line: 36, column: 24, scope: !41)
!71 = !DILocation(line: 38, column: 18, scope: !41)
!72 = !DILocation(line: 38, column: 3, scope: !41)
!73 = !DILocation(line: 40, column: 20, scope: !41)
!74 = !DILocation(line: 40, column: 3, scope: !41)
!75 = !DILocation(line: 41, column: 7, scope: !76)
!76 = distinct !DILexicalBlock(scope: !41, file: !2, line: 41, column: 7)
!77 = !DILocation(line: 41, column: 12, scope: !76)
!78 = !DILocation(line: 41, column: 7, scope: !41)
!79 = !DILocalVariable(name: "buf", scope: !80, file: !2, line: 43, type: !19)
!80 = distinct !DILexicalBlock(scope: !76, file: !2, line: 41, column: 18)
!81 = !DILocation(line: 43, column: 10, scope: !80)
!82 = !DILocation(line: 43, column: 23, scope: !80)
!83 = !DILocation(line: 45, column: 14, scope: !80)
!84 = !DILocation(line: 45, column: 51, scope: !80)
!85 = !DILocation(line: 45, column: 5, scope: !80)
!86 = !DILocation(line: 46, column: 13, scope: !80)
!87 = !DILocation(line: 46, column: 50, scope: !80)
!88 = !DILocation(line: 46, column: 5, scope: !80)
!89 = !DILocation(line: 47, column: 3, scope: !80)
!90 = !DILocation(line: 48, column: 20, scope: !41)
!91 = !DILocation(line: 48, column: 3, scope: !41)
!92 = !DILocation(line: 49, column: 7, scope: !93)
!93 = distinct !DILexicalBlock(scope: !41, file: !2, line: 49, column: 7)
!94 = !DILocation(line: 49, column: 12, scope: !93)
!95 = !DILocation(line: 49, column: 7, scope: !41)
!96 = !DILocation(line: 50, column: 5, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !2, line: 49, column: 18)
!98 = !DILocation(line: 51, column: 3, scope: !97)
!99 = !DILocation(line: 52, column: 3, scope: !41)
!100 = !DILocation(line: 54, column: 3, scope: !41)
!101 = !DILocation(line: 55, column: 41, scope: !41)
!102 = !DILocation(line: 55, column: 3, scope: !41)
!103 = !DILocation(line: 56, column: 3, scope: !41)
