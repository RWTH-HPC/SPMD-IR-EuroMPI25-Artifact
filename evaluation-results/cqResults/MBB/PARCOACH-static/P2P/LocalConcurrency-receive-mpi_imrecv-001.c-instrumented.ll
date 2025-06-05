; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/LocalConcurrency-receive-mpi_imrecv-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/LocalConcurrency-receive-mpi_imrecv-001.c"
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
  %10 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata ptr %9, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 738197504, ptr %9, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %10, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 0, ptr %10, align 4, !dbg !60
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !61
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !62
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !63
  %15 = load i32, ptr %6, align 4, !dbg !64
  %16 = icmp slt i32 %15, 2, !dbg !66
  br i1 %16, label %17, label %19, !dbg !67

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !68
  br label %19, !dbg !68

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !69, metadata !DIExpression()), !dbg !70
  %20 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !71
  store ptr %20, ptr %11, align 8, !dbg !70
  %21 = load i32, ptr %7, align 4, !dbg !72
  %22 = icmp eq i32 %21, 0, !dbg !74
  br i1 %22, label %23, label %30, !dbg !75

23:                                               ; preds = %19
  %24 = call i32 @MPI_Mprobe(i32 noundef 1, i32 noundef 0, i32 noundef 1140850688, ptr noundef %8, ptr noundef inttoptr (i64 1 to ptr)), !dbg !76
  %25 = load ptr, ptr %11, align 8, !dbg !78
  %26 = call i32 @MPI_Imrecv(ptr noundef %25, i32 noundef 10, i32 noundef 1275069445, ptr noundef %8, ptr noundef %9), !dbg !79
  %27 = load ptr, ptr %11, align 8, !dbg !80
  %28 = getelementptr inbounds i32, ptr %27, i64 2, !dbg !80
  store i32 1, ptr %28, align 4, !dbg !81
  %29 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef inttoptr (i64 1 to ptr)), !dbg !82
  br label %30, !dbg !83

30:                                               ; preds = %23, %19
  %31 = load i32, ptr %7, align 4, !dbg !84
  %32 = icmp eq i32 %31, 1, !dbg !86
  br i1 %32, label %33, label %37, !dbg !87

33:                                               ; preds = %30
  %34 = load ptr, ptr %11, align 8, !dbg !88
  %35 = call i32 @MPI_Isend(ptr noundef %34, i32 noundef 10, i32 noundef 1275069445, i32 noundef 0, i32 noundef 0, i32 noundef 1140850688, ptr noundef %9), !dbg !90
  %36 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef inttoptr (i64 1 to ptr)), !dbg !91
  br label %37, !dbg !92

37:                                               ; preds = %33, %30
  %38 = load ptr, ptr %11, align 8, !dbg !93
  call void @free(ptr noundef %38) #6, !dbg !94
  %39 = call i32 @MPI_Finalize(), !dbg !95
  %40 = load i32, ptr %7, align 4, !dbg !96
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %40), !dbg !97
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

declare i32 @MPI_Mprobe(i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Imrecv(ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Isend(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0,1) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!32, !33, !34, !35, !36, !37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-static/P2P/LocalConcurrency-receive-mpi_imrecv-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "171a5ab17ab35efa05cec5f38195dc7a")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 52, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !31, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-static/P2P/LocalConcurrency-receive-mpi_imrecv-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "171a5ab17ab35efa05cec5f38195dc7a")
!14 = !{!15, !18, !19, !20, !21, !30}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Message", file: !16, line: 454, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 451, baseType: !17)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 593, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "MPI_Status", file: !16, line: 587, size: 160, elements: !24)
!24 = !{!25, !26, !27, !28, !29}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "count_lo", scope: !23, file: !16, line: 588, baseType: !17, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "count_hi_and_cancelled", scope: !23, file: !16, line: 589, baseType: !17, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !23, file: !16, line: 590, baseType: !17, size: 32, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !23, file: !16, line: 591, baseType: !17, size: 32, offset: 96)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !23, file: !16, line: 592, baseType: !17, size: 32, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 104, baseType: !17)
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
!55 = !DILocalVariable(name: "mpi_message_0", scope: !41, file: !2, line: 25, type: !15)
!56 = !DILocation(line: 25, column: 15, scope: !41)
!57 = !DILocalVariable(name: "mpi_request_0", scope: !41, file: !2, line: 26, type: !18)
!58 = !DILocation(line: 26, column: 15, scope: !41)
!59 = !DILocalVariable(name: "int_0", scope: !41, file: !2, line: 27, type: !17)
!60 = !DILocation(line: 27, column: 7, scope: !41)
!61 = !DILocation(line: 29, column: 3, scope: !41)
!62 = !DILocation(line: 30, column: 3, scope: !41)
!63 = !DILocation(line: 31, column: 3, scope: !41)
!64 = !DILocation(line: 32, column: 7, scope: !65)
!65 = distinct !DILexicalBlock(scope: !41, file: !2, line: 32, column: 7)
!66 = !DILocation(line: 32, column: 14, scope: !65)
!67 = !DILocation(line: 32, column: 7, scope: !41)
!68 = !DILocation(line: 33, column: 5, scope: !65)
!69 = !DILocalVariable(name: "buf", scope: !41, file: !2, line: 36, type: !20)
!70 = !DILocation(line: 36, column: 8, scope: !41)
!71 = !DILocation(line: 36, column: 21, scope: !41)
!72 = !DILocation(line: 38, column: 7, scope: !73)
!73 = distinct !DILexicalBlock(scope: !41, file: !2, line: 38, column: 7)
!74 = !DILocation(line: 38, column: 12, scope: !73)
!75 = !DILocation(line: 38, column: 7, scope: !41)
!76 = !DILocation(line: 39, column: 5, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !2, line: 38, column: 18)
!78 = !DILocation(line: 40, column: 35, scope: !77)
!79 = !DILocation(line: 40, column: 24, scope: !77)
!80 = !DILocation(line: 42, column: 24, scope: !77)
!81 = !DILocation(line: 42, column: 31, scope: !77)
!82 = !DILocation(line: 43, column: 5, scope: !77)
!83 = !DILocation(line: 44, column: 3, scope: !77)
!84 = !DILocation(line: 45, column: 7, scope: !85)
!85 = distinct !DILexicalBlock(scope: !41, file: !2, line: 45, column: 7)
!86 = !DILocation(line: 45, column: 12, scope: !85)
!87 = !DILocation(line: 45, column: 7, scope: !41)
!88 = !DILocation(line: 46, column: 15, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !2, line: 45, column: 18)
!90 = !DILocation(line: 46, column: 5, scope: !89)
!91 = !DILocation(line: 47, column: 5, scope: !89)
!92 = !DILocation(line: 48, column: 3, scope: !89)
!93 = !DILocation(line: 49, column: 8, scope: !41)
!94 = !DILocation(line: 49, column: 3, scope: !41)
!95 = !DILocation(line: 51, column: 3, scope: !41)
!96 = !DILocation(line: 52, column: 41, scope: !41)
!97 = !DILocation(line: 52, column: 3, scope: !41)
!98 = !DILocation(line: 53, column: 3, scope: !41)
