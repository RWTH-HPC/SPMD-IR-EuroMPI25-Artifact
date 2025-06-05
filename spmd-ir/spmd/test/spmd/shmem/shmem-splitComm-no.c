/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

// all even ranks execute line 13 and therefore no error
#include <shmem.h>

int main(int argc, char *argv[]) {
  int myRank, size;
  shmem_init();
  myRank = shmem_my_pe();
  size = shmem_n_pes();

  shmem_team_t splitTeam;
  shmem_team_split_strided(SHMEM_TEAM_WORLD, 0, 2, size / 2, NULL, 0, &splitTeam);

  if (myRank%2) {
    shmem_team_sync(splitTeam);
  }

  shmem_team_destroy(splitTeam);
  shmem_finalize();
  return 0;
}