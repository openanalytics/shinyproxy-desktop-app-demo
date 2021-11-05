# Running Desktop apps in ShinyProxy

[Screenshots](#screenshots)

This repository contains two demos of running desktop apps using ShinyProxy. The
first demo demonstrates running [Phaedra](https://phaedra.io) while the second
demo show how to run Visual Studio Code.

**Note**: we have dedicated [demo](https://github.com/openanalytics/shinyproxy-vscode-demo) for running VS code as a native webapp
inside ShinyProxy.

We make extensively use of the great
[docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop)
project.

## Building the Docker images

In order to build the Docker images, simply execute the `build.sh` script. This
script first builds two base images (one for Ubuntu 16.04 and one for 20.04).
Next, it builds `shinyproxy-desktop-app-demo:phaedra` and
`shinyproxy-desktop-app-demo:vscode` containing the respective applications. You
can also simply down the images from [Docker
Hub](https://hub.docker.com/r/openanalytics/shinyproxy-desktop-app-demo).

## ShinyProxy configuration

The following configuration is all what is needed to run these applications inside ShinyProxy:

```yaml
- id: phaedra
  container-image: openanalytics/shinyproxy-desktop-app-demo:phaedra
  port: 80
  websocket-reconnection-mode: None
  container-env:
    # Use the following line when using ShinyProxy 2.6.0 or later
    RELATIVE_URL_ROOT: "#{proxy.getRuntimeValue('SHINYPROXY_PUBLIC_PATH')}"
    # Use the following line when using ShinyProxy 2.5.0
    # RELATIVE_URL_ROOT: "#{proxySpec.containerSpecs[0].env.get('SHINYPROXY_PUBLIC_PATH')}"
- id: vscode
  container-image: openanalytics/shinyproxy-desktop-app-demo:vscode
  port: 80
  websocket-reconnection-mode: None
  container-env:
    # Use the following line when using ShinyProxy 2.6.0 or later
    RELATIVE_URL_ROOT: "#{proxy.getRuntimeValue('SHINYPROXY_PUBLIC_PATH')}"
    # Use the following line when using ShinyProxy 2.5.0
    # RELATIVE_URL_ROOT: "#{proxySpec.containerSpecs[0].env.get('SHINYPROXY_PUBLIC_PATH')}"
```

## How does this work?

The [docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop) project is a Docker container which contains the following components:

- LXDE
- xvfb
- x11vnc
- noVNC
- nginx
- superverisor
- a web app to manage everything

The idea is to have an X server (xvfb), running a desktop environment (LXDE),
this is exposed by VNC server (x11vnc) using a web app (nginx/python/vue/noVNC).
All these processes are managed by supervisor such that it fits in a single
Docker container.

## Screenshots

![Phaedra](.github/screenshots/phaedra.png)
![VS Code](.github/screenshots/vscode.png)

**(c) Copyright Open Analytics NV, 2021.**
