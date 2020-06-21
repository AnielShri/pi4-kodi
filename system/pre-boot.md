# Pre-Boot configurations
Nessasary actions to perform before booting the system.

## OS
These configuration files are based on [**Raspbian Buster Lite**](https://www.raspberrypi.org/downloads/raspbian/) (release date 220-05-27). 

## Enable SSH
Full instructions [here](https://www.raspberrypi.org/documentation/remote-access/ssh/).  
Place a file named `ssh` (no extension) in the `/boot` partition of the SD-Card

## Bluetooth
Full instructions [here](https://scribles.net/disabling-bluetooth-on-raspberry-pi/).  
Disable the overlay in `/boot/config.txt` by adding `dtoverlay=disable-bt`.  
There are [first-run](first-run.md) instructions to disable the services. Refer to the full instructions or [first-run](first-run.md) file for more info.

## Serial Console
Add `enable_uart=1` to the `/boot/config.txt` file.  
Communication over SSH should be good enough, so enabling the serial console is optional.

## WIFI
Full instructions [here](https://www.raspberrypi-spy.co.uk/2017/04/manually-setting-up-pi-wifi-using-wpa_supplicant-conf/).  
Create a file named `wpa_supplicant.conf` in the `/boot` partition of the SD-Card. Add the following text to the `wpa_supplicant.conf` file.

```conf
	country=nl
	update_config=1
	ctrl_interface=/var/run/wpa_supplicant

	network={
	scan_ssid=1
	ssid="MyNetworkSSID"
	psk="Pa55w0rd1234"
	}
```

