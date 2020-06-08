#!/bin/bash

input=$1
fac=1

while [[ $input -gt 0 ]]
do 
	fac=$((fac*input))
	input=$((input-1))
done
echo "faculteit $1 is $fac";

