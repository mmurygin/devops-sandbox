#!/bin/bash

USER=${1:-muryginm}

docker network create reddit
docker run --name mongo -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run --name post -d --network=reddit --network-alias=post "$USER"/reddit_post:1.0
docker run --name comment -d --network=reddit --network-alias=comment "$USER"/reddit_comment:1.0
docker run --name ui -d --network=reddit -p 9292:9292 "$USER"/reddit_ui:1.0
