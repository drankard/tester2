#!/bin/bash

ENV=$1
VERSION="$(cat VERSION)"
TAG="${ENV}-v${VERSION}"

docker run --rm -v ${PWD}:/app treeder/bump patch
git add . && git commit -m "Version $VERSION $ENV [skip ci]"
git push origin master

git tag $TAG
git push origin $TAG
