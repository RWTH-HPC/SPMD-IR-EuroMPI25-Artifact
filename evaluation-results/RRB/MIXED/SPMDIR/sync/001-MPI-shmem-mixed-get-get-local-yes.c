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
    
    MPI_Win win;

    // Initialise MPI
    MPI_Init(&argc, &argv);
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

    // construct mpi communicator after OpenSHMEM PE numbers example from OpenSHMEM specification 1.6 Example 55
    MPI_Comm shmem_comm;
    MPI_Comm_split(MPI_COMM_WORLD, 0, shmem_pe, &shmem_comm);
    MPI_Comm_rank(shmem_comm, &mpi_rank);

    MPI_Win_create(remote1, sizeof(int), sizeof(int), MPI_INFO_NULL, shmem_comm, &win);

    shmem_barrier_all();
    MPI_Win_fence(0, win);

    if (mpi_rank == 0) {
        // CONFLICT
        MPI_Get(localbuf, 1, MPI_INT, 1, 0, 1, MPI_INT, win);
        // CONFLICT
        shmem_int_get(localbuf, remote2, 1, 1);
    }

    shmem_barrier_all();
    MPI_Win_fence(0, win);

    printf("MPI Rank: %d, SHMEM PE %d: localbuf = %d, remote1 = %d, remote2 = %d \n",
           mpi_rank, shmem_pe, *localbuf, *remote1, *remote2);

    MPI_Win_free(&win);
    MPI_Comm_free(&shmem_comm);

    shmem_finalize();
    MPI_Finalize();
    
    return 0;
}
