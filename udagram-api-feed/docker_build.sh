#! /bin/bash

docker build -t udagram-api-feed  . &&\
docker tag udagram-api-feed $DOCKER_HUB/udagram-api-feed:latest