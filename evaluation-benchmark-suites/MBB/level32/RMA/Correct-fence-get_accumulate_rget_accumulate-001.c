/* ///////////////////////// The MPI Bug Bench ////////////////////////

  Description: full description

  Version of MPI: 3.0

  Category: RMA

BEGIN_MBB_TESTS
  $ mpirun -np 2 ${EXE}
  | OK
  | Correct-fence-get_accumulate_rget_accumulate
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
  int int_0 = 0;
  int int_1 = 0;
  MPI_Request mpi_request_0 = MPI_REQUEST_NULL;

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
  MPI_Win_fence(0, mpi_win_0);
  if (rank == 0) {

    int *buf = (int *)calloc(10, sizeof(int));

    int *int_0 = (int *)calloc(10, sizeof(int));

    MPI_Get_accumulate(buf, 10, MPI_INT, int_0, 10, MPI_INT, 1, 0, 10, MPI_INT,
                       MPI_SUM, mpi_win_0);

    int *int_1 = (int *)calloc(10, sizeof(int));

    MPI_Rget_accumulate(buf, 10, MPI_INT, int_1, 10, MPI_INT, 0, 0, 10, MPI_INT,
                        MPI_SUM, mpi_win_0, &mpi_request_0);
  }
  MPI_Win_fence(0, mpi_win_0);
  if (rank == 0) {
    MPI_Wait(&mpi_request_0, MPI_STATUS_IGNORE);
  }
  MPI_Win_free(&mpi_win_0);

  MPI_Finalize();
  printf("Rank %d finished normally\n", rank);
  return 0;
}
