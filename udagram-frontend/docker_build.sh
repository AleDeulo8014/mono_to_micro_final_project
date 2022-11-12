#! /bin/bash

docker build -t udagram-frontend  . &&\
docker tag udagram-frontend $DOCKER_HUB/udagram-frontend:latest