#!/bin/bash
#Functie: Zoeken naar grote bestanden, default > 1 MB
# Args:Arg $1 MAG meegegeven worden
# Als $1 leeg is => einde met exti code 1

size=${1?"Usage: $(basename $0) ARGUMENT"}
# Het script gaat enkel verder wanneer $1 werd ingevuld
find . -name "*" -size "+${size}M"