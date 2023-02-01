#!/bin/bash

#Skrypt sprawdza status pliku o nazwie ~/.bashrc (skrypt ustawia zmienną o nazwie FILE na wartość ~/.bashrc, co oznacza pełną ścieżkę do pliku .bashrc w katalogu domowym użytkownika)

# test-file: Sprawdza status pliku
FILE=~/.bashrc
	if [ -e "$FILE" ]; then
 		if [ -f "$FILE" ]; then
 			echo "$FILE jest zwykłym plikiem."
 		fi
 		if [ -d "$FILE" ]; then
 			echo "$FILE jest katalogiem."
 		fi
		if [ -r "$FILE" ]; then
 			echo "$FILE jest do odczytu."
 		fi
 		if [ -w "$FILE" ]; then
			echo "$FILE jest do zapisu."
		fi
 		if [ -x "$FILE" ]; then
			echo "$FILE jest wykonywalny/wyszukiwalny"
 		fi
	else
		echo "$FILE nie istnieje"
		exit 1
	fi
	exit
