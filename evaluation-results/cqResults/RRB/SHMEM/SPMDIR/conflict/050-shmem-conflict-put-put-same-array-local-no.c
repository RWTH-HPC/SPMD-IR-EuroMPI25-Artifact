/* Part of RMARaceBench, under BSD-3-Clause License
 * See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
 * SPDX-License-Identifier: BSD-3-Clause
 */
 
// send two non-overlapping packets of data with the same arrays

#include <shmem.h>
#include <stdio.h>

#define PROC_NUM 2
#define ARR_SIZE 100

int main(int argc, char** argv) {
    shmem_init();

    int size = shmem_n_pes();
    int mype = shmem_my_pe();

    if (size != PROC_NUM) {
        printf("I have %d PEs. You should rerun with %d.\n", size, PROC_NUM);
        shmem_global_exit(1);
    }

    shmem_barrier_all();

    int packet_size = ARR_SIZE / 4;
    int* send_base = (int*)(shmem_malloc(sizeof(int) * ARR_SIZE));
    int* send_midp = send_base + (ARR_SIZE / 2);
    int* recv_base = (int*)(shmem_malloc(sizeof(int) * ARR_SIZE));
    int* recv_midp = recv_base + (ARR_SIZE / 2);

    if (mype == 0) {
        for (int i = 0; i < ARR_SIZE; i++) {
            send_base[i] = i;
            recv_base[i] = 0;
        }
    } else {
        for (int i = 0; i < ARR_SIZE; i++) {
            send_base[i] = 0;
            recv_base[i] = 0;
        }
    }

    shmem_barrier_all();

    if (mype == 0) {
        /* no data race */
        shmem_int_put_nbi(recv_base, send_base, packet_size, 1);
        shmem_int_put_nbi(recv_midp, send_midp, packet_size, 1);
    }

    shmem_barrier_all();

    int sum_send = 0;
    int sum_recv = 0;
    for (int i = 0; i < ARR_SIZE; i++) {
        sum_send += send_base[i];
        sum_recv += recv_base[i];
    }

    shmem_barrier_all();
    
    printf("Process %d finished. Array sums: send = %d, recv = %d\n", mype, sum_send, sum_recv);

    shmem_finalize();

    return 0;
}