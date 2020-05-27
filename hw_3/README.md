#### Description
This is the description of the third homework. In this task is's needed to use 
LVM for size reducing of `/root` directory, moving `/var` and `/home` to another LVM device and
creating a LVM snapshot for `/home`.
To do this homework I used ```Ubuntu 16.04.5 LTS```.

#### Build a machine
Clone this repository:
```shell script
git clone https://github.com/pik94/otus_linux_administrator.git
```
After that go to the ```hw_3``` directory.
There are used 5 provisions to prepare machine with the given requirements.

1. Move `/root` to a temporary created LVM device. To do it type:
    ```shell script
    vagrant up --provision-with provision_1
    ```

2. Reduce size of the old LVM `/root` device and move `/var` to another LVM 
device. Write in the console:
    ```shell script
    vagrant reload --provision-with provision_2
    ```

3. Clean and delete the temporary LVM devices, move `/home` and create 
a snapshot for `/home`:
    ```shell script
    vagrant reload --provision-with provision_3,provision_4,provision_5
    ```

#### Running the machine
To check that all provisions are applied, connect to the machine using:
```shell script
vagrant ssh
```
Type in the console `lsblk` to see the structure of the devices. If you see
```shell script
NAME                            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                               8:0    0   40G  0 disk 
├─sda1                            8:1    0    1M  0 part 
├─sda2                            8:2    0    1G  0 part /boot
└─sda3                            8:3    0   39G  0 part 
  ├─VolGroup00-LogVol00         253:0    0    8G  0 lvm  /
  ├─VolGroup00-LogVol01         253:1    0  1.5G  0 lvm  [SWAP]
  ├─VolGroup00-LogVol_Home-real 253:8    0    2G  0 lvm  
  │ ├─VolGroup00-LogVol_Home    253:7    0    2G  0 lvm  /home
  │ └─VolGroup00-home_snap      253:10   0    2G  0 lvm  
  └─VolGroup00-home_snap-cow    253:9    0  128M  0 lvm  
    └─VolGroup00-home_snap      253:10   0    2G  0 lvm  
sdb                               8:16   0   10G  0 disk 
sdc                               8:32   0    2G  0 disk 
├─vg_var-lv_var_rmeta_0         253:2    0    4M  0 lvm  
│ └─vg_var-lv_var               253:6    0  952M  0 lvm  /var
└─vg_var-lv_var_rimage_0        253:3    0  952M  0 lvm  
  └─vg_var-lv_var               253:6    0  952M  0 lvm  /var
sdd                               8:48   0    1G  0 disk 
├─vg_var-lv_var_rmeta_1         253:4    0    4M  0 lvm  
│ └─vg_var-lv_var               253:6    0  952M  0 lvm  /var
└─vg_var-lv_var_rimage_1        253:5    0  952M  0 lvm  
  └─vg_var-lv_var               253:6    0  952M  0 lvm  /var
sde                               8:64   0    1G  0 disk 
```
that means, it's all correct.
Also, you can check that the snapshot works:
```shell script
cd /
sudo su
rm -f /home/file{11..20}
ls /home
```
As you can see, all file containing 11, 12, ..., 20 are removed. To restore 
them, type:
```shell script
umount /home
lvconvert --merge /dev/VolGroup00/home_snap
mount /home
ls /home
```
Removed files should be recovered.