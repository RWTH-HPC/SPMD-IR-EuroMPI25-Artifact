/* ///////////////////////// The MPI Bug Bench ////////////////////////

  Description: Usage of buffer before operation is completed

  Version of MPI: 3.0

  Category: COLL

BEGIN_MBB_TESTS
  $ mpirun -np 2 ${EXE}
  | ERROR LocalConcurrency
  | LocalConcurrency-mpi_iscan
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

  int *recv_buf = (int *)calloc(10 * nprocs, sizeof(int));

  /*MBBERROR_BEGIN*/ MPI_Iscan(buf, recv_buf, 10, MPI_INT, MPI_SUM, MPI_COMM_WORLD,
            &mpi_request_0); /*MBBERROR_END*/
  /*MBBERROR_BEGIN*/ buf[2] = 1; /*MBBERROR_END*/
  MPI_Wait(&mpi_request_0, MPI_STATUS_IGNORE);
  free(buf);
  free(recv_buf);

  MPI_Finalize();
  printf("Rank %d finished normally\n", rank);
  return 0;
}
