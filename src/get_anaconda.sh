# Constants
HOME=/home/condauser

# Download Anaconda
Anaconda2=http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh
if [ ! -f /tmp/Anaconda.sh ];
then
	# Normal build will download Anaconda directly into user's directory
	wget $Anaconda2 -O $HOME/Anaconda.sh
else
	# If you've pre-downloaded Anaconda, the build should be in /src, named Anaconda.sh
	cp /tmp/Anaconda.sh $HOME/Anaconda.sh
fi

chown condauser:condauser $HOME/Anaconda.sh
