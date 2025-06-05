; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/Correct-mpi_imrecv-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/Correct-mpi_imrecv-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_message_t = type opaque
%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_message_null = external global %struct.ompi_predefined_message_t, align 1
@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !53 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !59, metadata !DIExpression()), !dbg !60
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %6, metadata !63, metadata !DIExpression()), !dbg !64
  store i32 -1, ptr %6, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata ptr %7, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, ptr %7, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata ptr %8, metadata !67, metadata !DIExpression()), !dbg !68
  store ptr @ompi_message_null, ptr %8, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata ptr %9, metadata !69, metadata !DIExpression()), !dbg !70
  store ptr @ompi_request_null, ptr %9, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata ptr %10, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 0, ptr %10, align 4, !dbg !72
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !73
  %13 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !74
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !75
  %15 = load i32, ptr %6, align 4, !dbg !76
  %16 = icmp slt i32 %15, 2, !dbg !78
  br i1 %16, label %17, label %19, !dbg !79

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !80
  br label %19, !dbg !80

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %11, metadata !81, metadata !DIExpression()), !dbg !82
  %20 = call noalias ptr @calloc(i64 noundef 10, i64 noundef 4) #5, !dbg !83
  store ptr %20, ptr %11, align 8, !dbg !82
  %21 = load i32, ptr %7, align 4, !dbg !84
  %22 = icmp eq i32 %21, 0, !dbg !86
  br i1 %22, label %23, label %28, !dbg !87

23:                                               ; preds = %19
  %24 = call i32 @MPI_Mprobe(i32 noundef 1, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %8, ptr noundef null), !dbg !88
  %25 = load ptr, ptr %11, align 8, !dbg !90
  %26 = call i32 @MPI_Imrecv(ptr noundef %25, i32 noundef 10, ptr noundef @ompi_mpi_int, ptr noundef %8, ptr noundef %9), !dbg !91
  %27 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !92
  br label %28, !dbg !93

28:                                               ; preds = %23, %19
  %29 = load i32, ptr %7, align 4, !dbg !94
  %30 = icmp eq i32 %29, 1, !dbg !96
  br i1 %30, label %31, label %35, !dbg !97

31:                                               ; preds = %28
  %32 = load ptr, ptr %11, align 8, !dbg !98
  %33 = call i32 @MPI_Isend(ptr noundef %32, i32 noundef 10, ptr noundef @ompi_mpi_int, i32 noundef 0, i32 noundef 0, ptr noundef @ompi_mpi_comm_world, ptr noundef %9), !dbg !100
  %34 = call i32 @MPI_Wait(ptr noundef %9, ptr noundef null), !dbg !101
  br label %35, !dbg !102

35:                                               ; preds = %31, %28
  %36 = load ptr, ptr %11, align 8, !dbg !103
  call void @free(ptr noundef %36) #6, !dbg !104
  %37 = call i32 @MPI_Finalize(), !dbg !105
  %38 = load i32, ptr %7, align 4, !dbg !106
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %38), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

