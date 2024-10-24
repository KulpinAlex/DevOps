#!/bin/bash

for i in 0 1 2 3 4; do
    goaccess --log-format=COMBINED ../04/file_$i.log -a -o goaccess_file_$i.html
done