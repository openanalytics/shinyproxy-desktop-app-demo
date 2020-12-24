FROM shinyproxy-desktop-app-demo-base:16.04

RUN cd /tmp && curl -OL https://www.phaedra.io/downloads/phaedra_1.0.9_amd64.deb \
    && dpkg -i phaedra_1.0.9_amd64.deb  \
    && rm -f phaedra_1.0.9_amd64.deb

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      libgtk2.0-0 \
      libswt-gnome-gtk-4-jni \
      libgomp1 \
      r-base \
      openjdk-8-jdk \
    && apt-get remove -y firefox chromium-browser \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* var/cache/apt/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


ENV USER phaedra
