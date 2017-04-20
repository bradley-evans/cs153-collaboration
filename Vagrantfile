# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.



ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"

Vagrant.configure("2") do |config|

  config.ssh.forward_x11 = true

  config.vm.define("ubuntu-xenial") do |ubuntu_config|

    ubuntu_config.vm.box = "ubuntu/xenial64"
    ubuntu_config.vm.synced_folder "./os_share", "/os_share"
    ubuntu_config.vm.provision "shell", path: "provisioner.sh"

  end

end
