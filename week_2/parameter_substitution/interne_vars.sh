#!/bin/bash

while true; do 
    echo "kind $!"
    echo "kind $$" 
    sleep 2
    echo "Laatste argument: $_"
    #kill $!
    kill $$
done 

