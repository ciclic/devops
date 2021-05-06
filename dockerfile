FROM centos:7

LABEL name="Base CentOS image from DockerHUB" \    
      maintainer="Wilton <wiltonms@hotmail.command>" \
      release="1" \
      summary="A Java image based on CentOS" 

# Change to user root to install jdk, cant install it with any other user
USER root 
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

# Creating user to run the service
RUN useradd --create-home --home-dir /home/ciclicuser ciclicuser

# Copy in script and necessary files to the container
COPY ciclicapp_entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/*

# Using non-root user 
USER ciclicuser

# Set entrypoint to run management script
ENTRYPOINT ["ciclicapp_entrypoint.sh"]
