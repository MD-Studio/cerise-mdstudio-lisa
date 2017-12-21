#!/bin/bash

CERISE_API_FILES="$1"

# Download cerise specialization
if [ -d "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-lisa" ] ; then
    cd "$CERISE_API_FILES/mdstudio/github/cerise-mdstudio-lisa"
    git pull
else
    mkdir -p "$CERISE_API_FILES/mdstudio/github"
    cd "$CERISE_API_FILES/mdstudio/github"
    git clone -b develop https://github.com/MD-Studio/cerise-mdstudio-lisa.git
fi

# Download script used by the steps
if [ ! -f "$CERISE_API_FILES/mdstudio/energies/getEnergies.py" ] ; then
    SCRIPT="https://raw.githubusercontent.com/MD-Studio/MDStudio/prototype/components/lie_md/lie_md/scripts/getEnergies.py"
    wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
fi

# install miniconda
if [ ! -d "$CERISE_API_FILES/miniconda" ] ; then
    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $CERISE_API_FILES/miniconda
    conda config --set always_yes yes --set changeps1 no --set auto_update_conda False
    source $CERISE_API_FILES/miniconda/bin/activate root
    conda clean --index-cache
    pip install panedr
fi
