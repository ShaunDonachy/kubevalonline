#!/bin/bash

set -e -x

pushd kubevalonline
    make linux darwin
popd