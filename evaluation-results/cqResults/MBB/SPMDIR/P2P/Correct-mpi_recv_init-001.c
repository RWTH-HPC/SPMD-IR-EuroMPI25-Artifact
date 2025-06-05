/* ///////////////////////// The MPI Bug Bench ////////////////////////

  Description: Correct usage of mpi_recv_init

  Version of MPI: 1.0

  Category: P2P

BEGIN_MBB_TESTS
  $ mpirun -np 2 ${EXE}
  | OK
  | Correct-mpi_recv_init
END_MBB_TESTS
//////////////////////       End of MBI headers        /////////////////// */

#include <mpi.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int nprocs = -1;
  int rank = -1;
  MPI_Request mpi_request_0 = MPI_REQUEST_NULL;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  if (nprocs < 2)
    printf(
        "MBB ERROR: This test needs at least 2 processes to produce a bug!\n");

  int *buf = (int *)calloc(10, sizeof(int));

  if (rank == 0) {
    MPI_Recv_init(buf, 10, MPI_INT, 1, 0, MPI_COMM_WORLD, &mpi_request_0);
    MPI_Start(&mpi_request_0);
    MPI_Wait(&mpi_request_0, MPI_STATUS_IGNORE);
  }
  if (rank == 1) {
    MPI_Send(buf, 10, MPI_INT, 0, 0, MPI_COMM_WORLD);
  }
  free(buf);
  if (rank == 0) {
    MPI_Request_free(&mpi_request_0);
  }

  MPI_Finalize();
  printf("Rank %d finished normally\n", rank);
  return 0;
}
