#!/bin/bash

## Trace command execution, and exit on first encountered error
set -e
set -x

## From LAB1 Intro Steps
apt-get update
apt-get install -y build-essential gdb git gcc-multilib upstart

git clone http://web.mit.edu/ccutler/www/qemu.git -b 6.828-2.3.0 ~/qemu
apt-get install -y libsdl1.2-dev libtool-bin libglib2.0-dev libz-dev libpixman-1-dev

# Install QEMU
mkdir /cs153
apt-get install -y libsdl1.2-dev libtool-bin libglib2.0-dev libz-dev libpixman-1-dev
cd ~/qemu
./configure --disable-kvm --target-list="i386-softmmu x86_64-softmmu"
make
make install

# Stand up Xv6
git clone https://github.com/mit-pdos/xv6-public.git ~/xv6
cd ~/xv6
# Change makefile to use 1 CPU on line 214 in xv6
sed 's/CPUS := 2/CPUS := 1/' Makefile > Makefile2
mv Makefile Makefile.bkup
mv Makefile2 Makefile
make
echo "add-auto-load-safe-path $HOME/xv6/.gdbinit" > ~/.gdbinit