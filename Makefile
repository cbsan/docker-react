#/bin/bash

DK=docker
DK_DIR=./docker
TAG=electron

build:
	$(DK) build -t cbsan/react:$(TAG) .
