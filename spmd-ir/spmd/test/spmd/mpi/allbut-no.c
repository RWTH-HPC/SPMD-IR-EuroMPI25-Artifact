/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <mpi.h>

int main(int argc, char *argv[]) {
  int myRank;
  int sendData;
  int recvData;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &myRank);

  if (!(myRank == 0 && myRank == 1)) {//executed by all but rank==0 and 1
    sendData = 10;
    MPI_Allreduce(&recvData, &sendData, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
  }
  else { //executed by rank==0 and 1
    sendData = 20;
    MPI_Allreduce(&recvData, &sendData, 1, MPI_INT, MPI_SUM, MPI_COMM_WORLD);
  }
  MPI_Finalize();
  return 0;
}
