# Connecting HDD to system

## Create mount folder

	sudo mkdir /media/hdd

## Check if HDD is connected to system

	lsblk

or

	df -h

## Mount HDD 

	sudo mount /dev/sdXN /media/hdd

* where X is the device letter in the ***lsblk*** output
* and N is the mount partition

eg

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

## Automatically mount HDD
Once it is verified that the HDD can be mounted and accessed, it's time to aoutomate the mounting, so that it is available after boot.
