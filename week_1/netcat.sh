#!/bin/bash

# Functie:  Lorum ipsum dolor sit et amet 
#           dolor sit et amet

[[ $(id -u) -ne 0 ]] && { echo "Error: Dit script moet als root uitgevoerd worden"; exit 1; }

function test() {
    [[ -x "$(command -v nc)"  ]] || { echo "Error: netcat dient geïnstalleerd te zijn"; exit 1; }
    nc -l 13 &
}

test

for i in {1..100}; do
    lsof -nPi tcp:$i | grep -i "listen"
done

kill $!
