### ubuntu boxes

https://github.com/ffuenf/vagrant-boxes
https://vagrantcloud.com/boxcutter/boxes/ubuntu1510


### vagrant with gui

# http://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment

# Don't start the GUI as root. You really want to stay the vagrant user. To do this you need to permit anyone to start the GUI:
#
sudo vim /etc/X11/Xwrapper.config

allowed_users=anybody

#
# install the VirtualBox guest tools before starting the GUI.
# This will give you a healthy screen resolution, integrated mouse, etc.

sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

sudo VBoxClient-all

# Only now should you start the GUI as the vagrant user, with

startxfce4&