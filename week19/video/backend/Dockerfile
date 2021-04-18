FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
    runtime-deps \
    build-base \
    libxml2-dev \
    libxslt-dev \
    sqlite-dev \
    nodejs \
    yarn \
    libffi-dev \
    git \
    tzdata \
    && rm -rf /var/cache/apk/*

RUN gem install sqlite3 -v '1.4.2' --source 'https://rubygems.org'

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install

ENTRYPOINT [ "bin/rails" ]
CMD ["s", "-b", "0.0.0.0"]
EXPOSE 3000
