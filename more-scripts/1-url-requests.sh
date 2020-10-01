#!/bin/bash

LOGS_FILE=$1
#declare -A urls


#exercise 1

#fill the array
#while read LINE; do
#  elements=($LINE);
#  URL="${elements[10]}";
#  if [ "${URL}" != '"-"' -a -n "${URL}" ]; then
#    if [ ${urls[$URL]} ]; then
#      COUNT=$((${urls[$URL]} +1))
#      urls[$URL]=$COUNT
#      #echo "${URL} -> ${urls[$URL]}"
#      else 
#        urls[$URL]=1
#    fi
#  fi
#
#done < $LOGS_FILE
#
##print sorted
#for h in "${!urls[@]}"
#do
#    printf "%5s %10s \n" ${urls["$h"]} ${h}
#    #echo ${urls["$h"]} ' ' ${h} 
#done | sort -rn -k1 | head -n 10

#awk solution
awk '{ print $11}' $LOGS_FILE | sort | uniq -c | sort -nr | head -n 10 | column -t