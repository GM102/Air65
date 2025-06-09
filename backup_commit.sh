#!/bin/bash


# Find the backup file matching the pattern
SOURCE_FILE=$(find . -maxdepth 1 -type f -name "BTFL_cli_backup_AIR65_*.txt" | head -n 1)

if [ -z "$SOURCE_FILE" ]; then
  echo "No file matching BTFL_cli_backup_AIR65_*.txt found"
  exit 1
fi

TARGET_FILE="BTFL_cli_backup_AIR65.txt"

# Overwrite the target file if it exists
if [ -f "$TARGET_FILE" ]; then
  echo "Overwriting existing $TARGET_FILE"
  rm -f "$TARGET_FILE"
fi

# Rename the file
mv "$SOURCE_FILE" "$TARGET_FILE" || exit 1

echo "Done: '$TARGET_FILE'"
