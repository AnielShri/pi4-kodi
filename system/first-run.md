# First Run

## Update system
Update system to get the latest firmware/software. Since this is the first time, it might take a while to finish. Please be patient.

```bash
sudo apt-get update
sudo apt-get upgrade
```

## Disable bluetooth services

```shell
sudo systemctl disable hciuart.service
sudo systemctl disable bluealsa.service
sudo systemctl disable bluetooth.service
sudo systemctl disable bluetooth
```

## Disable avahi
The Pi is going to use simple uni-cast DNS - multi-cast. DNS support is not required.

```shell
systemctl disable avahi-daemon
```

## Disable TriggerHappy
The Pi isn't being used with button. Disable the TriggerHappy daemon (not that it is a init.d service)

```
systemctl disable triggerhappy
```

## Disable Serial UART
Edit the `/boot/config.txt` when serial uart is not longer needed. 

```conf
enable_uart=0
```
## Set GPU Memory to 512MB
A larget GPU memory pool can result in smoother video playback.

Run the `raspi-config` and choose `7. Advanced Options` -> `A3. Memory Split` and enter `512`. Reboot when promted.

---
### References
* https://plone.lucidsolutions.co.nz/hardware/raspberry-pi/3/disable-unwanted-raspbian-services
* https://raspberrypi.stackexchange.com/a/106617