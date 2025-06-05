; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [11 x i8] c"buf is %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !12
@0 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@1 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@2 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@3 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@4 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@5 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@6 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@7 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@8 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@9 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@10 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1
@11 = private unnamed_addr constant [98 x i8] c"cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !47 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !53, metadata !DIExpression()), !dbg !54
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %6, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 -1, ptr %6, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %7, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, ptr %7, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 738197504, ptr %8, align 4, !dbg !62
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !63
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !64
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !65
  %15 = load i32, ptr %6, align 4, !dbg !66
  %16 = icmp slt i32 %15, 2, !dbg !68
  br i1 %16, label %17, label %19, !dbg !69

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !70
  br label %19, !dbg !70

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !71, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata ptr %10, metadata !74, metadata !DIExpression()), !dbg !75
  %20 = call noalias ptr @calloc(i64 noundef 20, i64 noundef 4) #4, !dbg !76
  store ptr %20, ptr %10, align 8, !dbg !75
  %21 = load ptr, ptr %10, align 8, !dbg !77
  %22 = call i32 @parcoach_rma_MPI_Win_create(ptr %21, i64 80, i32 4, i32 469762048, i32 1140850688, ptr %9, i32 38, ptr @0), !dbg !78
  %23 = load i32, ptr %9, align 4, !dbg !79
  %24 = call i32 @parcoach_rma_MPI_Win_lock_all(i32 0, i32 %23, i32 40, ptr @1), !dbg !80
  call void @parcoach_rma_load(ptr %7, i64 32, i32 41, ptr @2), !dbg !81
  %25 = load i32, ptr %7, align 4, !dbg !81
  %26 = icmp eq i32 %25, 0, !dbg !83
  br i1 %26, label %27, label %36, !dbg !84

27:                                               ; preds = %19
  call void @llvm.dbg.declare(metadata ptr %11, metadata !85, metadata !DIExpression()), !dbg !87
  %28 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #4, !dbg !88
  call void @parcoach_rma_store(ptr %11, i64 64, i32 43, ptr @3), !dbg !87
  store ptr %28, ptr %11, align 8, !dbg !87
  call void @parcoach_rma_load(ptr %11, i64 64, i32 45, ptr @4), !dbg !89
  %29 = load ptr, ptr %11, align 8, !dbg !89
  %30 = getelementptr inbounds i32, ptr %29, i64 0, !dbg !89
  call void @parcoach_rma_load(ptr %30, i64 32, i32 45, ptr @5), !dbg !89
  %31 = load i32, ptr %30, align 4, !dbg !89
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %31), !dbg !90
  call void @parcoach_rma_load(ptr %11, i64 64, i32 46, ptr @6), !dbg !91
  %33 = load ptr, ptr %11, align 8, !dbg !91
  call void @parcoach_rma_load(ptr %9, i64 32, i32 46, ptr @7), !dbg !92
  %34 = load i32, ptr %9, align 4, !dbg !92
  %35 = call i32 @MPI_Raccumulate(ptr noundef %33, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i64 noundef 0, i32 noundef 10, i32 noundef 1275069445, i32 noundef 1476395011, i32 noundef %34, ptr noundef %8), !dbg !93
  br label %36, !dbg !94

36:                                               ; preds = %27, %19
  call void @parcoach_rma_load(ptr %9, i64 32, i32 49, ptr @8), !dbg !95
  %37 = load i32, ptr %9, align 4, !dbg !95
  %38 = call i32 @parcoach_rma_MPI_Win_unlock_all(i32 %37, i32 49, ptr @9), !dbg !96
  call void @parcoach_rma_load(ptr %7, i64 32, i32 50, ptr @10), !dbg !97
  %39 = load i32, ptr %7, align 4, !dbg !97
  %40 = icmp eq i32 %39, 0, !dbg !99
  br i1 %40, label %41, label %43, !dbg !100

41:                                               ; preds = %36
  %42 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !101
  br label %43, !dbg !103

