#!/bin/sh

if [ $# > 1 ] || [ $# == 1 ] ;
then
	if [ "$1" == "-r" ] || [ "$1" == "--random" ];
	then
		mac=$(echo "obase=16; $((RANDOM%239+16))" | bc)':'$(echo "obase=16; $((RANDOM%239+16))" | bc)':'$(echo "obase=16; $((RANDOM%239+16))" | bc)':'$(echo "obase=16; $((RANDOM%239+16))" | bc)':'$(echo "obase=16; $((RANDOM%239+16))" | bc)':'$(echo "obase=16; $((RANDOM%239+16))" | bc) ;
		echo $mac
		sudo ifconfig $2 ether $mac
		exit
	elif [ "$1" == "--help" ] || [ "$1" == "-h" ];
	then
		echo
		echo "Usage: macchanger [OPTIONS] interface"
		echo
		echo "-h, --help                     Print this help"
		echo "-r, --random                   Set fully random MAC"
		echo "-0, --original                 Set the original MAC"
		echo "-m, --mac XX:XX:XX:XX:XX:XX    Set the MAC XX:XX:XX:XX:XX:XX"
		echo
		exit 1
	elif [ "$1" == "-0" ] || [ "$1" == "--original" ];
	then
		#Change the value for your original MAC
		mac="ORIGINAL_MAC"
	elif [ "$1" == "-m" ] || [ "$1" == "--mac" ];
		then
			mac=$2
			sudo ifconfig $3 ether $mac
			exit
	else
		#Edit with the correct path of the script
		%PATH_TO_SCRIPT%/macchanger.sh -h
		exit
	fi
	
	sudo ifconfig $2 ether $mac
else
	echo "Usage: macchanger [OPTIONS] interface"
fi
