#bin/bash 

#Skrypt wyświetla 10 największych plików (posortowane wg rozmiaru) 

du -s /usr/share/* | sort -nr | head
