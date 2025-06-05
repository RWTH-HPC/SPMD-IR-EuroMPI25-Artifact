/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 10

int main(int argc, char** argv)
{
    shmem_init();

    int localbuf[ARR_SIZE];
    for (int i = 0; i < ARR_SIZE; i++) {
        localbuf[i] = i;
    }
    int* remote = (int*)(shmem_malloc(sizeof(int) * ARR_SIZE));

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", my_pe, PROC_NUM);
        shmem_global_exit(1);
    }

    shmem_barrier_all();

    if (my_pe == 0) {
        for (int i = 1; i < ARR_SIZE; i++) {
            // CONFLICT
            shmem_int_put_nbi(&(remote[i]), &(localbuf[i]), 1, 1);
            // CONFLICT
            localbuf[i-1]++;
        }   
    }

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote[0], localbuf[0]);
    
    shmem_finalize();

    return 0;
}
