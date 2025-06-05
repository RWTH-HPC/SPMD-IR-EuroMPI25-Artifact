; ModuleID = '/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c.ll'
source_filename = "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ompi_predefined_communicator_t = type opaque
%struct.ompi_predefined_info_t = type opaque
%struct.ompi_predefined_datatype_t = type opaque

@ompi_mpi_comm_world = external global %struct.ompi_predefined_communicator_t, align 1
@.str = private unnamed_addr constant [49 x i8] c"Wrong number of MPI processes: %d. Expected: %d\0A\00", align 1, !dbg !0
@ompi_mpi_info_null = external global %struct.ompi_predefined_info_t, align 1
@ompi_mpi_int = external global %struct.ompi_predefined_datatype_t, align 1
@.str.1 = private unnamed_addr constant [94 x i8] c"Process %d: Execution finished, variable contents: value = %d, value2 = %d, win_base[0] = %d\0A\00", align 1, !dbg !7
@0 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@1 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@2 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@3 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@4 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@5 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@6 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@7 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@8 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@9 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@10 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@11 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@12 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@13 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@14 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@15 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@16 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1
@17 = private unnamed_addr constant [97 x i8] c"cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !49 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !55, metadata !DIExpression()), !dbg !56
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata ptr %6, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata ptr %7, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata ptr %8, metadata !63, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata ptr %9, metadata !68, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata ptr %10, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 1, ptr %10, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata ptr %11, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 2, ptr %11, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata ptr %12, metadata !75, metadata !DIExpression()), !dbg !76
  store ptr %10, ptr %12, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata ptr %13, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata ptr %14, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 42, ptr %14, align 4, !dbg !80
  %16 = call i32 @MPI_Init(ptr noundef %4, ptr noundef %5), !dbg !81
  %17 = call i32 @MPI_Comm_rank(ptr noundef @ompi_mpi_comm_world, ptr noundef %6), !dbg !82
  %18 = call i32 @MPI_Comm_size(ptr noundef @ompi_mpi_comm_world, ptr noundef %7), !dbg !83
  %19 = load i32, ptr %7, align 4, !dbg !84
  %20 = icmp ne i32 %19, 2, !dbg !86
  br i1 %20, label %21, label %25, !dbg !87

21:                                               ; preds = %2
  %22 = load i32, ptr %7, align 4, !dbg !88
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22, i32 noundef 2), !dbg !90
  %24 = call i32 @MPI_Abort(ptr noundef @ompi_mpi_comm_world, i32 noundef 1), !dbg !91
  br label %25, !dbg !92

25:                                               ; preds = %21, %2
  %26 = call i32 @parcoach_rma_MPI_Win_allocate(i64 40, i32 4, ptr @ompi_mpi_info_null, ptr @ompi_mpi_comm_world, ptr %9, ptr %8, i32 31, ptr @0), !dbg !93
  call void @llvm.dbg.declare(metadata ptr %15, metadata !94, metadata !DIExpression()), !dbg !96
  store i32 0, ptr %15, align 4, !dbg !96
  br label %27, !dbg !97

27:                                               ; preds = %35, %25
  %28 = load i32, ptr %15, align 4, !dbg !98
  %29 = icmp slt i32 %28, 10, !dbg !100
  br i1 %29, label %30, label %38, !dbg !101

30:                                               ; preds = %27
  %31 = load ptr, ptr %9, align 8, !dbg !102
  %32 = load i32, ptr %15, align 4, !dbg !104
  %33 = sext i32 %32 to i64, !dbg !102
  %34 = getelementptr inbounds i32, ptr %31, i64 %33, !dbg !102
  store i32 0, ptr %34, align 4, !dbg !105
  br label %35, !dbg !106

35:                                               ; preds = %30
  call void @parcoach_rma_load(ptr %15, i64 32, i32 32, ptr @16), !dbg !107
  %36 = load i32, ptr %15, align 4, !dbg !107
  %37 = add nsw i32 %36, 1, !dbg !107
  call void @parcoach_rma_store(ptr %15, i64 32, i32 32, ptr @17), !dbg !107
  store i32 %37, ptr %15, align 4, !dbg !107
  br label %27, !dbg !108, !llvm.loop !109

