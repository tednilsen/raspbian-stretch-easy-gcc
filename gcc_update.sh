#!/bin/bash

# https://solarianprogrammer.com/2017/12/07/raspberry-pi-raspbian-compiling-gcc/

# Languages: c, c++, objc, obj-c++

# remove defaults, and setup again
sudo update-alternatives --remove-all g++
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all cpp
sudo update-alternatives --remove-all c++
sudo update-alternatives --remove-all gcov

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 --slave /usr/bin/gcov gcov /usr/bin/gcov-6 --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-6 --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-6 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-6 --slave /usr/bin/cpp cpp /usr/bin/cpp-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/local/gcc-7.3.0/bin/gcc-7.3.0 73 --slave /usr/bin/g++ g++ /usr/local/gcc-7.3.0/bin/g++-7.3.0 --slave /usr/bin/gcov gcov /usr/local/gcc-7.3.0/bin/gcov-7.3.0 --slave /usr/bin/gcc-ar gcc-ar /usr/local/gcc-7.3.0/bin/gcc-ar-7.3.0 --slave /usr/bin/gcc-nm gcc-nm /usr/local/gcc-7.3.0/bin/gcc-nm-7.3.0 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/local/gcc-7.3.0/bin/gcc-ranlib-7.3.0 --slave /usr/bin/cpp cpp /usr/local/gcc-7.3.0/bin/cpp-7.3.0
sudo update-alternatives --install /usr/bin/gcc gcc /usr/local/gcc-8.2.0/bin/gcc-8.2.0 82 --slave /usr/bin/g++ g++ /usr/local/gcc-8.2.0/bin/g++-8.2.0 --slave /usr/bin/gcov gcov /usr/local/gcc-8.2.0/bin/gcov-8.2.0 --slave /usr/bin/gcc-ar gcc-ar /usr/local/gcc-8.2.0/bin/gcc-ar-8.2.0 --slave /usr/bin/gcc-nm gcc-nm /usr/local/gcc-8.2.0/bin/gcc-nm-8.2.0 --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/local/gcc-8.2.0/bin/gcc-ranlib-8.2.0 --slave /usr/bin/cpp cpp /usr/local/gcc-8.2.0/bin/cpp-8.2.0

sudo update-alternatives --config gcc

