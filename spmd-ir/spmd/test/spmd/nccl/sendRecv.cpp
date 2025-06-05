// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#include "cuda_runtime.h"
  #include "nccl.h"
  #include <stdlib.h>
  #include <stdio.h>
  #include "mpi.h"


  int main(int argc, char** argv){
  int rank, size;

  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);
  MPI_Comm_size(MPI_COMM_WORLD,&size);

  if(size<2){
    printf("This test needs at least 2 MPI processes\n");
    MPI_Finalize();
    return 1;
  }

  ncclUniqueId id;
  //get NCCL unique ID at rank 0 and broadcast it to all others
  if (rank == 0) {
    ncclGetUniqueId(&id);
  }
  MPI_Bcast(&id, sizeof(id), MPI_BYTE, 0, MPI_COMM_WORLD);

  ncclComm_t commWorld;
  int myRank;
  int *buf_d;
  cudaStream_t stream;

  //picking a GPU based on mpiRank (assuming one mpi rank per node with one gpu), allocate device buffers
  cudaSetDevice(0);
  cudaMalloc(&buf_d, 1 * sizeof(int));
  cudaStreamCreate(&stream);

  //initializing NCCL
  ncclCommInitRank(&commWorld, size, id, rank);
  ncclCommUserRank(commWorld, &myRank);

  if (myRank == 0) {
    cudaMemset(buf_d, 42, 1 * sizeof(int));
    ncclSend(buf_d, 1, ncclInt, 1, commWorld, stream);
  }
  if (myRank == 1){
    ncclRecv(buf_d, 1, ncclInt, 0, commWorld, stream);
  }

  //completing NCCL operation by synchronizing on the CUDA stream
  cudaStreamSynchronize(stream);
  MPI_Barrier(MPI_COMM_WORLD);

  //free device buffers
  cudaFree(buf_d);

  //finalizing NCCL
  ncclCommDestroy(commWorld);

  MPI_Finalize();
  return 0;
  }