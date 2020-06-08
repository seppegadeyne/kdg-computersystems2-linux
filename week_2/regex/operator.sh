#!/bin/bash
# Function: example of regex operator
# Note: never use $regex with double quotes here

content="KdG-Hogeschool, Nationalestraat 5, B-2000 Antwerpen"
regex="B-[0-9]{4}"

if [[ $content =~ $regex ]]; then
  echo "Found postal code"; exit 0;
else
  echo "Postal code not found" >&2; exit 1;
fi

