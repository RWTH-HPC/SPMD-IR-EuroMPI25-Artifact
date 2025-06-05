/*
 * Copyright (c) 2016-2023, NVIDIA CORPORATION. All rights reserved.
 *
 * SPDX-License-Identifier: LicenseRef-NVSHMEM
 */

#ifndef _NVSHMEM_H_
#define _NVSHMEM_H_

#include <cuda_runtime.h>
#include "nvshmem_common.cuh"

#ifdef __cplusplus
extern "C" {
#endif



// // Data types
// typedef struct {
//     int id;
//     // Additional fields
// } nvshmem_team_t;

// API declarations

// Library Initialization and Finalization
void nvshmem_init();
void nvshmem_finalize();
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_global_exit(int status);

//////////////////// Teams API ////////////////////

NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_team_my_pe(nvshmem_team_t team);
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_team_n_pes(nvshmem_team_t team);

void nvshmem_team_get_config(nvshmem_team_t team, nvshmem_team_config_t *config);
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_team_translate_pe(nvshmem_team_t src_team, int src_pe,
                                                         nvshmem_team_t dest_team);
int nvshmem_team_split_strided(nvshmem_team_t parent_team, int PE_start, int PE_stride, int PE_size,
                               const nvshmem_team_config_t *config, long config_mask,
                               nvshmem_team_t *new_team);
int nvshmem_team_split_2d(nvshmem_team_t parent_team, int xrange,
                          const nvshmem_team_config_t *xaxis_config, long xaxis_mask,
                          nvshmem_team_t *xaxis_team, const nvshmem_team_config_t *yaxis_config,
                          long yaxis_mask, nvshmem_team_t *yaxis_team);
void nvshmem_team_destroy(nvshmem_team_t team);


// PE info query 
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_my_pe();
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_n_pes();
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_info_get_version(int *major, int *minor);
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_info_get_name(char *name);
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmemx_vendor_get_version_info(int *major, int *minor,
                                                                 int *patch);

// Heap management
void *nvshmem_malloc(size_t size);
void *nvshmem_calloc(size_t, size_t);
void *nvshmem_align(size_t, size_t);

void nvshmem_free(void *ptr);
void *nvshmem_realloc(void *ptr, size_t size);
NVSHMEMI_HOSTDEVICE_PREFIX void *nvshmem_ptr(const void *ptr, int pe);

//////////////////// Point-to-Point Synchronization ////////////////////

NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_quiet();
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_fence();


//===============================
// standard nvshmem collective calls
//===============================

// barrier collectives
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_barrier(nvshmem_team_t team);
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_barrier_all();

// sync collectives
NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_team_sync(nvshmem_team_t team);
NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_sync_all();

// broadcast collectives
#define DECL_NVSHMEM_TYPENAME_BROADCAST(TYPENAME, TYPE)            \
    NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_##TYPENAME##_broadcast( \
        nvshmem_team_t team, TYPE *dest, const TYPE *src, size_t nelem, int PE_root);
NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(DECL_NVSHMEM_TYPENAME_BROADCAST)
#undef DECL_NVSHMEM_TYPENAME_BROADCAST

NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_broadcastmem(nvshmem_team_t team, void *dest,
                                                    const void *src, size_t nelems, int PE_root);

// reduction collectives
#define NVSHMEMI_DECL_TEAM_REDUCE(NAME, TYPE, OP)                  \
    NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_##NAME##_##OP##_reduce( \
        nvshmem_team_t team, TYPE *dest, const TYPE *src, size_t nreduce);

NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, and)
NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, or)
NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, xor)

NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, max)
NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, min)

NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, sum)
NVSHMEMI_REPT_FOR_STANDARD_REDUCE_TYPES(NVSHMEMI_DECL_TEAM_REDUCE, prod)

#undef NVSHMEMI_DECL_TEAM_REDUCE

//////////////////// Put ////////////////////

/*__device__ __host__ nvshmem_<typename>_put_nbi*/
#define NVSHMEMI_DECL_TYPE_PUT_NBI(NAME, TYPE)                                               \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_put_nbi(TYPE *dest, const TYPE *source, \
                                                             size_t nelems, int pe);

NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(NVSHMEMI_DECL_TYPE_PUT_NBI)
#undef NVSHMEM_DECL_TYPE_PUT_NBI


// put + signaling
/*__device__ nvshmem_<typename>_put_signal*/
#define NVSHMEMI_DECL_TYPE_PUT_SIGNAL(NAME, TYPE)                                               \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_put_signal(TYPE *dest, const TYPE *source, \
                                                                size_t nelems, uint64_t *sig_addr,  \
                                                                uint64_t signal, int sig_op, int pe);

NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(NVSHMEMI_DECL_TYPE_PUT_SIGNAL)
#undef NVSHMEMI_DECL_TYPE_PUT_SIGNAL

/*__device__ nvshmem_<typename>_put_signal_nbi*/
#define NVSHMEMI_DECL_TYPE_PUT_SIGNAL_NBI(NAME, TYPE)                                               \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_put_signal_nbi(TYPE *dest, const TYPE *source, \
                                                                size_t nelems, uint64_t *sig_addr,  \
                                                                uint64_t signal, int sig_op, int pe);

NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(NVSHMEMI_DECL_TYPE_PUT_SIGNAL_NBI)
#undef NVSHMEMI_DECL_TYPE_PUT_SIGNAL_NBI

//////////////////// Get ////////////////////

/*__device__ __host__ nvshmem_<typename>_get_nbi*/
#define NVSHMEMI_DECL_TYPE_GET_NBI(NAME, TYPE)                                               \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_get_nbi(TYPE *dest, const TYPE *source, \
                                                             size_t nelems, int pe);

NVSHMEMI_REPT_FOR_STANDARD_RMA_TYPES(NVSHMEMI_DECL_TYPE_GET_NBI)
#undef NVSHMEMI_DECL_TYPE_GET_NBI


//////////////////// OpenSHMEM 1.3 Atomics ////////////////////

#define NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(OPGRPNAME, opname)                  \
    NVSHMEMI_DECL_TYPE_##OPGRPNAME(uint, unsigned int, opname)                    \
        NVSHMEMI_DECL_TYPE_##OPGRPNAME(ulong, unsigned long, opname)              \
            NVSHMEMI_DECL_TYPE_##OPGRPNAME(ulonglong, unsigned long long, opname) \
                NVSHMEMI_DECL_TYPE_##OPGRPNAME(int32, int32_t, opname)            \
                    NVSHMEMI_DECL_TYPE_##OPGRPNAME(uint32, uint32_t, opname)      \
                        NVSHMEMI_DECL_TYPE_##OPGRPNAME(int64, int64_t, opname)    \
                            NVSHMEMI_DECL_TYPE_##OPGRPNAME(uint64, uint64_t, opname)

#define NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(OPGRPNAME, opname)       \
    NVSHMEMI_DECL_TYPE_##OPGRPNAME(int, int, opname)                    \
        NVSHMEMI_DECL_TYPE_##OPGRPNAME(long, long, opname)              \
            NVSHMEMI_DECL_TYPE_##OPGRPNAME(longlong, long long, opname) \
                NVSHMEMI_DECL_TYPE_##OPGRPNAME(size, size_t, opname)    \
                    NVSHMEMI_DECL_TYPE_##OPGRPNAME(ptrdiff, ptrdiff_t, opname)

#define NVSHMEMI_REPT_OPGROUP_FOR_EXTENDED_AMO(OPGRPNAME, opname) \
    NVSHMEMI_DECL_TYPE_##OPGRPNAME(float, float, opname)          \
        NVSHMEMI_DECL_TYPE_##OPGRPNAME(double, double, opname)

/* inc */
#define NVSHMEMI_DECL_TYPE_INC(type, TYPE, opname) \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##type##_atomic_##opname(TYPE *dest, int pe);

/* finc */
#define NVSHMEMI_DECL_TYPE_FINC(type, TYPE, opname) \
    NVSHMEMI_HOSTDEVICE_PREFIX TYPE nvshmem_##type##_atomic_##opname(TYPE *dest, int pe);

/* fetch */
#define NVSHMEMI_DECL_TYPE_FETCH(type, TYPE, opname) \
    NVSHMEMI_HOSTDEVICE_PREFIX TYPE nvshmem_##type##_atomic_##opname(const TYPE *dest, int pe);

/* add, set */
#define NVSHMEMI_DECL_TYPE_ADD_SET(type, TYPE, opname)                                       \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##type##_atomic_##opname(TYPE *dest, TYPE value, \
                                                                     int pe);

/* fadd, swap */
#define NVSHMEMI_DECL_TYPE_FADD_SWAP(type, TYPE, opname)                                     \
    NVSHMEMI_HOSTDEVICE_PREFIX TYPE nvshmem_##type##_atomic_##opname(TYPE *dest, TYPE value, \
                                                                     int pe);

