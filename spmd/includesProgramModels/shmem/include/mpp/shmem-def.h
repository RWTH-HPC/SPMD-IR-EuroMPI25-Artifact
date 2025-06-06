/* -*- C -*-
 *
 * Copyright 2011 Sandia Corporation. Under the terms of Contract
 * DE-AC04-94AL85000 with Sandia Corporation, the U.S.  Government
 * retains certain rights in this software.
 *
 * Copyright (c) 2016 Intel Corporation. All rights reserved.
 * This software is available to you under the BSD license.
 *
 * This file is part of the Sandia OpenSHMEM software package. For license
 * information, see the LICENSE file in the top level directory of the
 * distribution.
 *
 */

/*
 * This is a generated file, do not edit directly.
 */

#ifndef SHMEM_DEF_H
#define SHMEM_DEF_H

#ifdef __cplusplus
extern "C" {
#endif

#define SHMEM_CMP_EQ 1
#define SHMEM_CMP_NE 2
#define SHMEM_CMP_GT 3
#define SHMEM_CMP_GE 4
#define SHMEM_CMP_LT 5
#define SHMEM_CMP_LE 6

#define _SHMEM_CMP_EQ 1
#define _SHMEM_CMP_NE 2
#define _SHMEM_CMP_GT 3
#define _SHMEM_CMP_GE 4
#define _SHMEM_CMP_LT 5
#define _SHMEM_CMP_LE 6

#define _SHMEM_BCAST_SYNC_SIZE 1
#define  SHMEM_BCAST_SYNC_SIZE 1
#define _SHMEM_REDUCE_SYNC_SIZE 35
#define  SHMEM_REDUCE_SYNC_SIZE 35
#define _SHMEM_BARRIER_SYNC_SIZE 16
#define  SHMEM_BARRIER_SYNC_SIZE 16
#define _SHMEM_COLLECT_SYNC_SIZE 18
#define  SHMEM_COLLECT_SYNC_SIZE 18
#define  SHMEM_ALLTOALL_SYNC_SIZE 16
#define  SHMEM_ALLTOALLS_SYNC_SIZE 16
#define  SHMEM_SYNC_SIZE 35
#define _SHMEM_REDUCE_MIN_WRKDATA_SIZE 1
#define  SHMEM_REDUCE_MIN_WRKDATA_SIZE 1

#define SHMEM_HAVE_ATTRIBUTE_VISIBILITY 0
#define SHMEM_HAVE_ATTRIBUTE_DEPRECATED 1

#define  SHMEM_SYNC_VALUE 0
#define _SHMEM_SYNC_VALUE SHMEM_SYNC_VALUE

#define  SHMEM_MAJOR_VERSION 1
#define _SHMEM_MAJOR_VERSION SHMEM_MAJOR_VERSION
#define  SHMEM_MINOR_VERSION 5
#define _SHMEM_MINOR_VERSION SHMEM_MINOR_VERSION
#define  SHMEM_MAX_NAME_LEN  256
#define _SHMEM_MAX_NAME_LEN  SHMEM_MAX_NAME_LEN
#define  SHMEM_VENDOR_STRING "Sandia OpenSHMEM"
#define _SHMEM_VENDOR_STRING SHMEM_VENDOR_STRING

#define SHMEM_THREAD_SINGLE     0
#define SHMEM_THREAD_FUNNELED   1
#define SHMEM_THREAD_SERIALIZED 2
#define SHMEM_THREAD_MULTIPLE   3

#define SHMEM_MALLOC_ATOMICS_REMOTE   (1l<<0)
#define SHMEM_MALLOC_SIGNAL_REMOTE    (1l<<1)
/* MAX_HINTS value includes the SHMEMX constant(s) in shmemx.h4 */
#define SHMEM_MALLOC_MAX_HINTS        ((1l<<3) - 1)

/* Contexts */
typedef struct shmem_impl_ctx_t { int dummy; } * shmem_ctx_t;

#if SHMEM_HAVE_ATTRIBUTE_VISIBILITY == 1
  __attribute__((visibility("default"))) extern shmem_ctx_t SHMEM_CTX_DEFAULT;
#else
  extern shmem_ctx_t SHMEM_CTX_DEFAULT;
#endif
#define SHMEM_CTX_PRIVATE       (1l<<0)
#define SHMEM_CTX_SERIALIZED    (1l<<1)
#define SHMEM_CTX_NOSTORE       (1l<<2)

/* Teams */

typedef struct shmem_impl_team_t {
    int dummy;
} * shmem_team_t;

typedef struct {
    int num_contexts;
} shmem_team_config_t;

#if SHMEM_HAVE_ATTRIBUTE_VISIBILITY == 1
    __attribute__((visibility("default"))) extern shmem_team_t SHMEM_TEAM_WORLD;
    __attribute__((visibility("default"))) extern shmem_team_t SHMEM_TEAM_SHARED;
#else
    extern shmem_team_t SHMEM_TEAM_WORLD;
    extern shmem_team_t SHMEM_TEAM_SHARED;
#endif

#define SHMEM_TEAM_INVALID NULL

#define SHMEM_CTX_INVALID NULL

#define SHMEM_TEAM_NUM_CONTEXTS       (1l<<0)

#define SHMEM_SIGNAL_SET        0
#define SHMEM_SIGNAL_ADD        1

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* SHMEM_DEF_H */
