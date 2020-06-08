#!/bin/bash
# Functie: Toont versie van Ubuntu

versie=$(lsb_release -r | cut -f 2)
echo "Dit toestel draait Ubuntu versie ${versie}"
