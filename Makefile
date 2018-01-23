NAME=kubevalonline
IMAGE_NAME=shaundonachy/$(NAME)
PACKAGE_NAME=github.com/shaundonachy/$(NAME)
GOFMT_FILES?=$$(find . -name '*.go' | grep -v vendor)
TAG=0.0.0# $$(git describe --abbrev=0 --tags)

HAS_DEP := $(shell command -v dep;)

clean:
	rm -rf bin

test:
	go test -timeout 30s -cover \
	github.com/shaundonachy/kubevalonline/api \
	github.com/shaundonachy/kubevalonline/app

vendor:
	ifndef HAS_DEP
		go get -u github.com/golang/dep/cmd/dep
	endif
	dep ensure

coveralls: vendor
	$(GOPATH)/bin/goveralls -service=travis-ci

darwin: vendor
	env GOOS=darwin GOAARCH=amd64 go build -v -o $(CURDIR)/bin/darwin/amd64/$(NAME) ./cmd/$(NAME)

linux: vendor
	echo "linux..."
	env GOOS=linux GOAARCH=amd64 go build -v -o $(CURDIR)/bin/linux/amd64/$(NAME) ./cmd/$(NAME)

docker:
	docker build -t $(IMAGE_NAME):$(TAG) .
	docker tag $(IMAGE_NAME):$(TAG) $(IMAGE_NAME):latest

