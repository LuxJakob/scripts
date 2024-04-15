#!/bin/bash

destination="$HOME/Documents/no-vault/WednesdayFrog.jpg"

if [ -z "$mail" ]; then
    echo "Enter your username:"
    read -r username
else
    username=$mail
fi

echo "Enter your password (will not be displayed):"
read -rs password

url="https://i.kym-cdn.com/entries/icons/original/000/020/016/wednesdaymydudeswide.jpg"

curl -u "$username:$password" -o "$destination" "$url"
echo -e "\n\n"
ls -la "$destination"

xdg-open "$destination"
