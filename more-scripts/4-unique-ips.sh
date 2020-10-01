#!/bin/bash
LOGS_FILE=$1

awk -F '[:[]' '{split($1,b," "); split($2,a,"/");print a[2],a[3],b[1]}' $LOGS_FILE | uniq | awk '{print $1 " " $2}'| uniq -c \
| awk '{print $2 " " $3 " unique visits " $1}'
