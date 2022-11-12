#! /bin/bash

docker build -t udagram-reverseproxy  . &&\
docker tag udagram-reverseproxy $DOCKER_HUB/udagram-reverseproxy:latest