FROM ruby:2.7.1-alpine
RUN apk update && apk add --no-cache \
  build-base \
  postgresql-client \
  postgresql-dev \
  tzdata \
  openssl \
  imagemagick file \
  vim \
  nodejs

WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler && bundle install

COPY . ./

EXPOSE 3002

