#!/usr/bin/env bash

set -e
set -x

git submodule update --init --recursive

pushd docker-ubuntu-vnc-desktop
git apply ../docker-ubuntu-vnc-desktop_web.patch || true
docker build -t shinyproxy-desktop-app-demo-base:20.04 .
git apply ../docker-ubuntu-vnc-desktop_16.patch || true
docker build -t shinyproxy-desktop-app-demo-base:16.04 .
popd

pushd phaedra
docker build -t shinyproxy-desktop-app-demo:phaedra .
popd

pushd vscode
docker build -t shinyproxy-desktop-app-demo:vscode .
popd
