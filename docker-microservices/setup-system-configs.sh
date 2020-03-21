#!/bin/bash

set -e

echo "Setting up docker-host to allow the run of elasticsearch"
docker-machine ssh docker-host "echo vm.max_map_count=262144 | sudo tee /etc/sysctl.d/99-elasticsearch.conf >/dev/null"

docker-machine ssh docker-host "sudo sysctl -p /etc/sysctl.d/99-elasticsearch.conf"

echo "Done"
