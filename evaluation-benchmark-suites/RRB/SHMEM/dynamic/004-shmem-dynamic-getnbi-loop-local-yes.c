/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>
#include <stdlib.h>

#define PROC_NUM 2
#define ARR_SIZE 10

int main(int argc, char** argv)
{
    static int remote = 0;
    int localbuf = 1;

    int ctrl = 10;
    if (argc > 1) {
        ctrl = atoi(argv[1]);
    }

    shmem_init();

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", my_pe, PROC_NUM);
        shmem_global_exit(1);
    }

    shmem_barrier_all();

    if (my_pe == 0) {
        for (int i = 0; i < ctrl; i++) {
            // CONFLICT-SAME-LINE
            shmem_int_get_nbi(&localbuf, &remote, 1, 1);
        }
    }

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote = %d, localbuf = %d\n", my_pe, remote, localbuf);
    
    shmem_finalize();

    return 0;
}
