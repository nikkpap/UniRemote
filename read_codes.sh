#!/bin/bash
printf "\033c"
sleep 1
echo "Ir Controler for Ubuntu by nikkpap @ 2018"
echo ""
echo "Read remote control codes or device specs"
echo ""
echo ""
echo "" 
echo "" 
sleep 5
printf "\033c"
sudo ir-keytable
echo ""
echo ""
echo ""
sleep 1
if read -r -s -n 1 -p "Press any key to read codes :" key #key in a sense has no use at all
	then
		echo "" 
		echo "" 
		gedit &
		sudo ir-keytable -t 
		echo ""
		echo ""
		echo ""
		sleep 1
	else 
		exit
fi

