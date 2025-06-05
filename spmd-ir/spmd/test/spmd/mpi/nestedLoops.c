/*
 * SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
 *
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>


int main(int argc, char** argv){
  int rank, size;

  MPI_Init(&argc,&argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rank);
  MPI_Comm_size(MPI_COMM_WORLD,&size);

  if(size<2){
    printf("This test needs at least 2 MPI processes\n");
    MPI_Finalize();
    return 1;
  }

  if(rank%2){
    for(int i=0; i<3; i++){
      printf("test");
      for(int ii=0; ii<10; ii++){
        MPI_Barrier(MPI_COMM_WORLD);
      }
    }
  }else{
    for(int j=0; j<5; j++){
      printf("test");
      for(int jj=0; jj<6; jj++){
        MPI_Barrier(MPI_COMM_WORLD);
      }
    }
  }

  MPI_Finalize();
  return 0;
}
