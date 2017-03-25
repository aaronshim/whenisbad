############################################################
# Dockerfile to run whenisbad as a dev environment
# Based on the official Haskell image
############################################################

FROM haskell:8

################## BEGIN INSTALLATION ######################
# for Make (and other utilities)
RUN apt-get update
RUN apt-get install -y make curl time rsync

# node is necessary for Elm dependencies
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# elm
RUN npm install -g elm

##################### INSTALLATION END #####################

# Copy the source of the repo in its current state (so we don't deal with virtualizing filesystem problems)
# Prepare a mount point for the host volume mapping so we can eventually rsync it
RUN mkdir -p /home/code/whenisbad; mkdir -p /home/host/whenisbad
WORKDIR /home/code/whenisbad
ADD . /home/code/whenisbad

# build and start a terminal
RUN time make
ENV DOCKER_RSYNC true
ENTRYPOINT bash
