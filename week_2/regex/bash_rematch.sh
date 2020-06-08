#!/bin/bash
# Function: example of bash_rematch
# ${BASH_REMATCH[0]} is an array with the results of the match.
# Index 0 is the whole match.

content="KdG-Hogeschool, Nationalestraat 5, B-2000 Antwerpen"
regex="([[:alpha:]]+-[a-zA-Z]+), ([[:alpha:]]+) ([[:digit:]]+), (.*) (.*)"

[[ $content =~ $regex ]]
echo "${BASH_REMATCH[0]}"
echo "${BASH_REMATCH[1]}"
echo "${BASH_REMATCH[2]}"
echo "${BASH_REMATCH[3]}"
echo "${BASH_REMATCH[4]}"
echo "${BASH_REMATCH[5]}"
