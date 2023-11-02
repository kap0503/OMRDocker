LIBDIR=/home/user/omr
cd /home/user/omr/palisade-release
mkdir build 
cd build 
cmake .. -DCMAKE_INSTALL_PREFIX=$LIBDIR   
make -j 
make install

cd /home/user/omr/SEAL
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=$LIBDIR -DSEAL_USE_INTEL_HEXL=OFF 
cmake --build build 
cmake --install build

cd /home/user/omr/ObliviousMessageRetrieval/
mkdir build 
cd build 
mkdir ../data       
mkdir ../data/payloads 
mkdir ../data/clues 
cmake .. -DCMAKE_PREFIX_PATH=$LIBDIR 
make
cd build
./OMRdemos