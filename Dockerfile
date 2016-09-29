FROM alpine:edge

MAINTAINER Patrick Pokatilo <docker-hub@shyxormz.net>

RUN apk update && apk add \
  openssh \
  ruby \
  ruby-json \
  && gem install --no-rdoc --no-ri bundler io-console \
  && mkdir -pv ~/.ssh \
  && echo -ne "StrictHostKeyChecking no\nLogLevel quiet\n" > ~/.ssh/config \
  && chmod 0600 ~/.ssh/config

COPY check in out /opt/resource/