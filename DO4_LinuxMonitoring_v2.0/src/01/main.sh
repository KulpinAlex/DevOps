#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs
exec 2>/dev/null

#main.sh /opt/test 4 az 5 az.az 3kb
#Параметр 1 - это абсолютный путь. 
#Параметр 2 - количество вложенных папок. 
#Параметр 3 - список букв английского алфавита, используемый в названии папок (не более 7 знаков). 
#Параметр 4 - количество файлов в каждой созданной папке. 
#Параметр 5 - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения). 
#Параметр 6 - размер файлов (в килобайтах, но не более 100).

if check_arguments "$@"; then
    file_extension="."$(echo $5 | sed 's/.*\.//')
    file_name=$(echo $5 | sed -r 's/\..+//')
    folder_extention=""

    gen_names $2 $3 $folder_extention

    folder_names=()
    for t in ${result_names[*]}; do
        folder_names+=($t)
    done

    gen_names $4 $file_name $file_extension

    file_names=()
    for t in ${result_names[*]}; do
        file_names+=($t)
    done

    create_files "$1" $6

else
    echo "Ошибка входных данных"
fi