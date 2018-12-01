#!/bin/bash

# https://solarianprogrammer.com/2017/12/07/raspberry-pi-raspbian-compiling-gcc/

# Building GCC 8 from sources could take some time,
# in my case it took about 5 hours on a Raspberry Pi 3 with a 16GB class 10 SD card and 1GB swap.
# If you want to avoid the wait time or if you don’t have enough available space, you can download my version from
# https://bitbucket.org/sol_prog/raspberry-pi-gcc-binary.

sudo apt-get install libarchive-dev libzip-dev liblzo2-dev zip unzip
sudo apt-get install build-essential automake debhelper bison flex texi2html cmake texinfo libuv1-dev

export CFLAGS="-O3 -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
export CXXFLAGS="-O3 -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

wget https://ftpmirror.gnu.org/gcc/gcc-7.3.0/gcc-7.3.0.tar.gz
tar xf gcc-7.3.0.tar.gz
cd gcc-7.3.0
contrib/download_prerequisites

# At this point, we can configure the build. In order to keep the system clean,
# we will use /usr/local/gcc-7.3.0 as the destination for the installed GCC 7.
# Because we want to be able to use GCC 8 while keeping GCC 6.3, we will append -7.3.0 to the resulting executables.

mkdir build && cd build
../configure -v --enable-languages=c,c++ --prefix=/usr/local/gcc-7.3.0 --program-suffix=-7.3.0 --with-arch=armv8-a+crc --with-tune=cortex-a53 --with-fpu=neon-fp-armv8 --with-float=hard --build=arm-linux-gnueabihf --host=arm-linux-gnueabihf --target=arm-linux-gnueabihf
make -j3

# Once the build process is finished you can install the compilers with:
sudo make install-strip

# Add the new compilers to your path with:
export PATH=/usr/local/gcc-7.3.0/bin:$PATH

# At this point, you should be able to compile any C11 or C++17 code using gcc-7.3.0 or g++-7.3.0.
# If you want to permanently add GCC 8 to your path simply append the above export line to the end of your .bashrc file:
cd ~
echo 'export PATH=/usr/local/gcc-7.3.0/bin:$PATH' >> .bashrc
source .bashrc

# In GCC 8 the default C++ standard is now -std=gnu++14, which means that by default any C++ program will be compiled for C++14.
# For C, the default is std=gnu11 starting from GCC 5. If you want to use the new C++17 standard use:
# 1 g++-7.3.0 -std=c++17 -Wall -pedantic -O2 your_program_name.cpp -o your_program_name

# If, at some point in the future, you’ll want to get rid of GCC 7 from your system,
# all you have to do is to remove the gcc-7.3.0 folder from /usr/local, example:
# 1 sudo rm -rf /usr/local/gcc-7.3.0

exit 0
