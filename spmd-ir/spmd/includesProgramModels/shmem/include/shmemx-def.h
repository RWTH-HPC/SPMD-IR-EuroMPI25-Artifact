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
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef SHMEMX_DEF_H
#define SHMEMX_DEF_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

#define HAVE_SHMEMX_WTIME

/* Counting puts */
typedef char * shmemx_ct_t;

/* Counter */
typedef struct {
    uint64_t pending_put;
    uint64_t pending_get;
    uint64_t completed_put;
    uint64_t completed_get;
    uint64_t target;
} shmemx_pcntr_t;

#define SHMEMX_EXTERNAL_HEAP_ZE 0
#define SHMEMX_EXTERNAL_HEAP_CUDA 1

#if SHMEM_HAVE_ATTRIBUTE_VISIBILITY == 1
    __attribute__((visibility("default"))) extern shmem_team_t SHMEMX_TEAM_NODE;
#else
    extern shmem_team_t SHMEMX_TEAM_NODE;
#endif

#ifdef __cplusplus
}
#endif

#endif /* SHMEMX_DEF_H */
