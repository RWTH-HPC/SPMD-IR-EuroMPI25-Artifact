; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@1 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@2 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@3 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@4 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@5 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@6 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@7 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@8 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@9 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@10 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@11 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@12 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1
@13 = private unnamed_addr constant [99 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !32 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !38, metadata !DIExpression()), !dbg !39
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata ptr %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, ptr %6, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata ptr %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, ptr %7, align 4, !dbg !45
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !46
  %12 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !47
  %13 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !48
  %14 = load i32, ptr %6, align 4, !dbg !49
  %15 = icmp slt i32 %14, 2, !dbg !51
  br i1 %15, label %16, label %18, !dbg !52

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !53
  br label %18, !dbg !53

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %8, metadata !54, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  %19 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !59
  store ptr %19, ptr %9, align 8, !dbg !58
  %20 = load ptr, ptr %9, align 8, !dbg !60
  %21 = call i32 @parcoach_rma_MPI_Win_create(ptr %20, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %8, i32 37, ptr @0), !dbg !61
  %22 = load i32, ptr %8, align 4, !dbg !62
  %23 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, i32 %22, i32 39, ptr @1), !dbg !63
  call void @parcoach_rma_load(ptr %7, i64 32, i32 40, ptr @2), !dbg !64
  %24 = load i32, ptr %7, align 4, !dbg !64
  %25 = icmp eq i32 %24, 0, !dbg !66
  br i1 %25, label %26, label %34, !dbg !67

26:                                               ; preds = %18
  call void @llvm.dbg.declare(metadata ptr %10, metadata !68, metadata !DIExpression()), !dbg !70
  %27 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !71
  call void @parcoach_rma_store(ptr %10, i64 64, i32 42, ptr @3), !dbg !70
  store ptr %27, ptr %10, align 8, !dbg !70
  call void @parcoach_rma_load(ptr %10, i64 64, i32 44, ptr @4), !dbg !72
  %28 = load ptr, ptr %10, align 8, !dbg !72
  call void @parcoach_rma_load(ptr %8, i64 32, i32 44, ptr @5), !dbg !73
  %29 = load i32, ptr %8, align 4, !dbg !73
  %30 = call i32 @parcoach_rma_MPI_Accumulate(ptr %28, i32 10, i32 1275069445, i32 1, i64 0, i32 10, i32 1275069445, i32 1476395011, i32 %29, i32 44, ptr @6), !dbg !74
  call void @parcoach_rma_load(ptr %10, i64 64, i32 45, ptr @7), !dbg !75
  %31 = load ptr, ptr %10, align 8, !dbg !75
  call void @parcoach_rma_load(ptr %8, i64 32, i32 45, ptr @8), !dbg !76
  %32 = load i32, ptr %8, align 4, !dbg !76
  %33 = call i32 @parcoach_rma_MPI_Put(ptr %31, i32 10, i32 1275069445, i32 0, i64 0, i32 10, i32 1275069445, i32 %32, i32 45, ptr @9), !dbg !77
  br label %34, !dbg !78

34:                                               ; preds = %26, %18
  call void @parcoach_rma_load(ptr %8, i64 32, i32 47, ptr @10), !dbg !79
  %35 = load i32, ptr %8, align 4, !dbg !79
  %36 = call i32 @parcoach_rma_MPI_Win_unlock_all(i32 %35, i32 47, ptr @11), !dbg !80
  %37 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 48, ptr @12), !dbg !81
  %38 = call i32 @MPI_Finalize(), !dbg !82
  call void @parcoach_rma_load(ptr %7, i64 32, i32 51, ptr @13), !dbg !83
  %39 = load i32, ptr %7, align 4, !dbg !83
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %39), !dbg !84
  ret i32 0, !dbg !85
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

declare i32 @MPI_Win_lock_all(i32 noundef, i32 noundef) #2

