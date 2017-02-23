#!/usr/bin/env bash

sudo ansible-playbook add_nfs_share.yml -l localhost  --extra-vars "dir=/disk2/users/mmx/temp"