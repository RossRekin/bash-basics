#!/bin/bash
LOGS_FILE=$1


awk -F '[:[]' '{split($1,b," "); split($2,a,"/");print a[2],a[3],b[1]}' $LOGS_FILE | sort -M -r | uniq -c > temp_logs.txt
months=$(awk '{print $2 "." $3}' temp_logs.txt | uniq)

for MONTH in ${months[@]}; do
  CURRENT_MONTH=$(echo $MONTH | tr "." ' ')
  echo $CURRENT_MONTH
  cat temp_logs.txt | grep "${CURRENT_MONTH}" | awk '{printf "%s %s \n",$1,$4}' | sort -rn | head -n 10 > temp_month.txt


  numbers=$(cat temp_month.txt | awk '{print $1}')
  tot=0
  for i in ${numbers[@]}; do
    let tot+=$i
  done

  while read LINE; do
    elements=($LINE);
    COUNT="${elements[0]}";
    NUM=$(echo "$tot $COUNT" | awk '{printf "%d \n", $2/$1*100}')
    BARS="#"
    for ((i=1;i<=$NUM;i++))
    do
      BARS+="#"
    done
    echo $LINE $BARS >> barchart_logs.txt
  done < temp_month.txt
  if [ -f barchart_logs.txt ]; then
    cat barchart_logs.txt | column -t
    rm -f barchart_logs.txt
  fi
  
done

rm -f temp_logs.txt temp_month.txt


