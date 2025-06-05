; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_put-001.c'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_put-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !42 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !48, metadata !DIExpression()), !dbg !49
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata ptr %6, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 -1, ptr %6, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata ptr %7, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 -1, ptr %7, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %8, metadata !56, metadata !DIExpression()), !dbg !57
  store i32 738197504, ptr %8, align 4, !dbg !57
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !58
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !59
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !60
  %15 = load i32, ptr %6, align 4, !dbg !61
  %16 = icmp slt i32 %15, 2, !dbg !63
  br i1 %16, label %17, label %19, !dbg !64

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !65
  br label %19, !dbg !65

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !66, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata ptr %10, metadata !69, metadata !DIExpression()), !dbg !70
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !71
  store ptr %20, ptr %10, align 8, !dbg !70
  %21 = load ptr, ptr %10, align 8, !dbg !72
  %22 = call i32 @MPI_Win_create(ptr noundef %21, i64 noundef 80, i32 noundef 4, i32 noundef 469762048, i32 noundef 1140850688, ptr noundef %9), !dbg !73
  %23 = load i32, ptr %7, align 4, !dbg !74
  %24 = icmp eq i32 %23, 0, !dbg !76
  br i1 %24, label %25, label %38, !dbg !77

25:                                               ; preds = %19
  %26 = load i32, ptr %9, align 4, !dbg !78
  %27 = call i32 @MPI_Win_lock(i32 noundef 234, i32 noundef 1, i32 noundef 0, i32 noundef %26), !dbg !80
  call void @llvm.dbg.declare(metadata ptr %11, metadata !81, metadata !DIExpression()), !dbg !82
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !83
  store ptr %28, ptr %11, align 8, !dbg !82
  %29 = load ptr, ptr %11, align 8, !dbg !84
  %30 = load i32, ptr %9, align 4, !dbg !85
  %31 = call i32 @MPI_Raccumulate(ptr noundef %29, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %30, ptr noundef %8), !dbg !86
  %32 = load ptr, ptr %11, align 8, !dbg !87
  %33 = load i32, ptr %9, align 4, !dbg !88
  %34 = call i32 @MPI_Put(ptr noundef %32, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef 10, i32 noundef 1275069445, i32 noundef %33), !dbg !89
  %35 = load i32, ptr %9, align 4, !dbg !90
  %36 = call i32 @MPI_Win_unlock(i32 noundef 1, i32 noundef %35), !dbg !91
  %37 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !92
  br label %38, !dbg !93

38:                                               ; preds = %25, %19
  %39 = call i32 @MPI_Win_free(ptr noundef %9), !dbg !94
  %40 = call i32 @MPI_Finalize(), !dbg !95
  %41 = load i32, ptr %7, align 4, !dbg !96
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %41), !dbg !97
  ret i32 0, !dbg !98
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

declare i32 @MPI_Raccumulate(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "57c19b9430fe1639d684d8863bcffa9c")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 54, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !32, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "57c19b9430fe1639d684d8863bcffa9c")
!14 = !{!15, !18, !19, !20, !21, !22, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !26)
!26 = !{!27, !28, !29, !30, !31}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !25, file: !16, line: 588, baseType: !17, size: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !25, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !25, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !25, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !25, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!32 = !{!0, !7}
!33 = !{i32 7, !"Dwarf Version", i32 5}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"openmp", i32 50}
!37 = !{i32 7, !"PIC Level", i32 2}
!38 = !{i32 7, !"PIE Level", i32 2}
!39 = !{i32 7, !"uwtable", i32 2}
!40 = !{i32 7, !"frame-pointer", i32 2}
!41 = !{!"Debian clang version 15.0.6"}
!42 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !43, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !47)
!43 = !DISubroutineType(types: !44)
!44 = !{!17, !17, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!47 = !{}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !2, line: 22, type: !17)
!49 = !DILocation(line: 22, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !2, line: 22, type: !45)
!51 = !DILocation(line: 22, column: 27, scope: !42)
!52 = !DILocalVariable(name: "nprocs", scope: !42, file: !2, line: 23, type: !17)
!53 = !DILocation(line: 23, column: 7, scope: !42)
!54 = !DILocalVariable(name: "rank", scope: !42, file: !2, line: 24, type: !17)
!55 = !DILocation(line: 24, column: 7, scope: !42)
!56 = !DILocalVariable(name: "mpi_request_0", scope: !42, file: !2, line: 25, type: !15)
!57 = !DILocation(line: 25, column: 15, scope: !42)
!58 = !DILocation(line: 27, column: 3, scope: !42)
!59 = !DILocation(line: 28, column: 3, scope: !42)
!60 = !DILocation(line: 29, column: 3, scope: !42)
!61 = !DILocation(line: 30, column: 7, scope: !62)
!62 = distinct !DILexicalBlock(scope: !42, file: !2, line: 30, column: 7)
!63 = !DILocation(line: 30, column: 14, scope: !62)
!64 = !DILocation(line: 30, column: 7, scope: !42)
!65 = !DILocation(line: 31, column: 5, scope: !62)
!66 = !DILocalVariable(name: "mpi_win_0", scope: !42, file: !2, line: 34, type: !67)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!68 = !DILocation(line: 34, column: 11, scope: !42)
!69 = !DILocalVariable(name: "winbuf", scope: !42, file: !2, line: 36, type: !19)
!70 = !DILocation(line: 36, column: 8, scope: !42)
!71 = !DILocation(line: 36, column: 24, scope: !42)
!72 = !DILocation(line: 38, column: 18, scope: !42)
!73 = !DILocation(line: 38, column: 3, scope: !42)
!74 = !DILocation(line: 40, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !42, file: !2, line: 40, column: 7)
!76 = !DILocation(line: 40, column: 12, scope: !75)
!77 = !DILocation(line: 40, column: 7, scope: !42)
!78 = !DILocation(line: 41, column: 44, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !2, line: 40, column: 18)
!80 = !DILocation(line: 41, column: 5, scope: !79)
!81 = !DILocalVariable(name: "buf", scope: !79, file: !2, line: 43, type: !19)
!82 = !DILocation(line: 43, column: 10, scope: !79)
!83 = !DILocation(line: 43, column: 23, scope: !79)
!84 = !DILocation(line: 45, column: 21, scope: !79)
!85 = !DILocation(line: 45, column: 67, scope: !79)
!86 = !DILocation(line: 45, column: 5, scope: !79)
!87 = !DILocation(line: 47, column: 13, scope: !79)
!88 = !DILocation(line: 47, column: 51, scope: !79)
!89 = !DILocation(line: 47, column: 5, scope: !79)
!90 = !DILocation(line: 48, column: 23, scope: !79)
!91 = !DILocation(line: 48, column: 5, scope: !79)
!92 = !DILocation(line: 49, column: 5, scope: !79)
!93 = !DILocation(line: 50, column: 3, scope: !79)
!94 = !DILocation(line: 51, column: 3, scope: !42)
!95 = !DILocation(line: 53, column: 3, scope: !42)
!96 = !DILocation(line: 54, column: 41, scope: !42)
!97 = !DILocation(line: 54, column: 3, scope: !42)
!98 = !DILocation(line: 55, column: 3, scope: !42)
