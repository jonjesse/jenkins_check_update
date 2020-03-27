#!/bin/bash

_date=$(date +"%m-%d-%y")
_output=$(docker images | grep $_date)
if [[ $? == 0 ]]; then
  echo "Today $_date jenkins image updated"
else
  echo "No updates today, $_date"
fi  
