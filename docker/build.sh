DOCKER_LOGIN="$1"

docker pull mongo:latest
docker build -t "$DOCKER_LOGIN"/post:1.0 ./post-py
docker build -t "$DOCKER_LOGIN"/comment:1.0 ./comment
docker build -t "$DOCKER_LOGIN"/ui:1.0 ./ui
