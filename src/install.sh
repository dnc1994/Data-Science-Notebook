# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
PY2PATH=$PREFIX/envs/python2/bin

# Python 3
CONDA3=$PY3PATH/conda
PIP3=$PY3PATH/pip

# Python 2
CONDA2=$PY2PATH/conda
PIP2=$PY2PATH/pip

# Install Anaconda
bash $HOME/Anaconda.sh -b

# Make Anaconda's Python default for our user
echo "
# added by Anaconda-Notebook
export PATH=\"$PY2PATH:\$PATH\"" >> $BASH_RC

# Python 2 environment
$CONDA3 create --yes -n python2 python=2 pip

# Clean-up
rm -rf $HOME/Anaconda.sh
rm -rf $HOME/temp
