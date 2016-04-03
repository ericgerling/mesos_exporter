#!/bin/bash -e

imagename=$1
if [ -z $imagename ]; then
    imagename="mesos-exporter"
fi

godepscmd=$(which godep)
if [ -z $godepscmd ]; then
    echo "Godeps not found. go get github.com/tools/godep"
    exit 1
fi

$godepscmd save

docker run --rm \
    -v "$(pwd):/src" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e OUTPUT=mesos-exporter \
    centurylink/golang-builder $imagename
