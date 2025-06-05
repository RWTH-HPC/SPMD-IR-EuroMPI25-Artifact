/* ///////////////////////// The MPI Bug Bench ////////////////////////

  Description: Correct usage of mpi_imrecv

  Version of MPI: 3.0

  Category: P2P

BEGIN_MBB_TESTS
  $ mpirun -np 2 ${EXE}
  | OK
  | Correct-mpi_imrecv
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
  MPI_Message mpi_message_0 = MPI_MESSAGE_NULL;
  MPI_Request mpi_request_0 = MPI_REQUEST_NULL;
  int int_0 = 0;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  if (nprocs < 2)
    printf(
        "MBB ERROR: This test needs at least 2 processes to produce a bug!\n");

  int *buf = (int *)calloc(10, sizeof(int));

  if (rank == 0) {
    MPI_Mprobe(1, 0, MPI_COMM_WORLD, &mpi_message_0, MPI_STATUS_IGNORE);
    MPI_Imrecv(buf, 10, MPI_INT, &mpi_message_0, &mpi_request_0);
    MPI_Wait(&mpi_request_0, MPI_STATUS_IGNORE);
  }
  if (rank == 1) {
    MPI_Isend(buf, 10, MPI_INT, 0, 0, MPI_COMM_WORLD, &mpi_request_0);
    MPI_Wait(&mpi_request_0, MPI_STATUS_IGNORE);
  }
  free(buf);

  MPI_Finalize();
  printf("Rank %d finished normally\n", rank);
  return 0;
}
