#!/bin/bash

# Function to echo with a delay
echo_with_delay() {
    echo -e "$1"
    sleep 1.5
}

# Warning message with delay
echo_with_delay "\nThis script will move all files and directories from subdirectories to the current directory."
echo_with_delay "It will then remove any empty subdirectories."

# Bold and red message for user confirmation
echo_with_delay $'\e[1;31m''\nDo you want to proceed? (Y/N)'$'\e[0m'
read answer

# Check user's response
if [ "$answer" != "Y" ] && [ "$answer" != "y" ]; then
    echo "Exiting..."
    exit 0
fi

# Move all files and directories from subdirectories to the current directory
find . -mindepth 2 -type f -exec mv -i {} . \;
find . -mindepth 2 -type d -exec mv -i {} . \;

# Remove empty subdirectories
find . -mindepth 1 -depth -type d -empty -exec rmdir {} +