declare i32 @MPI_Mprobe(i32 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Imrecv(ptr noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Isend(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

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
!llvm.module.flags = !{!44, !45, !46, !47, !48, !49, !50, !51}
!llvm.ident = !{!52}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 34, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/P2P/Correct-mpi_imrecv-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d8bfc27b4df427721891f7b46add3882")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !43, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/P2P/Correct-mpi_imrecv-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "d8bfc27b4df427721891f7b46add3882")
!14 = !{!15, !19, !20, !23, !26, !28, !40}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Message", file: !16, line: 427, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_message_t", file: !16, line: 427, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !31)
!31 = !{!32, !33, !34, !35, !36}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !30, file: !16, line: 441, baseType: !27, size: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !30, file: !16, line: 442, baseType: !27, size: 32, offset: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !30, file: !16, line: 443, baseType: !27, size: 32, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !30, file: !16, line: 448, baseType: !27, size: 32, offset: 96)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !30, file: !16, line: 449, baseType: !37, size: 64, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !41)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!43 = !{!0, !7}
!44 = !{i32 7, !"Dwarf Version", i32 5}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"openmp", i32 50}
!48 = !{i32 7, !"PIC Level", i32 2}
!49 = !{i32 7, !"PIE Level", i32 2}
!50 = !{i32 7, !"uwtable", i32 2}
!51 = !{i32 7, !"frame-pointer", i32 2}
!52 = !{!"Debian clang version 15.0.6"}
!53 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !54, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !58)
!54 = !DISubroutineType(types: !55)
!55 = !{!27, !27, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !{}
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !2, line: 22, type: !27)
!60 = !DILocation(line: 22, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !2, line: 22, type: !56)
!62 = !DILocation(line: 22, column: 27, scope: !53)
!63 = !DILocalVariable(name: "nprocs", scope: !53, file: !2, line: 23, type: !27)
!64 = !DILocation(line: 23, column: 7, scope: !53)
!65 = !DILocalVariable(name: "rank", scope: !53, file: !2, line: 24, type: !27)
!66 = !DILocation(line: 24, column: 7, scope: !53)
!67 = !DILocalVariable(name: "mpi_message_0", scope: !53, file: !2, line: 25, type: !15)
!68 = !DILocation(line: 25, column: 15, scope: !53)
!69 = !DILocalVariable(name: "mpi_request_0", scope: !53, file: !2, line: 26, type: !20)
!70 = !DILocation(line: 26, column: 15, scope: !53)
!71 = !DILocalVariable(name: "int_0", scope: !53, file: !2, line: 27, type: !27)
!72 = !DILocation(line: 27, column: 7, scope: !53)
!73 = !DILocation(line: 29, column: 3, scope: !53)
!74 = !DILocation(line: 30, column: 3, scope: !53)
!75 = !DILocation(line: 31, column: 3, scope: !53)
!76 = !DILocation(line: 32, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !53, file: !2, line: 32, column: 7)
!78 = !DILocation(line: 32, column: 14, scope: !77)
!79 = !DILocation(line: 32, column: 7, scope: !53)
!80 = !DILocation(line: 33, column: 5, scope: !77)
!81 = !DILocalVariable(name: "buf", scope: !53, file: !2, line: 36, type: !26)
!82 = !DILocation(line: 36, column: 8, scope: !53)
!83 = !DILocation(line: 36, column: 21, scope: !53)
!84 = !DILocation(line: 38, column: 7, scope: !85)
!85 = distinct !DILexicalBlock(scope: !53, file: !2, line: 38, column: 7)
!86 = !DILocation(line: 38, column: 12, scope: !85)
!87 = !DILocation(line: 38, column: 7, scope: !53)
!88 = !DILocation(line: 39, column: 5, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !2, line: 38, column: 18)
!90 = !DILocation(line: 40, column: 16, scope: !89)
!91 = !DILocation(line: 40, column: 5, scope: !89)
!92 = !DILocation(line: 41, column: 5, scope: !89)
!93 = !DILocation(line: 42, column: 3, scope: !89)
!94 = !DILocation(line: 43, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !53, file: !2, line: 43, column: 7)
!96 = !DILocation(line: 43, column: 12, scope: !95)
!97 = !DILocation(line: 43, column: 7, scope: !53)
!98 = !DILocation(line: 44, column: 15, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !2, line: 43, column: 18)
!100 = !DILocation(line: 44, column: 5, scope: !99)
!101 = !DILocation(line: 45, column: 5, scope: !99)
!102 = !DILocation(line: 46, column: 3, scope: !99)
!103 = !DILocation(line: 47, column: 8, scope: !53)
!104 = !DILocation(line: 47, column: 3, scope: !53)
!105 = !DILocation(line: 49, column: 3, scope: !53)
!106 = !DILocation(line: 50, column: 41, scope: !53)
!107 = !DILocation(line: 50, column: 3, scope: !53)
!108 = !DILocation(line: 51, column: 3, scope: !53)
