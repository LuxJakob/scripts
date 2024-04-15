#!/bin/bash

echo "Your frog waits for Wednesday!"
wednesday=""
if [ "$(date +%A)" = "Wednesday" ]; then
    wednesday=" - It Is Wednesday My Dudes!"
fi

echo "- $(date)$wednesday" >> ../frog.md
