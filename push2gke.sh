#!/bin/bash
set -e
IMAGE_BASE=gcr.io/homin-dev 

IMAGE_NAME=wikidata
IMAGE_TAG=$IMAGE_BASE/$IMAGE_NAME:latest
docker buildx build --platform linux/amd64 \
  -t $IMAGE_TAG -f $IMAGE_NAME.dockerfile .
docker push $IMAGE_TAG

IMAGE_NAME=nginx-php
IMAGE_TAG=$IMAGE_BASE/$IMAGE_NAME:latest
docker buildx build --platform linux/amd64 \
  -t $IMAGE_TAG -f $IMAGE_NAME.dockerfile .
docker push $IMAGE_TAG

IMAGE_NAME=php-fpm-wiki
IMAGE_TAG=$IMAGE_BASE/$IMAGE_NAME:latest
docker buildx build --platform linux/amd64 \
  -t $IMAGE_TAG -f $IMAGE_NAME.dockerfile .
docker push $IMAGE_TAG