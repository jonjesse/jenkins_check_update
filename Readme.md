# Usage

Downloads latest jenkins/jenkins:lts image and builds jenkins-docker image based on Dockerfile.
Updates the date to CST, please change reconfig_date.sh based on your time zone.

Run Jenkins:
```
docker run -dit -p 50000,50000 -p 8080,8080 -v /home/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock
```
