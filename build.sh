#! /bin/bash

docker image prune --all
docker-compose -f docker-compose-build.yaml build --parallel
docker-compose up