// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma atomic write","rma atomic write"],
    "RACE_PAIR": ["nvshmem_int_atomic_add@52","nvshmem_long_atomic_add@57"],
    "CONSISTENCY_CALLS": ["nvshmem_barrier_all"],
    "SYNC_CALLS": ["nvshmem_barrier_all"],
    "NPROCS": 3,
    "DESCRIPTION": "Two concurrent conflicting atomic operations with different datatypes, no atomicity guarantee."
}
*/
// RACE LABELS END

#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

#define PROC_NUM 3

int main(int argc, char** argv) {
    long remote, localbuf;

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
    long *remote_d = (long *)nvshmem_malloc(sizeof(long));
    long *localbuf_d = (long *)nvshmem_malloc(sizeof(long));

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(long));
    cudaMemset(localbuf_d, 1, sizeof(long));

    // Synchronize across all PEs
    nvshmem_barrier_all();

    if (my_pe == 0) {
        // CONFLICT
        nvshmem_int_atomic_add((int*)remote_d, 2.0, 1);
    }

    if (my_pe == 2) {
        // CONFLICT
        nvshmem_long_atomic_add(remote_d, 3, 1);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(long), cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(long), cudaMemcpyDeviceToHost);

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
