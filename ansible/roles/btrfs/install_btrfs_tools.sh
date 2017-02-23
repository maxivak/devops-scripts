#!/usr/bin/env bash

# TOOL. https://github.com/digint/btrbk

# install cpan
# http://www.thegeekstuff.com/2008/09/how-to-install-perl-modules-manually-and-using-cpan-command/

# install Date::Calc

sudo apt-get install libdate-calc-perl


# edit /etc/btrbk/btrbk-ny.conf


#  check config
cd /etc/btrbk

btrbk -c btrbk-my.conf -v dryrun
