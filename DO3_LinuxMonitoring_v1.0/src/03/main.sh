#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs

exec 2>/dev/null

if [ $1 -ne $2 ] &&  [ $3 -ne $4 ] && [ $# -eq 4 ]
then
colour_key $1 $2 $3 $4
var_part1="\033[$col1;05;$col2"
var_part2="\033[$col3;05;$col4"

host_time_usr $var_part1 $var_part2
operating_system $var_part1 $var_part2
print_date $var_part1 $var_part2
print_uptime $var_part1 $var_part2
print_ip_mask_gate $var_part1 $var_part2
print_ram $var_part1 $var_part2
print_space $var_part1 $var_part2

else
echo "invalid input, run script again"
fi
