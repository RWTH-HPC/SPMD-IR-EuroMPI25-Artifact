/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

//we assume that argc is dynamic but singe-value, so that if-region is only executed by a single process
#include <mpi.h>

int main(int argc, char *argv[]) {
  int myRank;
  int data;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);
  if (myRank == argc) {
    data = 42;
    MPI_Bcast(&data, 1, MPI_INT, /*ROOT_PROCESS=*/0, MPI_COMM_WORLD);
  }
  MPI_Barrier(MPI_COMM_WORLD);
  MPI_Finalize();
  return 0;
}
