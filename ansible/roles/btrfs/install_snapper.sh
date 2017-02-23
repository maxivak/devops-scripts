
# http://software.opensuse.org/download/package?project=filesystems:snapper&package=snapper

#
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/snapper.list"
sudo apt-get update
sudo apt-get install snapper


#You can add the repository key to apt. Keep in mind that the owner of the key may distribute updates, packages and repositories that your system will trust (more information). To add the key, run:

wget http://download.opensuse.org/repositories/filesystems:snapper/xUbuntu_15.04/Release.key
sudo apt-key add - < Release.key



#download:
# http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_15.04/amd64/snapper_0.2.6-0_amd64.deb

#
sudo apt-get install libboost-all-dev

# install downloaded *.deb


sudo apt-get install snapper

# review package
sudo apt-cache policy snapper




### snapper-gui
# https://poisonpacket.wordpress.com/2015/06/04/installing-btrfs-snapper-gui-on-ubuntu-and-ubuntu-derivatives/

sudo apt-get install python3 libgtksourceview-3.0-1 python3 python3-dbus python3-setuptools git

#
cd /disk2/data

# Then clone the snapper-gui GIT repo somewhere:
git clone --depth=1 https://github.com/ricardomv/snapper-gui.git


#
cd snapper-gui

sudo python3 setup.py install


# run the program:
sudo snapper-gui