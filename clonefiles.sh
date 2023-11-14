### Stuff below is from the repo README 
LIBDIR=/home/prabhu21/OMR/OMRDocker
cd ${LIBDIR}
## PALISADE STUFF HERE
git clone -b v1.11.3 https://gitlab.com/palisade/palisade-release

### SEAL stuff here
cd ${LIBDIR}

git clone -b 3.6.6 https://github.com/microsoft/SEAL 

cd ${LIBDIR}

git clone https://github.com/ZeyuThomasLiu/ObliviousMessageRetrieval 
