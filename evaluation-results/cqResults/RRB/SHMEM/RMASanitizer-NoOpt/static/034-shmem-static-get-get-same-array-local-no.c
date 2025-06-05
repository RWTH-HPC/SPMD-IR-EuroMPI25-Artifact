/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 100

int main(int argc, char** argv)
{
    static int remote = 0;
    int localbuf = 1;

    shmem_init();

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", my_pe, PROC_NUM);
        shmem_global_exit(1);
    }

    int disposition = ARR_SIZE / 2;
    int packet_size = ARR_SIZE / 4;
    int* localb_base = (int*)(shmem_malloc(sizeof(int) * ARR_SIZE));
    int* localb_midp = &(localb_base[1]);
    int* remote_base = (int*)(shmem_malloc(sizeof(int) * ARR_SIZE));
    int* remote_midp = remote_base + disposition;

    if (my_pe == 0) {
        localb_base[0] = 0;
    } else {
        localb_base[0] = 1;
    }

    shmem_barrier_all();

    if (my_pe == 0) {
        shmem_int_get_nbi(localb_base, remote_base, 1, 1);
        shmem_int_get_nbi(localb_midp, remote_base, 1, 1);
    }

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);
    
    shmem_finalize();

    return 0;
}
