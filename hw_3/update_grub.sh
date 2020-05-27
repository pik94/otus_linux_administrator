#!/usr/bin/bash
grub2-mkconfig -o /boot/grub2/grub.cfg
cd boot
for i in `ls initramfs-*img`; \
do \
  dracut -v $i `echo $i | sed "s/initramfs-//g;s/.img//g"` --force; \
done
if [ "$1" = "update_grub_config" ]
then
  sed -i 's/rd.lvm.lv=VolGroup00\/LogVol00/rd.lvm.lv=vg_root\/lv_root/g' \
    /boot/grub2/grub.cfg
  echo "Reboot the machine"
fi