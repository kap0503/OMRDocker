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

ENV LIBDIR=/home/user/omr
ENV PAL=${LIBDIR}/palisade-release
ENV SEEL=${LIBDIR}/SEAL
ENV OMR=${LIBDIR}/ObliviousMessageRetrieval
## PALISADE STUFF HERE
RUN git clone -b v1.11.3 https://gitlab.com/palisade/palisade-release
RUN mkdir build 
WORKDIR $PAL/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX=$LIBDIR  
WORKDIR $LIBDIR/palisade-release/third-party/google-benchmark/src
RUN sed -i '2a #include<limits>' $LIBDIR/palisade-release/third-party/google-benchmark/src/benchmark_register.h
WORKDIR $PAL/build
RUN make -j 
RUN make install

### SEAL stuff here
WORKDIR /home/user/omr/

RUN git clone -b 3.6.6 https://github.com/microsoft/SEAL 
WORKDIR ${SEEL}/build

RUN cmake -S . -B build -DCMAKE_INSTALL_PREFIX=$LIBDIR -DSEAL_USE_INTEL_HEXL=OFF && \   
    cmake --build build && \
    cmake --install build

WORKDIR /home/user/omr/

RUN git clone https://github.com/ZeyuThomasLiu/ObliviousMessageRetrieval 
WORKDIR ${OMR}
RUN mkdir build 
WORKDIR ${OMR}/build 
RUN mkdir ../data && \       
mkdir ../data/payloads && \ 
mkdir ../data/clues && \
cmake .. -DCMAKE_PREFIX_PATH=$LIBDIR && \
make && \
./OMRdemos
