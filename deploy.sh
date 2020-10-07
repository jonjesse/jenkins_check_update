#!/bin/bash


mmount="/home/jenkins"
img=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i jenkins | head -1)
echo "Latest Jenkins image: $img"
cur_img=$(docker container ps --format "{{.ID}}:{{.Image}}"  | grep -i jenkins | cut -d ':' -f 1)
echo "Running Jenkins Image: $cur_img"
echo "stopping current image"
docker stop $cur_img
echo "removing current image"
docker rm $cur_img
sleep 10
echo "starting new image"
new_start=$(docker run -dit --network miner -p 50000:50000 -p 8080:8080 -v $mmount:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock $img)
if [[ $? == 0 ]]; then
  echo "successfully started new image"
else
  echo "failled to start new image"
fi
