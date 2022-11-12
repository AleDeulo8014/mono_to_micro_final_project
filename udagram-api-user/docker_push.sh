#! /bin/bash

docker build -t udagram-api-user  . 
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin &&\
docker tag udagram-api-user $DOCKER_HUB/udagram-api-user:latest &&\
docker push $DOCKER_HUB/udagram-api-user