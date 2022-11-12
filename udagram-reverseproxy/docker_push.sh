#! /bin/bash

docker build -t udagram-reverseproxy  . 
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin &&\
docker tag udagram-reverseproxy $DOCKER_HUB/udagram-reverseproxy:latest &&\
docker push $DOCKER_HUB/udagram-reverseproxy