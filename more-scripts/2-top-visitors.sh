#!/bin/bash

LOGS_FILE=$1
#declare -A visitors
#
#while read LINE; do
#  elements=($LINE);
#  VISITOR="${elements[0]}";
#  if [ -n "${VISITOR}" ]; then
#    if [ ${visitors[$VISITOR]} ]; then
#      COUNT=$((${visitors[$VISITOR]} +1))
#      visitors[$VISITOR]=$COUNT
#      else 
#        visitors[$VISITOR]=1
#    fi
#  fi
#done < $LOGS_FILE
#
#for v in "${!visitors[@]}"
#do
#    printf "%5s %10s \n" ${visitors["$v"]} ${v} 
#done | sort -rn -k1 | head -n 10

#awk solution
awk '{ print $1}' $LOGS_FILE | sort | uniq -c | sort -nr | head -n 10 | column -t