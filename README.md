# CS153 Operating Systems
Collaboration Repo for Bradley Evans and Dharti Tarapara<br>
University of California, Riverside<br>
Spring 2017<br>
<br>
How to Use This Repository:
<br>
Step 1: Install Vagrant<br>
Step 2: If you're using Windows, install some sort of ssh client. Cygwin `ssh` has been used successfully here.<br>
Step 3: Clone this repo into a directory.<br>
Step 4: Access the directory in the command line, and `vagrant up`. The provisioner will do the rest.<br>
Step 5: Access the box via `vagrant ssh` from the same directory once provisioning is complete.<br>

Useful Links: <br>
http://www.cs.ucr.edu/~csong/os/17/v <br>

## Instructions that were posted on Piazza

If this is useful, I wrote a vagrantfile and provisioner that will bring a student up to Lab 0 automatically (in case something happens and the VM needs to be destroyed and remade). I haven't tested this on sledge. I am running Windows 10 with Vagrant and Cygwin. All I have to do once I have these files in a directory is vagrant up and vagrant ssh in the place these files are located.

Vagrantfile
```
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.


ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"

Vagrant.configure("2") do |config|

  config.vm.define("ubuntu-xenial") do |ubuntu_config|

    ubuntu_config.vm.box = "ubuntu/xenial64"
    ubuntu_config.vm.synced_folder "./os_share", "/os_share"
    ubuntu_config.vm.provision "shell", path: "provisioner.sh"

  end

end
```
provisioner.sh (in same directory)
```
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
cd ~/qemu
./configure --disable-kvm --target-list="i386-softmmu x86_64-softmmu"
make
make install

# Stand up Xv6
git clone https://github.com/mit-pdos/xv6-public.git ~/xv6
cd ~/xv6
# Change makefile to use 1 CPU on line 214 in xv6. I am told this makes things easier.
sed 's/CPUS := 2/CPUS := 1/' Makefile > Makefile2
mv Makefile Makefile.bkup
mv Makefile2 Makefile
make
echo "add-auto-load-safe-path $HOME/xv6/.gdbinit" > ~/.gdbinit
The user should also create an os_share folder in the same directory to use the rsync features described in the Vagrantfile.
```

How To Use This

Create an empty folder. For this example, I will use ~/cs153.
Copy the first portion into `~/cs153/Vargrantfile`. Copy the second portion into ~/cs153/provisioner.sh.
Navigate to the folder. cd ~/cs153.
Do vagrant up.
Vagrant will automatically create the VM and provision it based on the instructions in lab 0.
If you break your VM, do vagrant destroy && vagrant up. This will restore the image to the initial state defined by the provisioner. You probabaly want to update your provisioner.sh if you make changes to the environment.
Enjoy.
