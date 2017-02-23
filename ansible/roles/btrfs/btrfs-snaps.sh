#!/bin/bash

# By Marc MERLIN <marc_soft@merlins.org>
# License Apache 2.0.

# This lets you create sets of snapshots at any interval (I use hourly,
# daily, and weekly) and delete the older ones automatically.

# Usage:
# This is called from /etc/cron.d like so:
# GREPOUT="(Create a snapshot of|Will delete the oldest|Delete subvolume|Making snapshot of )"
# 0 * * * * root cd /mnt/btrfs_pool1 && btrfs-snaps hourly 3 | grep -Ev "$GREPOUT"
# 1 0 * * * root cd /mnt/btrfs_pool1 && btrfs-snaps daily  4 | grep -Ev "$GREPOUT"
# 2 0 * * 0 root cd /mnt/btrfs_pool1 && btrfs-snaps weekly 4 | grep -Ev "$GREPOUT"

BTRFSROOT=/data/alldata
DIR_SNAPHOSTS=/data/snapshots
DATE="$(date '+%Y%m%d_%H:%M:%S')"

type=${1:-hourly}
keep=${2:-3}
shift
shift

cd "${BTRFSROOT:-.}"

if [[ -n "$@" ]]; then
    echo "1"
    subvolumes="$@"
else
    echo "2"
    subvolumes=$(btrfs subvolume list -q $BTRFSROOT | grep "parent_uuid -" | awk '{print $11}' | grep -Ev '_(hourly|daily|weekly)_')
fi

for i in $subvolumes
do
    # Skip duplicate dirs once a year on DST 1h rewind.
    test -d "${i}_${type}_$DATE" && continue
    echo "Making snapshot of type $type, $i"
    #btrfs subvolume snapshot "$i" "${DIR_SNAPHOSTS}/${i}_${type}.$DATE"
    #count="$(ls -d ${i}_${type}.* | wc -l)"
    #clip=$(( $count - $keep ))
    #if [ $clip -gt 0 ]; then
    #    echo "Will delete the oldest $clip snapshots for $type"
    #    for sub in $(ls -d ${i}_${type}.* | head -n $clip)
    #    do
    #        #echo "Will delete $sub"
    #        btrfs subvolume delete "$sub" | grep -v 'Transaction commit:'
    #    done
    #fi
done

