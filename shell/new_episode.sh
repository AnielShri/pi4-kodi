#!/bin/bash

echo " "
echo "+----------------------------------------------------------------------+"
echo " "
echo " Downloading latest episode"
echo " "
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
			echo ${msg}
		done
		echo " "
	fi

	echo "+----------------------------------------------------------------------+"
	echo " "
	exit
}


#--- variables ---------------------------------------------------------------#
# url_template="https://v1.4animu.me/Seraph-of-the-End-S2/Seraph-of-the-End-S2-Episode-%02d-1080p.mp4"
url_template="https://v6.4animu.me/Overlord-II/Overlord-II-Episode-%d-1080p.mp4"
file_regexp="-([0-9]{1})-"


#--- check last local episode
# -- don't know where I got this from, but a alternative explenation can be found here:
# -- https://mywiki.wooledge.org/ParsingLs
# -- https://www.cyberciti.biz/faq/finding-bash-shell-array-length-elements/
#shopt -s nullglob #  empty directory won't give you a literal '*'
#local_files=( *.mp4 ) 
local_files=$(ls *.mp4 -v1) # considered a bad idea, but I'm not sure what the alternative is
local_files=$(ls *.mp4 -v1)
num_videos=${#local_files[@]}
last_episode=${local_files[${num_videos}-1]}

if [[ ${last_episode} =~ ${file_regexp} ]]; then
	regexp_result=${BASH_REMATCH[1]}
elif [[ ${num_videos} -eq 0 ]]; then
	regexp_result=0
else
	echo "${last_episode}"
	exit_script "Last episode filename dit not match expected naming convention!"
fi

next_episode=$((${regexp_result} + 1))
# next_episode=5
episode_url=$(printf ${url_template} ${next_episode})



# debug_print ----------------------------------------------------------------#
echo "Number of videos: ${num_videos}"
echo "last_episode: ${last_episode}"
echo "Regular expression result: ${regexp_result}"
echo "Next episode: ${next_episode}"
echo "URL: ${episode_url}"



#--- download if new episode available online --------------------------------#
#url="https://www.gnu.org/software/wget/manual/wget.html#Exit-Status"
wget ${episode_url}

wget_status=$?

if [[ ${wget_status} -gt 0 ]]; then
	exit_script "An error occured while downloading latest script" "Error code: ${wget_status}"
else
	exit_script "Download succesful!"
fi


#--- exit
exit_script "Last line" "Exit script..."