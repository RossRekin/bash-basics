#!/bin/bash

FILE="/home/rrekin/scripts-demo/file1.txt"

if [ -e "$FILE" ]
  then
    echo "${FILE} passwords are enabled"
fi
if [ -w "$FILE" ]
  then
    echo "You have permission to edit ${FILE}"
  else
    echo "You do NOT have permission to edit ${FILE}"
fi
