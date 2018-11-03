#!/bin/bash

ENV=$1
TAG="qa-v$(cat VERSION)"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH
docker run --rm -v $SCRIPTPATH:/app treeder/bump patch
git add . && git commit -m "Version bump [skip ci]"
git tag $TAG

git push origin master
git push origin $TAG
