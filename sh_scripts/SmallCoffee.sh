#!/bin/sh

# Load the necessary libraries for sending keys
xdotool type "Du! This is your sh coffee time!"

# Define the target time
targettime=$(date -d '22:00' +%s)

# Generate a random sleep time between 30 and 170 seconds
RNDSleep=$(shuf -i 30-170 -n 1)

# Clear the screen
clear
echo "It's time for a small coffee!"

while true; do
    now=$(date +%s)

    # Check if the current time is greater or equal to the target time
    if [ "$now" -ge "$targettime" ]; then
        break
    fi

    # Sleep for a random amount of time
    sleep "$RNDSleep"

    # Send the F13 keypress
    xdotool key F13

    # Display the current time
    echo "Key pressed at $(date)"
done

# End of the script
echo "Coffee time is over!"
