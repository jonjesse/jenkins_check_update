#!/bin/bash

_date=$(date +"%m-%d-%y")
_output=$(docker images | grep -i jenkins | grep $_date)
if [[ $? == 0 ]]; then
  echo "Today $_date jenkins image updated" >> ./results.txt
else
  echo "No updates today, $_date" >> ./results.txt
fi  
