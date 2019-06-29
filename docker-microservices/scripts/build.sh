#!/bin/bash

docker pull mongo:latest
docker build -t post:1.0 ./post-py
docker build -t comment:1.0 ./comment
docker build -t ui:1.0 ./ui
