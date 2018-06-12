# Ubuntuspace Vagrant

This Vagrant is a simple __Ubuntu Trusty64__ vagrant configuration for LAMP stack developers which also includes many related modern development tools.


# Overview
This vagrant use [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) from [Atlas Vagrant Box](https://atlas.hashicorp.com/boxes/search?utm_source=vagrantcloud.com&vagrantcloud=1).
  On your 'vagrant up' command, this vagrantfile will automatically download the box. Vagrant folder here contain a `bootstrap.sh` file which provision the vagrant box.
  
  You need to place your projects in `projects` directory. This directory is synced with `/var/www/html` directory in the virtual machine. 
  This project folder also contain a `config` folder which is used during the provisioning. 

This vagrant box is configured to use '1024 mb' of RAM and 1 CPU core. You can change ths configuration from Vagrantfile.
 
## Included packages

- Ubuntu Trusty64 (64-Bit)
- Apache 2
- PHP _v7.1_ with mysql, mcrypt, memcached, memcache, sqlite, xmlrpc, geoip gd, xdebug, php7.1-fpm, php7.1-common, php7.1-bcmath
- MySQL _v5.5.41_
- Git
- Node
- Composer
- NPM
- Bower

### Included Dependencies
The following dependencies are installed using apt-get as they are required to install and build other modules:

- cURL
- python-software-properties
- build-essential
- libev-dev

 
# Installation

### Install via Git
To use this Ubuntuspace vagrant, clone this github repo 

   ### With https
    $ git clone https://github.com/SubrataBauri/ubuntuspace.git
   
   ### With ssh
       $ git clone git@github.com:SubrataBauri/ubuntuspace.git
       
to your mac/pc/linux.  When clone is complete, go to the `ubuntuspace` and now you are ready to use your Virtual Machine.


## Edit hosts file
   
Windows - start notepad.exe as Administrator and browse to this file:
```
C:\Windows\System32\drivers\etc\hosts
```

Linux/Mac - use root user or sudo to edit this file:
```
/etc/hosts
```

   Add the following lines to your hosts file:
```
10.0.0.103 dev.ubuntuspace.com
```


### Use
Start the VM

    $ cd /ubuntuspace
    $ vagrant up

First time of your 'vagrant up' will provision the vagrant. You can see the status of your VM from [http://dev.ubuntuspace.com](http://dev.ubuntuspace.com).
You can check the `phpinfo` from  [http://dev.ubuntuspace.com/phpinfo.php](http://dev.ubuntuspace.com/phpinfo.php)

### Requirements
You must have [Vagrant](http://vagrantup.com) and [VirtualBox](https://www.virtualbox.org)installed in your pc.


# Default Credentials
These are credentials setup by default.

## Host Address:
- Host: 10.0.0.103 (Change in Vagrantfile if you like)
 
## SSH
- Username: vagrant
- Password: vagrant
- Port: 22

## MySQL Credentials
- Username: root
- Password: root
- Host: localhost
- Port: 3306

## Errors and Solutions
##### 1. If you get `proc_open(): fork failed` error while installing applications (ex. magento 2.2)
[Solution link here](https://getcomposer.org/doc/articles/troubleshooting.md#proc-open-fork-failed-errors)

## Enable rewrite 
```BASH
vagrant ssh
cd /etc/apache2/sites-available/
vim 000-default.conf
```
add the following section:
```
<Directory /var/www/html>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```
