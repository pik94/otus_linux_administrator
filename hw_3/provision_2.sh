#!/bin/bash

# This provision reduce a size of device there the previous root was and
# move tmp root back this device.
# Also /var is moved to another device.

lvremove -y /dev/VolGroup00/LogVol00
lvcreate -y -n VolGroup00/LogVol00 -L 8G /dev/VolGroup00
mkfs.xfs /dev/VolGroup00/LogVol00
mount /dev/VolGroup00/LogVol00 /mnt
xfsdump -J - /dev/vg_root/lv_root | xfsrestore -J - /mnt
for i in /proc/ /sys/ /dev/ /run/ /boot/; \
do \
  mount --bind $i /mnt/$i; \
done
cp /vagrant/update_grub.sh /mnt
chroot /mnt /bin/bash -c "./update_grub.sh"
cp /vagrant/move_var.sh /mnt
chroot /mnt /bin/bash -c "chmod +x move_var.sh && ./move_var.sh"