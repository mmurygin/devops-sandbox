#!/bin/bash

set -e

export $(grep -v '^#' .env | xargs)

function build_img() {
    local service="$1"

    cd src/"$service"
    ./docker_build.sh

    cd -
}

build_img post-py
build_img comment
build_img ui
