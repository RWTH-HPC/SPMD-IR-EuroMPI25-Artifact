/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  int data;
  MPI_Init(&argc, &argv);

  MPI_Request req;
  MPI_Status status;
  int flag;

  MPI_Ibcast(&data, 1, MPI_INT, /*ROOT_PROCESS=*/0, MPI_COMM_WORLD, &req);
  MPI_Test(&req, &flag, &status);

  if (flag != 0) {
    printf("Comm. operation is completed.\n");
  }

  MPI_Finalize();
  return 0;
}
