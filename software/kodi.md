# Kodi

## Installing Kodi
Get Kodi from the apt repository. When using the lite version of Raspbian, this will download ~725MB of files.

```bash
sudo apt-get install kodi
```

## Add Kodi to systemd
Create the service file:
```bash
sudo nano /lib/systemd/system/kodi.service
```

Add the following content to the `kodi.service` file

```conf
[Unit]
Description = Kodi Media Center
After = remote-fs.target network-online.target
Wants = network-online.target
[Service]
User = pi
Group = pi
Type = simple
ExecStart = /usr/bin/kodi-standalone
Restart = on-abort
RestartSec = 5
[Install]
WantedBy = multi-user.target
```

## Test the service
Test to see if the service really works

```bash
sudo systemctl start kodi.service
```
## Add Kodi to startup
Enable the service to autostart at boot

```bash
sudo systemctl enable kodi.service
```
---
Reference
* https://github.com/graysky2/kodi-standalone-service/blob/master/init/kodi.service