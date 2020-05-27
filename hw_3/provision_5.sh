#!/bin/bash

# This provision creates LVM snapshot.

touch /home/file{1..20}
lvcreate -L 100MB -s -n home_snap /dev/VolGroup00/LogVol_Home