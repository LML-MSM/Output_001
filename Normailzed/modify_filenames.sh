#!/bin/bash

# Directory to process (change this to your target directory)
TARGET_DIR="./"

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR does not exist."
  exit 1
fi

# Function to rename files and folders
rename_spaces() {
  local path="$1"
  # Rename folders and files
  find "$path" -depth -name "* *" | while read -r file; do
    # Replace spaces with underscores
    new_name=$(dirname "$file")/$(basename "$file" | tr ' ' '_')
    # Rename the file or folder
    mv "$file" "$new_name"
    echo "Renamed: $file -> $new_name"
  done
}

# Run the function
rename_spaces "$TARGET_DIR"

echo "All spaces in folder and file names have been replaced with underscores."