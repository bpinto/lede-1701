#!/bin/bash

set -e

IMAGE_TAG=lede-imagebuilder


function build_docker_image {
  docker build -t $IMAGE_TAG .
}

function build_lede_image {
  run_cmd_in_container "make image PROFILE='gl-mt300n-v2' PACKAGES='kmod-mt7628 uci2dat mtk-iwinfo' FILES=files/"
}

function run_cmd_in_container {
  docker run \
    -it --rm \
    -v $PWD/files:/src/files \
    $IMAGE_TAG "$@"
}

build_docker_image
build_lede_image
