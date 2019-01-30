#!/bin/bash

# Run base install
$CERISE_PROJECT_FILES/install_base.sh

# Install GROMACS
# Lisa is pretty broken at the moment after the Torque-to-Slurm and
# module-to-EasyBuild upgrade. The only built-in Gromacs that didn't
# not work was gromacs/2016.2, but that uses Intel MPI which confuses
# gromit_mpi.sh, and possibly there's some system issue there as well.
# So we compile from scratch, it's the only thing I could make work.

GROMACS_BUILD_DIR=$(mktemp --tmpdir=/scratch -d)

cd $GROMACS_BUILD_DIR
wget http://ftp.gromacs.org/pub/gromacs/gromacs-2016.4.tar.gz
tar xf gromacs-2016.4.tar.gz
cd gromacs-2016.4

module purge
module load OpenMPI/2.1.1-GCC-6.4.0-2.28

mkdir build-gromacs
cd build-gromacs
cmake -DCMAKE_INSTALL_PREFIX=${CERISE_PROJECT_FILES}/gromacs -DGMX_BUILD_OWN_FFTW=ON -DGMX_MPI=ON -DGMX_THREAD_MPI=OFF -DGMX_GPU=OFF ..
make -j 8
make install

cd $CERISE_PROJECT_FILES
rm -rf $GROMACS_BUILD_DIR
