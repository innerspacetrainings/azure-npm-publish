FROM alpine:3

RUN apk --no-cache add git nodejs-npm perl

COPY LICENSE README.md default.npmrc /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
