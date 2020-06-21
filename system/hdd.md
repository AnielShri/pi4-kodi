# Connecting HDD to system
To automount an USB-connected HDD, several steps are required.

## Create mount folder
Create a destination folder for the HDD.

```shell
sudo mkdir /media/hdd
```
## Check if HDD is connected to system
```shell
lsblk
```
or
```shell
df -h
```
## Mount HDD 
Manually mount the HDD for the initial test.

```shell
sudo mount /dev/sdXN /media/hdd
```

* where `X` is the device letter in the `lsblk` output
* and `N` is the mount partition

eg

```shell
pi@raspberrypi:~ $ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0 931.5G  0 disk
└─sda1        8:1    0 931.5G  0 part 
mmcblk0     179:0    0   7.4G  0 disk
├─mmcblk0p1 179:1    0   256M  0 part /boot
└─mmcblk0p2 179:2    0   7.2G  0 part /

pi@raspberrypi:~ $ sudo mount /dev/sda1 /media/hdd

pi@raspberrypi:~ $ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0 931.5G  0 disk
└─sda1        8:1    0 931.5G  0 part /media/hdd
mmcblk0     179:0    0   7.4G  0 disk
├─mmcblk0p1 179:1    0   256M  0 part /boot
└─mmcblk0p2 179:2    0   7.2G  0 part /
```

## Automatically mount HDD
Once it is verified that the HDD can be mounted and accessed, it's time to automate the mounting, so that it is available after boot.

1. First get the UUID of the HDD

```bash
sudo blkid
```

2. Edit the fstab configuration

```bash
sudo nano /etc/fstab
```

3. Add the line below to automount the HDD, the `defaults` options are `rw, suid, dev, exec, auto, nouser, async`. These are complemented with `noatime, nodiratime` to reduce HDD stress. The `nofail` allows booting without the HDD connected.

```bash
UUID=2b566964-1880-4097-931a-4bf32f45ed7e       /media/hdd      ext4    defaults,noatime,nodiratime,nofail     0	0
```

---
### References
* https://help.ubuntu.com/community/Fstab
* https://www.man7.org/linux/man-pages/man5/fstab.5.html
* https://linux.die.net/man/8/mount