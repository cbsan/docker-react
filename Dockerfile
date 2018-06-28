FROM node:10-jessie

RUN apt update && apt install -y \
    zip \
    libgtk-3-0 \
    libgconf-2-4 \
    libasound2 \
    libxtst6 \
    libxss1 \
    libnss3 \
    xvfb

RUN curl -fSL "https://github.com/infinitered/reactotron/releases/download/v1.15.0/Reactotron-linux-x64.zip" -o /tmp/reactotron.zip \
    && unzip /tmp/reactotron.zip -d /opt \
    && ln -sF /opt/Reactotron/Reactotron /usr/local/bin/Reactotron \
    && rm -f /tmp/reactotron.zip

RUN set -xe \
    && npm_pkg="\
    yarn \
    nodemon" \
    && npm i -g $npm_pkg --unsafe-perm=true --allow-root \
    && yarn global add create-react-app

RUN Xvfb -screen 1280x2000x32 :0 & export DISPLAY=:0

WORKDIR /usr/src/app

EXPOSE 3000 9090
