#!/usr/bin/env bash

IMAGE=thetemplateblog/squid-proxy
TAG="${1:-latest}"
while true; do
    read -p "Are you sure you want to build/rebuild this image? [Y/N]" answer
    case $answer in
        [Yy]) break;;
        [Nn]) echo "Aborting image build"; exit;;
        *) ;;
    esac
done
echo "Starting image build"
docker container rm "$IMAGE" 2>/dev/null
docker build -t "$IMAGE:$TAG" .
docker tag $IMAGE:$TAG $IMAGE:latest

docker push $IMAGE:$TAG 
docker push $IMAGE:latest
