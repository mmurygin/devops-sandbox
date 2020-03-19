include .env
export

all: prometheus post comment ui

.PHONY: prometheus
prometheus:
	docker-compose build prometheus
	docker push "${DOCKER_USER}"/reddit_prometheus:"${PROMETHEUS_VERSION}"

.PHONY: post
post:
	cd src/post-py && ./docker_build.sh
	docker push "${DOCKER_USER}"/reddit_post:"${POST_VERSION}"

.PHONY: comment
comment:
	cd src/comment && ./docker_build.sh
	docker push "${DOCKER_USER}"/reddit_comment:"${COMMENT_VERSION}"

.PHONY: ui
ui:
	cd src/ui && ./docker_build.sh
	docker push "${DOCKER_USER}"/reddit_ui:"${UI_VERSION}"
