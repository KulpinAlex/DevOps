#!/bin/bash

gcc /home/server.c -lfcgi
service nginx start
spawn-fcgi -p 8080 -n ./a.out
rm ./a.out