declare i32 @MPI_Accumulate(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare i32 @MPI_Win_unlock_all(i32 noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Accumulate(ptr, i32, i32, i32, i64, i32, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, i32, i32, i64, i32, i32, i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "dec876e1a605ed61633ea38f881d2ca0")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 51, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !22, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/RMA/Correct-lockallflushlocal-accumulate_put-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "dec876e1a605ed61633ea38f881d2ca0")
!14 = !{!15, !18, !19, !20, !21}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 528, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Op", file: !16, line: 303, baseType: !17)
!22 = !{!0, !7}
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"openmp", i32 50}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 2}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Debian clang version 15.0.6"}
!32 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !33, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !37)
!33 = !DISubroutineType(types: !34)
!34 = !{!17, !17, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!37 = !{}
!38 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !2, line: 22, type: !17)
!39 = !DILocation(line: 22, column: 14, scope: !32)
!40 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !2, line: 22, type: !35)
!41 = !DILocation(line: 22, column: 27, scope: !32)
!42 = !DILocalVariable(name: "nprocs", scope: !32, file: !2, line: 23, type: !17)
!43 = !DILocation(line: 23, column: 7, scope: !32)
!44 = !DILocalVariable(name: "rank", scope: !32, file: !2, line: 24, type: !17)
!45 = !DILocation(line: 24, column: 7, scope: !32)
!46 = !DILocation(line: 26, column: 3, scope: !32)
!47 = !DILocation(line: 27, column: 3, scope: !32)
!48 = !DILocation(line: 28, column: 3, scope: !32)
!49 = !DILocation(line: 29, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !32, file: !2, line: 29, column: 7)
!51 = !DILocation(line: 29, column: 14, scope: !50)
!52 = !DILocation(line: 29, column: 7, scope: !32)
!53 = !DILocation(line: 30, column: 5, scope: !50)
!54 = !DILocalVariable(name: "mpi_win_0", scope: !32, file: !2, line: 33, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 287, baseType: !17)
!56 = !DILocation(line: 33, column: 11, scope: !32)
!57 = !DILocalVariable(name: "winbuf", scope: !32, file: !2, line: 35, type: !18)
!58 = !DILocation(line: 35, column: 8, scope: !32)
!59 = !DILocation(line: 35, column: 24, scope: !32)
!60 = !DILocation(line: 37, column: 18, scope: !32)
!61 = !DILocation(line: 37, column: 3, scope: !32)
!62 = !DILocation(line: 39, column: 23, scope: !32)
!63 = !DILocation(line: 39, column: 3, scope: !32)
!64 = !DILocation(line: 40, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !32, file: !2, line: 40, column: 7)
!66 = !DILocation(line: 40, column: 12, scope: !65)
!67 = !DILocation(line: 40, column: 7, scope: !32)
!68 = !DILocalVariable(name: "buf", scope: !69, file: !2, line: 42, type: !18)
!69 = distinct !DILexicalBlock(scope: !65, file: !2, line: 40, column: 18)
!70 = !DILocation(line: 42, column: 10, scope: !69)
!71 = !DILocation(line: 42, column: 23, scope: !69)
!72 = !DILocation(line: 44, column: 20, scope: !69)
!73 = !DILocation(line: 44, column: 66, scope: !69)
!74 = !DILocation(line: 44, column: 5, scope: !69)
!75 = !DILocation(line: 45, column: 13, scope: !69)
!76 = !DILocation(line: 45, column: 50, scope: !69)
!77 = !DILocation(line: 45, column: 5, scope: !69)
!78 = !DILocation(line: 46, column: 3, scope: !69)
!79 = !DILocation(line: 47, column: 22, scope: !32)
!80 = !DILocation(line: 47, column: 3, scope: !32)
!81 = !DILocation(line: 48, column: 3, scope: !32)
!82 = !DILocation(line: 50, column: 3, scope: !32)
!83 = !DILocation(line: 51, column: 41, scope: !32)
!84 = !DILocation(line: 51, column: 3, scope: !32)
!85 = !DILocation(line: 52, column: 3, scope: !32)
