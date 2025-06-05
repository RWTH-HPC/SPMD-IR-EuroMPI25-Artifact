// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma write","rma write"],
    "RACE_PAIR": ["nvshmem_ctx_int_put@58","nvshmem_ctx_int_put@65"],
    "CONSISTENCY_CALLS": ["nvshmem_quiet"],
    "SYNC_CALLS": ["nvshmem_barrier_all"],
    "NPROCS": 2,
    "DESCRIPTION": "Two conflicting nvshmem_ctx_put operations with nvshmem_quiet called on a wrong context, no consistency between the two puts."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 2

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

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));

    // Create context
    nvshmem_ctx_t ctx;
    nvshmem_ctx_create(0, &ctx);

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        // CONFLICT
        nvshmem_ctx_int_put_nbi(ctx, remote_d, localbuf_d, 1, 1);

        shmem_quiet();

        localbuf = 42;
        cudaMemcpy(localbuf_d, localbuf, sizeof(int), cudaMemcpyHostToDevice);
        // CONFLICT
        nvshmem_ctx_int_put_nbi(ctx, remote_d, localbuf_d, 1, 0);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(int), cudaMemcpyDeviceToHost);

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