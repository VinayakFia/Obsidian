#!/bin/bash
temp="temp"
mkdir $temp
cd $temp
cp ../lights_v3.pml .
spin -a lights_v3.pml
gcc -o pan pan.c
./pan
spin -p -t lights_v3.pml
cd ..
rm -rf $temp
