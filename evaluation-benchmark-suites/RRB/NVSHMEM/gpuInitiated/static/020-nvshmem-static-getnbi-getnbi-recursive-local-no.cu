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
#define ARR_SIZE 3

__device__ void inefficient_get(int iteration, int* localbuf, int* remote) {
    nvshmem_int_get_nbi(localbuf + iteration, remote, 1, 1);
    if (iteration < ARR_SIZE) {
        inefficient_get(iteration + 1, localbuf, remote);
    }
}

__global__ void nvshmem_kernel(int *remote, int *localbuf) {
    // Initialize memory
    *remote = 0;
    *localbuf = 1;
    int x = 0;

    int my_pe = nvshmem_my_pe();

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        inefficient_get(0, localbuf, remote);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();
}

int main(int argc, char **argv) {
    int remote[ARR_SIZE];
    int localbuf[ARR_SIZE];

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
    int *remote_d = (int *)nvshmem_malloc(sizeof(int) * ARR_SIZE);
    int *localbuf_d = (int *)nvshmem_malloc(sizeof(int) * ARR_SIZE);

    // Step 3: Allocate shared memory across PEs
    size_t shared_data_size = 2 * ARR_SIZE * sizeof(int);

    // Step 4: Define kernel execution parameters
    void *args[] = {remote_d, localbuf_d};  // Kernel arguments
    dim3 blocks(1);
    dim3 threads(1);

    // Launch kernel collectively across all PEs
    nvshmemx_collective_launch((const void *)nvshmem_kernel, blocks, threads, args, shared_data_size, 0);

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(int) * ARR_SIZE, cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(int) * ARR_SIZE, cudaMemcpyDeviceToHost);

    // Synchronize again
    nvshmem_barrier_all();

    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote[0], localbuf[0]);

    // Free NVSHMEM symmetric memory
    nvshmem_free(remote_d);
    nvshmem_free(localbuf_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
