###
# https://www.virtualbox.org/wiki/Downloads
#


#
sudo apt-get install dkms

# remove previous versions
#sudo apt-get remove virtualbox-\*
#sudo apt-get purge virtualbox-\*

# edit /etc/apt/sources.list
deb http://download.virtualbox.org/virtualbox/debian vivid contrib

#
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -


sudo apt-get update
sudo apt-get install virtualbox-5.0
#sudo apt-get install virtualbox-4.3