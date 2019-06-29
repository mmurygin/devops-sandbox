#!/bin/bash

USER=${1:-muryginm}

docker pull mongo:latest
docker build -t "$USER"/reddit_post:1.0 ./src/post-py
docker build -t "$USER"/reddit_comment:1.0 ./src/comment
docker build -t "$USER"/reddit_ui:1.0 ./src/ui
