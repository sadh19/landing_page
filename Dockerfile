FROM jenkins/jenkins:lts-jdk21
USER root
 
RUN apt-get update && \
    apt-get install -y docker.io && \
    groupadd -f docker && \
    usermod -aG docker jenkins && \
    apt-get clean
USER jenkins