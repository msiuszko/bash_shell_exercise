#!/bin/bash
#Skrypt w bash służy do tworzenia kopii zapasowej katalogu domowego użytkownika i zapisywania jej w /tmp/
user=$(whoami)

#Skrypt rozpoczyna się od zdefiniowania zmiennej user z nazwą aktualnego użytkownika, a także zmiennych input i output. Zmienna input określa katalog domowy użytkownika, który ma być zarchiwizowany, a zmienna output określa nazwę pliku kopii zapasowej, w tym datę i godzinę utworzenia.
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

#Funkcja total_files raportuje całkowitą liczbę plików w danym katalogu, a funkcja total_directories raportuje całkowitą liczbę katalogów w danym katalogu.
function total_files {
        find $1 -type f | wc -l
}

function total_directories {
        find $1 -type d | wc -l
}

#Polecenie tar tworzy skompresowane archiwum katalogu wejściowego i zapisuje je w katalogu wyjściowym
tar -czf $output $input 2> /dev/null

#Informacja o wykonaniu backup
echo -n "Files to be included:"
total_files $input
echo -n "Directories to be included:"
total_directories $input

echo "Backup of $input completed!"

echo "Details about the output backup file:"
ls -l $output

