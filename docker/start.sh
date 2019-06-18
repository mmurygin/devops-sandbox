#!/bin/bash

DOCKER_LOGIN="$1"

docker network create reddit
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post "$DOCKER_LOGIN"/post:1.0
docker run -d --network=reddit --network-alias=comment "$DOCKER_LOGIN"/comment:1.0
docker run -d --network=reddit -p 9292:9292 "$DOCKER_LOGIN"/ui:1.0
