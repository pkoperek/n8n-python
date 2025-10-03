#!/bin/bash

IMAGE=pkoperek/n8n-python
TAG=${1:-"1.113.3"}
PUSH=${2:-false}

docker buildx build \
  -t ${IMAGE}:${TAG} \
  -t ${IMAGE}:latest \
  --platform linux/amd64,linux/arm64 \
  --build-arg UPSTREAM_TAG=${TAG} \
  -f Dockerfile .

if [[ "${PUSH}" == "true" ]]; then
	echo "Pushing to dockerhub"

  docker push ${IMAGE}:${TAG}
  docker push ${IMAGE}:latest
fi
