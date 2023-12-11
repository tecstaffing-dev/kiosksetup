#!/bin/bash
#################################
##########Check if Root##########
#################################
if [ -z ${1+x} ];
then
echo "parameters are required for this program... refer to README file"

else

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root exiting...' >&2
        exit 1
fi

#Change Hostname
old=$(cat /etc/hostname)
new=$(tr -dc 'A-Z0-9' < /dev/urandom | head -c12)
sed -i "s/$old/$new/g" /etc/hosts
sed -i "s/$old/$new/g" /etc/hostname
hostname "$new"
# set keymap to US
localectl set-keymap us
# set timezone to America/Chicago
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
apt update && apt upgrade -y
apt install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox -y
apt install --no-install-recommends firefox-esr tint2 -y
apt autoremove -y
# backup original autostart file
mv /etc/xdg/openbox/autostart /etc/xdg/openbox/autostart.bak
# copy customized autostart file from host
curl -o /etc/xdg/openbox/autostart http://192.168.1.165/autostart
echo "[[ -z \$DISPLAY && \$XDG_VTNR -eq 1 ]] && startx --" > /home/pi/.bash_profile
chown -R pi:pi /home/pi/.bash_profile
echo "Script is complete... rebooting in 10 seconds."
sleep 10
reboot
fi