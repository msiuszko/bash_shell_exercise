#!/bin/bash
#Prosty skrypt liczący wszystkie katalogi w danej lokalizacji oraz wyświetlający ich nazwy

echo "Total of directories are " && ls -p | grep  / | wc -l
ls -p | grep  /

