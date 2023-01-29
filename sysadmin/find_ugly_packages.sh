#!/bin/bash

#Skrypt wyszukuje pliki, które w nazwie zawierają duże litery, spacje  i myślniki 

# Definiujemy katalog
dir=.

# Wyszczególnienie co ma zostać znalezione 
files=($(find $dir -type f | grep -E '[A-Z ]|-'))

# Wyświetlanie wyników
for file in "${files[@]}"; do
  echo "$file"
done
