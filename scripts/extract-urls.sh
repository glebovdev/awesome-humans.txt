#!/bin/bash

if [ ! -f "README.md" ]; then
    echo "Error: README.md not found" >&2
    exit 1
fi

while IFS= read -r line; do
    if [[ $line =~ \[(.*)\]\((.*humans\.txt)\) ]]; then
        echo "${BASH_REMATCH[2]}"
    fi
done < README.md