/* cswap */
#define NVSHMEMI_DECL_TYPE_CSWAP(type, TYPE, opname)                                        \
    NVSHMEMI_HOSTDEVICE_PREFIX TYPE nvshmem_##type##_atomic_##opname(TYPE *dest, TYPE cond, \
                                                                     TYPE value, int pe);

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(INC, inc)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(INC, inc)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FINC, fetch_inc)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(FINC, fetch_inc)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FETCH, fetch)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(FETCH, fetch)
NVSHMEMI_REPT_OPGROUP_FOR_EXTENDED_AMO(FETCH, fetch)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(ADD_SET, add)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(ADD_SET, add)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(ADD_SET, set)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(ADD_SET, set)
NVSHMEMI_REPT_OPGROUP_FOR_EXTENDED_AMO(ADD_SET, set)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FADD_SWAP, fetch_add)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(FADD_SWAP, fetch_add)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FADD_SWAP, swap)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(FADD_SWAP, swap)
NVSHMEMI_REPT_OPGROUP_FOR_EXTENDED_AMO(FADD_SWAP, swap)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(CSWAP, compare_swap)
NVSHMEMI_REPT_OPGROUP_FOR_STANDARD_AMO(CSWAP, compare_swap)

#undef NVSHMEMI_DECL_TYPE_INC
#undef NVSHMEMI_DECL_TYPE_FINC
#undef NVSHMEMI_DECL_TYPE_FETCH
#undef NVSHMEMI_DECL_TYPE_ADD_SET
#undef NVSHMEMI_DECL_TYPE_FADD_SWAP
#undef NVSHMEMI_DECL_TYPE_CSWAP

//////////////////// OpenSHMEM 1.4 Atomics ////////////////////

/* and, or, xor */
#define NVSHMEMI_DECL_TYPE_AND_OR_XOR(type, TYPE, opname)                                    \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##type##_atomic_##opname(TYPE *dest, TYPE value, \
                                                                     int pe);

/* fand, for, fxor */
#define NVSHMEMI_DECL_TYPE_FAND_FOR_FXOR(type, TYPE, opname)                                       \
    NVSHMEMI_HOSTDEVICE_PREFIX TYPE nvshmem_##type##_atomic_fetch_##opname(TYPE *dest, TYPE value, \
                                                                           int pe);

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(AND_OR_XOR, and)
NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(AND_OR_XOR, or)
NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(AND_OR_XOR, xor)

NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FAND_FOR_FXOR, and)
NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FAND_FOR_FXOR, or)
NVSHMEMI_REPT_OPGROUP_FOR_BITWISE_AMO(FAND_FOR_FXOR, xor)

#undef NVSHMEMI_DECL_TYPE_AND_OR_XOR
#undef NVSHMEMI_DECL_TYPE_FAND_FOR_FXOR

// // Team management
// nvshmem_team_t nvshmem_team_create(int num_pes, int pe);
// int nvshmem_team_destroy(nvshmem_team_t team);

// // Memory management
// void *nvshmem_malloc(size_t size);
// void nvshmem_free(void *ptr);

// // Communication operations
// void nvshmem_set(int *dest, int value, int pe);
// void nvshmem_get(int *dest, const int *src, int pe);
// void nvshmem_add(int *dest, int value, int pe);
// void nvshmem_fadd(int *dest, int value, int pe);

// // Barrier and synchronization
// void nvshmem_barrier_all();
// void nvshmem_barrier(nvshmem_team_t team);

// // Reduction operations
// int nvshmem_int_sum(int *dest, const int *src, int pe);
// int nvshmem_int_max(int *dest, const int *src, int pe);
// int nvshmem_int_min(int *dest, const int *src, int pe);

// // Broadcast
// void nvshmem_broadcast(int *dest, const int *src, int pe, int root_pe);

// // Misc functions
// int nvshmem_team_my_pe(nvshmem_team_t team);
// int nvshmem_team_n_pes(nvshmem_team_t team);

// // Debug and utilities
// void nvshmem_info_get_name(char *name);
// void nvshmem_info_get_version(int *major, int *minor);

// Wait and Test API
// __device__ uint64_t nvshmem_signal_wait_until(uint64_t *sig_addr, int cmp, uint64_t cmp_val);

#define NVSHMEMI_DECL_WAIT_UNTIL(NAME, TYPE) \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_wait_until(TYPE *ivar, int cmp, TYPE cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL)
#undef NVSHMEMI_DECL_WAIT_UNTIL

