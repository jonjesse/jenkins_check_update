#!/bin/bash

_date=$(date +"%m-%d-%y")
_output=$(docker images --format "{{.Repository}}\t{{.Tag}}" | grep jenk | head -1)
echo $_output  
