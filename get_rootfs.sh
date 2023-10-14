#!/bin/bash

# Set the directory to save the file
SAVE_DIR="$(pwd)"

# Get the URL of the latest timestamp directory
URL="https://images.linuxcontainers.org/images/debian/bookworm/amd64/default/"

# Get the latest timestamp directory
LATEST_FOLDER=$(curl -s $URL | grep -o 'href=".*"' | awk -F\" '{print $2}' | tail -n 1)

# Extract the date part from the folder name using awk
DATE_ONLY=$(echo $LATEST_FOLDER | awk -F "/" '{print $1}' | awk -F "_" '{print $1}')

# Save version into release.txt
echo $DATE_ONLY > release.txt

# Concatenate URL and filename
FILE_URL="${URL}${LATEST_FOLDER}rootfs.tar.xz"

# Download the latest rootfs.tar.xz file
curl -L -o "$SAVE_DIR/rootfs.tar.xz" $FILE_URL