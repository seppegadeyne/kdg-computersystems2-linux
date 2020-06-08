#!/bin/bash
#Functie: Zoeken naar grote bestanden, default > 1 MB
# Args:Arg $1 MAG meegegeven worden
# Als $1 leeg is, krijgt het een default waarde

default_waarde="10"
size=${1:-$default_waarde} # of ${1:-10}
find . -name "*" -size "+${size}M"