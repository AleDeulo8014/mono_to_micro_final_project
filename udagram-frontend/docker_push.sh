#! /bin/bash

docker build -t udagram-frontend  . 
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin &&\
docker tag udagram-frontend $DOCKER_HUB/udagram-frontend:latest &&\
docker push $DOCKER_HUB/udagram-frontend