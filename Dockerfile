FROM golang:1.11-alpine as builder

ADD https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 /usr/bin/dep

WORKDIR $GOPATH/src/bitbucket.org/haphan/echo-app

COPY Gopkg.toml Gopkg.lock ./

RUN chmod +x /usr/bin/dep && \
    apk --update add git && \
    dep ensure -v --vendor-only

COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /app .

FROM alpine:3.8

COPY --from=builder /app /srv/app

EXPOSE 8080

WORKDIR /srv

HEALTHCHECK --interval=5s --timeout=1s \
  CMD wget --quiet --tries=1 --spider --user-agent healthcheck http://127.0.0.1:8080/ || exit 1

ENTRYPOINT ["/srv/app"]
