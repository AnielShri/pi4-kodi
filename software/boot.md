# Optimize boot time

## Get an overview of loading times
Use `systemd-analyze`, `systemd-analyze blame` and `systemd-analyze critical-chain` to investigate which services take up the most time while loading. 

## Disable unnecessary services

```bash
sudo systemctl disable x.service
```
Where `x` is the service name.



---
### References
* https://raspberrypi.stackexchange.com/questions/78099/how-can-i-lower-my-boot-time-more
* https://www.freedesktop.org/software/systemd/man/systemd-analyze.html
* https://serverfault.com/questions/617398/is-there-a-way-to-see-the-execution-tree-of-systemd
* https://elinux.org/images/6/64/Chris-simmonds-boot-time-elce-2017_0.pdf
* http://himeshp.blogspot.com/2018/08/fast-boot-with-raspberry-pi.html