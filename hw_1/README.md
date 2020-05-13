#### Description
This is the description of the 1-th. In this task is's needed to build 
a vagrant box with Centos 7.7 and the 5-th version of the kernel.
To do this howework I used ```Ubuntu 16.04.5 LTS```.

#### Build
To build a vagrant box for next running, read 
[here](https://github.com/pik94/otus_linux_administrator/hw_1/manual/manual.md). 
If a mirror with CentOS 7.7 is unavailable, try to search for in that 
[links](http://isoredirect.centos.org/centos/7/isos/x86_64/) 
(don't forget that you need the 7.7 version).

#### Running
Clone this repository:
```shell script
git clone https://github.com/pik94/otus_linux_administrator.git
```
After that go to the ```hw_1``` directory and type:
```shell script
vagrant up
```
Next, connect to the running machine printing:
```shell script
vagrant ssh
```
To ensure that you are using a correct kernel, type inside the box:
```shell script
uname -r
```
If you ```5.6.10-1.el7.elrepo.x86_64``` in the output, it's all correct.