// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma write","rma read"],
    "RACE_PAIR": ["nvshmem_int_put@56","nvshmem_int_get@58"],
    "NPROCS": 2,
    "CONSISTENCY_CALLS": ["nvshmem_barrier_all"],
    "SYNC_CALLS": ["nvshmem_barrier_all"],
    "DESCRIPTION": "Two conflicting operations put and get which are not correctly separated by a shmem_barrier_all leading to a remote race. The shmem_barrier_all should be in between the two conflicting operations to be correct."
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
    int remote, localbuf, myval;

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
    int *myval_d = (int *)nvshmem_malloc(sizeof(int));

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));
    cudaMemset(myval_d, 2, sizeof(int));

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        // CONFLICT
        nvshmem_int_put(remote_d, myval_d, 1, 1);
        // CONFLICT
        nvshmem_int_get(localbuf_d, remote_d, 1, 1);

        nvshmem_barrier_all();
    } else {
        nvshmem_barrier_all();
    }

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
    nvshmem_free(myval_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
