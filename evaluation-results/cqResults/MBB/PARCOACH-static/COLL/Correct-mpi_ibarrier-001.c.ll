; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_request_t = type opaque
%struct.ompi_predefined_communicator_t = type opaque

@ompi_request_null = external global %struct.ompi_predefined_request_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !46 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
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
  store ptr @ompi_request_null, ptr %8, align 8, !dbg !61
  %9 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !62
  %10 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !63
  %11 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !64
  %12 = load i32, ptr %6, align 4, !dbg !65
  %13 = icmp slt i32 %12, 2, !dbg !67
  br i1 %13, label %14, label %16, !dbg !68

14:                                               ; preds = %2
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !69
  br label %16, !dbg !69

16:                                               ; preds = %14, %2
  %17 = call i32 @MPI_Ibarrier(ptr noundef @ompi_mpi_comm_world, ptr noundef %8), !dbg !70
  %18 = call i32 @MPI_Wait(ptr noundef %8, ptr noundef null), !dbg !71
  %19 = call i32 @MPI_Finalize(), !dbg !72
  %20 = load i32, ptr %7, align 4, !dbg !73
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %20), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Ibarrier(ptr noundef, ptr noundef) #2

declare i32 @MPI_Wait(ptr noundef, ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!37, !38, !39, !40, !41, !42, !43, !44}
!llvm.ident = !{!45}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "20d095f000001561cdd55ae5af1e409b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 38, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !36, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-static/COLL/Correct-mpi_ibarrier-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "20d095f000001561cdd55ae5af1e409b")
!14 = !{!15, !19, !20, !23}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Request", file: !16, line: 426, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_request_t", file: !16, line: 426, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !26)
!26 = !{!27, !29, !30, !31, !32}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !25, file: !16, line: 441, baseType: !28, size: 32)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !25, file: !16, line: 442, baseType: !28, size: 32, offset: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !25, file: !16, line: 443, baseType: !28, size: 32, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !25, file: !16, line: 448, baseType: !28, size: 32, offset: 96)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !25, file: !16, line: 449, baseType: !33, size: 64, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !{!0, !7}
!37 = !{i32 7, !"Dwarf Version", i32 5}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"openmp", i32 50}
!41 = !{i32 7, !"PIC Level", i32 2}
!42 = !{i32 7, !"PIE Level", i32 2}
!43 = !{i32 7, !"uwtable", i32 2}
!44 = !{i32 7, !"frame-pointer", i32 2}
!45 = !{!"Debian clang version 15.0.6"}
!46 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !47, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !51)
!47 = !DISubroutineType(types: !48)
!48 = !{!28, !28, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!51 = !{}
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !2, line: 22, type: !28)
!53 = !DILocation(line: 22, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !2, line: 22, type: !49)
!55 = !DILocation(line: 22, column: 27, scope: !46)
!56 = !DILocalVariable(name: "nprocs", scope: !46, file: !2, line: 23, type: !28)
!57 = !DILocation(line: 23, column: 7, scope: !46)
!58 = !DILocalVariable(name: "rank", scope: !46, file: !2, line: 24, type: !28)
!59 = !DILocation(line: 24, column: 7, scope: !46)
!60 = !DILocalVariable(name: "mpi_request_0", scope: !46, file: !2, line: 25, type: !15)
!61 = !DILocation(line: 25, column: 15, scope: !46)
!62 = !DILocation(line: 27, column: 3, scope: !46)
!63 = !DILocation(line: 28, column: 3, scope: !46)
!64 = !DILocation(line: 29, column: 3, scope: !46)
!65 = !DILocation(line: 30, column: 7, scope: !66)
!66 = distinct !DILexicalBlock(scope: !46, file: !2, line: 30, column: 7)
!67 = !DILocation(line: 30, column: 14, scope: !66)
!68 = !DILocation(line: 30, column: 7, scope: !46)
!69 = !DILocation(line: 31, column: 5, scope: !66)
!70 = !DILocation(line: 34, column: 3, scope: !46)
!71 = !DILocation(line: 35, column: 3, scope: !46)
!72 = !DILocation(line: 37, column: 3, scope: !46)
!73 = !DILocation(line: 38, column: 41, scope: !46)
!74 = !DILocation(line: 38, column: 3, scope: !46)
!75 = !DILocation(line: 39, column: 3, scope: !46)
