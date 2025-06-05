#ifndef NVSHMEM_TYPES_H
#define NVSHMEM_TYPES_H

#define TEAM_CONFIG_PADDING 56

typedef int32_t nvshmem_team_t;
typedef nvshmem_team_t nvshmemx_team_t;

typedef struct {
    int version;
    int num_contexts;
    char padding[TEAM_CONFIG_PADDING];
} nvshmem_team_config_v1;
static_assert(sizeof(nvshmem_team_config_v1) == 64, "team_config_v1 must be 64 bytes.");

typedef nvshmem_team_config_v1 nvshmem_team_config_t;

#endif /* NVSHMEM_TYPES_H */