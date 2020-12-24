FROM shinyproxy-desktop-app-demo-base:20.04

RUN apt-get update && cd /tmp && curl -o code.deb -LO https://go.microsoft.com/fwlink/?LinkID=760868  \
    && apt install -y ./code.deb  \
    && rm -f code.deb \
    && apt-get remove -y firefox chromium-browser \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* var/cache/apt/*

RUN useradd --create-home --shell /bin/bash --user-group --groups adm,sudo code \
    && mkdir /home/code/Workspace

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD settings.json /home/code/.config/Code/User/settings.json

ENV USER code
