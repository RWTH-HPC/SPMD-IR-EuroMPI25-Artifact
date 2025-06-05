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
#define ARR_SIZE 10

void inefficient_get(int iteration, int* localbuf_d, int* remote_d) {
    // CONFLICT-SAME-LINE
    nvshmem_int_get_nbi(localbuf_d, remote_d, 1, 1);
    if (iteration < ARR_SIZE) {
        inefficient_get(iteration + 1, localbuf_d, remote_d);
    }
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

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int) * ARR_SIZE);
    cudaMemset(localbuf_d, 1, sizeof(int) * ARR_SIZE);

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        inefficient_get(0, localbuf_d, remote_d);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();

    // Copy data back to host
    cudaMemcpy(&remote, remote_d, sizeof(int) * ARR_SIZE, cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localbuf_d, sizeof(int) * ARR_SIZE, cudaMemcpyDeviceToHost);

    // Synchronize again
    nvshmem_barrier_all();

    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, *remote, *localbuf);

    // Free NVSHMEM symmetric memory
    nvshmem_free(remote_d);
    nvshmem_free(localbuf_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}