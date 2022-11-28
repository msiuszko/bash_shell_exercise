#!/bin/bash

case "$1" in

  "stop") systemctl stop nginx.service; echo "Nqinx was stop" ;;

  "status") systemctl status nginx | grep Active: ;;

  "start")
        if [ -f /usr/local/var/run/nginx.pid ]; then
                systemctl start nginx
                echo "Nginx is running"

        else
                yum install nginx -y >/dev/null
                systemctl start nginx
                echo "Nginx is running"

        fi ;;


        echo "Konfiguracja prostej strony internetowej"
        echo "Hello World" > /usr/share/nginx/html/index.html
        curl 127.0.0.1




  "remove") yum remove ngnix.service; echo "Nginx is delete" ;;

esac


#systemctl enable ngnix

#echo "Konfiguracja prostej strony internetowej"
#echo "Hello World" > /usr/share/nginx/html/index.html
#curl 127.0.0.1
