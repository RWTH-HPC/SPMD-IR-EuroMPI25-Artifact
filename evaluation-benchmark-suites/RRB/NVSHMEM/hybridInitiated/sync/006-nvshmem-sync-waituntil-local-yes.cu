/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <cuda.h>
#include <nvshmem.h>
#include <nvshmemx.h>
#include <stdio.h>

// Number of processing elements
#define PROC_NUM 2

__global__ void nvshmem_kernel(int *remote, int *localbuf, uint64_t *flag) {
    // send data with signal (ping)
    // CONFLICT
    nvshmem_int_put_signal_nbi(remote, localbuf, 1, flag, 1, NVSHMEM_SIGNAL_SET, 1);
    // wait for pong from PE 1
    nvshmem_uint64_wait_until(flag, NVSHMEM_CMP_EQ, 1);
}

__global__ void nvshmem_kernel2(int *localbuf) {
    *localbuf = 1337;
}


__global__ void nvshmem_barrier_all_kernelWrapper() {
    nvshmem_barrier_all();    
}

__global__ void nvshmem_quiet_kernelWrapper() {
    nvshmem_quiet();    
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
    uint64_t *flag_d = (uint64_t *)nvshmem_malloc(sizeof(uint64_t));

    // Allocate shared memory across PEs
    size_t shared_data_size = 0 * sizeof(int);

    // Define kernel execution parameters
    void *args[] = {remote_d, localbuf_d, flag_d};  // Kernel arguments
    void *args2[] = {localbuf_d};  // Kernel arguments
    dim3 blocks(1);
    dim3 threads(1);

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));
    cudaMemset(flag_d, 0, sizeof(int));

    // Synchronize across all PEs
    nvshmem_barrier_all();    
    nvshmemx_collective_launch((const void *)nvshmem_barrier_all_kernelWrapper, blocks, threads, nullptr, shared_data_size, 0);

    if (my_pe == 0) {
        cudaMemset(localbuf_d, 42, sizeof(int));
        nvshmemx_collective_launch((const void *)nvshmem_kernel, blocks, threads, args, shared_data_size, 0);
        // CONFLICT
        cudaMemset(localbuf_d, 1337, sizeof(int));
    }

    if (my_pe == 1) {
        nvshmem_kernel2<<<blocks, threads, shared_data_size>>>(localbuf_d);
        // send data with signal (pong)
        nvshmem_int_put_signal(remote_d, localbuf_d, 1, flag_d, 1, NVSHMEM_SIGNAL_SET, 0);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();
    nvshmemx_collective_launch((const void *)nvshmem_barrier_all_kernelWrapper, blocks, threads, nullptr, shared_data_size, 0);
    
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
