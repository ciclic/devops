#Defne OS
FROM centos:7

#Environment configuration
RUN yum update -y && \
    yum install -y yum install java-1.8.0-openjdk-devel

#Define work directory
WORKDIR /opt

#Build application
ADD exampleJava .
RUN javac HelloWorld/Main.java; \
    java -cp . HelloWorld.Main; \
    jar cfme Main.jar Manifest.txt HelloWorld.Main HelloWorld/Main.class