43:                                               ; preds = %41, %36
  %44 = call i32 @parcoach_rma_MPI_Win_free(ptr %9, i32 53, ptr @11), !dbg !104
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

declare i32 @MPI_Win_lock_all(i32 noundef, i32 noundef) #2

declare i32 @MPI_Raccumulate(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Win_unlock_all(i32 noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_create(ptr, i64, i32, i32, i32, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_lock_all(i32, i32, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_unlock_all(i32, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!38, !39, !40, !41, !42, !43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "804d9e2e31968199a83fb833553ae858")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 45, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 11)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !19, globals: !37, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/RMA/Correct-lockallflush-bufread_raccumulate-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "804d9e2e31968199a83fb833553ae858")
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
!63 = !DILocation(line: 27, column: 3, scope: !47)
!64 = !DILocation(line: 28, column: 3, scope: !47)
!65 = !DILocation(line: 29, column: 3, scope: !47)
!66 = !DILocation(line: 30, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !47, file: !2, line: 30, column: 7)
!68 = !DILocation(line: 30, column: 14, scope: !67)
!69 = !DILocation(line: 30, column: 7, scope: !47)
!70 = !DILocation(line: 31, column: 5, scope: !67)
!71 = !DILocalVariable(name: "mpi_win_0", scope: !47, file: !2, line: 34, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !21, line: 287, baseType: !22)
!73 = !DILocation(line: 34, column: 11, scope: !47)
!74 = !DILocalVariable(name: "winbuf", scope: !47, file: !2, line: 36, type: !24)
!75 = !DILocation(line: 36, column: 8, scope: !47)
!76 = !DILocation(line: 36, column: 24, scope: !47)
!77 = !DILocation(line: 38, column: 18, scope: !47)
!78 = !DILocation(line: 38, column: 3, scope: !47)
!79 = !DILocation(line: 40, column: 23, scope: !47)
!80 = !DILocation(line: 40, column: 3, scope: !47)
!81 = !DILocation(line: 41, column: 7, scope: !82)
!82 = distinct !DILexicalBlock(scope: !47, file: !2, line: 41, column: 7)
!83 = !DILocation(line: 41, column: 12, scope: !82)
!84 = !DILocation(line: 41, column: 7, scope: !47)
!85 = !DILocalVariable(name: "buf", scope: !86, file: !2, line: 43, type: !24)
!86 = distinct !DILexicalBlock(scope: !82, file: !2, line: 41, column: 18)
!87 = !DILocation(line: 43, column: 10, scope: !86)
!88 = !DILocation(line: 43, column: 23, scope: !86)
!89 = !DILocation(line: 45, column: 27, scope: !86)
!90 = !DILocation(line: 45, column: 5, scope: !86)
!91 = !DILocation(line: 46, column: 21, scope: !86)
!92 = !DILocation(line: 46, column: 67, scope: !86)
!93 = !DILocation(line: 46, column: 5, scope: !86)
!94 = !DILocation(line: 48, column: 3, scope: !86)
!95 = !DILocation(line: 49, column: 22, scope: !47)
!96 = !DILocation(line: 49, column: 3, scope: !47)
!97 = !DILocation(line: 50, column: 7, scope: !98)
!98 = distinct !DILexicalBlock(scope: !47, file: !2, line: 50, column: 7)
!99 = !DILocation(line: 50, column: 12, scope: !98)
!100 = !DILocation(line: 50, column: 7, scope: !47)
!101 = !DILocation(line: 51, column: 5, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !2, line: 50, column: 18)
!103 = !DILocation(line: 52, column: 3, scope: !102)
!104 = !DILocation(line: 53, column: 3, scope: !47)
!105 = !DILocation(line: 55, column: 3, scope: !47)
!106 = !DILocation(line: 56, column: 41, scope: !47)
!107 = !DILocation(line: 56, column: 3, scope: !47)
!108 = !DILocation(line: 57, column: 3, scope: !47)
