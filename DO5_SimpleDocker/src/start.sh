#!/bin/bash

gcc /home/server.c -lfcgi
spawn-fcgi -p 8080 ./a.out
rm ./a.out
