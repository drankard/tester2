#!/bin/bash

ENV=$1
VERSION="$(cat VERSION)"
TAG="${ENV}-v${VERSION}"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH
echo "Executing docker"
ls -l $SCRIPTPATH
docker run --rm -v ${PWD}:/app treeder/bump patch
echo "Updating git"

git add . && git commit -m "Version $VERSION $ENV [skip ci]"
git tag $TAG

git push origin master
git push origin $TAG
