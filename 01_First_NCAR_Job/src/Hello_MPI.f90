PROGRAM example
USE mpi
IMPLICIT NONE

INTEGER :: mpi_ierr, nprocs, mpi_rank

! initialize MPI environment
CALL MPI_Init(mpi_ierr)
CALL MPI_Comm_size(MPI_COMM_WORLD, nprocs, mpi_ierr)
CALL MPI_Comm_rank(MPI_COMM_WORLD, mpi_rank, mpi_ierr)

! just have rank 0 state how many processors we are using
IF (mpi_rank == 0) THEN
 write(*,*) nprocs, "processes have been requested."
ENDIF

! Here is the hello world part...
write(*,*) "Hi, I am Rank: ", mpi_rank
CALL MPI_Finalize(mpi_ierr)
END PROGRAM example
