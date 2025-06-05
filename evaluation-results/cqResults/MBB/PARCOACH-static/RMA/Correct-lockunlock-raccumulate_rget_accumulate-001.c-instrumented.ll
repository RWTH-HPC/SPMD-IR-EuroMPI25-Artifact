; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@1 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@2 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@3 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@4 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@5 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@6 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@7 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@8 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@9 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@10 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@11 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1
@12 = private unnamed_addr constant [104 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !42 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
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
  call void @llvm.dbg.declare(metadata ptr %9, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 738197504, ptr %9, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata ptr %10, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 0, ptr %10, align 4, !dbg !61
  %15 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !62
  %16 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !63
  %17 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !64
  %18 = load i32, ptr %6, align 4, !dbg !65
  %19 = icmp slt i32 %18, 2, !dbg !67
  br i1 %19, label %20, label %22, !dbg !68

20:                                               ; preds = %2
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !69
  br label %22, !dbg !69

22:                                               ; preds = %20, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata ptr %12, metadata !73, metadata !DIExpression()), !dbg !74
  %23 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !75
  store ptr %23, ptr %12, align 8, !dbg !74
  %24 = load ptr, ptr %12, align 8, !dbg !76
  %25 = call i32 @parcoach_rma_MPI_Win_create(ptr %24, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %11, i32 40, ptr @0), !dbg !77
  %26 = load i32, ptr %7, align 4, !dbg !78
  %27 = icmp eq i32 %26, 0, !dbg !80
  br i1 %27, label %28, label %44, !dbg !81

28:                                               ; preds = %22
  %29 = load i32, ptr %11, align 4, !dbg !82
  %30 = call i32 @parcoach_rma_MPI_Win_lock(i32 234, i32 1, i32 0, i32 %29, i32 43, ptr @1), !dbg !84
  call void @llvm.dbg.declare(metadata ptr %13, metadata !85, metadata !DIExpression()), !dbg !86
  %31 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !87
  call void @parcoach_rma_store(ptr %13, i64 64, i32 45, ptr @2), !dbg !86
  store ptr %31, ptr %13, align 8, !dbg !86
  call void @parcoach_rma_load(ptr %13, i64 64, i32 47, ptr @3), !dbg !88
  %32 = load ptr, ptr %13, align 8, !dbg !88
  call void @parcoach_rma_load(ptr %11, i64 32, i32 47, ptr @4), !dbg !89
  %33 = load i32, ptr %11, align 4, !dbg !89
  %34 = call i32 @MPI_Raccumulate(ptr noundef %32, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %33, ptr noundef %8), !dbg !90
  call void @llvm.dbg.declare(metadata ptr %14, metadata !91, metadata !DIExpression()), !dbg !92
  %35 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !93
  call void @parcoach_rma_store(ptr %14, i64 64, i32 50, ptr @5), !dbg !92
  store ptr %35, ptr %14, align 8, !dbg !92
  call void @parcoach_rma_load(ptr %13, i64 64, i32 52, ptr @6), !dbg !94
  %36 = load ptr, ptr %13, align 8, !dbg !94
  call void @parcoach_rma_load(ptr %14, i64 64, i32 52, ptr @7), !dbg !95
  %37 = load ptr, ptr %14, align 8, !dbg !95
  call void @parcoach_rma_load(ptr %11, i64 32, i32 53, ptr @8), !dbg !96
  %38 = load i32, ptr %11, align 4, !dbg !96
  %39 = call i32 @MPI_Rget_accumulate(ptr noundef %36, i32 noundef 10, i32 noundef 1275069445, ptr noundef %37, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1, i64 noundef 10, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %38, ptr noundef %9), !dbg !97
  call void @parcoach_rma_load(ptr %11, i64 32, i32 54, ptr @9), !dbg !98
  %40 = load i32, ptr %11, align 4, !dbg !98
  %41 = call i32 @parcoach_rma_MPI_Win_unlock(i32 1, i32 %40, i32 54, ptr @10), !dbg !99
  %42 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !100
  %43 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef inttoptr (i64 1 to ptr)), !dbg !101
  br label %44, !dbg !102

