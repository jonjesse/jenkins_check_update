#change the groupID to your groupID
FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
ARG _groupid=132
RUN apt-get update && apt-get install -y apt-utils ruby sudo \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add \
 && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" \
 && apt-get update \
 && apt-get install -y docker-ce docker-ce-cli containerd.io \
 && groupmod -g ${_groupid} docker \
 && usermod -aG docker jenkins
COPY reconfig_date.sh /reconfig_date.sh
RUN /reconfig_date.sh

# drop back to the regular jenkins user - good practice
USER jenkins
