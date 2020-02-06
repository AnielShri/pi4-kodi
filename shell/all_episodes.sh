#!/bin/bash

echo " "
echo "+----------------------------------------------------------------------+"
echo "Downloading all realeased episodes"
echo "+----------------------------------------------------------------------+"
echo " "

#--- exit --------------------------------------------------------------------#
function exit_script()
{
	echo " " # newline

	if [ ${#} -gt 0 ]; then
		echo "+----------------------------------------------------------------------+"
		echo " "
		for msg in "${@}"; do
			echo "${msg}"
		done
		echo " "
	fi

	echo "+----------------------------------------------------------------------+"
	echo " "
	exit
}


#--- variables ---------------------------------------------------------------#
url_template="https://v6.4animu.me/Overlord-III/Overlord-III-Episode-%02d-1080p.mp4"

#--- (in)finite download loop ------------------------------------------------#
exit_code=0
next_episode=1


while [[ exit_code -eq 0 ]]
do
	
	echo "next_episode: ${next_episode}"
	episode_url=$(printf ${url_template} ${next_episode})
	echo "URL: ${episode_url}"
	wget "${episode_url}"

	exit_code=$?
	next_episode=$((next_episode + 1))

done

echo "Finished with code ${exit_code}"