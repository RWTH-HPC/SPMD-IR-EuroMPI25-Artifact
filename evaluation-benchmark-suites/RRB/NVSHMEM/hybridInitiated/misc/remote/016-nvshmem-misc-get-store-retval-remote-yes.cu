// RACE LABELS BEGIN
/*
{
    "RACE_KIND": "remote",
    "ACCESS_SET": ["rma read","store"],
    "RACE_PAIR": ["shmem_int_get@22","cudaMemcpy@85"],
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

__device__  __attribute__((noinline)) void rank0(int* rem_ptr, int* lbuf_ptr, int* x) {
    nvshmem_int_get(lbuf_ptr, rem_ptr, 1, 1);
}

__attribute__((noinline)) int* aliasgenerator(int** x) { return *x; }

__global__ void nvshmem_barrier_all_kernelWrapper() {
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

    // Allocate shared memory across PEs
    size_t shared_data_size = 0 * sizeof(int);

    // Define kernel execution parameters
    dim3 blocks(1);
    dim3 threads(1);

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));

    int* rem_ptr = &remote;
    int* rem_ptr_d = remote_d;
    int* lbuf_ptr_d = localbuf_d;
    int* rem_ptr_alias;
    int* rem_ptr_alias_d;
    int* lbuf_ptr_alias_d;
    
    rem_ptr_alias = aliasgenerator(&rem_ptr);
    rem_ptr_alias_d = aliasgenerator(&rem_ptr_d);
    lbuf_ptr_alias_d = aliasgenerator(&lbuf_ptr_d);

    // Synchronize across all PEs
    nvshmem_barrier_all();    
    nvshmemx_collective_launch((void *)nvshmem_barrier_all_kernelWrapper, blocks, threads, nullptr, shared_data_size, 0);

    if (my_pe == 0) {
        // CONFLICT
        nvshmemx_collective_launch((void *)rank0, blocks, threads, args, shared_data_size, 0);
    }

    if (my_pe == 1) {
        // CONFLICT
        cudaMemcpy(rem_ptr_alias_d, rem_ptr_alias, sizeof(int), cudaMemcpyHostToDevice);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();
    nvshmemx_collective_launch((void *)nvshmem_barrier_all_kernelWrapper, blocks, threads, nullptr, shared_data_size, 0);

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
