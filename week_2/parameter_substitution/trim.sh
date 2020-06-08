#!/bin/bash
# Functie: Remove gedeelte string voor / achteraan
# Greedy (langste match) en ungreedy (kortste match)

url="http://www.kdg.be/index.html"
echo "Remove non-greedy *. from beginning: ${url#*.}"
echo "Remove greedy *. from beginning: ${url##*.}"
echo "Remove non-greedy .* from end: ${url%.*}"
echo "Remove greedy .* from end: ${url%%.*}"