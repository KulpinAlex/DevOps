#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

#Скрипт запускается с 1 параметром, который принимает значение 1, 2, 3 или 4.

#Все записи, отсортированные по коду ответа
#Все уникальные IP, встречающиеся в записях
#Все запросы с ошибками (код ответа - 4хх или 5хх)
#Все уникальные IP, которые встречаются среди ошибочных запросов

if check_arguments "$@"; then
    if [[ $1 -eq 1 ]]; then
        sort_by_response_code
    elif [[ $1 -eq 2 ]]; then
        unique_ip
    elif [[ $1 -eq 3 ]]; then
        error_code
    else
        error_code_unique_ip
    fi
else
    echo "Ошибка входных данных"
fi