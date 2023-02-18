#!/bin/bash
#Ten skrypt bash określa zmienne, a następnie używa polecenia ":" w celu przekierowania wejścia standardowego (stdin) z urządzenia określonego przez wartości zmiennych.

#Tworzy zmienną "port" i przypisuje jej wartość pierwszego argumentu, przekazanego do skryptu. Jeśli nie ma argumentu, domyślna wartość to 22 (czyli port SSH)
port=${1:-22}

#Tworzy zmienną "ip" i przypisuje jej wartość drugiego argumentu, przekazanego do skryptu. Jeśli nie ma argumentu, domyślna wartość to 127.0.0.1 (czyli adres localhost)
ip=${2:-127.0.0.1}

#Tworzy zmienną "protocol" i przypisuje jej wartość trzeciego argumentu, przekazanego do skryptu. Jeśli nie ma argumentu, domyślna wartość to "tcp". 
protocol=${3:-tcp}

#Zwraca kod błędu 0
: < /dev/${protocol}/${ip}/${port}

#Jeśli zmienna "protocol" ma wartość "tcp", a "ip" ma wartość "127.0.0.1", a "port" ma wartość "22", to przekierowanie to spowoduje przekierowanie wejścia standardowego z urządzenia "/dev/tcp/127.0.0.1/22". Przekierowanie to może służyć do próby nawiązania połączenia sieciowego z podanym adresem IP i portem, w zależności od dostępnych urządzeń w systemie.
