#!/bin/bash

_date=$(date +"%m-%d-%y")
image_date="lts_docker_"$_date

image=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i jenkins | grep -i $_date | head -1)

echo "Looking for new tag: $image_date"
echo "Current tag: $image"

mmount="/home/jenkins"

if [ $image_date == $image ]; then
  cur_img=$(docker container ps --format "{{.ID}}:{{.Image}}"  | grep -i jenkins | cut -d ':' -f 1)
  docker stop $cur_img
  docker rm $cur_img
  sleep 10
  echo "starting new image"
  new_start=$(docker run -dit -p 50000:50000 -p 8080:8080 -v $mmount:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:$image_date)
  if [[ $? == 0 ]]; then
    echo "successfully started new image"
  else
    echo "failled to start new image"
  fi
else
   echo "no new image today: $_date"
fi
