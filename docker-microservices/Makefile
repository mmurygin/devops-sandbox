include .env
export

all: prometheus grafana post comment ui

.PHONY: prometheus
prometheus:
	docker-compose build prometheus
	docker push "${DOCKER_USER}"/reddit_prometheus:"${REDDIT_PROMETHEUS_VERSION}"

.PHONY: grafana
grafana:
	docker-compose build grafana
	docker push "${DOCKER_USER}"/reddit_grafana:"${REDDIT_GRAFANA_VERSION}"

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
