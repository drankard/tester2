#!/bin/bash

ENV=$1
VERSION="$(cat VERSION)"
TAG="$ENV-v$VERSION"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH
ls -la
docker run --rm -v $SCRIPTPATH:/app treeder/bump patch
git add . && git commit -m "Version $VERSION promoted to $ENV [skip ci]"
git tag $TAG

git push origin master
git push origin $TAG
