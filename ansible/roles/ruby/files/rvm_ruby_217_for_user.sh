#!/bin/bash

# source

# >> .bash_profile
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile

# >> .bashrc
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#source $HOME/.rvm/scripts/rvm


#
source $HOME/.rvm/scripts/rvm




# install ruby
rvm install 2.1.7


#
rvm use 2.1.7
rvm use 2.1.7 --default
rvm alias create default 2.1.7






# gems
gem install bundler --no-ri --no-rdoc
gem install rake --no-ri --no-rdoc

#
sudo apt-get install -y libxslt-dev libxml2-dev
gem install nokogiri


gem install rails --no-ri --no-rdoc


