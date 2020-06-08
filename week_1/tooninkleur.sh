#!/bin/bash
# Functie:  Lorum ipsum dolor sit et amet 
#           dolor sit et amet

function tooninkleur() {
    local reset='[0m'
    local rood='[0;31m'
    echo -e "\e$rood $1 \e$reset"
}

resultaat=$(tooninkleur "ok")
echo "$resultaat"
