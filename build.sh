#!/bin/bash



SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $SCRIPTPATH
docker run --rm -v $SCRIPTPATH:/app treeder/bump patch
