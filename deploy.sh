#!/bin/bash


mmount="/home/jenkins"
img=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i jenkins | head -1)

cur_img=$(docker container ps --format "{{.ID}}:{{.Image}}"  | grep -i jenkins | cut -d ':' -f 1)
docker stop $cur_img
docker rm $cur_img
sleep 10
echo "starting new image"
new_start=$(docker run -dit -p 50000:50000 -p 8080:8080 -v $mmount:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock $img)
if [[ $? == 0 ]]; then
  echo "successfully started new image"
else
  echo "failled to start new image"
fi
