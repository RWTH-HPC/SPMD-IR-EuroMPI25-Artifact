/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>
#include <stdlib.h>

int main(int argc, char** argv){
  int rank, size;
  MPI_Request req;
  MPI_Status status;

  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  int recvData;
  int sendBuf[size];
  // Each process will have an array of size 'size'.
  for (size_t i=0; i<size;i++) {
    sendBuf[i] = i*rank;
  }
  // Specify the number of elements each process will receive.
  int recvCounts[size];
  for (int i = 0; i < size; ++i) {
      recvCounts[i] = 1; // Each process will receive one element.
  }

  if (rank%2){
    MPI_Reduce_scatter_block(sendBuf, &recvData, recvCounts, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
  }
  else {
    MPI_Ireduce_scatter_block(sendBuf, &recvData, recvCounts, MPI_INT, MPI_SUM, MPI_COMM_WORLD, &req);
    MPI_Wait(&req, &status);
  }

  MPI_Finalize();
  return 0;
}
