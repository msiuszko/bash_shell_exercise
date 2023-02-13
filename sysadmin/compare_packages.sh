#!/bin/bash
#Skrypt listuje paczki systemowe i porównuje z paczkami z pliku 
yum list installed | cut -f 1 -d' ' | cut -f -d'.' > moje paczki
for x in $(cat paczkiposzuiwane); grep -E ^${x} mojepaczki, done
