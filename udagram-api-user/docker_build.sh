#! /bin/bash

docker build -t udagram-api-user  . &&\
docker tag udagram-api-user $DOCKER_HUB/udagram-api-user:latest