#!/usr/bin/env bash

cd /tmp



#!/usr/bin/env bash

cd /tmp

#
# v1. not work
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce

# v2. not work
#curl -LJO https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_8.1.1-ce.1_amd64.deb
#sudo dpkg -i gitlab-ce_8.1.1-ce.1_amd64.deb


# v3
# edit /etc/apt/sources.list.d/gitlab_gitlab-ce.list
>>
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ trusty main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ trusty main

#
sudo apt-get update
sudo apt-get install gitlab-ce

# configure
sudo gitlab-ctl reconfigure

# login in browser
# root
# 5iveL!fe

# config


# move home dir => /var/www/git



### v. using docker
# https://github.com/sameersbn/docker-gitlab

#
cd ..

wget https://raw.githubusercontent.com/sameersbn/docker-gitlab/master/docker-compose.yml

# generate key

pwgen -Bsv1 64

# save value to env
#
sudo nano /etc/profile

#
GITLAB_SECRETS_DB_KEY_BASE=XXXXX
export GITLAB_SECRETS_DB_KEY_BASE

# or
sudo nano /etc/profile.d/gitlab.sh

export GITLAB_SECRETS_DB_KEY_BASE=XXXX

#
source /etc/profile


#
sudo docker run --name gitlab-postgresql -d     --env 'DB_NAME=gitlabhq_production'     --env 'DB_USER=gitlab' --env 'DB_PASS=password'  --volume /vagrant/gitlab/postgresql:/var/lib/postgresql     sameersbn/postgresql:9.4-8
sudo docker run --name gitlab-postgresql -d sameersbn/postgresql:9.4-8
sudo docker run --name gitlab-postgresql -d     --volume /vagrant/gitlab/postgresql:/var/lib/postgresql     sameersbn/postgresql:9.4-8
sudo docker run --name pg4 -d   -v /vagrant/gitlab/postgresql:/var/lib/postgresql sameersbn/postgresql:9.4-8

sudo docker run --name pg5 -d   -v /home/vagrant/temp/postgresql:/var/lib/postgresql sameersbn/postgresql:9.4-8

# redis
sudo docker run --name gitlab-redis -d  --volume /vagrant/gitlab/redis:/var/lib/redis    sameersbn/redis:latest

# gitlab
sudo docker run --name gitlab -d --link gitlab-postgresql:postgresql --link gitlab-redis:redisio    --publish 10022:22 --publish 10080:80   --env 'GITLAB_PORT=10080' --env 'GITLAB_SSH_PORT=10022'    --env 'GITLAB_SECRETS_DB_KEY_BASE=tqffsNpsj3FdkzN4pFdgX7MKM4h7qLmKmx9CFmdPMxJKcwsmdRfVJXLrdvJfCmdP'  --volume /vagrant/gitlab/gitlab:/home/git/data     sameersbn/gitlab:8.2.0

sudo docker run --name gitlab2 -d --link pg5:postgresql --link gitlab-redis:redisio    --publish 10022:22 --publish 10080:80   --env 'GITLAB_PORT=10080' --env 'GITLAB_SSH_PORT=10022'    --env 'GITLAB_SECRETS_DB_KEY_BASE=tqffsNpsj3FdkzN4pFdgX7MKM4h7qLmKmx9CFmdPMxJKcwsmdRfVJXLrdvJfCmdP'  --volume /vagrant/gitlab/gitlab:/home/git/data     sameersbn/gitlab:8.2.0


#
# v1. not work
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install gitlab-ce

# v2. not work
#curl -LJO https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_8.1.1-ce.1_amd64.deb
#sudo dpkg -i gitlab-ce_8.1.1-ce.1_amd64.deb


# v3
# edit /etc/apt/sources.list.d/gitlab_gitlab-ce.list
>>
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ trusty main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ trusty main

#
sudo apt-get update
sudo apt-get install gitlab-ce

# configure
sudo gitlab-ctl reconfigure

# login in browser
# root
# 5iveL!fe

# config


# move home dir => /var/www/git



### dir for repositories


#sudo gitlab-ctl stop

sudo rsync -av /var/opt/gitlab/git-data/repositories /mnt/repos




sudo gitlab-ctl reconfigure


sudo gitlab-ctl start

sudo /etc/init.d/gitlab restart


su - git -c "mkdir /mnt/repos/1"
