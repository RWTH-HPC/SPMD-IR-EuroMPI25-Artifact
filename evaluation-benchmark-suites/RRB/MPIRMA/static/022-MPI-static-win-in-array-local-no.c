/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include <mpi.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 100

int main(int argc, char** argv) {
    int rank;
    int size;
    int *arr0, *arr1;
    int packet_size = ARR_SIZE / 2;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (size != PROC_NUM) {
        printf("I have %d ranks. You should rerun with %d.\n", size, PROC_NUM);
        MPI_Abort(MPI_COMM_WORLD, 1);
    }

    MPI_Win win0, win1;
    MPI_Win wins[2] = {win0, win1};
    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &arr0, &wins[0]);
    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &arr1, &wins[1]);
    for (int i = 0; i < ARR_SIZE; i++) {
        arr0[i] = i * (rank + 1);
        arr1[i] = 0;
    }

    MPI_Barrier(MPI_COMM_WORLD);

    if (rank == 0) {
        MPI_Win_lock(MPI_LOCK_EXCLUSIVE, 1, 0, wins[0]);
        MPI_Win_lock(MPI_LOCK_EXCLUSIVE, 1, 0, wins[1]);

        /* no data race: correct window for fence used */
        MPI_Get(arr1, packet_size, MPI_INT, 1, 0, packet_size, MPI_INT, wins[0]);
        MPI_Win_flush(1, wins[0]);
        MPI_Get(arr1, packet_size, MPI_INT, 1, packet_size, packet_size, MPI_INT, wins[0]);
        
        MPI_Win_flush(1, wins[0]);
        MPI_Win_flush(1, wins[1]);
        MPI_Win_unlock(1, wins[0]);
        MPI_Win_unlock(1, wins[1]);
    } 

    MPI_Barrier(MPI_COMM_WORLD);

    int sum0 = 0;
    int sum1 = 0;
    for (int i = 0; i < ARR_SIZE; i++) {
        sum0 += arr0[i];
        sum1 += arr1[i];
    }
    printf("Process %d finished. Sums: sum0 = %d, sum1 = %d\n", rank, sum0, sum1);

    MPI_Finalize();

    return 0;
}
