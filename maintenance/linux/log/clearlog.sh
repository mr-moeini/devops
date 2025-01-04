#!/bin/bash

# Define the path to the MongoDB log directory
LOG_DIR="/var/log/"

# Define the number of days to keep logs
DAYS_TO_KEEP=10

# Find and delete log files older than the defined number of days
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;

# Output a message for confirmation
echo "log files older than $DAYS_TO_KEEP days have been cleared."

# Optional: Add this script to your crontab for periodic execution
# Example: To run this script daily at midnight, add the following line to your crontab
# 0 0 * * * /path/to/clearlog.sh