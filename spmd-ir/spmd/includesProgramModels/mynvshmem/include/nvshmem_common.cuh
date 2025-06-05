/*
 * Copyright (c) 2016-2023, NVIDIA CORPORATION. All rights reserved.
 *
 * SPDX-License-Identifier: LicenseRef-NVSHMEM
 */

#ifndef _NVSHMEM_COMMON_H_
#define _NVSHMEM_COMMON_H_

#include "nvshmem_types.h"
#include "nvshmem_common_transport.h"
#include "nvshmem_constants.h"
#include <limits.h>
#define NVSHMEMI_HOSTDEVICE_PREFIX __host__ __device__
#define NVSHMEMI_DEVICE_PREFIX __device__

/* Note: The "long double" type is not supported */
#define NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(NVSHMEMI_FN_TEMPLATE) \
    NVSHMEMI_FN_TEMPLATE(float, float)                             \
    NVSHMEMI_FN_TEMPLATE(double, double)                           \
    NVSHMEMI_FN_TEMPLATE(char, char)                               \
    NVSHMEMI_FN_TEMPLATE(short, short)                             \
    NVSHMEMI_FN_TEMPLATE(schar, signed char)                       \
    NVSHMEMI_FN_TEMPLATE(int, int)                                 \
    NVSHMEMI_FN_TEMPLATE(long, long)                               \
    NVSHMEMI_FN_TEMPLATE(longlong, long long)                      \
    NVSHMEMI_FN_TEMPLATE(uchar, unsigned char)                     \
    NVSHMEMI_FN_TEMPLATE(ushort, unsigned short)                   \
    NVSHMEMI_FN_TEMPLATE(uint, unsigned int)                       \
    NVSHMEMI_FN_TEMPLATE(ulong, unsigned long)                     \
    NVSHMEMI_FN_TEMPLATE(ulonglong, unsigned long long)            \
    NVSHMEMI_FN_TEMPLATE(int8, int8_t)                             \
    NVSHMEMI_FN_TEMPLATE(int16, int16_t)                           \
    NVSHMEMI_FN_TEMPLATE(int32, int32_t)                           \
    NVSHMEMI_FN_TEMPLATE(int64, int64_t)                           \
    NVSHMEMI_FN_TEMPLATE(uint8, uint8_t)                           \
    NVSHMEMI_FN_TEMPLATE(uint16, uint16_t)                         \
    NVSHMEMI_FN_TEMPLATE(uint32, uint32_t)                         \
    NVSHMEMI_FN_TEMPLATE(uint64, uint64_t)                         \
    NVSHMEMI_FN_TEMPLATE(size, size_t)                             \
    NVSHMEMI_FN_TEMPLATE(ptrdiff, ptrdiff_t)

#define NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_FN_TEMPLATE) \
    NVSHMEMI_FN_TEMPLATE(short, short)                     \
    NVSHMEMI_FN_TEMPLATE(int, int)                         \
    NVSHMEMI_FN_TEMPLATE(long, long)                       \
    NVSHMEMI_FN_TEMPLATE(longlong, long long)              \
    NVSHMEMI_FN_TEMPLATE(ushort, unsigned short)           \
    NVSHMEMI_FN_TEMPLATE(uint, unsigned int)               \
    NVSHMEMI_FN_TEMPLATE(ulong, unsigned long)             \
    NVSHMEMI_FN_TEMPLATE(ulonglong, unsigned long long)    \
    NVSHMEMI_FN_TEMPLATE(int32, int32_t)                   \
    NVSHMEMI_FN_TEMPLATE(int64, int64_t)                   \
    NVSHMEMI_FN_TEMPLATE(uint32, uint32_t)                 \
    NVSHMEMI_FN_TEMPLATE(uint64, uint64_t)                 \
    NVSHMEMI_FN_TEMPLATE(size, size_t)                     \
    NVSHMEMI_FN_TEMPLATE(ptrdiff, ptrdiff_t)

/* Note: The "long double" type is not supported */
#define NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_FN_TEMPLATE, opname) \
    NVSHMEMI_FN_TEMPLATE(char, char, opname)                                  \
    NVSHMEMI_FN_TEMPLATE(schar, signed char, opname)                          \
    NVSHMEMI_FN_TEMPLATE(short, short, opname)                                \
    NVSHMEMI_FN_TEMPLATE(int, int, opname)                                    \
    NVSHMEMI_FN_TEMPLATE(long, long, opname)                                  \
    NVSHMEMI_FN_TEMPLATE(longlong, long long, opname)                         \
    NVSHMEMI_FN_TEMPLATE(float, float, opname)                                \
    NVSHMEMI_FN_TEMPLATE(double, double, opname)
        // NVSHMEMI_REPT_FOR_BITWISE_REDUCE_TYPES(NVSHMEMI_FN_TEMPLATE, opname)      \
            NVSHMEMI_FN_TEMPLATE(bfloat16, __nv_bfloat16, opname)                     \
    // NVSHMEMI_FN_TEMPLATE(half, half, opname)                                  \
    
enum {
    NVSHMEM_TEAM_INVALID = -1,
    NVSHMEM_TEAM_WORLD = 0,
    NVSHMEM_TEAM_WORLD_INDEX = 0,
    NVSHMEM_TEAM_SHARED = 1,
    NVSHMEM_TEAM_SHARED_INDEX = 1,
    NVSHMEMX_TEAM_NODE = 2,
    NVSHMEM_TEAM_NODE_INDEX = 2,
    NVSHMEMX_TEAM_SAME_MYPE_NODE = 3,
    NVSHMEM_TEAM_SAME_MYPE_NODE_INDEX = 3,
    NVSHMEMI_TEAM_SAME_GPU = 4,
    NVSHMEM_TEAM_SAME_GPU_INDEX = 4,
    NVSHMEMI_TEAM_GPU_LEADERS = 5,
    NVSHMEM_TEAM_GPU_LEADERS_INDEX = 5,
    NVSHMEM_TEAMS_MIN = 6,
    NVSHMEM_TEAM_INDEX_MAX = INT_MAX
};

#endif // _NVSHMEM_COMMON_H_