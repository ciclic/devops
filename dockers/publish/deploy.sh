#!/bin/bash
# Rafael Ramos <rafasoul@msn.com>

# Help description
usage="$(basename "$0") [-h] [-s n] -- build docker and push to repository

where:
    -h  show this help text;
    -r  pass aws region;
    -a  pass aws account;
    -n  pass docker path;
    -v  pass docker version;
    -f  pass docker file;
"

# Default values
AWS_ACCOUNT="00000000000";
AWS_REGION="us-east-1";
DOCKER_NAME=;
DOCKER_VERSION=;
DOCKER_PATH=;

# Options
while getopts :a:r:n:v:f:h: option; do
 case "${option}" in 
 h) echo "$usage" exit;;
 a) AWS_ACCOUNT=${OPTARG};;
 r) AWS_REGION=${OPTARG};;
 n) DOCKER_NAME=${OPTARG};;
 v) DOCKER_VERSION=${OPTARG};;
 f) DOCKER_PATH=${OPTARG};;
 esac
done

if [ -z "${DOCKER_PATH}" ]; then
    DOCKER_PATH="../${DOCKER_NAME////-}/image/";
fi

if [ -z "${DOCKER_VERSION}" ]; then
    DOCKER_VERSION="latest";
fi

BASE_REPOSITORY_URI="$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com"
TARGET_IMAGE=$BASE_REPOSITORY_URI"/$DOCKER_NAME";
REPOSITORY_URI="https://$TARGET_IMAGE";

echo "-> Executing deploy for:"
echo "-> AWS account: " $AWS_ACCOUNT;
echo "-> AWS region: " $AWS_REGION;
echo "-> Docker name: " $DOCKER_NAME;
echo "-> Docker version: " $DOCKER_VERSION;
echo "-> Docker file: " $DOCKER_PATH;
echo "-> Docker repository: " $REPOSITORY_URI;
echo "-> Base repository: " $BASE_REPOSITORY_URI;

echo "-> Authenticating user on ECR."
token=$(aws ecr get-authorization-token --output text --query 'authorizationData[].authorizationToken' | base64 -di | cut -d: -f2)
docker login -u AWS --password $token $REPOSITORY_URI

echo "-> Building container. >" $BASE_REPOSITORY_URI
docker build --no-cache -t $DOCKER_NAME:$DOCKER_VERSION $DOCKER_PATH

echo "-> Tagging container with unique identifier."
docker tag $DOCKER_NAME:$DOCKER_VERSION $TARGET_IMAGE:$DOCKER_VERSION

echo "-> Publishing container created."
docker push $TARGET_IMAGE:$DOCKER_VERSION

exit 0