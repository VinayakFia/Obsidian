#!/bin/bash
temp="temp"
mkdir $temp
cd $temp
cp ../lights.pml .
spin -a lights.pml
gcc -o pan pan.c
./pan
spin -p -t lights.pml
cd ..
rm -rf $temp
