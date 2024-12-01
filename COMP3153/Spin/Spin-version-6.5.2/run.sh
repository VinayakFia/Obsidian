#!/bin/bash
temp="temp"
mkdir $temp
cd $temp
cp ../lights_v4.pml .
spin -a lights_v4.pml
gcc -o pan pan.c
./pan -m10000 -a
# spin -p -t lights_v4.pml
cd ..
rm -rf $temp
