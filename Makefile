#/bin/bash

DK=docker
DK_DIR=./docker
TAG=latest

build:
	$(DK) build -t cbsan/react:$(TAG) .
