#!/bin/bash

docker rm -f mongo post comment ui

docker network rm reddit_backend
docker network rm reddit_frontend

if [[ "$1" = "-v" ]]; then
  docker volume rm reddit_db
fi
