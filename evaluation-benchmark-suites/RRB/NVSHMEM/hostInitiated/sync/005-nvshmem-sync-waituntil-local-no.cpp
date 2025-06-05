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

    // Initialize memory
    cudaMemset(remote_d, 0, sizeof(int));
    cudaMemset(localbuf_d, 1, sizeof(int));
    cudaMemset(flag_d, 0, sizeof(int));

    // Synchronize across all PEs
    nvshmem_barrier_all();    

    if (my_pe == 0) {
        cudaMemset(localbuf_d, 42, sizeof(int));
        // send data with signal (ping)
        nvshmem_int_put_signal_nbi(remote_d, localbuf_d, 1, flag_d, 1, NVSHMEM_SIGNAL_SET, 1);
        // wait for pong from PE 1
        nvshmem_uint64_wait_until(flag_d, NVSHMEM_CMP_EQ, 1);
        cudaMemset(localbuf_d, 1337, sizeof(int));
    }

    if (my_pe == 1) {
        cudaMemset(localbuf_d, 1337, sizeof(int));
        // wait for ping from PE 0
        nvshmem_uint64_wait_until(flag_d, NVSHMEM_CMP_EQ, 1);
        // send data with signal (pong)
        nvshmem_int_put_signal(remote_d, localbuf_d, 1, flag_d, 1, NVSHMEM_SIGNAL_SET, 0);
    }

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
    nvshmem_free(flag_d);

    // Finalize NVSHMEM
    nvshmem_finalize();

    return 0;
}
