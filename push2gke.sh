#!/bin/bash
set -e
IMAGE_TAG=gcr.io/homin-dev/wiki:latest 
docker buildx build --platform linux/amd64 -t $IMAGE_TAG .
docker push $IMAGE_TAG
