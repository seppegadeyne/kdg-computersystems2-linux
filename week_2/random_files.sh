#!/bin/bash
# Function: write 10 random files to current directory

text=('lorum' 'ipsum' 'dolor' 'sit' 'et' 'amet')

for ((i = 0; i < 10; i++)); do
  touch "Dit is een random bestand $((RANDOM % 1000)).txt"
done

#echo "$RANDOM"
#echo "$((RANDOM % 6))"
#echo "$(((RANDOM % 10) +1))"