#!/bin/bash
#Find file 

echo -n "Enter File Name: "
read -r file

if [ ! -f "$file" ]; then
	echo "Filename $file does not exists"
	exit 1
fi
    echo "Filename $file exist"
#tr '[:upper:]' '[:lower:]' < "$file" >> small.txt
