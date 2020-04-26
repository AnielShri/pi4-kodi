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
