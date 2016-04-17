# -*- mode: ruby -*-
# vi: set ft=ruby :

ANSIBLE_VERSION = "1.9.4"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  # The following are a list of boxes that have been tested and known to build
  # successfully.:
  #config.vm.box = "boxcutter/ol72"
  config.vm.box = "boxcutter/centos72"
  #config.vm.box = "debian/jessie64"
  #config.vm.box = "ubuntu/vivid64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 22, host: 50022
  config.vm.network "forwarded_port", guest: 80, host: 50080
  config.vm.network "forwarded_port", guest: 1521, host: 50521

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # vb.name = "oxar"
    # # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.cpus = "1"
    vb.memory = "1024"

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    if Vagrant.has_plugin?("vagrant-vbguest")
      # Set the following to 'true' after the VM has been successfully provisioned
      config.vbguest.auto_update = false
    end
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vm.provision "shell", path: "ansible/install.sh", args: ANSIBLE_VERSION
  config.vm.provision "ansible_local" do |ansible|
    ansible.install = false
    ansible.version = ANSIBLE_VERSION
    ansible.provisioning_path = "/vagrant/ansible"
    ansible.verbose = true
    ansible.sudo = true
    # ansible.tags = ['oracle_xe_config']
    ansible.playbook = "oxar.yml"
  end
end
