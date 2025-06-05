; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !47 {
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
  call void @llvm.dbg.declare(metadata ptr %4, metadata !53, metadata !DIExpression()), !dbg !54
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %6, metadata !57, metadata !DIExpression()), !dbg !58
  store i32 -1, ptr %6, align 4, !dbg !58
  call void @llvm.dbg.declare(metadata ptr %7, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, ptr %7, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %8, metadata !61, metadata !DIExpression()), !dbg !62
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !62
  %11 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !63
  %12 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !64
  %13 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !65
  %14 = load i32, ptr %6, align 4, !dbg !66
  %15 = icmp slt i32 %14, 2, !dbg !68
  br i1 %15, label %16, label %18, !dbg !69

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !70
  br label %18, !dbg !70

18:                                               ; preds = %16, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !71, metadata !DIExpression()), !dbg !72
  %19 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !73
  store ptr %19, ptr %9, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata ptr %10, metadata !74, metadata !DIExpression()), !dbg !75
  %20 = load i32, ptr %6, align 4, !dbg !76
  %21 = mul nsw i32 10, %20, !dbg !77
  %22 = sext i32 %21 to i64, !dbg !78
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 4) #5, !dbg !79
  store ptr %23, ptr %10, align 8, !dbg !75
  %24 = load i32, ptr %7, align 4, !dbg !80
  %25 = icmp eq i32 %24, 0, !dbg !82
  br i1 %25, label %26, label %28, !dbg !83

26:                                               ; preds = %18
  %27 = call i32 @MPI_Ibarrier(ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !84
  br label %28, !dbg !86

28:                                               ; preds = %26, %18
  %29 = load i32, ptr %7, align 4, !dbg !87
  %30 = icmp ne i32 %29, 0, !dbg !89
  br i1 %30, label %31, label %33, !dbg !90

31:                                               ; preds = %28
  %32 = call i32 @MPI_Ibarrier(ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !91
  br label %33, !dbg !93

33:                                               ; preds = %31, %28
  %34 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !94
  %35 = load ptr, ptr %9, align 8, !dbg !95
  call void @free(ptr noundef %35) #6, !dbg !96
  %36 = load ptr, ptr %10, align 8, !dbg !97
  call void @free(ptr noundef %36) #6, !dbg !98
  %37 = call i32 @MPI_Finalize(), !dbg !99
  %38 = load i32, ptr %7, align 4, !dbg !100
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %38), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Ibarrier(ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

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
!llvm.module.flags = !{!38, !39, !40, !41, !42, !43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "03f22f062b006b26091753eb56b44cf3")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !37, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_ibarrier-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "03f22f062b006b26091753eb56b44cf3")
!14 = !{!15, !19, !20, !23, !25}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !28)
!28 = !{!29, !30, !31, !32, !33}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !27, file: !16, line: 441, baseType: !24, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !27, file: !16, line: 442, baseType: !24, size: 32, offset: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !27, file: !16, line: 443, baseType: !24, size: 32, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !27, file: !16, line: 448, baseType: !24, size: 32, offset: 96)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !27, file: !16, line: 449, baseType: !34, size: 64, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 46, baseType: !36)
!35 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!36 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!37 = !{!0, !7}
!38 = !{i32 7, !"Dwarf Version", i32 5}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"openmp", i32 50}
!42 = !{i32 7, !"PIC Level", i32 2}
!43 = !{i32 7, !"PIE Level", i32 2}
!44 = !{i32 7, !"uwtable", i32 2}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = !{!"Debian clang version 15.0.6"}
!47 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !48, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !52)
!48 = !DISubroutineType(types: !49)
!49 = !{!24, !24, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !{}
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !2, line: 22, type: !24)
!54 = !DILocation(line: 22, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !2, line: 22, type: !50)
!56 = !DILocation(line: 22, column: 27, scope: !47)
!57 = !DILocalVariable(name: "nprocs", scope: !47, file: !2, line: 23, type: !24)
!58 = !DILocation(line: 23, column: 7, scope: !47)
!59 = !DILocalVariable(name: "rank", scope: !47, file: !2, line: 24, type: !24)
!60 = !DILocation(line: 24, column: 7, scope: !47)
!61 = !DILocalVariable(name: "mpi_request_0", scope: !47, file: !2, line: 25, type: !15)
!62 = !DILocation(line: 25, column: 15, scope: !47)
!63 = !DILocation(line: 27, column: 3, scope: !47)
!64 = !DILocation(line: 28, column: 3, scope: !47)
!65 = !DILocation(line: 29, column: 3, scope: !47)
!66 = !DILocation(line: 30, column: 7, scope: !67)
!67 = distinct !DILexicalBlock(scope: !47, file: !2, line: 30, column: 7)
!68 = !DILocation(line: 30, column: 14, scope: !67)
!69 = !DILocation(line: 30, column: 7, scope: !47)
!70 = !DILocation(line: 31, column: 5, scope: !67)
!71 = !DILocalVariable(name: "buf", scope: !47, file: !2, line: 34, type: !23)
!72 = !DILocation(line: 34, column: 8, scope: !47)
!73 = !DILocation(line: 34, column: 21, scope: !47)
!74 = !DILocalVariable(name: "recv_buf", scope: !47, file: !2, line: 36, type: !23)
!75 = !DILocation(line: 36, column: 8, scope: !47)
!76 = !DILocation(line: 36, column: 38, scope: !47)
!77 = !DILocation(line: 36, column: 36, scope: !47)
!78 = !DILocation(line: 36, column: 33, scope: !47)
!79 = !DILocation(line: 36, column: 26, scope: !47)
!80 = !DILocation(line: 38, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !47, file: !2, line: 38, column: 7)
!82 = !DILocation(line: 38, column: 12, scope: !81)
!83 = !DILocation(line: 38, column: 7, scope: !47)
!84 = !DILocation(line: 39, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !2, line: 38, column: 18)
!86 = !DILocation(line: 40, column: 3, scope: !85)
!87 = !DILocation(line: 41, column: 7, scope: !88)
!88 = distinct !DILexicalBlock(scope: !47, file: !2, line: 41, column: 7)
!89 = !DILocation(line: 41, column: 12, scope: !88)
!90 = !DILocation(line: 41, column: 7, scope: !47)
!91 = !DILocation(line: 42, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !2, line: 41, column: 18)
!93 = !DILocation(line: 43, column: 3, scope: !92)
!94 = !DILocation(line: 44, column: 3, scope: !47)
!95 = !DILocation(line: 45, column: 8, scope: !47)
!96 = !DILocation(line: 45, column: 3, scope: !47)
!97 = !DILocation(line: 46, column: 8, scope: !47)
!98 = !DILocation(line: 46, column: 3, scope: !47)
!99 = !DILocation(line: 48, column: 3, scope: !47)
!100 = !DILocation(line: 49, column: 41, scope: !47)
!101 = !DILocation(line: 49, column: 3, scope: !47)
!102 = !DILocation(line: 50, column: 3, scope: !47)
