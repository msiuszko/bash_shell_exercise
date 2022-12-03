#!/bin/bash
#Prosty skrypt liczący pliki i wyświetlający ich nazwy
echo  "Total of files are " && ls -p | grep -v / | wc -l
ls -p | grep -v /
