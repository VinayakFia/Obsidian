#!/bin/bash
temp="temp"
mkdir $temp
cd $temp
cp ../lights_v2.pml .
spin -a lights_v2.pml
gcc -o pan pan.c
./pan
spin -p -t lights_v2.pml
cd ..
rm -rf $temp
