#!/usr/bin/bash
echo "Create RAID"
mdadm --create --verbose /dev/md/raid10 --level=10 --raid-devices=4 \
/dev/sdb /dev/sdc /dev/sdd /dev/sde