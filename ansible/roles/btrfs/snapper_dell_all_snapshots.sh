#!/usr/bin/env bash

### delete all snapshots in a folder
## first argument = path to a subvolume, for example, /disk2/test

dd=$1
spath="$dd/.snapshots/"
cd $dd

for d in */ ; do
    echo "$d"
    v="$spath$d"
    cd $v && btrfs subvolume delete snapshot
done

all="$dd/.snapshots/*"
rm -rf $all

btrfs subvolume delete $spath