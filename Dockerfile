FROM cbsan/react:latest

RUN dpkg --add-architecture i386 \
    && curl -fSL https://dl.winehq.org/wine-builds/Release.key -o /tmp/Release.key \
    && apt-key add /tmp/Release.key \
    && echo "deb https://dl.winehq.org/wine-builds/debian/ jessie main" > /etc/apt/sources.list.d/winehq.list \
    && apt update && apt install --no-install-recommends -y \
    winehq-stable

RUN set -xe \
    && npm_pkg="\
    electron \
    electron-builder" \
    && npm i -g $npm_pkg --unsafe-perm=true --allow-root