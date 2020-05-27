#!/bin/bash

# This provision create temporary root on temporary LVM device and move all
# files there.

yum install -y xfsdump
pvcreate /dev/sdb
vgcreate vg_root /dev/sdb
lvcreate -n lv_root -l +100%FREE /dev/vg_root
mkfs.xfs /dev/vg_root/lv_root
mount /dev/vg_root/lv_root /mnt
xfsdump -J - /dev/VolGroup00/LogVol00 | xfsrestore -J - /mnt
for i in /proc/ /sys/ /dev/ /run/ /boot/; \
do \
  mount --bind $i /mnt/$i; \
done
cp /vagrant/update_grub.sh /mnt
chroot /mnt /bin/bash -c \
"chmod +x update_grub.sh && ./update_grub.sh update_grub_config"