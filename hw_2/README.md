#### Description
This is the description of the second homework. In this task is's needed to build 
a RAID array and create a config file for it..
To do this homework I used ```Ubuntu 16.04.5 LTS```.

#### Running
Clone this repository:
```shell script
git clone https://github.com/pik94/otus_linux_administrator.git
```
After that go to the ```hw_2``` directory and type:
```shell script
vagrant up
```
Next, connect to the running machine printing:
```shell script
vagrant ssh
```
To ensure that the RAID was built, type ```lsblk``` in the terminal. If you see
```shell script
NAME    MAJ:MIN RM  SIZE RO TYPE   MOUNTPOINT
sda       8:0    0   40G  0 disk   
`-sda1    8:1    0   40G  0 part   /
sdb       8:16   0  250M  0 disk   
`-md127   9:127  0  496M  0 raid10 
sdc       8:32   0  250M  0 disk   
`-md127   9:127  0  496M  0 raid10 
sdd       8:48   0  250M  0 disk   
`-md127   9:127  0  496M  0 raid10 
sde       8:64   0  250M  0 disk   
`-md127   9:127  0  496M  0 raid10 
sdf       8:80   0  250M  0 disk  
```
it means that it has been built correctly.