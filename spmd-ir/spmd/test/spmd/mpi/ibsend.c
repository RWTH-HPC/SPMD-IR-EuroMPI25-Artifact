/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int myRank,size;
  int data;
  int sendData;
  int recvData;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  MPI_Request reqs[2];
  MPI_Status status;
  MPI_Status statuses[2];

  if(size!=3){
    MPI_Finalize();
    return 1;
  }

  // Calculate the required buffer size
  int bufferSize;
  MPI_Pack_size(1, MPI_INT, MPI_COMM_WORLD, &bufferSize);
  bufferSize += MPI_BSEND_OVERHEAD;

  // Allocate and attach the buffer
  char *buffer = (char *)malloc(bufferSize);
  MPI_Buffer_attach(buffer, bufferSize);

  if (myRank == 0) {
    sendData = 10;
    MPI_Issend(&sendData, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, &reqs[0]);
  }
  if (myRank == 1){
    MPI_Irecv(&recvData, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &reqs[0]);
  }

  data = 42;
  MPI_Ibcast(&data, 1, MPI_INT, /*ROOT_PROCESS=*/0, MPI_COMM_WORLD, &reqs[1]);


  int idx;
  MPI_Waitany(2, reqs, &idx, &status);

  if(idx == 2) {
    printf("bcast finished!\n");
  }

  // Detach and free the buffer
  MPI_Buffer_detach(&buffer, &bufferSize);
  free(buffer);

  MPI_Finalize();
  return 0;
}