38:                                               ; preds = %27
  %39 = load ptr, ptr %8, align 8, !dbg !112
  %40 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %39, i32 36, ptr @1), !dbg !113
  call void @parcoach_rma_load(ptr %6, i64 32, i32 37, ptr @2), !dbg !114
  %41 = load i32, ptr %6, align 4, !dbg !114
  %42 = icmp eq i32 %41, 0, !dbg !116
  br i1 %42, label %43, label %47, !dbg !117

43:                                               ; preds = %38
  call void @parcoach_rma_load(ptr %8, i64 64, i32 38, ptr @3), !dbg !118
  %44 = load ptr, ptr %8, align 8, !dbg !118
  %45 = call i32 @parcoach_rma_MPI_Put(ptr %10, i32 1, ptr @ompi_mpi_int, i32 1, i64 0, i32 1, ptr @ompi_mpi_int, ptr %44, i32 38, ptr @4), !dbg !120
  %46 = call i32 @MPI_Send(ptr noundef %10, i32 noundef 1, ptr noundef @ompi_mpi_int, i32 noundef 1, i32 noundef 0, ptr noundef @ompi_mpi_comm_world), !dbg !121
  br label %47, !dbg !122

47:                                               ; preds = %43, %38
  call void @parcoach_rma_load(ptr %6, i64 32, i32 41, ptr @5), !dbg !123
  %48 = load i32, ptr %6, align 4, !dbg !123
  %49 = icmp eq i32 %48, 1, !dbg !125
  br i1 %49, label %50, label %52, !dbg !126

50:                                               ; preds = %47
  %51 = call i32 @MPI_Recv(ptr noundef %11, i32 noundef 1, ptr noundef @ompi_mpi_int, i32 noundef 0, i32 noundef -1, ptr noundef @ompi_mpi_comm_world, ptr noundef null), !dbg !127
  br label %52, !dbg !129

