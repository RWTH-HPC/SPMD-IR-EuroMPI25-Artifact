/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include <mpi.h>
#include <stdio.h>

#define PROC_NUM 3
#define ARR_SIZE 100

int main(int argc, char** argv) {
    int rank;
    int size;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (size != PROC_NUM) {
        printf("I have %d ranks. You should rerun with %d.\n", size, PROC_NUM);
        MPI_Abort(MPI_COMM_WORLD, 1);
    }

    MPI_Win win1, win2;
    int *arr1, *arr2;
    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &arr1, &win1);
    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &arr2, &win2);

    int packet_size = ARR_SIZE / 2;

    for (int i = 0; i < ARR_SIZE; i++) {
        arr1[i] = (rank + 1);
        arr2[i] = i * (rank + 1);
    }

    MPI_Barrier(MPI_COMM_WORLD);

    if (rank == 0) {
        MPI_Win_lock_all(0, win1);
        MPI_Win_lock_all(0, win2);

        MPI_Put(arr2, packet_size, MPI_INT, 1, 0, packet_size, MPI_INT, win1);

        MPI_Win_flush_all(win1);

        /* no data race: correct flush parameters */
        MPI_Get(arr2, packet_size, MPI_INT, 2, 0, packet_size, MPI_INT, win2);
        MPI_Win_flush(2, win2);
        MPI_Get(arr1, packet_size, MPI_INT, 2, 0, packet_size, MPI_INT, win2);

        MPI_Win_flush_all(win1);
        MPI_Win_flush_all(win2);
        MPI_Win_unlock_all(win1);
        MPI_Win_unlock_all(win2);
    }

    MPI_Barrier(MPI_COMM_WORLD);

    int sum1 = 0;
    int sum2 = 0;
    for (int i = 0; i < ARR_SIZE; i++) {
        sum1 += arr1[i];
        sum2 += arr2[i];
    }

    MPI_Barrier(MPI_COMM_WORLD);
    
    printf("Process %d finished. Sums: sum1 = %d, sum2 = %d\n", rank, sum1, sum2);
    
    MPI_Win_free(&win1);
    MPI_Win_free(&win2);
    MPI_Finalize();

    return 0;
}