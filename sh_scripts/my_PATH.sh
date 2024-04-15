#!/bin/bash

echo -e "Script location: /home/jalux/.local/bin/my_PATH.sh \n"

echo -e "Your PATH contains: \n"
echo "$PATH" | tr ':' '\n'
echo -e "\n"

if [ "$1" = "u" ] || [ "$1" = "U" ]; then
        echo "Chose to update"
else
        exit 1
fi

echo "sudo apt update:"   
sudo apt update

echo -e "\napt list --upgradable:"   
apt list --upgradable
echo -e "\n"

read -rp "Do you want to upgrade? [y/n]: " first_choice

if [ "$first_choice" = "y" ] || [ "$first_choice" = "Y" ]; then
        echo "You chose to continue."
        echo "sudo apt upgrade:"
        sudo apt upgrade
else
        echo "You chose to exit."
fi
