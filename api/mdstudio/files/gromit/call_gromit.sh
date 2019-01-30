#!/bin/bash

CERISE_PROJECT_FILES="$1"
LIGAND_PDB="$2"
LIGAND_TOP="$3"

# Remove the CERISE_PROJECT_FILES, LIGAND_PDB and LIGAND_TOP
# items from the input array
shift 3

module load OpenMPI/2.1.1-GCC-6.4.0-2.28

source $CERISE_PROJECT_FILES/miniconda/bin/activate root

# load GMXRC_MDSTUDIO PATH
. $CERISE_PROJECT_FILES/gmxrc
GROMIT="$CERISE_PROJECT_FILES/gromit/gromit_mpi.sh"

# perform a normal MD protein-ligand simulation
export MPI_RUN='mpirun'
$GROMIT -gmxrc $GMXRC_MDSTUDIO -np 4 -vsite -lie -l $LIGAND_PDB,$LIGAND_TOP $*
