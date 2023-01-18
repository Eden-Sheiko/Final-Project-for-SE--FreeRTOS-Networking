#!/bin/bash

# Change into the folder
cd client_files

# Set the base file name and the number of files
BASE_NAME=./packet
NUM_FILES=50

# Set the TFTP server address
TFTP_SERVER=192.168.001.002

# Set the interval between sends (in milliseconds)
INTERVAL=100

# Initialize the counter variable
COUNTER=1

while true; do
  # Construct the file name by appending the counter value to the base name
  FILE=$BASE_NAME$COUNTER.txt

  # Use the `tftp` command to send the file to the TFTP server
  tftp -vl $TFTP_SERVER -c put $FILE

  # Increment the counter
  COUNTER=$((COUNTER + 1))

  # If the counter has reached the maximum number of files, reset it to 1
  if [ $COUNTER -gt $NUM_FILES ]; then
    COUNTER=1
  fi

  # Sleep for the specified interval before sending the next file
  sleep $(($INTERVAL / 1000))
done
