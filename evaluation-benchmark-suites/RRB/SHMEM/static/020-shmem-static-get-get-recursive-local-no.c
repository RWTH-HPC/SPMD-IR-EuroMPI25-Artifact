/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 10

void inefficient_get(int iteration, float* localb_base, float* remote_base) {
    shmem_float_get_nbi(localb_base + iteration, remote_base, 1, 1);
    if (iteration < 10) {
        inefficient_get(iteration + 1, localb_base, remote_base);
    }
}

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

    float* localb_base = (float*)(shmem_malloc(sizeof(float) * ARR_SIZE));
    float* remote_base = (float*)(shmem_malloc(sizeof(float) * ARR_SIZE));

    shmem_barrier_all();

    if (my_pe == 0) {
        inefficient_get(0, localb_base, remote_base);
    }

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote = %f, localbuf = %f\n", my_pe, remote_base[0], localb_base[0]);
    
    shmem_finalize();

    return 0;
}
