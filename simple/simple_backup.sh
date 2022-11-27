#!/bin/bash 

#Backing up required files 

echo "Creating backup directory"
mkdir /backup 
echo 'Copying files'
cp /usr/bin/* ~/backup 
