/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 4

int main(int argc, char** argv)
{
    static int remote = 0;
    int localbuf = 1;

    shmem_init();

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("Got %d PEs, expected %d\n", num_pe, PROC_NUM);
        shmem_global_exit(1);
    }
    localbuf = 1;
    static int reduced = 0;
    static int source = 1;

    shmem_barrier_all();

    // CONFLICT
    shmem_int_sum_reduce(SHMEM_TEAM_WORLD, &reduced, &source, 1);

    if (my_pe == 0) {
        int localbuf = 0;
        // CONFLICT
        shmem_int_put(&reduced, &localbuf, 1, 1);
    }

    shmem_barrier_all();

    printf("PE %d: %d\n", my_pe, reduced);

    shmem_barrier_all();
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);
    shmem_finalize();

    return 0;
}
