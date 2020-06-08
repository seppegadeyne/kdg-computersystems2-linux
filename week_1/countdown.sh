#!/bin/bash
# Functie:  Lorum ipsum dolor sit et amet 
#           dolor sit et amet

for ((i = 5; i > 0; i--)); do
    echo -ne "\r\033[O$i"
    sleep 1s
done
    
