#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

start=$(date +%s%N)

#main.sh az az.az 3Mb

#Параметр 1 - список букв английского алфавита, используемый в названии папок (не более 7 знаков). 
#Параметр 2 - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения). 
#Параметр 3 - размер файла (в Мегабайтах, но не более 100).

if check_arguments "$@"; then
    file_extension="."$(echo $2 | sed 's/.*\.//')
    file_name=$(echo $2 | sed -r 's/\..+//')
    folder_extention=""
    IFS="
"
    folders_list=()
    paths="$(find / -type d -writable | grep -Ev '(^/sbin|^/bin)' | shuf)"

    for path in "$paths"; do
        folders_list+=($path)
    done

    gen_names 99 $1 $folder_extention
    folder_names=()
    for t in ${result_names[*]}; do
        folder_names+=($t)
    done

    gen_names 32768 $file_name $file_extension
    file_names=()
    for t in ${result_names[*]}; do
        file_names+=($t)
    done
    
    for i in "${!folders_list[@]}"; do
        test="${folders_list[$i]}"
        size=$(df / | tail -1 | awk '{print $4}')
        if [[ $size -le 1000000 ]]; then
            break
        fi
        num=$((1 + $RANDOM))
        create_files "$test" $3 $num
    done

else
    echo "Ошибка входных данных"
fi

stop=$(date +%s%N)
total_time=$((($stop - $start) / 1000000))

echo "Время работы скрипта $total_time милисекунд или $(($total_time / 1000)).$(($total_time % 1000)) секунд"
echo "Время работы скрипта $total_time милисекунд или $(($total_time / 1000)).$(($total_time % 1000)) секунд" >> script.log
