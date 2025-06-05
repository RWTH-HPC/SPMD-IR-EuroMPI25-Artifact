// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "none",
    "ACCESS_SET": ["rma atomic write","rma atomic write"],
    "CONSISTENCY_CALLS": ["nvshmem_barrier_all"],
    "SYNC_CALLS": ["nvshmem_barrier_all"],
    "NPROCS": 3,
    "DESCRIPTION": "Two concurrent conflicting atomic operations used on the same context"
}
*/
// RACE LABELS END

#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

#define PROC_NUM 3

int main(int argc, char** argv) {
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

    // Create contexts
    nvshmem_ctx_t ctx;
    nvshmem_ctx_create(0, &ctx);

    // Synchronize across all PEs
    nvshmem_barrier_all();

    if (my_pe == 0) {
        nvshmem_ctx_int_atomic_add(ctx, remote_d, 1, 1);
    }

    if (my_pe == 2) {
        nvshmem_ctx_int_atomic_add(ctx, remote_d, 1, 1);
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
