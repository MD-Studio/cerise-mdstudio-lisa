#!/bin/bash

CERISE_API_FILES="$1"
CERISE_DATA=cerise-mdstudio-share-data

# Install share data and miniconda
SCRIPT="https://raw.githubusercontent.com/MD-Studio/cerise-mdstudio-share-data/master/scripts/install_share.sh"
wget $SCRIPT -P "$CERISE_API_FILES/mdstudio/bin"
chmod u+x "$CERISE_API_FILES/mdstudio/bin/install_share.sh"
$CERISE_API_FILES/mdstudio/bin/install_share.sh $CERISE_API_FILES


GMXRC_MDSTUDIO="/sara/sw/gromacs-2016.2-sp/bin/GMXRC.bash"

# ADD ENV variable if it is not already there
pred=$(grep -m 1 'GMXRC_MDSTUDIO' ~/.bashrc)
if [[ -z $pred ]]; then
    echo >>~/.bashrc
    echo '# Added by cerise-mdstudio, sorry!' >>~/.bashrc
    echo 'module load intel-studio'
    echo 'module load gromacs/2016.2'
    echo 'export GMXRC_MDSTUDIO=$GMXRC_MDSTUDIO' >>~/.bashrc
    echo '# End cerise-mdstudio additions' >>~/.bashrc    
fi
