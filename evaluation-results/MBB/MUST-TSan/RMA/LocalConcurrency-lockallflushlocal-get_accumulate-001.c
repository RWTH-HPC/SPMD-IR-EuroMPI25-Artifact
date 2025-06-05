/* ///////////////////////// The MPI Bug Bench ////////////////////////

  Description: full description

  Version of MPI: 3.0

  Category: RMA

BEGIN_MBB_TESTS
  $ mpirun -np 2 ${EXE}
  | ERROR LocalConcurrency
  | LocalConcurrency-lockallflushlocal-get_accumulate
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

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  if (nprocs < 2)
    printf(
        "MBB ERROR: This test needs at least 2 processes to produce a bug!\n");

  MPI_Win mpi_win_0;

  int *winbuf = (int *)calloc(20, sizeof(int));

  MPI_Win_create(winbuf, 20 * sizeof(int), sizeof(int), MPI_INFO_NULL,
                 MPI_COMM_WORLD, &mpi_win_0);
  MPI_Win_lock_all(0, mpi_win_0);
  if (rank == 0) {

    int *buf = (int *)calloc(10, sizeof(int));

    /*MBBERROR_BEGIN*/ MPI_Get(buf, 10, MPI_INT, 1, 0, 10, MPI_INT,
                               mpi_win_0); /*MBBERROR_END*/
    /*MBBERROR_BEGIN*/ MPI_Accumulate(buf, 10, MPI_INT, 0, 0, 10, MPI_INT,
                                      MPI_SUM, mpi_win_0); /*MBBERROR_END*/
  }
  MPI_Win_unlock_all(mpi_win_0);
  MPI_Win_free(&mpi_win_0);

  MPI_Finalize();
  printf("Rank %d finished normally\n", rank);
  return 0;
}
