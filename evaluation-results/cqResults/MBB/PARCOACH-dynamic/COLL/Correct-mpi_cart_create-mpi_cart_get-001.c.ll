; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-mpi_cart_get-001.c'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-mpi_cart_get-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque

@ompi_mpi_comm_null = external global %struct.ompi_predefined_communicator_t, align 1
@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@__const.main.periods = private unnamed_addr constant [2 x i32] [i32 1, i32 1], align 4
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !30 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca [2 x i32], align 4
  %10 = alloca [2 x i32], align 4
  %11 = alloca [2 x i32], align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !37, metadata !DIExpression()), !dbg !38
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata ptr %6, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 -1, ptr %6, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata ptr %7, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 -1, ptr %7, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata ptr %8, metadata !45, metadata !DIExpression()), !dbg !46
  store ptr @ompi_mpi_comm_null, ptr %8, align 8, !dbg !46
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !47
  %13 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !48
  %14 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !49
  %15 = load i32, ptr %6, align 4, !dbg !50
  %16 = icmp slt i32 %15, 2, !dbg !52
  br i1 %16, label %17, label %19, !dbg !53

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !54
  br label %19, !dbg !54

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 @__const.main.periods, i64 8, i1 false), !dbg !59
  call void @llvm.dbg.declare(metadata ptr %10, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.memset.p0.i64(ptr align 4 %10, i8 0, i64 8, i1 false), !dbg !61
  call void @llvm.dbg.declare(metadata ptr %11, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.memset.p0.i64(ptr align 4 %11, i8 0, i64 8, i1 false), !dbg !63
  %20 = load i32, ptr %6, align 4, !dbg !64
  %21 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !65
  %22 = call i32 @MPI_Dims_create(i32 noundef %20, i32 noundef 2, ptr noundef %21), !dbg !66
  %23 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !67
  %24 = getelementptr inbounds [2 x i32], ptr %9, i64 0, i64 0, !dbg !68
  %25 = call i32 @MPI_Cart_create(ptr noundef @ompi_mpi_comm_world, i32 noundef 2, ptr noundef %23, ptr noundef %24, i32 noundef 0, ptr noundef %8), !dbg !69
  %26 = load ptr, ptr %8, align 8, !dbg !70
  %27 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !71
  %28 = getelementptr inbounds [2 x i32], ptr %9, i64 0, i64 0, !dbg !72
  %29 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0, !dbg !73
  %30 = call i32 @MPI_Cart_get(ptr noundef %26, i32 noundef 2, ptr noundef %27, ptr noundef %28, ptr noundef %29), !dbg !74
  %31 = call i32 @MPI_Comm_free(ptr noundef %8), !dbg !75
  %32 = call i32 @MPI_Finalize(), !dbg !76
  %33 = load i32, ptr %7, align 4, !dbg !77
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %33), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare i32 @MPI_Dims_create(i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Cart_create(ptr noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Cart_get(ptr noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-mpi_cart_get-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7b5819a22bba92165a915ffef096d850")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-mpi_cart_get-001.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7b5819a22bba92165a915ffef096d850")
!14 = !{!15, !19}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !{!0, !7}
!21 = !{i32 7, !"Dwarf Version", i32 5}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"openmp", i32 50}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Debian clang version 15.0.6"}
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !31, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !36)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !33, !34}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!36 = !{}
!37 = !DILocalVariable(name: "argc", arg: 1, scope: !30, file: !2, line: 22, type: !33)
!38 = !DILocation(line: 22, column: 14, scope: !30)
!39 = !DILocalVariable(name: "argv", arg: 2, scope: !30, file: !2, line: 22, type: !34)
!40 = !DILocation(line: 22, column: 27, scope: !30)
!41 = !DILocalVariable(name: "nprocs", scope: !30, file: !2, line: 23, type: !33)
!42 = !DILocation(line: 23, column: 7, scope: !30)
!43 = !DILocalVariable(name: "rank", scope: !30, file: !2, line: 24, type: !33)
!44 = !DILocation(line: 24, column: 7, scope: !30)
!45 = !DILocalVariable(name: "mpi_comm_0", scope: !30, file: !2, line: 25, type: !15)
!46 = !DILocation(line: 25, column: 12, scope: !30)
!47 = !DILocation(line: 27, column: 3, scope: !30)
!48 = !DILocation(line: 28, column: 3, scope: !30)
!49 = !DILocation(line: 29, column: 3, scope: !30)
!50 = !DILocation(line: 30, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !30, file: !2, line: 30, column: 7)
!52 = !DILocation(line: 30, column: 14, scope: !51)
!53 = !DILocation(line: 30, column: 7, scope: !30)
!54 = !DILocation(line: 31, column: 5, scope: !51)
!55 = !DILocalVariable(name: "periods", scope: !30, file: !2, line: 34, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 64, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 2)
!59 = !DILocation(line: 34, column: 7, scope: !30)
!60 = !DILocalVariable(name: "dims", scope: !30, file: !2, line: 35, type: !56)
!61 = !DILocation(line: 35, column: 7, scope: !30)
!62 = !DILocalVariable(name: "coords", scope: !30, file: !2, line: 36, type: !56)
!63 = !DILocation(line: 36, column: 7, scope: !30)
!64 = !DILocation(line: 37, column: 19, scope: !30)
!65 = !DILocation(line: 37, column: 30, scope: !30)
!66 = !DILocation(line: 37, column: 3, scope: !30)
!67 = !DILocation(line: 38, column: 38, scope: !30)
!68 = !DILocation(line: 38, column: 44, scope: !30)
!69 = !DILocation(line: 38, column: 3, scope: !30)
!70 = !DILocation(line: 39, column: 16, scope: !30)
!71 = !DILocation(line: 39, column: 31, scope: !30)
!72 = !DILocation(line: 39, column: 37, scope: !30)
!73 = !DILocation(line: 39, column: 46, scope: !30)
!74 = !DILocation(line: 39, column: 3, scope: !30)
!75 = !DILocation(line: 40, column: 3, scope: !30)
!76 = !DILocation(line: 42, column: 3, scope: !30)
!77 = !DILocation(line: 43, column: 41, scope: !30)
!78 = !DILocation(line: 43, column: 3, scope: !30)
!79 = !DILocation(line: 44, column: 3, scope: !30)
