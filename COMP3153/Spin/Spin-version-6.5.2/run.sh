#!/bin/bash
temp=$(mktemp -d)
echo $temp
cd $temp
cp ../lights.pml .
spin -a lights.pml
gcc -o pan pan.c
./pan
spin -p -t lights.ml
cd ..
rm -rf $temp
