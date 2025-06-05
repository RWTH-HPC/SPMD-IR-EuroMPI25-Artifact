/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 2

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

    if (my_pe == 0) {
        // CONFLICT
        shmem_put_nbi(&remote, &localbuf, 1, 1);
        shmem_quiet();
        shmem_sync_all();
    }

    if (my_pe == 1) {
#pragma omp parallel num_threads(2)
        {
#pragma omp for schedule(static, 1)
            for (int i = 0; i < 2; ++i) {
                if (i == 0) {
                    shmem_sync_all();
                } else {
                    // CONFLICT
                    printf("remote is %d\n", remote);
                }
            }
        }
    }

    shmem_barrier_all();
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);
    shmem_finalize();

    return 0;
}
