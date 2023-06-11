#!/bin/bash

# Path to the file to monitor
FILE_PATH="backend-deploy.yaml"

# Command to run when changes are detected
COMMAND_TO_RUN="kubectl apply -f backend-deploy.yaml"

# Get the initial modification timestamp of the file
LAST_MODIFIED=$(stat -c %Y "$FILE_PATH")

# Start an infinite loop to continuously monitor the file
while true; do
  # Get the current modification timestamp of the file
  CURRENT_MODIFIED=$(stat -c %Y "$FILE_PATH")

  # Compare the current and last modified timestamps
  if [[ $CURRENT_MODIFIED -gt $LAST_MODIFIED ]]; then
    echo "Changes detected in $FILE_PATH"
    echo "Running command: $COMMAND_TO_RUN"
    # Run the command
    eval "$COMMAND_TO_RUN"
    # Update the last modified timestamp
    LAST_MODIFIED=$CURRENT_MODIFIED
  fi

  # Sleep for a specified interval before checking again
  sleep 1
done