44:                                               ; preds = %28, %22
  %45 = call i32 @parcoach_rma_MPI_Win_free(ptr %11, i32 58, ptr @11), !dbg !103
  %46 = call i32 @MPI_Finalize(), !dbg !104
  call void @parcoach_rma_load(ptr %7, i64 32, i32 61, ptr @12), !dbg !105
  %47 = load i32, ptr %7, align 4, !dbg !105
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %47), !dbg !106
  ret i32 0, !dbg !107
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

declare i32 @MPI_Rget_accumulate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock(i32 noundef, i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock(i32, i32, i32, i32, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock(i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "eff90e1cc73a201a69ad2facf4ab47d1")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 61, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !32, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockunlock-raccumulate_rget_accumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "eff90e1cc73a201a69ad2facf4ab47d1")
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
!58 = !DILocalVariable(name: "mpi_request_1", scope: !42, file: !2, line: 26, type: !15)
!59 = !DILocation(line: 26, column: 15, scope: !42)
!60 = !DILocalVariable(name: "int_0", scope: !42, file: !2, line: 27, type: !17)
!61 = !DILocation(line: 27, column: 7, scope: !42)
!62 = !DILocation(line: 29, column: 3, scope: !42)
!63 = !DILocation(line: 30, column: 3, scope: !42)
!64 = !DILocation(line: 31, column: 3, scope: !42)
!65 = !DILocation(line: 32, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !42, file: !2, line: 32, column: 7)
!67 = !DILocation(line: 32, column: 14, scope: !66)
!68 = !DILocation(line: 32, column: 7, scope: !42)
!69 = !DILocation(line: 33, column: 5, scope: !66)
!70 = !DILocalVariable(name: "mpi_win_0", scope: !42, file: !2, line: 36, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!72 = !DILocation(line: 36, column: 11, scope: !42)
!73 = !DILocalVariable(name: "winbuf", scope: !42, file: !2, line: 38, type: !19)
!74 = !DILocation(line: 38, column: 8, scope: !42)
!75 = !DILocation(line: 38, column: 24, scope: !42)
!76 = !DILocation(line: 40, column: 18, scope: !42)
!77 = !DILocation(line: 40, column: 3, scope: !42)
!78 = !DILocation(line: 42, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !42, file: !2, line: 42, column: 7)
!80 = !DILocation(line: 42, column: 12, scope: !79)
!81 = !DILocation(line: 42, column: 7, scope: !42)
!82 = !DILocation(line: 43, column: 44, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !2, line: 42, column: 18)
!84 = !DILocation(line: 43, column: 5, scope: !83)
!85 = !DILocalVariable(name: "buf", scope: !83, file: !2, line: 45, type: !19)
!86 = !DILocation(line: 45, column: 10, scope: !83)
!87 = !DILocation(line: 45, column: 23, scope: !83)
!88 = !DILocation(line: 47, column: 21, scope: !83)
!89 = !DILocation(line: 47, column: 67, scope: !83)
!90 = !DILocation(line: 47, column: 5, scope: !83)
!91 = !DILocalVariable(name: "int_0", scope: !83, file: !2, line: 50, type: !19)
!92 = !DILocation(line: 50, column: 10, scope: !83)
!93 = !DILocation(line: 50, column: 25, scope: !83)
!94 = !DILocation(line: 52, column: 25, scope: !83)
!95 = !DILocation(line: 52, column: 43, scope: !83)
!96 = !DILocation(line: 53, column: 43, scope: !83)
!97 = !DILocation(line: 52, column: 5, scope: !83)
!98 = !DILocation(line: 54, column: 23, scope: !83)
!99 = !DILocation(line: 54, column: 5, scope: !83)
!100 = !DILocation(line: 55, column: 5, scope: !83)
!101 = !DILocation(line: 56, column: 5, scope: !83)
!102 = !DILocation(line: 57, column: 3, scope: !83)
!103 = !DILocation(line: 58, column: 3, scope: !42)
!104 = !DILocation(line: 60, column: 3, scope: !42)
!105 = !DILocation(line: 61, column: 41, scope: !42)
!106 = !DILocation(line: 61, column: 3, scope: !42)
!107 = !DILocation(line: 62, column: 3, scope: !42)
