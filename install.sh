#!/bin/bash
printf "\033c"
sleep 1
echo "Ir Controler for Ubuntu by nikkpap @ 2018"
echo ""
echo "Using ir-keytable without LIRC"
echo ""
echo ""
echo "" 
echo "" 
sleep 5

if read -r -s -n 1 -t 5 -p "Press any key to install it:" key #key in a sense has no use at all
then
echo ""
sleep 1
printf "\033c"
sudo apt remove lirc -y && sudo apt remove --auto-remove lirc -y
sudo apt purge lirc -y && sudo apt purge --auto-remove lirc -y
sudo apt autoremove -y && sudo apt autoclean -y
sudo apt update && sudo apt upgrade
sudo apt install ir-keytable -y

sudo cp -vr etc/ /
sudo ir-keytable -c
sudo ir-keytable -p nec,rc-6 -w /etc/rc_keymaps/apple_a1156
sudo ir-keytable -p nec,rc-6 -w /etc/rc_keymaps/avermedia_rm-ks

#sudo chmod 755 /etc/init.d/script_keymap_config
#sudo chmod 644 /etc/rc_maps.cfg
#sudo update-rc.d script_keymap_config defaults 99

sudo chmod +x /etc/rc.local

sleep 5

if read -r -s -n 1 -t 5 -p "Press any key to abort reboot or wait to reboot:" key #key in a sense has no use at all
then
	echo ""
	sleep 1
    echo "You have to reboot to enable your remote control"
    sleep 5
    exit
else
    sudo reboot
fi

else
    exit
fi
