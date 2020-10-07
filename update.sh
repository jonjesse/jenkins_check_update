#!/bin/bash

_date=$(date +"%m-%d-%y")
#echo $_date
_output=$(docker pull jenkins/jenkins:lts)
#echo $_output
_already_exists="Image is up to date"
_new_image="Downloaded newer image for"
_digests=""
#_current_images=$(docker images | grep lts_docker)


#echo "lastest docker images: $_current_images"
if [[ $_output =~ $_already_exists ]]; then
  #echo "you already have latest image
  echo 0
  exit 0
elif [[ $_output =~ $_new_image ]]; then
  #echo "new image was downloaded, building"
  _digests=$(docker image inspect --format='{{.RepoDigests}}' jenkins/jenkins:lts)
  #echo "Digests for new image: $_digests"
  b1=$(docker build -f Dockerfile -t jenkins/jenkins:lts_docker_$_date .)
  sleep 5
  echo $b1
  _state=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep -i jenkins | grep -i $_date | head -1)
  echo $_state
  exit 0
else
  echo "unknown state"
  exit 1
  #echo "entered an unknow state, quitting"
fi
