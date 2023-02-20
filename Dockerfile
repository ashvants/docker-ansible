FROM ubuntu:latest@sha256:61bd0b97000996232eb07b8d0e9375d14197f78aa850c2506417ef995a7199a7
#ubuntu:20.04
LABEL maintainer="ashvants"

ARG TERRAFORM_VERSION="1.3.9"
#ARG ANSIBLE_VERSION="2.5.1"
ARG PACKER_VERSION="1.8.6"
ARG AWSCLI_VERSION="1.18.19"

LABEL terraform_version=${TERRAFORM_VERSION}
#LABEL ansible_version=${ANSIBLE_VERSION}
#LABEL aws_cli_version=${AWSCLI_VERSION}

#terraform_1.3.9_linux_arm64.zip
#packer_1.8.6_linux_arm64.zip

ENV DEBIAN_FRONTEND=noninteractive
ENV AWSCLI_VERSION=${AWSCLI_VERSION}
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ENV PACKER_VERSION=${PACKER_VERSION}

RUN apt-get update && apt-get dist-upgrade -y \
    git \
    curl \
    python3 python3-pip \
    apt-transport-https \
    init \
    openssh-server openssh-client \
    unzip \
    rsync \
    sudo       

RUN python3 -m pip install ansible \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip \
    && curl -LO https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_arm64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* *.zip

CMD    ["/bin/bash"]    
 

   
    #  \
    # ca-certificates-java \
    

    
    # init \
    # openssh-server openssh-client \
    # unzip \
    # rsync \
    # sudo \
    # fuse snapd snap-confine squashfuse



 # pip3 install --upgrade awscli==${AWSCLI_VERSION} \
# RUN apt-get update && apt-get install -y \
#     git \
#     ansible \
#     apt-transport-https \
#     ca-certificates-java \
#     curl \
#     python3 \
#     python3-pip \
#     init \
#     openssh-server openssh-client \
#     unzip \
#     rsync \
#     sudo \
#     fuse snapd snap-confine squashfuse \


# # Configure udev for docker integration
# RUN dpkg-divert --local --rename --add /sbin/udevadm && ln -s /bin/true /sbin/udevadm

# RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# EXPOSE 22 

# ENTRYPOINT ["/sbin/init"]