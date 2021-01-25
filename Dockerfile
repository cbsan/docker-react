FROM node:lts-stretch

RUN apt update && apt install -y \
    zip \
    libgtk-3-0 \
    libgconf-2-4 \
    libasound2 \
    libxtst6 \
    libxss1 \
    libnss3 \
    libgtk2.0-0 \
    xvfb \
    apt-transport-https

RUN curl -fSL "https://github.com/infinitered/reactotron/releases/download/v2.17.1/reactotron-app_2.17.1_amd64.deb" -o /tmp/reactotron.deb \
    && apt install -y /tmp/reactotron.deb \
    #&& ln -sF /opt/Reactotron/Reactotron /usr/local/bin/Reactotron \
    && rm -f /tmp/reactotron.deb

RUN set -xe \
    && npm_pkg="\
    yarn \
    nodemon" \
    && npm i -g $npm_pkg --unsafe-perm=true --allow-root \
    && yarn global add create-react-app

RUN Xvfb -screen 1280x2000x32 :0 & export DISPLAY=:0

WORKDIR /usr/src/app

EXPOSE 3000 9090
