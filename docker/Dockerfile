FROM ubuntu:24.04

ARG user=deployer

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN useradd -m -s /bin/bash ${user} && \
    echo "${user}:${user}" | chpasswd && \
    adduser deployer sudo

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
