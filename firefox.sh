#!/bin/bash
x=1
sudo apt update && sudo apt upgrade -y
while [ $x -le 15 ];
        do
                firefox-esr --private-window https://fsind.tecjobs.net
                x=$(($x +1 ))
done


sudo reboot