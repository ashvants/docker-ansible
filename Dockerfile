#Get base image from ubuntu
FROM ubuntu:14.04

MAINTAINER Ashvants <ashvants@hotmail.com>

RUN apt-get update
RUN apt-get install python
RUN apt-get install openssh-server
RUN apt-get install openssh-client
RUN apt-get install vim
RUN apt-get install git
RUN apt-get install ansible

#pip install pip --upgrade
#git clone -b 21.11.0 https://github.com/ansible/awx.git

CMD ["ssh-keygen"]
