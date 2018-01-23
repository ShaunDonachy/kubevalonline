FROM golang:1.9.2-alpine3.7 as builder
RUN apk --no-cache add make git
RUN mkdir -p /go/src/github.com/shaundonachy/kubevalonline/
COPY . /go/src/github.com/shaundonachy/kubevalonline/
WORKDIR /go/src/github.com/shaundonachy/kubevalonline/
RUN make linux

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/src/github.com/shaundonachy/kubevalonline/bin/linux/amd64/kubevalonline .
COPY --from=builder /go/src/github.com/shaundonachy/kubevalonline/app /root/go/src/github.com/donachys/kubevalonline/app
ENTRYPOINT ["/kubevalonline"]
EXPOSE 5000
