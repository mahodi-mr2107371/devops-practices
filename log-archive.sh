#!/bin/bash

# Check if log directory argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Verify directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Archive storage directory
ARCHIVE_DIR="./archives"

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_${TIMESTAMP}.tar.gz"

# Create compressed archive
tar -czf "$ARCHIVE_FILE" "$LOG_DIR"

# Check if archive was created successfully
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Archived $LOG_DIR -> $ARCHIVE_FILE" >> archive.log
    echo "Archive created: $ARCHIVE_FILE"
else
    echo "Archive creation failed."
    exit 1
fi