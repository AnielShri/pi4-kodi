# Aria2c
Downloading media (http and torrents) is done using `aria2c`. 


## Installation
Install `aria2c` from the debian repository:

```bash
sudo apt-get install aria2
```

## Web-UI
Since `aria2c` does not come with a UI, a 3rd-party ui is added. Download it here:

```bash
cd ~
aria2c https://github.com/ziahamza/webui-aria2/archive/master.zip
```

Unzip it in the home directory
```bash
cd ~
unzip webui-aria2-master.zip
mv ~/webui-aria2-master/docs ~/webui-aria2c
rm -r ~/webui-aria2-master/
rm -r 
```

## Install HTTP server
The web-ui requires a http server. The server only needs to serve up static pages (all dynamic stuff is done client side through js), so `darkhttpd` can do the job.

Get the source: 
```bash
aria2c https://unix4lyfe.org/gitweb/darkhttpd/blob_plain/HEAD:/darkhttpd.c -d ~/scripts
```

Build the binary:
```bash
cd ~/scripts
cc -Wall -O2 darkhttpd.c -o darkhttpd
```

## Add configuration files
Create a configuration file for `aria2c`.

```bash
touch ~/scripts/aria2.session
nano ~/scripts/aria2.conf
```

Add these settings and adjust as needed

```conf
# change this to reflect your configuration
dir=/media/hdd/transmission/

# adjust as needed
max-overall-upload-limit=1M
max-upload-limit=500K
max-concurrent-downloads=5
seed-time=5
seed-ratio=0.1

# for web-ui
enable-rpc=true
rpc-listen-all=true

# auto-save session info
input-file=./aria2.session
save-session=./aria2.session
save-session-interval=300

summary-interval=0
```

## Create Launch script
Add the bash script:
```bash
touch ~/scripts/launch_aria2.sh
chmod +x ~/scripts/launch_aria2.sh
nano ~/scripts/launch_aria2.sh
```

Add content to the script:
```bash
#!/bin/bash

# only launch if needed
if [[ $(pidof aria2c) ]]; then
	echo "aria2c already running"
else
	echo "Launching aria2c"
	aria2c --enable-rpc --rpc-listen-all --quiet --conf-path=./aria2.conf &
fi

echo "pausing for 2 seconds"
sleep 2

# assume one instance of the wekserver
if [[ $(pidof darkhttpd) ]]; then
	echo "darkhttpd already running"
else
	echo "Launching darkhttpd"
	# nodejs --no-warnings ../webui-aria2/node-server.js
	./darkhttpd ../webui-aria2c/ --port 8000 --daemon
fi

echo "finished!"
```

## Launch Aria (+UI)
Launch the script from the `scripts` folder

```bash
cd ~/scripts
./launch_aria2.sh
```

## Access Aria2c
To access `aria2c`, open a browser and go to:
```
http://<raspberry_ip>:8000
```