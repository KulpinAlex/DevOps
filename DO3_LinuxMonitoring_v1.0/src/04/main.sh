#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs

exec 2>/dev/null

f_path=$(realpath $0 | sed 's/.main.sh//')"/conf"

col_1=$(cat $f_path | awk 'NR == 1' | sed 's/.*=//')
col_2=$(cat $f_path | awk 'NR == 2' | sed 's/.*=//')
col_3=$(cat $f_path | awk 'NR == 3' | sed 's/.*=//')
col_4=$(cat $f_path | awk 'NR == 4' | sed 's/.*=//')

check_defoult=0

[ "$col_1" -eq "$col_1" ] && [ "$col_2" -eq "$col_2" ] && [ "$col_3" -eq "$col_3" ] && [ "$col_4" -eq "$col_4" ]
if [ $? -ne 0 ]
then
check_defoult=1
col_1=1
col_2=2
col_3=3
col_4=4
fi

if [ $col_1 -ne $col_2 ] && [ $col_3 -ne $col_4 ]
then

colour_key $col_1 $col_2 $col_3 $col_4
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
echo "invalid ./conf file, run script again"
fi

echo ""
if [ $check_defoult -eq 1 ]
then
echo "Column 1 background = default $(colour_name $col_1)"
echo "Column 1 font color = default $(colour_name $col_2)"
echo "Column 2 background = default $(colour_name $col_3)"
echo "Column 2 font color = default $(colour_name $col_4)"
else
echo "Column 1 background = $col_1 $(colour_name $col_1)"
echo "Column 1 font color = $col_2 $(colour_name $col_2)"
echo "Column 2 background = $col_3 $(colour_name $col_3)"
echo "Column 2 font color = $col_4 $(colour_name $col_4)"
fi
