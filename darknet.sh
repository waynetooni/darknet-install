#!/bin/bash 

# update on 2020.11.19
# install darknet with bash
# by Lee Hao

# test on ubuntu 16.04
#         cuda 10.0
#         cudnn 7.5
#         opencv 3.4.7

# Download darknet
git clone https://github.com/AlexeyAB/darknet.git

# set Makefile value
python changeMakefile.py

# make darknet
cd darknet && make -j$(nproc)