#!/bin/sh

rsync -arv --exclude={.snapshots/,tmp/,mnt/,media/,lost+found/} /disk2/users/mmx/ /disk2/backups/current/users/mmx/ > /var/log/rsync.log




