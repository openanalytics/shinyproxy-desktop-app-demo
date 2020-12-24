#!/usr/bin/env sh

set -e
set -x

cd docker-ubuntu-vnc-desktop
git apply ../docker-ubuntu-vnc-desktop_web.patch || true
docker build -t shinyproxy-desktop-app-demo-base:20.04 .
git apply ../docker-ubuntu-vnc-desktop_16.patch || true
docker build -t shinyproxy-desktop-app-demo-base:16.04 .
cd ..

cd phaedra
docker build -t shinyproxy-desktop-app-demo:phaedra .
cd ..

cd vscode
docker build -t shinyproxy-desktop-app-demo:vscode .
cd ..
