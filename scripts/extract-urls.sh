#!/bin/bash

# Check if README.md exists
if [ ! -f "README.md" ]; then
    echo "Error: README.md not found"
    exit 1
fi

# Extract humans.txt URLs from README.md
FOUND=false
while IFS= read -r line; do
    if [[ $line =~ \[.*\]\((https?://[^)]+/humans\.txt)\) ]]; then
        echo "${BASH_REMATCH[1]}"
        FOUND=true
    fi
done < README.md

# Check if any URLs were found
if [ "$FOUND" = false ]; then
    echo "No humans.txt URLs found in README.md"
    exit 1
fi 