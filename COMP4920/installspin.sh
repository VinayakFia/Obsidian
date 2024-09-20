#!/bin/bash

# Install Spin and iSpin on MacOS
# adapted from https://philenius.github.io/software%20quality/2020/04/09/installing-spin-on-ubuntu-19.html
# (requires developer tools to be installed; to install them, run `xcode-select --install`)

# Install in a new directory
INSTALL_DIR=Spin
mkdir $INSTALL_DIR
cd $INSTALL_DIR
curl -OL https://github.com/nimble-code/Spin/archive/version-6.5.2.tar.gz
tar xfz version-6.5.2.tar.gz
cd Spin-version-*/Src
make
sudo cp spin /usr/local/bin/

# Example: Check if Spin was installed
# spin -V

# Example: Running Spin
# spin $INSTALL_DIR/Spin-version-*/Examples/hello.pml

# Example: Running iSpin
# cd $INSTALL_DIR/Spin-version-*/optional_gui/
# ./ispin.tcl