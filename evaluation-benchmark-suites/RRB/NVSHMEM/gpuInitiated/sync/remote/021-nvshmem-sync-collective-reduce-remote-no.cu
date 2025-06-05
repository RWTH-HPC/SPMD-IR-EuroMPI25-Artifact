// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "none",
    "ACCESS_SET": ["rma write","rma write"],
    "CONSISTENCY_CALLS": ["nvshmem_quiet"],
    "SYNC_CALLS": ["nvshmem_barrier_all"],
    "NPROCS": 4,
    "DESCRIPTION": "Two conflicting operations nvshmem_int_sum_reduce and nvshmem_int_put synchronized through nvshmem_barrier_all."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 4

__global__ void nvshmem_kernel(int *remote, int *localbuf, int *reduced) {
    // Initialize memory
    *remote = 0;
    *localbuf = 1;
    int x = 0;
    static uint64_t signal = 0;

    int my_pe = nvshmem_my_pe();

    // Synchronize across all PEs
    nvshmem_barrier_all();   
    
    // Potential conflict
    nvshmem_int_sum_reduce(NVSHMEM_TEAM_WORLD, reduced, remote, 1);

    nvshmem_barrier_all();

    if (my_pe == 0) {
        // Potential conflict
        nvshmem_int_put(remote, localbuf, 1, 1);
    }

    nvshmem_barrier_all();
}


int main(int argc, char **argv) {
    int remote, localbuf, reduced;

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
    int *reduced_d = (int *)nvshmem_malloc(sizeof(int));

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
    cudaMemcpy(&reduced, reduced_d, sizeof(int), cudaMemcpyDeviceToHost);

    // Synchronize
    nvshmem_barrier_all();

    printf("PE %d: localbuf = %d, remote = %d, reduced = %d\n", my_pe, localbuf, remote, reduced);

    // Synchronize again
    nvshmem_barrier_all();

    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);

    // Free NVSHMEM symmetric memory
    nvshmem_free(remote_d);
    nvshmem_free(localbuf_d);
    nvshmem_free(reduced_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
