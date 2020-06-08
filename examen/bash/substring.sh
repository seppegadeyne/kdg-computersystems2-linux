#!/bin/bash
# Function:       Geeft de positie (te beginnen bij 0) van het eerste voorkomen
#                 van de substring in de string en schrijft deze naar het scherm.
#                 Indien de substring niet voorkomt wordt er -1 weergegeven.
# Arguments:      Arg1 is een string, arg2 is een substring
# Author:         seppe.gadeyne@student.kdg.be
# Copyright:      2020, seppe.gadeyne@student.kdg.be
# Version:        0.0.1
# Requires:       Bash shell

[[ $# -ne 2 || "$1" = "--help" ]] && {
  echo "Usage: $(basename "$0") arg1 arg2" >&2
  echo "Example: $(basename "$0") \"abcd\" \"cd\"" >&2
  exit 1
}

regex="^${2}+"

for ((i = 0; i < ${#1}; i++)); do
  [[ ${1:$i} =~ $regex ]] && { echo "$i"; exit 0; }
done

echo "-1" >&2; exit 1;