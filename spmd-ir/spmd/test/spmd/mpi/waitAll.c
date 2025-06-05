/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>

int main(int argc, char *argv[]) {
  int myRank, size;
  int data;
  int sendData;
  int recvData;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  MPI_Request reqs[2];

  if(size!=3){
    MPI_Finalize();
    return 1;
  }

  if (myRank == 0) {
    sendData = 10;
    MPI_Isend(&sendData, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, &(reqs[0]));
  }
  if (myRank == 1){
    MPI_Irecv(&recvData, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &(reqs[0]));
  }
  if (myRank == 2){
    data = 42;
  }
  MPI_Ibcast(&data, 1, MPI_INT, /*ROOT_PROCESS=*/2, MPI_COMM_WORLD, &(reqs[1]));

  MPI_Status statuses[2];
  MPI_Waitall(2, reqs, statuses);

  MPI_Finalize();
  return 0;
}
