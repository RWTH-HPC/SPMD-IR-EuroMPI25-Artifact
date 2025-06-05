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
#define ARR_SIZE 100

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
    int disposition = ARR_SIZE / 2;
    int packet_size = ARR_SIZE / 4;
    int* localb_base_d = (int*)(nvshmem_malloc(sizeof(int) * ARR_SIZE));
    int* localb_midp_d = localb_base_d + disposition;
    int* remote_base_d = (int*)(nvshmem_malloc(sizeof(int) * ARR_SIZE));
    int* remote_midp_d = remote_base_d + disposition;

    // Initialize memory
    cudaMemset(remote_base_d, 0, sizeof(int) * ARR_SIZE);
    cudaMemset(localb_base_d, 1, sizeof(int) * ARR_SIZE);

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        nvshmem_int_put_nbi(localb_base_d, remote_base_d, packet_size, 1);
        nvshmem_int_put_nbi(localb_midp_d, remote_midp_d, packet_size, 1);
    }

    // Synchronize across all PEs
    nvshmem_barrier_all();

    // Copy data back to host
    cudaMemcpy(&remote, remote_base_d, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(&localbuf, localb_base_d, sizeof(int), cudaMemcpyDeviceToHost);

    // Synchronize again
    nvshmem_barrier_all();

    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);

    // Free NVSHMEM symmetric memory
    nvshmem_free(remote_base_d);
    nvshmem_free(localb_base_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}