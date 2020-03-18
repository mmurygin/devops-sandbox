include .env
export

all: build push

build: prometheus post comment ui

prometheus:
	docker-compose build prometheus

post:
	cd src/post-py && ./docker_build.sh

comment:
	cd src/comment && ./docker_build.sh

ui:
	cd src/ui && ./docker_build.sh

push: build
	docker push "${DOCKER_USER}"/reddit_comment:"${COMMENT_VERSION}"
	docker push "${DOCKER_USER}"/reddit_post:"${POST_VERSION}"
	docker push "${DOCKER_USER}"/reddit_ui:"${UI_VERSION}"
	docker push "${DOCKER_USER}"/reddit_prometheus:"${PROMETHEUS_VERSION}"
