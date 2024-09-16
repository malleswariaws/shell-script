#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOULD ]
    then
        echo "$FOLDER is more than $DISK_THRESHOULD, current usage: $USAGE"
    fi    
done <<< $DISK_USAGE