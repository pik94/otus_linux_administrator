#!/bin/bash

# This provision remove the temporary LVM devices.

echo "Remove old lvm devices..."
lvremove -y /dev/vg_root/lv_root
vgremove /dev/vg_root
pvremove /dev/sdb
