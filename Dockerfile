# Dockerfile

FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get -y install sudo && \
    apt-get clean

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
