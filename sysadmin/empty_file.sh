#!/bin/bash 

#Skrypt znajdzie i usunie każdy pusty plik, opcja -t wyświetla każde wykonane działanie 

find / -type f -size 0 | xargs -t rm
