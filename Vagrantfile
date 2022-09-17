
Vagrant.configure(2) do |config|

  # Specify the base box
  config.vm.box = "ubuntu/focal64"

  # Setup port forwarding
  #config.vm.network "forwarded_port", guest: 22, host: 1022, host_ip: "127.0.0.1", id: 'ssh'

  # Setup network
  config.vm.network "private_network", ip: "10.0.0.103"
  config.vm.hostname = "dev.ubuntuspace.com"

  # Setup synced folder
    config.vm.synced_folder "projects/", "/var/www/html", group: "www-data", owner: "vagrant", :mount_options => ['dmode=775', 'fmode=775']

  # CUSTOMIZATION
   config.vm.provider "virtualbox" do |vb|

     vb.name = "ubuntuspace"
  
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
     vb.cpus = 2
   end


  # PROVISION
  # config.vm.provision :shell, path: “vagrant/bootstrap.sh"
   # Shell provisioning
    config.vm.provision "shell" do |s|
      s.path = "vagrant/bootstrap.sh"
    end
  
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
