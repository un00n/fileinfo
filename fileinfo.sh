#!/bin/bash

# Prompt the user for the file path
read -p "Enter the full path of the file: " path

# Check if the file or directory exists
if [[ -d "$path" ]] || [[ -f "$path" ]]; then
  # Get file type using the 'file' command and remove unnecessary path from output
  echo "File Type: $(file "$path" | tr -d "$path:")"

  # Get file information using 'stat' and format the output
  stat --printf='Name: %n\nSize: %s bytes\nOwner: %U\nPermissions: %a\nLast Modified: %y\n' "$path"
else
  # File or directory not found
  echo "File or directory does not exist."
fi
