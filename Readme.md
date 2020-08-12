# Usage

Downloads latest jenkins/jenkins:lts image and builds jenkins-docker image based on Dockerfile.
Updates the date to CST, please change reconfig_date.sh based on your time zone.

Dockerfile: change the \_groupid to match your docker group on your local host.

Run Jenkins:
```
docker run -dit -p 50000:50000 -p 8080:8080 -v $JENKINS_Folder:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts_docker_$_date

```
