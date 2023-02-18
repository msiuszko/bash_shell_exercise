#!/bin/bash

#Ten skrypt bash służy do tworzenia kopii zapasowej (backupu) katalogu domowego bieżącego użytkownika
user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

#Funkcje służą do zliczania plików i katalogów w katalogu źródłowym oraz w skompresowanej kopii zapas
function total_files {
        find $1 -type f | wc -l
}

function total_directories {
        find $1 -type d | wc -l
}

function total_archived_directories {
        tar -tzf $1 | grep  /$ | wc -l
}

function total_archived_files {
        tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

#Funkcja "total_files" przyjmuje jeden argument - ścieżkę do katalogu - i zwraca liczbę plików w tym katalogu (z wyłączeniem podkatalogów).
src_files=$( total_files $input )
#Funkcja "total_directories" przyjmuje jeden argument - ścieżkę do katalogu - i zwraca liczbę katalogów w tym katalogu (z wyłączeniem podkatalogów).
src_directories=$( total_directories $input )
#Funkcja "total_archived_directories" przyjmuje jeden argument - ścieżkę do pliku skompresowanej kopii zapasowej - i zwraca liczbę katalogów w tej kopii.
arch_files=$( total_archived_files $output )
#Funkcja "total_archived_files" przyjmuje jeden argument - ścieżkę do pliku skompresowanej kopii zapasowej - i zwraca liczbę plików w tej kopii.
arch_directories=$( total_archived_directories $output )

echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -eq $arch_files ]; then
        echo "Backup of $input completed!"
        echo "Details about the output backup file:"
        ls -l $output
else
        echo "Backup of $input failed!"
fi
