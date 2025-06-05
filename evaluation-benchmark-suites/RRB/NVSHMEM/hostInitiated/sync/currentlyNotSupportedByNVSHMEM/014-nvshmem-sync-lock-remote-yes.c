// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma write","rma write"],
    "RACE_PAIR": ["nvshmem_int_put@59","nvshmem_int_put@67"],
    "NPROCS": 2,
    "CONSISTENCY_CALLS": ["nvshmem_set_lock,nvshmem_clear_lock"],
    "SYNC_CALLS": ["nvshmem_set_lock,nvshmem_clear_lock,nvshmem_barrier_all"],
    "DESCRIPTION": "Two conflicting operations put and put, where only the first access is correcly ordered by a lock."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 3

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
    long *lock_d = (long *)nvshmem_malloc(sizeof(long));

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));

    // Synchronize across all PEs
    nvshmem_barrier_all();

    if (my_pe == 0) {
        // make it probable that PE 1 locks first to make race observable
        sleep(1);

        nvshmem_set_lock(lock_d);
        // CONFLICT
        nvshmem_int_put(remote_d, localbuf_d, 1, 1);
        nvshmem_clear_lock(lock_d);
    }

    if (my_pe == 2) {
        nvshmem_set_lock(lock_d);
        nvshmem_clear_lock(lock_d);
        // CONFLICT
        nvshmem_int_put(remote_d, localbuf_d, 1, 1);
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
    nvshmem_free(lock_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
