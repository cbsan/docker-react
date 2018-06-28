#/bin/bash

DK=docker
DK_DIR=./docker

build:
	$(DK) build -t cbsan/react:latest .
