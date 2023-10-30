#!/usr/bin/env bash

#hexdump -C -n 65536 

if (( $# == 1 )); then
    less -f /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | head -c"${1:-$1}"
else
    less -f /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | head -c"${1:-48}"
fi
