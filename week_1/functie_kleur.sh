#!/bin/bash
# Functie:  Tonen van het argument in kleur
# Vergeet NIET te resetten of alles blijft gekleurd

reset='[0m'
rood='[0;31m'

function tooninkleur() {
    echo -e "\e$rood $1 \e$reset"
}

tooninkleur "hallo"
tooninkleur "tamelijk rood he"
