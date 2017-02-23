#sudo apt-get install software-properties-common
#sudo apt-add-repository ppa:ansible/ansible
#sudo apt-get update
#sudo apt-get install ansible

# fix error
# python-setuptools : Depends: python-pkg-resources (= 3.3-1ubuntu1) but 3.3-1ubuntu2 is to be installed
#sudo apt-get install python-pkg-resources=3.3-1ubuntu1
#sudo apt-get install python-setuptools


# config
#/etc/ansible/ansible.cfg

### 2

# depends on version
#sudo apt-get install python-pkg-resources=3.3-1ubuntu1

sudo apt-get install python-setuptools
sudo apt-get install python-pip python-dev
sudo apt-get update
sudo pip install ansible==1.9.4

#sudo rm /usr/bin/ansible
#sudo rm /usr/bin/ansible-playbook
sudo ln -s /usr/local/bin/ansible /usr/bin/ansible
sudo ln -s /usr/local/bin/ansible-playbook /usr/bin/ansible-playbook

## changes
