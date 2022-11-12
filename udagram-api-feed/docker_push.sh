#! /bin/bash

docker build -t udagram-api-feed  . 
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin &&\
docker tag udagram-api-feed $DOCKER_HUB/udagram-api-feed:latest &&\
docker push $DOCKER_HUB/udagram-api-feed