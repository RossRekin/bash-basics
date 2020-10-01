#!/bin/bash

#solution 1
LOGS_FILE=$1
#declare -A months
#
#while read LINE; do
#
#    elements=($LINE);
#    IFS='/:' read -ra date_arr <<< $(echo ${elements[3]} " " ${elements[4]} | tr -d '[]')  
#    MONTH="${date_arr[1]} ${date_arr[2]}"
#    if [[ ${#MONTH} -gt 1 ]]; then
#      if [ ${months[$MONTH]} ]; then
#        COUNT=$((${months[$MONTH]} +1))
#        months[$MONTH]=$COUNT
#        else 
#          months[$MONTH]=1
#      fi
#    fi
#  
#done < $LOGS_FILE
#
#for m in "${!months[@]}"
#do
#    echo $m "hits count" ${months["$m"]} 
#done | sort -rn -k5


#solution 2
awk -F '[:[]' '{split($2,a,"/");print a[2],a[3]}' $LOGS_FILE | sort | uniq -c | sort -nr | head -n 10