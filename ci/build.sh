#!/bin/bash

set -e -x

echo $GOPATH

mkdir -p $GOPATH/src/github.com/shaundonachy/
cp -R ./kubevalonline $GOPATH/src/github.com/shaundonachy/.
cd $GOPATH/src/github.com/shaundonachy/kubevalonline
make linux darwin