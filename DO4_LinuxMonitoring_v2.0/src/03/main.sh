#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

#Параметр 1 - По лог файлу
#Параметр 2 - По дате и времени создания
#Параметр 3 - По маске имени (т.е. символы, нижнее подчёркивание и дата).

    IFS="
"

if check_arguments "$@"; then
    if [[ $1 -eq 1 ]]; then
        clean_by_logfile
    
    elif [[ $1 -eq 2 && $# -eq 1 ]]; then
        read -p "Введите дату начала в формате (MM/DD/YYYY HH:MM):" 2>&1 start_date
        read -p "Введите дату окончания в формате (MM/DD/YYYY HH:MM):" 2>&1 end_date
        check_date "$start_date" "$end_date"

    elif [[ $1 -eq 2 && $# -eq 5 ]]; then
        start_date="$2 $3"
        end_date="$4 $5"
        check_date "$start_date" "$end_date"

    elif [[ $1 -eq 2 && ! $# -eq 5 ]]; then
        echo Введите дату и время в правильном формате: '(MM/DD/YYYY HH:MM)'
    elif [[ $1 -eq 3 ]]; then
        clean_by_mask
    else
        echo "Ошибка входных данных"
    fi
else
    echo "Ошибка входных данных"
fi