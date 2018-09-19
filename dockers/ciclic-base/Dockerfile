FROM centos:7
LABEL maintainer="Rafael Ramos <rafasoul@msn.com>"

USER root

# Create default folders
RUN mkdir -p \
        /ciclic/tools \
        /ciclic/src \
        /ciclic/downloads \
        /ciclic/apps \
        /ciclic/scripts

RUN yum -y update && yum install -y \
        curl \
        wget \
        unzip \
        git \
        ssh \
        vim \
        locales \
    && yum clean all

# Set language and locales
RUN locale-gen en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8
ENV LC_ALL  en_US.UTF-8