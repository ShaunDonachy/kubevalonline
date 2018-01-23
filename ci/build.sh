#!/bin/bash

set -e -x

echo $GOPATH

mkdir -p $GOPATH/src/github.com/shaundonachy/
cp -R ./kubevalonline $GOPATH/src/github.com/shaundonachy/.
make linux darwin