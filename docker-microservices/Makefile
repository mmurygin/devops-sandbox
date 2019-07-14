include .env
export

all: prometheus post comment ui

.PHONY: prometheus
prometheus:
	docker-compose build prometheus

post:
	cd src/post-py && ./docker_build.sh

comment:
	cd src/comment && ./docker_build.sh

ui:
	cd src/ui && ./docker_build.sh
