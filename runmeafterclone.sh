LIBDIR=/home/prabhu21/OMR/OMRDocker
PAL=${LIBDIR}/palisade-release
SEEL=${LIBDIR}/SEAL
OMR=${LIBDIR}/ObliviousMessageRetrieval

cd ${PAL}
mkdir build 
cd $PAL/build
cmake .. -DCMAKE_INSTALL_PREFIX=$LIBDIR  
cd $LIBDIR/palisade-release/third-party/google-benchmark/src
sed -i '2a #include<limits>' $LIBDIR/palisade-release/third-party/google-benchmark/src/benchmark_register.h
cd $PAL/build
make -j 
make install

cd ${SEEL}
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=$LIBDIR -DSEAL_USE_INTEL_HEXL=OFF 
cmake --build build 
cmake --install build

cd ${OMR}
mkdir build 
cd build 
mkdir ../data       
mkdir ../data/payloads 
mkdir ../data/clues 
cmake .. -DCMAKE_PREFIX_PATH=$LIBDIR 
make
cd build
./OMRdemos