/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <mpi.h>
#include <stdio.h>

#define PROC_NUM 2

int main(int argc, char** argv)
{
    int mpi_rank, mpi_size,
        shmem_pe, shmem_size;
    
    int shmem_target_pe;
    MPI_Win win;

    // Initialise MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &mpi_rank);
    MPI_Comm_size(MPI_COMM_WORLD, &mpi_size);

    // Initialise SHMEM
    shmem_init();
    shmem_size = shmem_n_pes();
    shmem_pe = shmem_my_pe();

    if (mpi_size != shmem_size || shmem_size != PROC_NUM) {
        printf("I have %d PEs and %d ranks. You should rerun with %d of both.\n", shmem_size, mpi_size, PROC_NUM);
    }

    // Create communication arrays for SHMEM and window for MPI
    int* remote1 = (int*)(shmem_malloc(sizeof(int)));
    int* remote2 = (int*)(shmem_malloc(sizeof(int)));
    int* localbuf = (int*)(shmem_malloc(sizeof(int)));

    MPI_Win_create(remote1, sizeof(int), sizeof(int), MPI_INFO_NULL, MPI_COMM_WORLD, &win);

    // Data race is to be caused on MPI rank 0 using rank 1.
    // SHMEM's PE index is not guaranteed to line up with MPI's rank index
    // To ensure proper communication, rank 1 broadcasts its SHMEM PE to the other ranks.
    if (mpi_rank == 1)
        shmem_target_pe = shmem_pe;
    MPI_Bcast(&shmem_target_pe, 1, MPI_INT, 1, MPI_COMM_WORLD);

    shmem_barrier_all();

    if (mpi_rank == 0) {
        MPI_Win_lock(MPI_LOCK_EXCLUSIVE, 1, 0, win);
        MPI_Get(localbuf, 1, MPI_INT, 1, 0, 1, MPI_INT, win);
        MPI_Win_flush(1, win);
        shmem_int_get_nbi(localbuf, remote2, 1, shmem_target_pe);
        MPI_Win_unlock(1, win);
    }

    shmem_barrier_all();

    printf("MPI Rank: %d, SHMEM PE %d: localbuf = %d, remote1 = %d, remote2 = %d \n",
           mpi_rank, shmem_pe, *localbuf, *remote1, *remote2);

    MPI_Win_free(&win);

    shmem_finalize();
    MPI_Finalize();

    return 0;
}
