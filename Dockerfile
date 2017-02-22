FROM debian:jessie
MAINTAINER Linghao Zhang "zlhdnc1994@gmail.com"

# Link in our build files to the docker image
ADD src/ /tmp
COPY src/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Set permissions
RUN chmod +x /tmp/get_anaconda.sh
RUN chmod +x /tmp/install.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Run all Ubuntu updates and apt-get installs
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y git \
		wget \
		bzip2 \
		build-essential \
		python-dev \
		gfortran \
	&& apt-get clean

# Create conda user, get Anaconda by web or locally
RUN useradd --create-home --home-dir /home/condauser --shell /bin/bash condauser
RUN /tmp/get_anaconda.sh

# Run all Python installs
# Perform necessary clean-ups
USER condauser
RUN /tmp/install.sh

# Copy notebook configs into iPython directory
# Make sure our user owns the directory
USER root
RUN apt-get --purge -y autoremove wget && \
	cp /tmp/ipython_notebook_config.py /home/condauser/.ipython/profile_default/ && \
	cp /tmp/matplotlib_nb_init.py /home/condauser/.ipython/profile_default/startup && \
	chown condauser:condauser /home/condauser -R

# Set persistent environment variables for Python3 and Python2
ENV PY3PATH=/home/condauser/anaconda3/bin
ENV PY2PATH=/home/condauser/anaconda3/envs/python2/bin

# Install Python3 iPython kernel
RUN $PY3PATH/python $PY3PATH/ipython kernelspec install-self

# Set up our environment for running ipython notebook
# Setting user here makes sure ipython notebook is run as user, not root
EXPOSE 8888
USER condauser
ENV HOME=/home/condauser
ENV SHELL=/bin/bash
ENV USER=condauser
WORKDIR /home/condauser/notebooks

# Set entry point
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
# CMD $PY3PATH/ipython notebook
