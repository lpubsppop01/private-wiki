#! /bin/sh
# -*- coding: utf-8-unix -*-

# Filename: start.sh
# Author: lpubsppop01
# Created: 2017/05/04 12:24:06
# Last modified: 2017/05/04 14:54:44

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
nohup jingo -c ~/private-wiki/config.yaml > /dev/null &

# start.sh ends here
