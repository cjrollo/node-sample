#!/bin/bash
VERSION="1.0.0.4.${BUILD_NUMBER:-99}"
IMAGE=rollo/node-sample
ID=$(docker build  -t ${IMAGE}  .  | tail -1 | sed 's/.*Successfully built \(.*\)$/\1/')

docker tag ${ID} ${IMAGE}:${VERSION}
docker tag ${ID} ${IMAGE}:latest

docker login -u $DOCKER_USER -p $DOCKER_PWD -e rollo.nike@gmail.com

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest
