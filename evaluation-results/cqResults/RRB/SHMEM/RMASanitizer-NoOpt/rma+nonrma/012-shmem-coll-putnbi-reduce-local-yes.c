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
    static int remote = 0;
    static int remote_alt = 0;
    static int localbuf = 1;

    shmem_init();

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", my_pe, PROC_NUM);
        shmem_global_exit(1);
    }

    shmem_barrier_all();

    if (my_pe == 0) {
        // CONFLICT
        shmem_int_put_nbi(&remote, &localbuf, 1, 1);
    }
    // CONFLICT
    shmem_int_sum_reduce(SHMEM_TEAM_WORLD, &localbuf, &remote, 1);

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);
    
    shmem_finalize();

    return 0;
}
