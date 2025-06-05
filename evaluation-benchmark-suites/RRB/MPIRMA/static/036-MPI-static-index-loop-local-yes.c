/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <mpi.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 10

int main(int argc, char** argv)
{
    int rank, size;
    MPI_Win win;
    int localbuf[ARR_SIZE];
    int* win_base;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    for (int i = 0; i < ARR_SIZE; i++) {
        localbuf[i] = i;
    }


    if (size != PROC_NUM) {
        printf("Wrong number of MPI processes: %d. Expected: %d\n", size, PROC_NUM);
        MPI_Abort(MPI_COMM_WORLD, 1);
    }

    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &win_base, &win);
    for (int i = 0; i < ARR_SIZE; i++) {
        win_base[i] = 0;
    }

    MPI_Win_fence(0, win);

    if (rank == 0) {
        for (int i = 1; i < ARR_SIZE; i++) {
            // CONFLICT
            MPI_Put(&(localbuf[i]), 1, MPI_INT, 1, i, 1, MPI_INT, win);
            // CONFLICT
            localbuf[i-1]++;
        }   
    }

    MPI_Win_fence(0, win);

    MPI_Barrier(MPI_COMM_WORLD);
    printf("Process %d: Execution finished, variable contents: win_base = %d, localbuf = %d\n", rank, win_base[0], localbuf[0]);

    MPI_Win_free(&win);
    MPI_Finalize();

    return 0;
}
