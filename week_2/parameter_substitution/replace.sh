#!/bin/bash
#Functie: Replace in een string

url="http://www.kdg.be/index.html"

echo ${url}
echo "Replace 1 time kdg by student: ${url/kdg/student}"
echo "Replace all keren ht by f: ${url//ht/f}"
echo "Replace first occurancy of http by ftp: ${url/#http/ftp}"
echo "Replace last occurancy of html with aspx: ${url/%html/aspx}"