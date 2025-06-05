// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

// even ranks go first in Reduce in Line 16 and since they constitute the whole splitComm they can finish the op and go to barrier
  // odd ranks wait in Barrier in Line 20 and can move to Reduce Line 21 as soon as even ranks finishes their ReduceOp.
  #include "cuda_runtime.h"
  #include "nccl.h"
  #include <mpi.h>

  int main(int argc, char *argv[]) {
  int myRank, size;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  ncclUniqueId id;
  //get NCCL unique ID at rank 0 and broadcast it to all others
  if (myRank == 0) {
    ncclGetUniqueId(&id);
  }
  MPI_Bcast(&id, sizeof(id), MPI_BYTE, 0, MPI_COMM_WORLD);

  ncclComm_t commWorld;
  int *buf_d;
  cudaStream_t stream;

  //picking a GPU based on mpiRank (assuming one mpi rank per node with one gpu), allocate device buffers
  cudaSetDevice(0);
  cudaMalloc(&buf_d, 0 * sizeof(int));
  cudaStreamCreate(&stream);

  //initializing NCCL
  ncclConfig_t config = NCCL_CONFIG_INITIALIZER;
  config.blocking = 0;
  ncclCommInitRankConfig(&commWorld, size, id, myRank, &config);

  ncclComm_t newComm;
  ncclCommSplit(commWorld, myRank%2, myRank, &newComm, NULL);

  ncclAllGather(buf_d, buf_d, 0, ncclInt, commWorld, stream); //simulate Ibarrier
  ncclAllGather(buf_d, buf_d, 0, ncclInt, commWorld, stream); //simulate Ibarrier

  ncclResult_t state1;
  ncclResult_t state2;

  if (myRank%2) {
    do {
      ncclCommGetAsyncError(commWorld, &state1);
    } while(state1 == ncclInProgress);
    do {
      ncclCommGetAsyncError(newComm, &state2);
    } while(state2 == ncclInProgress);
  }

  //completing NCCL operations by synchronizing on the CUDA stream
  cudaStreamSynchronize(stream);
  MPI_Barrier(MPI_COMM_WORLD);

  //free device buffers
  cudaFree(buf_d);

  //finalizing NCCL
  ncclCommDestroy(commWorld);
  ncclCommDestroy(newComm);

  MPI_Finalize();
  return 0;
  }