### Scuffed Dockerfile for now - I will update this!
## Now operates on the basis that you have literally nothing
FROM ubuntu

SHELL ["/bin/bash", "-c"]

## C++ stuff
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    clang \
    cmake \
    gdb \
    wget

## Get git hehe    
RUN apt-get -y update
RUN apt-get -y install git
## Requirements needed for other dependencies From the repo
RUN apt-get -y install autoconf && \
    apt-get -y install cmake && \
    apt-get -y install libgmp3-dev &&\
    apt-get -y install libntl-dev

WORKDIR /home/user/omr

