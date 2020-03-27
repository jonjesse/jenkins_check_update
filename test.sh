#!/bin/bash

_date=$(date +"%m-%d-%y")
_output=$(docker images | grep $_date)
if [[ $? == 0 ]]; then
  echo "success"
else
  echo "failure"
fi  
