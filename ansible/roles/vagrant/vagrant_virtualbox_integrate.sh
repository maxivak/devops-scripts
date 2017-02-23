#!/usr/bin/env bash

# http://aruizca.com/steps-to-create-a-vagrant-base-box-with-ubuntu-14-04-desktop-gui-and-virtualbox/

# add user vagrant

sudo adduser vagrant
sudo passwd vagrant


#
sudo su -
visudo

# Add the following line to the end of the file.
vagrant ALL=(ALL) NOPASSWD:ALL

# Install Vagrant Public Keys


mkdir -p /home/vagrant/.ssh
wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys

chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Install OpenSSH Server
sudo apt-get install -y openssh-server

#
sudo nano /etc/ssh/sshd_config

# Ensure the following is set:

Port 22
PubKeyAuthentication yes
AuthorizedKeysFile %h/.ssh/authorized_keys
PermitEmptyPasswords no

#
sudo service ssh restart


# shut down VM

#
vagrant package –-base <VitualBox VM Name>

# this will create a file called package.box

vagrant box add my-ubuntu-1404-desktop package.box
