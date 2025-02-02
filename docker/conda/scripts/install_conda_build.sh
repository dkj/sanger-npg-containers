#!/bin/bash -l

set -eo pipefail
set -x

# Conda package parameters
CONDA_INSTALL_DIR=${CONDA_INSTALL_DIR:-/opt/conda}
CONDA_BUILD_VERSION=${CONDA_BUILD_VERSION:-"3.21.7"}

source $CONDA_INSTALL_DIR/etc/profile.d/conda.sh
conda activate

conda config --set auto_update_conda False
conda config --set ssl_verify True
conda config --set show_channel_urls True

conda install -y -n base "conda-build=$CONDA_BUILD_VERSION" conda-verify
conda install -y -n base curl git patch

conda clean -y --all
