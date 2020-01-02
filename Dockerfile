FROM ruby:2.6.5-alpine3.9

RUN echo 'gem: --no-document' >> /etc/gemrc

# needed at runtime
RUN apk add --no-cache \
  libcurl

RUN apk add --no-cache --virtual build-dependencies \
  build-base \
  libxml2-dev \
  libxslt-dev \
  && gem install html-proofer --version 3.15.0 \
  && apk del build-dependencies

ENTRYPOINT ["htmlproofer"]
CMD ["--help"]
