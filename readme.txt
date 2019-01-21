#completely remove
sudo apt remove lirc && sudo apt remove --auto-remove lirc
sudo apt purge lirc && sudo apt purge --auto-remove lirc

#autoremove && autoclean
sudo apt autoremove && sudo apt autoclean

#update && upgrade
sudo apt update && sudo apt upgrade

#install ir-keytable
sudo apt install ir-keytable

#Check if your ir is supportded by ir-keytable. Most common protocol are nec,rc-6 (use other if this does't work for you "Supported protocols: other lirc rc-5 rc-5-sz jvc sony nec sanyo mce_kbd rc-6 sharp xmp") 
sudo ir-keytable

#Keymap our remote control keystrokes (scancode = 0x77e190e6 the hex code is the code we need) take notes the keystrokes by pressing one by one the keys you need to map
sudo ir-keytable -t

#Copy your config's to /etc/rc_keymaps/ for nautilus use on terminal "sudo nautilus" or
sudo cp etc/rc_keymaps/* /etc/rc_keymaps/

#Clean your driver from previous tables
sudo ir-keytable -c

#Write the config (apple_a1156,avermedia_rm-ks) to the driver for the chips (most common protocol are nec,rc-6)
sudo ir-keytable -p nec,rc-6 -w /etc/rc_keymaps/apple_a1156
sudo ir-keytable -p nec,rc-6 -w /etc/rc_keymaps/avermedia_rm-ks

#Copy your script's to /etc/init.d/ for nautilus use on terminal "sudo nautilus" or
sudo cp etc/init.d/* /etc/init.d/

#Make the script executable or ("sudo chmod 755 /etc/init.d/script_keymap_config")
sudo chmod a+x /etc/init.d/script_keymap_config

#The 99 means script gets sequence number 99 at boot, the range starts on 1 and goes till 99, most boot scripts have smaller numbers
sudo update-rc.d script_keymap_config defaults 99

# Edit the existing /etc/rc_maps.cfg to load your config in kernel on every boot... Dont forget to check permissions of the rc_maps.cfg must be 644 rc_maps.cfg (With "stat -c "%a %n" /etc/rc_maps.cfg"  ) or #rw-r--r-- 1 root root 6649 Νοε  28 16:01 rc_maps.cfg (With "ls -l /etc/rc_maps.cfg") You can set permissions to the correct one with "sudo chmod 644 /etc/rc_maps.cfg"  http://permissions-calculator.org/

# # Add your Driver (use * for any) | Table (find it from "sudo ir-keytable" | File put yours in (/etc/rc_keymaps)
#*       rc-rc6-mce               apple_a1156  
#*       rc-rc6-mce               avermedia_rm-ks

#Dont forger to comment the existing default configuration to avoid confligs
#*	rc-rc6-mce               rc6_mce

cat <<EOT >> /etc/rc_maps.cfg
# Add your Driver (use * for any) | Table (find it from "sudo ir-keytable" | File put yours in (/etc/rc_keymaps)
*       rc-rc6-mce               apple_a1156
*       rc-rc6-mce               avermedia_rm-ks
EOT

#Finally it’s reboot time!
sudo reboot