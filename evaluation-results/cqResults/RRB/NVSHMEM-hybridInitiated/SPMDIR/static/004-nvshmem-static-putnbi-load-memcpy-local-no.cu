/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>
#include <string.h>

// Number of processing elements
#define PROC_NUM 2

__global__ void nvshmem_kernel(int *rem_ptr_alias, int *lbuf_ptr_alias) {
    int x = *lbuf_ptr_alias;

    nvshmem_barrier_all();
    *rem_ptr_alias += x;
}

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

    int* rem_ptr_d = remote_d;
    int* lbuf_ptr_d = localbuf_d;
    int* rem_ptr_alias_d;
    int* lbuf_ptr_alias_d;

    // Synchronize across all PEs
    nvshmem_barrier_all();    
    nvshmemx_collective_launch((const void *)nvshmem_barrier_all_kernelWrapper, blocks, threads, nullptr, shared_data_size, 0);

    memcpy(&rem_ptr_alias_d, &rem_ptr_d, sizeof(int*));
    memcpy(&lbuf_ptr_alias_d, &lbuf_ptr_d, sizeof(int*));

    void *args[] = {rem_ptr_alias_d, lbuf_ptr_alias_d};  

    if (my_pe == 0) {
        nvshmem_int_put_nbi(rem_ptr_d, lbuf_ptr_d, 1, 1);
        nvshmemx_collective_launch((const void *)nvshmem_kernel, blocks, threads, args, shared_data_size, 0);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(int), cudaMemcpyDeviceToHost);

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
