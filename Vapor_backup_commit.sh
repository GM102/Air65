#!/bin/bash

# List of filename patterns to check
PATTERNS=("BTFL_cli_VAPOR-X5_*.txt" "BTFL_cli_backup_VAPOR-X5_*.txt")

for PATTERN in "${PATTERNS[@]}"; do
  # Find the first file matching the pattern
  SOURCE_FILE=$(find . -maxdepth 1 -type f -name "$PATTERN" | head -n 1)

  if [ -z "$SOURCE_FILE" ]; then
    echo "No file found for pattern '$PATTERN' — skipping."
    continue
  fi

  # Determine target file name based on pattern
  if [[ "$PATTERN" == "BTFL_cli_VAPOR-X5_"* ]]; then
    TARGET_FILE="BTFL_cli_VAPOR-X5.txt"
  elif [[ "$PATTERN" == "BTFL_cli_backup_VAPOR-X5_"* ]]; then
    TARGET_FILE="BTFL_cli_backup_VAPOR-X5.txt"
  else
    echo "Unknown pattern '$PATTERN' — skipping."
    continue
  fi

  echo "Renaming: $SOURCE_FILE → $TARGET_FILE"

  # Overwrite if the target file already exists
  [ -f "$TARGET_FILE" ] && rm -f "$TARGET_FILE"

  mv "$SOURCE_FILE" "$TARGET_FILE" || {
    echo "Failed to rename $SOURCE_FILE"
    exit 1
  }
done

echo "Done."    
