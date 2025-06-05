// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma write","load"],
    "RACE_PAIR": ["nvshmem_int_put@43","LOAD@53"],
    "CONSISTENCY_CALLS": ["nvshmem_quiet"],
    "SYNC_CALLS": ["nvshmem_team_sync"],
    "NPROCS": 4,
    "DESCRIPTION": "PE 2 part of the team puts to PE 3 which is *not* part of the team. There is no synchronization between PE 2 and PE3, since they are not in the same team."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 4

__global__ void nvshmem_kernel(int *remote, int *localbuf) {
    // Initialize memory
    *remote = 0;
    *localbuf = 1;
    int x = 0;

    int my_pe = nvshmem_my_pe();
    int num_pe = nvshmem_n_pes();

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    nvshmem_team_t team = NVSHMEM_TEAM_INVALID;
    nvshmem_team_split_strided(NVSHMEM_TEAM_WORLD, 0, 2, num_pe / 2, NULL, 0lu, &team);

    nvshmem_barrier_all();

    if (NVSHMEM_TEAM_INVALID != team) {
        if (my_pe == 2) {
            // CONFLICT
            nvshmem_int_put(remote, localbuf, 1, 3); // P2 puts to P3
        }
        nvshmem_quiet(); // Synchronisation

        nvshmem_team_sync(team); // Synchronisation
    }

    if (NVSHMEM_TEAM_INVALID == team) {
        if (my_pe == 3)
        // CONFLICT
        x = *remote;
    }

    nvshmem_barrier_all();
}


int main(int argc, char **argv) {
    int remote, localbuf;

    // Initialize NVSHMEM
    nvshmem_init();
    int mype_node = nvshmem_team_my_pe(NVSHMEMX_TEAM_NODE);
    cudaSetDevice(mype_node);

    // Get the number of PEs and the current PE's rank
    int my_pe = nvshmem_my_pe();
    int num_pe = nvshmem_n_pes();
    // Ensure the required number of PEs
    if (num_pe != PROC_NUM) {
        printf("Got %d PEs, expected %d\n", num_pe, PROC_NUM);
        nvshmem_global_exit(1);
    }

    // Allocate symmetric memory on the device
    int *remote_d = (int *)nvshmem_malloc(sizeof(int));
    int *localbuf_d = (int *)nvshmem_malloc(sizeof(int));

    // Step 3: Allocate shared memory across PEs
    size_t shared_data_size = 0 * sizeof(int);

    // Step 4: Define kernel execution parameters
    void *args[] = {remote_d, localbuf_d};  // Kernel arguments
    dim3 blocks(1);
    dim3 threads(1);

    // Launch kernel collectively across all PEs
    nvshmemx_collective_launch((void *)nvshmem_kernel, blocks, threads, args, shared_data_size, 0);

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(int), cudaMemcpyDeviceToHost);

    // Synchronize
    nvshmem_barrier_all();

    printf("PE %d: localbuf = %d, remote = %d\n", my_pe, localbuf, remote);

    // Synchronize again
    nvshmem_barrier_all();

    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);

    // Free NVSHMEM symmetric memory
    nvshmem_free(remote_d);
    nvshmem_free(localbuf_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
