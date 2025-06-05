// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma atomic write","load"],
    "RACE_PAIR": ["nvshmem_int_atomic_set@35","LOAD@40"],
    "NPROCS": 2,
    "DESCRIPTION": "Two conflicting operations atomicset and load executed concurrently which leads to a race."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <cuda_runtime.h>
#include <mynvshmem.h>
#include <mynvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 2

__global__ void nvshmem_kernel(int *remote, int *localbuf) {
    // Initialize memory
    *remote = 0;
    *localbuf = 1;
    int x = 0;

    int my_pe = nvshmem_my_pe();

    // Synchronize across all PEs
    nvshmem_barrier_all();

    if (my_pe == 0) {
        // CONFLICT
        nvshmem_int_atomic_set(remote, 42, 1);
    }

    if (my_pe == 1) {
        // CONFLICT
        x = *remote;
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();
    *remote += x;
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

    // Allocate shared memory across PEs
    size_t shared_data_size = 0 * sizeof(int);

    // Define kernel execution parameters
    void *args[] = {remote_d, localbuf_d};  // Kernel arguments
    dim3 blocks(1);
    dim3 threads(1);

    // Launch kernel collectively across all PEs
    nvshmemx_collective_launch((const void *)nvshmem_kernel, blocks, threads, args, shared_data_size, 0);

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