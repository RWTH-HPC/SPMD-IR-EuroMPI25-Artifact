/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <mpi.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 100

void inefficient_get(int iteration, int* arr_base, MPI_Win win) {
    // CONFLICT-SAME-LINE
    MPI_Get(arr_base, 1, MPI_INT, 1, iteration, 1, MPI_INT, win);
    if (iteration < 10) {
        inefficient_get(iteration + 1, arr_base, win);
    }
}

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

    MPI_Win win;
    int* arr_base;
    MPI_Win_allocate(ARR_SIZE * sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &arr_base, &win);

    int packet_size = ARR_SIZE / 2;

    if (rank == 0) {
        for (int i = 0; i < ARR_SIZE; i++) {
            arr_base[i] = 0;
        }
    } else {
        for (int i = 0; i < ARR_SIZE; i++) {
            arr_base[i] = i;
        }
    }

    MPI_Win_fence(0, win);

    if (rank == 0) {
        inefficient_get(0, arr_base, win);
    }

    MPI_Win_fence(0, win);
    
    MPI_Barrier(MPI_COMM_WORLD);
    printf("Process %d finished. Array element %d\n", rank, arr_base[1]);
    
    MPI_Win_free(&win);
    MPI_Finalize();

    return 0;
}