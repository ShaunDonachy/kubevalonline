#!/bin/bash

set -e -x

pushd kubevalonline
    echo $GOPATH
    echo `pwd`
    mv kubevalonline $GOPATH/src/github.com/kubevalonline
    make linux darwin
popd