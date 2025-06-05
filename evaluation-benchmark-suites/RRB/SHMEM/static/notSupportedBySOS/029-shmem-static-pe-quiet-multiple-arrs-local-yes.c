/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 3
#define ARR_SIZE 10

int main(int argc, char** argv)
{
    static int remote0 = 0;
    static int remote1 = 1;
    static int remote2 = 4;
    int localbuf0 = 2;
    int localbuf1 = 3;

    shmem_init();

    int num_pe = shmem_n_pes();
    int my_pe = shmem_my_pe();

    if (num_pe != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", my_pe, PROC_NUM);
        shmem_global_exit(1);
    }

    shmem_barrier_all();

    int target_pe2 = 2;
    if (my_pe == 0) {
        // CONFLICT
        shmem_int_get_nbi(&localbuf0, &remote0, 1, 1);
        shmem_int_get_nbi(&localbuf1, &remote1, 1, 2);
        shmem_pe_quiet(&target_pe2, 1);
        // CONFLICT
        shmem_int_get_nbi(&localbuf0, &remote2, 1, 1);
    }

    shmem_barrier_all();
    
    printf("Process %d: Execution finished, variable contents: remote0 = %d, remote1 = %d, remote2 = %d, localbuf0 = %d, localbuf1 = %d\n",
            my_pe, remote0, remote1, remote2, localbuf0, localbuf1);
    
    shmem_finalize();

    return 0;
}
