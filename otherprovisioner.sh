#!/bin/bash
## Trace command execution, and exit on first encountered error
set -e
set -x

## From LAB1 Intro Steps
apt-get update
apt-get install -y build-essential gdb git gcc-multilib upstart sed

git clone http://web.mit.edu/ccutler/www/qemu.git -b 6.828-2.3.0 ~/qemu
apt-get install -y libsdl1.2-dev libtool-bin libglib2.0-dev libz-dev libpixman-1-dev

# Install QEMU
mkdir /cs153
cd ~/workspace/qemu
./configure --disable-kvm --target-list="i386-softmmu x86_64-softmmu"
make
make install

# Stand up Xv6
#git clone https://github.com/mit-pdos/xv6-public.git ~/xv6
cd ~/workspace/xv6
# Change makefile to use 1 CPU on line 214 in xv6. I'm told this "makes things easier."
#sed 's/CPUS := 2/CPUS := 1/' Makefile > Makefile2
#mv Makefile Makefile.bkup
#mv Makefile2 Makefile
make
echo "add-auto-load-safe-path $HOME/workspace/xv6/.gdbinit" > ~/.gdbinit

# TODO: finish X11 breakfix
# looks like most of this has to do with Cygwin peculiarities.
### ENABLE X11 ###
apt-get install -y xterm xinit

# VANITY STUFF
# Custom configurations for Vim.
#mkdir ~/.vim
#cp -r /os_share/vanity/* ~
#cp -r /os_share/vanity/.vim/* ~/.vim/

# LAB 0.5 SAVE POINT
#cp -avf /os_share/lab0/* ~/xv6/

# LAB 1 SAVE POINT
#cp -r /os_share/lab1/xv6/* ~/xv6/
