#!/bin/bash


date
echo "uptime:"
uptime
echo "Currently connected:"
w
echo "--------------------"
echo "Last logins:"
last -a | head -3
echo "--------------------"
echo "Disk and memory usage:"
df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'
echo "--------------------"
#Ta linia zawiera datę i godzinę pierwszego wpisu w dzienniku systemowym.
start_log=$(head -1 /var/log/messages | cut -c 1-12)
#To polecenie zlicza, ile razy w systemie wystąpił błąd braku pamięci (OOM), wyszukując w dzienniku systemowym wystąpienia słowa „kill”.
oom=$(grep -ci kill /var/log/messages)
#To polecenie drukuje liczbę błędów OOM od początku dziennika systemowego.
echo -n "OOM errors since $start_log :" $oom
echo ""
echo "--------------------"
echo "Utilization and most expensive processes:"
#To polecenie wyświetla informacje o bieżącym wykorzystaniu systemu, takie jak obciążenie procesora i użycie pamięci.
top -b | head -3
#To polecenie wyświetla cztery najbardziej obciążające procesor procesy aktualnie uruchomione w systemie.
echo
top -b | head -10 | tail -4
echo "--------------------"
echo "Open TCP ports:"
nmap -p -T4 127.0.0.1
echo "--------------------"
echo "Current connections:"
ss -s
echo "--------------------"
echo "processes:"
ps auxf --width=200
echo "--------------------"
echo "vmstat:"
#To polecenie wyświetla statystyki dotyczące pamięci wirtualnej systemu, takie jak ilość wolnej pamięci i liczba procesów zablokowanych na wejściu/wyjściu. Dane wyjściowe są aktualizowane co sekundę przez łącznie pięć iteracji.
vmstat 1 5
