#!/bin/bash

# Create the folder to hold the files
mkdir client_files

# Change into the folder
cd client_files

# Set the base file name
filename="packet"

# Loop through numbers 1 to 50
for i in {1..50}
do
  # Create the file name by appending the number to the base file name
  newfile="${filename}${i}.txt"

  # Generate the dep_num value
  dep_num=$((RANDOM % 4))

  # Generate the severity value
  severity=$((RANDOM % 3))

  # Generate the ev_num value
  ev_num=$i

  # Generate the padding sequence
  if [ $i -lt 10 ]
  then
    padding=$(printf '1%.0s' {1..83})
  else
    padding=$(printf '1%.0s' {1..82})
  fi

  # Write the sentence to the file
  echo -n "${dep_num}${severity}event ${ev_num} address${padding}" > "$newfile"
done
