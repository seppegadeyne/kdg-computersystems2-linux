#!/bin/bash
# Function: remove whitespaces from filenames

! [[ -d "$1" ]] && { echo "Usage: $(basename "$0") DIRECTORY"; exit 1; }
for i in "${1/%\//}"/*; do
    [[ -f "$i" ]] && mv -u "$i" "${i// /_}" 2>/dev/null
    echo "${i// /_}"
done
