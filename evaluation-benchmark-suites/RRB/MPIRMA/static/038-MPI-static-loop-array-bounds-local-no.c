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

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (size != PROC_NUM) {
        printf("I have %d ranks. You should rerun with %d.\n", size, PROC_NUM);
        MPI_Abort(MPI_COMM_WORLD, 1);
    }

    MPI_Win win;
    float* arr_base;
    MPI_Win_allocate(ARR_SIZE * sizeof(float), sizeof(float), MPI_INFO_NULL, MPI_COMM_WORLD, &arr_base, &win);

    int packet_size = ARR_SIZE / 4;
    float* arr_midp = arr_base + (ARR_SIZE / 2);

    if (rank == 0) {
        arr_base[0] = 0;
    } else {
        arr_base[0] = 1;
    }

    MPI_Win_fence(0, win);
    
    if (rank == 0) {
        for (int i = 0; i < packet_size; i++)
            MPI_Get(arr_base + i, 1, MPI_FLOAT, 1, 0, 1, MPI_FLOAT, win);
        arr_midp[0] = 3;
    }

    MPI_Win_fence(0, win);

    MPI_Barrier(MPI_COMM_WORLD);

    printf("Process %d finished. Array element = %f.\n", rank, arr_base[0]);

    MPI_Win_free(&win);
    MPI_Finalize();

    return 0;
}