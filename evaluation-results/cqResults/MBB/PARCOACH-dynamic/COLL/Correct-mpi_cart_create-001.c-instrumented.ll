; ModuleID = '/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-001.c.ll'
source_filename = "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [67 x i8] c"MBB ERROR: This test needs at least 2 processes to produce a bug!\0A\00", align 1, !dbg !0
@__const.main.periods = private unnamed_addr constant [2 x i32] [i32 1, i32 1], align 4
@.str.1 = private unnamed_addr constant [27 x i8] c"Rank %d finished normally\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !28 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2 x i32], align 4
  %10 = alloca [2 x i32], align 4
  %11 = alloca [2 x i32], align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !34, metadata !DIExpression()), !dbg !35
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata ptr %6, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 -1, ptr %6, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata ptr %7, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 -1, ptr %7, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata ptr %8, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 67108864, ptr %8, align 4, !dbg !43
  %12 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !44
  %13 = call i32 @MPI_Comm_size(i32 noundef 1140850688, ptr noundef %6), !dbg !45
  %14 = call i32 @MPI_Comm_rank(i32 noundef 1140850688, ptr noundef %7), !dbg !46
  %15 = load i32, ptr %6, align 4, !dbg !47
  %16 = icmp slt i32 %15, 2, !dbg !49
  br i1 %16, label %17, label %19, !dbg !50

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !51
  br label %19, !dbg !51

19:                                               ; preds = %17, %2
  call void @llvm.dbg.declare(metadata ptr %9, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 @__const.main.periods, i64 8, i1 false), !dbg !56
  call void @llvm.dbg.declare(metadata ptr %10, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.memset.p0.i64(ptr align 4 %10, i8 0, i64 8, i1 false), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %11, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.memset.p0.i64(ptr align 4 %11, i8 0, i64 8, i1 false), !dbg !60
  %20 = load i32, ptr %6, align 4, !dbg !61
  %21 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !62
  %22 = call i32 @MPI_Dims_create(i32 noundef %20, i32 noundef 2, ptr noundef %21), !dbg !63
  %23 = getelementptr inbounds [2 x i32], ptr %10, i64 0, i64 0, !dbg !64
  %24 = getelementptr inbounds [2 x i32], ptr %9, i64 0, i64 0, !dbg !65
  %25 = call i32 @MPI_Cart_create(i32 noundef 1140850688, i32 noundef 2, ptr noundef %23, ptr noundef %24, i32 noundef 0, ptr noundef %8), !dbg !66
  %26 = call i32 @MPI_Comm_free(ptr noundef %8), !dbg !67
  %27 = call i32 @MPI_Finalize(), !dbg !68
  %28 = load i32, ptr %7, align 4, !dbg !69
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %28), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(i32 noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare i32 @MPI_Dims_create(i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Cart_create(i32 noundef, i32 noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Comm_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "faeb3754a3cbdfe375c56fa045b027ac")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 536, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 67)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 42, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 27)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !18, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250731-154348/MBB/PARCOACH-dynamic/COLL/Correct-mpi_cart_create-001.c", directory: "/rwthfs/rz/cluster/work/rwth1282/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "faeb3754a3cbdfe375c56fa045b027ac")
!14 = !{!15}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 278, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/mpich/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "4b71fd3b70af927520642c9484925c9e")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{!0, !7}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"openmp", i32 50}
!23 = !{i32 7, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 2}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"Debian clang version 15.0.6"}
!28 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 22, type: !29, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !33)
!29 = !DISubroutineType(types: !30)
!30 = !{!17, !17, !31}
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!33 = !{}
!34 = !DILocalVariable(name: "argc", arg: 1, scope: !28, file: !2, line: 22, type: !17)
!35 = !DILocation(line: 22, column: 14, scope: !28)
!36 = !DILocalVariable(name: "argv", arg: 2, scope: !28, file: !2, line: 22, type: !31)
!37 = !DILocation(line: 22, column: 27, scope: !28)
!38 = !DILocalVariable(name: "nprocs", scope: !28, file: !2, line: 23, type: !17)
!39 = !DILocation(line: 23, column: 7, scope: !28)
!40 = !DILocalVariable(name: "rank", scope: !28, file: !2, line: 24, type: !17)
!41 = !DILocation(line: 24, column: 7, scope: !28)
!42 = !DILocalVariable(name: "mpi_comm_0", scope: !28, file: !2, line: 25, type: !15)
!43 = !DILocation(line: 25, column: 12, scope: !28)
!44 = !DILocation(line: 27, column: 3, scope: !28)
!45 = !DILocation(line: 28, column: 3, scope: !28)
!46 = !DILocation(line: 29, column: 3, scope: !28)
!47 = !DILocation(line: 30, column: 7, scope: !48)
!48 = distinct !DILexicalBlock(scope: !28, file: !2, line: 30, column: 7)
!49 = !DILocation(line: 30, column: 14, scope: !48)
!50 = !DILocation(line: 30, column: 7, scope: !28)
!51 = !DILocation(line: 31, column: 5, scope: !48)
!52 = !DILocalVariable(name: "periods", scope: !28, file: !2, line: 34, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 64, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 2)
!56 = !DILocation(line: 34, column: 7, scope: !28)
!57 = !DILocalVariable(name: "dims", scope: !28, file: !2, line: 35, type: !53)
!58 = !DILocation(line: 35, column: 7, scope: !28)
!59 = !DILocalVariable(name: "coords", scope: !28, file: !2, line: 36, type: !53)
!60 = !DILocation(line: 36, column: 7, scope: !28)
!61 = !DILocation(line: 37, column: 19, scope: !28)
!62 = !DILocation(line: 37, column: 30, scope: !28)
!63 = !DILocation(line: 37, column: 3, scope: !28)
!64 = !DILocation(line: 38, column: 38, scope: !28)
!65 = !DILocation(line: 38, column: 44, scope: !28)
!66 = !DILocation(line: 38, column: 3, scope: !28)
!67 = !DILocation(line: 39, column: 3, scope: !28)
!68 = !DILocation(line: 41, column: 3, scope: !28)
!69 = !DILocation(line: 42, column: 41, scope: !28)
!70 = !DILocation(line: 42, column: 3, scope: !28)
!71 = !DILocation(line: 43, column: 3, scope: !28)
