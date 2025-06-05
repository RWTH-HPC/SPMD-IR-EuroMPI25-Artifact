// send two non-overlapping packets of data with the same arrays

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
        return 1;
    }

    MPI_Win win;
    float* arr_base;
    MPI_Win_allocate(ARR_SIZE * sizeof(float), sizeof(float), MPI_INFO_NULL, MPI_COMM_WORLD, &arr_base, &win);

    int packet_size = ARR_SIZE / 4;
    int disposition = ARR_SIZE / 2;

    if (rank == 0) {
        for (int i = 0; i < ARR_SIZE; i++) {
            arr_base[i] = 0;
        }
    } else {
        for (int i = 0; i < ARR_SIZE; i++) {
            arr_base[i] = i;
        }
    }

    MPI_Barrier(MPI_COMM_WORLD);

    if (rank == 0) {
        /* no data race */
        MPI_Put(arr_base, packet_size, MPI_FLOAT, 1, 0, packet_size, MPI_FLOAT, win);
        MPI_Put(arr_base, packet_size, MPI_FLOAT, 1, disposition, packet_size, MPI_FLOAT, win);
    }

    MPI_Barrier(MPI_COMM_WORLD);

    int sum = 0;
    for (int i = 0; i < ARR_SIZE; i++) {
        sum += arr_base[i];
    }

    MPI_Barrier(MPI_COMM_WORLD);
    
    printf("Process %d finished. Array sum %d\n", rank, sum);
    
    MPI_Win_free(&win);
    MPI_Finalize();

    return 0;
}