/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>

int main(int argc, char *argv[]) {
  int myRank, size;
  int data;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  if(size!=2){
    MPI_Finalize();
    return 1;
  }

  MPI_Request req;

  if (myRank == 0) {
    data = 10;
  }

  if (myRank == 0 || myRank == 1){
    MPI_Isendrecv_replace(&data, 1, MPI_INT, 1, 0, 0, 0, MPI_COMM_WORLD, &req);
  }

  MPI_Status status;
  MPI_Wait(&req, &status);

  MPI_Finalize();
  return 0;
}
