/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int myRank, size;
  int sendData;
  int recvData;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  if(size!=2){
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
    MPI_Bsend(&sendData, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
  }
  if (myRank == 1){
    MPI_Recv(&recvData, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
  }

  // Detach and free the buffer
  MPI_Buffer_detach(&buffer, &bufferSize);
  free(buffer);

  MPI_Finalize();
  return 0;
}
