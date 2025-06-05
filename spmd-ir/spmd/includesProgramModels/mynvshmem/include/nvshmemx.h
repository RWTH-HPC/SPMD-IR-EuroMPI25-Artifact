/*
 * Copyright (c) 2016-2023, NVIDIA CORPORATION. All rights reserved.
 *
 * SPDX-License-Identifier: LicenseRef-NVSHMEM
 */
#ifndef _NVSHMEMX_H_
#define _NVSHMEMX_H_

#include <cuda_runtime.h>
#include "nvshmem_common.cuh"

#ifdef __cplusplus
extern "C" {
#endif

// collective launch APIs
int nvshmemx_collective_launch(const void *func, dim3 gridDims, dim3 blockDims, void **args,
        size_t sharedMem, cudaStream_t stream);
//     // Cast the function pointer to a generic CUDA kernel function pointer
//     cudaError_t err = cudaLaunchKernel(func, gridDims, blockDims, args, sharedMem, stream);

//     if (err != cudaSuccess) {
//         return -1;  // Indicate failure
//     }

//     return 0;  // Indicate success
// }

int nvshmemx_collective_launch_query_gridsize(const void *func, dim3 blockDims, void **args,
                   size_t sharedMem, int *gridsize);

// Extended API Declarations

// Memory management with advanced features
// void *nvshmemx_malloc(size_t size, int pe);
// void nvshmemx_free(void *ptr, int pe);

// // Advanced Atomic Operations
// void nvshmemx_atomic_add(int *dest, int value, int pe);
// void nvshmemx_atomic_and(int *dest, int value, int pe);
// void nvshmemx_atomic_or(int *dest, int value, int pe);
// void nvshmemx_atomic_xor(int *dest, int value, int pe);
// void nvshmemx_atomic_max(int *dest, int value, int pe);
// void nvshmemx_atomic_min(int *dest, int value, int pe);
// void nvshmemx_atomic_inc(int *dest, int pe);
// void nvshmemx_atomic_dec(int *dest, int pe);

// // Advanced Synchronization Primitives
// void nvshmemx_barrier(nvshmem_team_t team, int pe);
// void nvshmemx_team_barrier_all(nvshmem_team_t team);
// void nvshmemx_team_broadcast(int *dest, const int *src, int pe, int root_pe);

// // Advanced Reduction Operations
// int nvshmemx_int_sum_reduce(int *dest, const int *src, int pe);
// int nvshmemx_int_prod_reduce(int *dest, const int *src, int pe);
// int nvshmemx_int_and_reduce(int *dest, const int *src, int pe);
// int nvshmemx_int_or_reduce(int *dest, const int *src, int pe);

// // Extended Broadcast Operations
// void nvshmemx_broadcast_to_all(int *dest, const int *src, int pe, int root_pe);
// void nvshmemx_broadcast_team(nvshmem_team_t team, int *dest, const int *src, int root_pe);

// // Extended Info and Debug Functions
// void nvshmemx_info_get_all_pe_names(char **pe_names, int max_pes);
// void nvshmemx_info_get_all_pe_versions(int *versions, int max_pes);
// void nvshmemx_debug_print_team_info(nvshmem_team_t team);

// // Team and PE Management
// nvshmem_team_t nvshmemx_team_create_with_params(int num_pes, int pe, const char *params);
// int nvshmemx_team_get_num_pes(nvshmem_team_t team);
// int nvshmemx_team_get_pe_id(nvshmem_team_t team, int pe_index);

// // Additional Utility Functions
// int nvshmemx_pe_id_to_global(int pe, nvshmem_team_t team);
// int nvshmemx_pe_global_to_team(int global_pe, nvshmem_team_t team);

// // Advanced Memory Copy and Transfer
// void nvshmemx_memcpy(void *dest, const void *src, size_t size, int pe);
// void nvshmemx_memmove(void *dest, const void *src, size_t size, int pe);

// // Advanced Query Functions
// int nvshmemx_get_team_size(nvshmem_team_t team);
// int nvshmemx_get_total_pes();

#ifdef __cplusplus
}
#endif

#endif // _NVSHMEMX_H_
