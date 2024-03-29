#
#  The purpose of this Dockerfile is to test out my dotuser repository
#
#	rebuild image: docker build -t dotuser-tester:latest --build-arg CACHE_DATE=$(date +%Y-%m-%d:%H:%M:%S) .
#	run container: docker run -it dotuser-tester /bin/bash

FROM ubuntu:latest

# Needed to allow for tzdata to be installed without asking for geographical information
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
	curl \
	git \
	vim \
    jq \
	sudo \
    software-properties-common \
    locales \
    make

# Fix issues related to locale
RUN locale-gen en_US.UTF-8

# add dotuser user
RUN adduser dotuser --disabled-password --gecos ""                      && \
    echo "dotuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R dotuser:dotuser /home/dotuser

# dotuser user config
USER dotuser
ENV HOME /home/dotuser

WORKDIR $HOME

# If BRANCH not passed, default to 'main'
ARG BRANCH=main

# Using SHA gets past the issue of the git clone being cached and not pulling in most recent commits
ARG SHA=LATEST
RUN SHA=${SHA} \
    git clone -b ${BRANCH} https://github.com/dmorand17/dotfiles.git
