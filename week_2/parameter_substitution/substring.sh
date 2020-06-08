#!/bin/bash

url="http://www.kdg.be/index.html"
echo ${url}

echo "Length = ${#url}"
echo "Starting from 7: ${url:7}"
echo "Starting from -4: ${url: -4}" # Of ${url:(-4)}
echo "Starting from 0 length 4: ${url:0:4}"
echo "Starting from 7 length 10: ${url:7:10}"