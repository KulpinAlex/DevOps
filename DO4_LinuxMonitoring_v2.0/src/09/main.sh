#!/bin/bash

#U0 - cpu, N0 - nice, S0 - system, I0 - idle

U0=$(cat /proc/stat | head -1 | awk '{print $2}')
N0=$(cat /proc/stat | head -1 | awk '{print $3}')
S0=$(cat /proc/stat | head -1 | awk '{print $4}')
I0=$(cat /proc/stat | head -1 | awk '{print $5}')
sleep 3

while true; do
U1=$(cat /proc/stat | head -1 | awk '{print $2}')
N1=$(cat /proc/stat | head -1 | awk '{print $3}')
S1=$(cat /proc/stat | head -1 | awk '{print $4}')
I1=$(cat /proc/stat | head -1 | awk '{print $5}')
Ud=$((U1-U0))
Nd=$((N1-N0))
Sd=$((S1-S0))
Id=$((I1-I0))
Total=$((Ud+Nd+Sd+Id))
avg_load=$(((Ud+Nd+Sd)*100/Total))
U0=$(echo $U1)
N0=$(echo $N1)
S0=$(echo $S1)
I0=$(echo $I1)
free_memory=$(cat /proc/meminfo | grep MemFree | awk '{print $2/1024}')
free_space=$(df / | awk 'NR == 2 {print $4/1024}')
echo -e "avg_cpu_load $avg_load <br>
RAM_memory_free $free_memory <br>
disk_space_free $free_space" > index.html

sleep 3
done
