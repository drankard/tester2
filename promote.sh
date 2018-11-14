#!/bin/bash

ENV=$1
VERSION="$(cat VERSION)"
TAG="${ENV}-v${VERSION}"

git tag $TAG
git push origin $TAG
