#! /bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin &&\
docker tag udagram-frontend $DOCKER_HUB/udagram-frontend:latest &&\