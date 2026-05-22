#!/bin/bash
#PBS -A SCSG0001
#PBS -N HelloWorld
#PBS -q main@desched1
#PBS -l walltime=00:01:00
#PBS -l select=1:ncpus=128:mpiprocs=128
#PBS -o Hello_MPI.log

# Load modules to match compile-time environment
module --force purge
module load ncarenv/25.10 intel/2025.2.1 cray-mpich/8.1.32

# Build Hello World MPI program
mkdir -p bin
mpif90 src/Hello_MPI.f90 -o bin/Hello_MPI

# Run application with MPI binding helper script
mpibind ./bin/Hello_MPI
