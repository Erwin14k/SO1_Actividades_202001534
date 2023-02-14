#!/bin/bash

# Read the GITHUB_USER variable from user input, and check that it's not empty
read -p "Enter GitHub username: " GITHUB_USER
if [[ -z "$GITHUB_USER" ]]; then
    echo "Error: GitHub username is required."
    exit 1
fi

# Query the GitHub webservice API for user data
URL="https://api.github.com/users/$GITHUB_USER"
JSON=$(curl -s "$URL")

# Extract user data from the returned JSON
ID=$(echo "$JSON" | grep -Eo '"id": [0-9]*' | cut -d' ' -f3)
CREATED_AT=$(echo "$JSON" | grep -Eo '"created_at": "[^"]*"' | cut -d'"' -f4)

# Print a greeting message with user data
echo "Hello $GITHUB_USER. User ID: $ID. Account created on: $CREATED_AT."

# Create a log file in /tmp/<date>/greetings.log with the greeting message
DATE=$(date +"%Y-%m-%d")
LOG_DIR="/tmp/$DATE"
LOG_FILE="$LOG_DIR/greetings.log"
mkdir -p "$LOG_DIR"
echo "$(date +"%Y-%m-%d %H:%M:%S") - Hello $GITHUB_USER. User ID: $ID. Account created on: $CREATED_AT." >> "$LOG_FILE"
