#!/usr/bin/env bash

# source: https://github.com/bensuperpc/scripts

if [[ "$EUID" = 0 ]]; then
    echo "(1) already root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "(2) correct password"
    else
        echo "(3) wrong password"
        exit 1
    fi
fi

#journalctl --disk-usage
sudo journalctl --vacuum-time=3d
echo "Clear journalctl: OK"

#du -h /var/lib/snapd/snaps
sudo find ~/.cache/ -type f -atime +3 -delete
echo "Clear cache: OK"

sudo find ~/Downloads/ -type f -atime +15 -delete || true
echo "Clear Downloads: OK"

sudo rm -rf ~/.local/share/Trash/*
echo "Clear Trash: OK"

sudo docker image prune -f || true
echo "Clear docker: OK"

echo "Clean: OK"