52:                                               ; preds = %50, %47
  call void @parcoach_rma_load(ptr %8, i64 64, i32 44, ptr @6), !dbg !130
  %53 = load ptr, ptr %8, align 8, !dbg !130
  %54 = call i32 @parcoach_rma_MPI_Win_fence(i32 0, ptr %53, i32 44, ptr @7), !dbg !131
  %55 = call i32 @parcoach_rma_MPI_Barrier(ptr @ompi_mpi_comm_world, i32 46, ptr @8), !dbg !132
  call void @parcoach_rma_load(ptr %6, i64 32, i32 49, ptr @9), !dbg !133
  %56 = load i32, ptr %6, align 4, !dbg !133
  call void @parcoach_rma_load(ptr %12, i64 64, i32 50, ptr @10), !dbg !134
  %57 = load ptr, ptr %12, align 8, !dbg !134
  call void @parcoach_rma_load(ptr %57, i64 32, i32 50, ptr @11), !dbg !135
  %58 = load i32, ptr %57, align 4, !dbg !135
  call void @parcoach_rma_load(ptr %11, i64 32, i32 51, ptr @12), !dbg !136
  %59 = load i32, ptr %11, align 4, !dbg !136
  call void @parcoach_rma_load(ptr %9, i64 64, i32 52, ptr @13), !dbg !137
  %60 = load ptr, ptr %9, align 8, !dbg !137
  %61 = getelementptr inbounds i32, ptr %60, i64 0, !dbg !137
  call void @parcoach_rma_load(ptr %61, i64 32, i32 52, ptr @14), !dbg !137
  %62 = load i32, ptr %61, align 4, !dbg !137
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %56, i32 noundef %58, i32 noundef %59, i32 noundef %62), !dbg !138
  %64 = call i32 @parcoach_rma_MPI_Win_free(ptr %8, i32 54, ptr @15), !dbg !139
  %65 = call i32 @MPI_Finalize(), !dbg !140
  ret i32 0, !dbg !141
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @MPI_Init(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_rank(ptr noundef, ptr noundef) #2

declare i32 @MPI_Comm_size(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @MPI_Abort(ptr noundef, i32 noundef) #2

declare i32 @MPI_Win_allocate(i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Win_fence(i32 noundef, ptr noundef) #2

declare i32 @MPI_Put(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Send(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef) #2

declare i32 @MPI_Recv(ptr noundef, i32 noundef, ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @MPI_Barrier(ptr noundef) #2

declare i32 @MPI_Win_free(ptr noundef) #2

declare i32 @MPI_Finalize() #2

declare i32 @parcoach_rma_MPI_Win_allocate(i64, i32, ptr, ptr, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_fence(i32, ptr, i32, ptr)

declare void @parcoach_rma_load(ptr, i64, i32, ptr)

declare i32 @parcoach_rma_MPI_Put(ptr, i32, ptr, i32, i64, i32, ptr, ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Barrier(ptr, i32, ptr)

declare i32 @parcoach_rma_MPI_Win_free(ptr, i32, ptr)

declare void @parcoach_rma_store(ptr, i64, i32, ptr)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!40, !41, !42, !43, !44, !45, !46, !47}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 27, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7e2b6eaa45bcebfc59044a0a8c50f92b")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 49)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 752, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 94)
!12 = distinct !DICompileUnit(language: DW_LANG_C99, file: !13, producer: "Debian clang version 15.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !14, globals: !39, splitDebugInlining: false, nameTableKind: None)
!13 = !DIFile(filename: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite/cq-results-20250604-173113/RRB/MPIRMA/PARCOACH-static/rma+nonrma/002-MPI-p2p-put-send-local-no.c", directory: "/rwthfs/rz/cluster/home/ss540294/spmdir/spmd/externals/data-race-detection-benchmark-suite", checksumkind: CSK_MD5, checksum: "7e2b6eaa45bcebfc59044a0a8c50f92b")
!14 = !{!15, !19, !20, !23, !26}
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Comm", file: !16, line: 419, baseType: !17)
!16 = !DIFile(filename: "/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h", directory: "", checksumkind: CSK_MD5, checksum: "c3ca5be6f2c6a6e16d01846df47c0b49")
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_communicator_t", file: !16, line: 419, flags: DIFlagFwdDecl)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Info", file: !16, line: 424, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_info_t", file: !16, line: 424, flags: DIFlagFwdDecl)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Datatype", file: !16, line: 420, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_datatype_t", file: !16, line: 420, flags: DIFlagFwdDecl)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Status", file: !16, line: 428, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_status_public_t", file: !16, line: 438, size: 192, elements: !29)
!29 = !{!30, !32, !33, !34, !35}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_SOURCE", scope: !28, file: !16, line: 441, baseType: !31, size: 32)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_TAG", scope: !28, file: !16, line: 442, baseType: !31, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "MPI_ERROR", scope: !28, file: !16, line: 443, baseType: !31, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_cancelled", scope: !28, file: !16, line: 448, baseType: !31, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_ucount", scope: !28, file: !16, line: 449, baseType: !36, size: 64, offset: 128)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "/usr/lib/llvm-15/lib/clang/15.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "b76978376d35d5cd171876ac58ac1256")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !{!0, !7}
!40 = !{i32 7, !"Dwarf Version", i32 5}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = !{i32 7, !"openmp", i32 50}
!44 = !{i32 7, !"PIC Level", i32 2}
!45 = !{i32 7, !"PIE Level", i32 2}
!46 = !{i32 7, !"uwtable", i32 2}
!47 = !{i32 7, !"frame-pointer", i32 2}
!48 = !{!"Debian clang version 15.0.6"}
!49 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !50, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !54)
!50 = !DISubroutineType(types: !51)
!51 = !{!31, !31, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!54 = !{}
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !2, line: 12, type: !31)
!56 = !DILocation(line: 12, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !2, line: 12, type: !52)
!58 = !DILocation(line: 12, column: 27, scope: !49)
!59 = !DILocalVariable(name: "rank", scope: !49, file: !2, line: 14, type: !31)
!60 = !DILocation(line: 14, column: 9, scope: !49)
!61 = !DILocalVariable(name: "size", scope: !49, file: !2, line: 14, type: !31)
!62 = !DILocation(line: 14, column: 15, scope: !49)
!63 = !DILocalVariable(name: "win", scope: !49, file: !2, line: 15, type: !64)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "MPI_Win", file: !16, line: 429, baseType: !65)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DICompositeType(tag: DW_TAG_structure_type, name: "ompi_win_t", file: !16, line: 429, flags: DIFlagFwdDecl)
!67 = !DILocation(line: 15, column: 13, scope: !49)
!68 = !DILocalVariable(name: "win_base", scope: !49, file: !2, line: 16, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!70 = !DILocation(line: 16, column: 10, scope: !49)
!71 = !DILocalVariable(name: "value", scope: !49, file: !2, line: 17, type: !31)
!72 = !DILocation(line: 17, column: 9, scope: !49)
!73 = !DILocalVariable(name: "value2", scope: !49, file: !2, line: 17, type: !31)
!74 = !DILocation(line: 17, column: 20, scope: !49)
!75 = !DILocalVariable(name: "buf", scope: !49, file: !2, line: 18, type: !69)
!76 = !DILocation(line: 18, column: 10, scope: !49)
!77 = !DILocalVariable(name: "result", scope: !49, file: !2, line: 19, type: !31)
!78 = !DILocation(line: 19, column: 9, scope: !49)
!79 = !DILocalVariable(name: "token", scope: !49, file: !2, line: 20, type: !31)
!80 = !DILocation(line: 20, column: 9, scope: !49)
!81 = !DILocation(line: 22, column: 5, scope: !49)
!82 = !DILocation(line: 23, column: 5, scope: !49)
!83 = !DILocation(line: 24, column: 5, scope: !49)
!84 = !DILocation(line: 26, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !49, file: !2, line: 26, column: 9)
!86 = !DILocation(line: 26, column: 14, scope: !85)
!87 = !DILocation(line: 26, column: 9, scope: !49)
!88 = !DILocation(line: 27, column: 69, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !2, line: 26, column: 27)
!90 = !DILocation(line: 27, column: 9, scope: !89)
!91 = !DILocation(line: 28, column: 9, scope: !89)
!92 = !DILocation(line: 29, column: 5, scope: !89)
!93 = !DILocation(line: 31, column: 5, scope: !49)
!94 = !DILocalVariable(name: "i", scope: !95, file: !2, line: 32, type: !31)
!95 = distinct !DILexicalBlock(scope: !49, file: !2, line: 32, column: 5)
!96 = !DILocation(line: 32, column: 14, scope: !95)
!97 = !DILocation(line: 32, column: 10, scope: !95)
!98 = !DILocation(line: 32, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !2, line: 32, column: 5)
!100 = !DILocation(line: 32, column: 23, scope: !99)
!101 = !DILocation(line: 32, column: 5, scope: !95)
!102 = !DILocation(line: 33, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !2, line: 32, column: 40)
!104 = !DILocation(line: 33, column: 18, scope: !103)
!105 = !DILocation(line: 33, column: 21, scope: !103)
!106 = !DILocation(line: 34, column: 5, scope: !103)
!107 = !DILocation(line: 32, column: 36, scope: !99)
!108 = !DILocation(line: 32, column: 5, scope: !99)
!109 = distinct !{!109, !101, !110, !111}
!110 = !DILocation(line: 34, column: 5, scope: !95)
!111 = !{!"llvm.loop.mustprogress"}
!112 = !DILocation(line: 36, column: 22, scope: !49)
!113 = !DILocation(line: 36, column: 5, scope: !49)
!114 = !DILocation(line: 37, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !49, file: !2, line: 37, column: 9)
!116 = !DILocation(line: 37, column: 14, scope: !115)
!117 = !DILocation(line: 37, column: 9, scope: !49)
!118 = !DILocation(line: 38, column: 55, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !2, line: 37, column: 20)
!120 = !DILocation(line: 38, column: 9, scope: !119)
!121 = !DILocation(line: 39, column: 9, scope: !119)
!122 = !DILocation(line: 40, column: 5, scope: !119)
!123 = !DILocation(line: 41, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !49, file: !2, line: 41, column: 9)
!125 = !DILocation(line: 41, column: 14, scope: !124)
!126 = !DILocation(line: 41, column: 9, scope: !49)
!127 = !DILocation(line: 42, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !2, line: 41, column: 20)
!129 = !DILocation(line: 43, column: 5, scope: !128)
!130 = !DILocation(line: 44, column: 22, scope: !49)
!131 = !DILocation(line: 44, column: 5, scope: !49)
!132 = !DILocation(line: 46, column: 5, scope: !49)
!133 = !DILocation(line: 49, column: 9, scope: !49)
!134 = !DILocation(line: 50, column: 10, scope: !49)
!135 = !DILocation(line: 50, column: 9, scope: !49)
!136 = !DILocation(line: 51, column: 9, scope: !49)
!137 = !DILocation(line: 52, column: 9, scope: !49)
!138 = !DILocation(line: 47, column: 5, scope: !49)
!139 = !DILocation(line: 54, column: 5, scope: !49)
!140 = !DILocation(line: 55, column: 5, scope: !49)
!141 = !DILocation(line: 57, column: 5, scope: !49)
