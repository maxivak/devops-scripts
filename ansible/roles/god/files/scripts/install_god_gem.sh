#!/bin/bash

source /home/uadmin/.rvm/scripts/rvm

#rvm use 2.1.7
rvm use 2.2.4


gem install god


# startup script
#rvm wrapper ruby-2.1.7 boot god
rvm wrapper ruby-2.2.4 boot god

