### shared folders

# in virtualbox manager - add share named 'share'
# Add the shared folder to the virtual machine using vBox graphical interface
# Make sure to select automount and make permanent

# on guest machine:
sudo adduser myuser vboxsf
sudo usermod -a -G vboxsf myuser

mkdir /home/<user>/vboxshare
sudo mount -t vboxsf -o uid=1000,gid=1000 share /home/<user>/vboxshare

# automount

# /etc/fstab
# !!! use tabs between blocks
<name_of_share> /path/to/mountpoint   vboxsf   uid=1000,gid=1000  0   0
#mytemp  /home/mmx/temp   vboxsf   uid=1000,gid=1000  0   0

sudo mount -a

# /etc/modules

# add line
vboxsf


# solution 2
# /etc/rc.local

# add line
mount mytemp
