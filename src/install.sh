# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda2

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

# Additional packages to install
$CONDA2 install --yes seaborn
$PIP2 install xgboost
$PIP2 install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

# Python 2 environment
$CONDA3 create --yes -n python2 python=2 pip ipython

# iPython setup
$PY3PATH/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser $HOME/.ipython/profile_default/security -R
mkdir $HOME/notebooks
cp -a /tmp/notebooks $HOME/notebooks

# Clean-up
rm -rf $HOME/Anaconda.sh
rm -rf $HOME/temp
