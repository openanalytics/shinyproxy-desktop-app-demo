#!/usr/bin/env sh

set -e
set -x

cd docker-ubuntu-vnc-desktop
patch -p1 < ../docker-ubuntu-vnc-desktop_web.patch
docker build -t shinyproxy-desktop-app-demo-base:20.04 .
patch -p1 < ../docker-ubuntu-vnc-desktop_16.patch
docker build -t shinyproxy-desktop-app-demo-base:16.04 .
cd ..

cd phaedra
docker build -t shinyproxy-desktop-app-demo:phaedra .
cd ..

cd vscode
docker build -t shinyproxy-desktop-app-demo:vscode .
cd ..
