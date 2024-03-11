#!/bin/bash

# Start the index JSON file
index="{"

# Loop through all subdirectories
for dir in */; do
  # Remove the trailing slash from the directory name
  dir=${dir%?}

  # Find all JSON files in the directory
  json_files=$(find "$dir" -name '*.json')

  # Add the directory name and JSON files to the index
  index+="\"$dir\": ["
  first=true
  for file in $json_files; do
    if $first; then
      first=false
    else
      index+=", "
    fi
    index+="{\"file\":\"$file\"}"
  done
  index+="]"
done

# End the index JSON file
index+="}"

# Print the index JSON file
echo $index

# Save the index JSON file to a file
echo $index > index.json