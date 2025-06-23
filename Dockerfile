FROM alpine:3.21

RUN mkdir -p /dist/

COPY dist/ /dist/
