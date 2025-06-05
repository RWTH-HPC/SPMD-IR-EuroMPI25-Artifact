#include <par-res-kern_general.h>
#include <par-res-kern_mpi.h>

int main(int argc, char ** argv) {

  int    Num_procs;       /* number of ranks                                     */
  int    Num_procsx, Num_procsy; /* number of ranks in each coord direction      */

  MPI_Comm_size(MPI_COMM_WORLD, &Num_procs);
  factor(Num_procs, &Num_procsx, &Num_procsy);

  exit(EXIT_SUCCESS);
}
