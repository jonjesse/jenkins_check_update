#!/bin/bash

_date=$(date +"%m-%d-%y")
echo $_date
_output=$(docker pull jenkins/jenkins:lts)
#echo $_output
_already_exists="Image is up to date"
_new_image="Downloaded newer image for"
_digests=""

if [[ $_output =~ $_already_exists ]]; then
  echo "you already have latest image"
elif [[ $_output =~ $_new_image ]]; then
  echo "new image was downloaded, building"
  _digests=$(docker image inspect --format='{{.RepoDigests}}' jenkins/jenkins:lts)
  echo "Digests for new image: $_digests"
  docker build -f Dockerfile -t jenkins/jenkins:lts_docker_$_date .
else
  echo $_output
  echo "entered an unknow state, quitting"
fi
