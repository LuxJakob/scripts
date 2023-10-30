#!/usr/bin/env bash

# source: https://askubuntu.com/a/377561/971804

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

if (( $# == 2 )); then
    sudo umount "$2" || true
    sudo dd bs=4M if="$1" of="$2" conv=fdatasync status=progress
else
    echo "Usage: ${0##*/} <iso path> <device path (USB ...)>"
    exit 1
fi
