#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

#Написать bash-скрипт или программу на Си, генерирующий 5 файлов логов nginx в combined формате.
#Каждый лог должен содержать информацию за 1 день.
#"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""

    IFS="
"

test=$(generate_ip)

time_day=(
    "03/16/2023 00:00:00"
    "01/12/2022 00:00:00"
    "08/20/2015 00:00:00"
    "09/30/2021 00:00:00"
    "11/27/2019 00:00:00"
)

for t in ${!time_day[@]}; do
    test="${time_day[$i]}"
    num=$((100 + $RANDOM % 901))
    rm file_$t.log
    for ((i = 0; i < $num; ++i)); do
        generate_time "$test"
        echo $(generate_ip) - - \[$print_date\] \"$(generate_metod) $(generate_agent_URL) $(generate_http_code)\" \
        $(generate_response) $((1 + $RANDOM)) \"-\" \"$(generate_agent)\" >> file_$t.log
    done
done