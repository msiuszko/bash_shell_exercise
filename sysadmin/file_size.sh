#bin/bash 

#Skrypt wyświetla 10 największych paczek posortowane wg rozmiaru 

du -s /usr/share/* | sort -nr | head
