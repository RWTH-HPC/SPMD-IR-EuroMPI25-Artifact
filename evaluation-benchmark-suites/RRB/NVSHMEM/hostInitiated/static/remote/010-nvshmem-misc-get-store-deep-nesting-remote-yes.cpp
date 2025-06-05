// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma read","store"],
    "RACE_PAIR": ["nvshmem_int_get@23","cudaMemcpy@77"],
    "NPROCS": 2,
    "DESCRIPTION": "Two conflicting operations get and store executed concurrently which leads to a race."
}
*/
// RACE LABELS END

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 2

__attribute__((noinline)) void deeeeeeeeep(int* rem_ptr_d, int* lbuf_ptr_d) { 
    // CONFLICT
    nvshmem_int_get(lbuf_ptr_d, rem_ptr_d, 1, 1);
}

__attribute__((noinline)) void deeeeeeeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeeeeeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deeeeeeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeeeeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deeeeeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeeeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deeeeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deeeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deeep(int* rem_ptr_d, int* lbuf_ptr_d) { deeeep(rem_ptr_d, lbuf_ptr_d); }
__attribute__((noinline)) void deep(int* rem_ptr_d, int* lbuf_ptr_d) { deeep(rem_ptr_d, lbuf_ptr_d); }

void rank0(int* rem_ptr_d, int* lbuf_ptr_d)
{
    deep(rem_ptr_d, lbuf_ptr_d);
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

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));

    int* rem_ptr_d = remote_d;
    int* lbuf_ptr_d = localbuf_d;

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        rank0(rem_ptr_d, lbuf_ptr_d);
    }

    if (my_pe == 1) {
        // CONFLICT
        cudaMemcpy(remote_d, remote, sizeof(int), cudaMemcpyHostToDevice);
    }

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
