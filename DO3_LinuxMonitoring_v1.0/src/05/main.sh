#!/bin/bash
START=$(date +%s%N)
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

if [ $# -eq 1 ] && [ ${1: -1} = "/" ] && [ -d "$1" ]
then
total_folders "$1"
top_five_folders "$1"
number_files "$1"
number_some_files "$1"
top_ten_files "$1"
top_ten_exe_files "$1"
else
echo "invalid input"
fi

END=$(date +%s%N)
DIFF=$(echo "scale=3; ($END - $START)/1000000000" | bc)
echo "It took $DIFF seconds"