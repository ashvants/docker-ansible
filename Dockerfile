FROM ubuntu:20.04
LABEL maintainer="ashvants"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    ansible \
    apt-transport-https \
    ca-certificates-java \
    curl \
    python3 \
    python3-pip \
    init \
    openssh-server openssh-client \
    unzip \
    rsync \
    sudo \
    fuse snapd snap-confine squashfuse \
    && rm -rf /var/lib/apt/lists/*

# Configure udev for docker integration
RUN dpkg-divert --local --rename --add /sbin/udevadm && ln -s /bin/true /sbin/udevadm

RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

EXPOSE 22 

ENTRYPOINT ["/sbin/init"]