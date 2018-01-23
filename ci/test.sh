#!/bin/bash

set -e -x

mkdir -p $GOPATH/src/github.com/shaundonachy/
cp -R ./kubevalonline $GOPATH/src/github.com/shaundonachy/.

cd $GOPATH/src/github.com/shaundonachy/kubevalonline

# RUN unit_tests and it shows the percentage coverage
# print to stdout and file using tee
make test | tee test_coverage.txt
# add some whitespace to the begining of each line
sed -i -e 's/^/     /' test_coverage.txt

# Move to coverage-results directory.
mv test_coverage.txt $GOPATH/coverage-results/.
