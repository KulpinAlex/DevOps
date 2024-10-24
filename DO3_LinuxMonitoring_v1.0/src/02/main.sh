#!/bin/bash
. $(realpath $0 | sed 's/.main.sh//')/funcs

logFile=$(mktemp -u)
exec 1> >(tee $logFile)


host_time_usr
operating_system
print_date
print_uptime
print_ip_mask_gate
print_ram
print_space
sleep 0.5
create_file