#define NVSHMEMI_DECL_WAIT_UNTIL_ALL(NAME, TYPE)                                                  \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_wait_until_all(TYPE *ivar, size_t nelems, const int *status, \
                                                    int cmp, TYPE cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_ALL)
#undef NVSHMEMI_DECL_WAIT_UNTIL_ALL

#define NVSHMEMI_DECL_WAIT_UNTIL_ANY(NAME, TYPE)                                 \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_wait_until_any(TYPE *ivar, size_t nelems, \
                                                      const int *status, int cmp, TYPE cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_ANY)
#undef NVSHMEMI_DECL_WAIT_UNTIL_ANY

#define NVSHMEMI_DECL_WAIT_UNTIL_SOME(NAME, TYPE)       \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_wait_until_some( \
        TYPE *ivar, size_t nelems, size_t *indices, const int *status, int cmp, TYPE cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_SOME)
#undef NVSHMEMI_DECL_WAIT_UNTIL_SOME

#define NVSHMEMI_DECL_WAIT_UNTIL_ALL_VECTOR(NAME, TYPE)     \
    NVSHMEMI_HOSTDEVICE_PREFIX void nvshmem_##NAME##_wait_until_all_vector( \
        TYPE *ivars, size_t nelems, const int *status, int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_ALL_VECTOR)
#undef NVSHMEMI_DECL_WAIT_UNTIL_ALL_VECTOR

#define NVSHMEMI_DECL_WAIT_UNTIL_ANY_VECTOR(NAME, TYPE)       \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_wait_until_any_vector( \
        TYPE *ivars, size_t nelems, const int *status, int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_ANY_VECTOR)
#undef NVSHMEMI_DECL_WAIT_UNTIL_ANY_VECTOR

#define NVSHMEMI_DECL_WAIT_UNTIL_SOME_VECTOR(NAME, TYPE)                                          \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_wait_until_some_vector(TYPE *ivars, size_t nelems,         \
                                                              size_t *indices, const int *status, \
                                                              int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_WAIT_UNTIL_SOME_VECTOR)
#undef NVSHMEMI_DECL_WAIT_UNTIL_SOME_VECTOR

#define NVSHMEMI_DECL_TEST(NAME, TYPE) \
    NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_##NAME##_test(TYPE *ivar, int cmp, TYPE cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST)
#undef NVSHMEMI_DECL_TEST

#define NVSHMEMI_DECL_TEST_ALL(Name, Type)                                                  \
    NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_##Name##_test_all(Type *ivars, size_t nelems, const int *status, \
                                             int cmp, Type cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_ALL)
#undef NVSHMEMI_DECL_TEST_ALL

#define NVSHMEMI_DECL_TEST_ANY(Name, Type)                                                     \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##Name##_test_any(Type *ivars, size_t nelems, const int *status, \
                                                int cmp, Type cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_ANY)
#undef NVSHMEMI_DECL_TEST_ANY

#define NVSHMEMI_DECL_TEST_SOME(Name, Type)                                                   \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##Name##_test_some(Type *ivars, size_t nelems, size_t *indices, \
                                                 const int *status, int cmp, Type cmp_value);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_SOME)
#undef NVSHMEMI_DECL_TEST_SOME

#define NVSHMEMI_DECL_TEST_ALL_VECTOR(NAME, TYPE)                                                  \
    NVSHMEMI_HOSTDEVICE_PREFIX int nvshmem_##NAME##_test_all_vector(TYPE *ivars, size_t nelems, const int *status, \
                                                    int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_ALL_VECTOR)
#undef NVSHMEMI_DECL_TEST_ALL_VECTOR

#define NVSHMEMI_DECL_TEST_ANY_VECTOR(NAME, TYPE)       \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_test_any_vector( \
        TYPE *ivars, size_t nelems, const int *status, int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_ANY_VECTOR)
#undef NVSHMEMI_DECL_TEST_ANY_VECTOR

#define NVSHMEMI_DECL_TEST_SOME_VECTOR(NAME, TYPE)                                          \
    NVSHMEMI_HOSTDEVICE_PREFIX size_t nvshmem_##NAME##_test_some_vector(TYPE *ivars, size_t nelems,         \
                                                        size_t *indices, const int *status, \
                                                        int cmp, TYPE *cmp_values);

NVSHMEMI_REPT_FOR_WAIT_TYPES(NVSHMEMI_DECL_TEST_SOME_VECTOR)
#undef NVSHMEMI_DECL_TEST_SOME_VECTOR


#ifdef __cplusplus
}
#endif

#endif // _NVSHMEM_H_
