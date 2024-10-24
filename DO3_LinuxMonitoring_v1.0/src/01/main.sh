#!/bin/bash

if [ $# -eq 1 ]
then
[ "$1" -eq "$1" ] 2>/dev/null
if [ $? -ne 0 ]
then
echo $1
else
echo "invalid input"
fi
else
echo "invalid input"
fi