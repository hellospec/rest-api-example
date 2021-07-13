FROM ruby:2.7.1-alpine
RUN apk update && apk add --no-cache \
  build-base \
  postgresql-client \
  postgresql-dev \
  tzdata \
  openssl \
  vim \
  nodejs \
  yarn

WORKDIR /app
COPY Gemfile* ./
RUN gem install bundler && bundle install

COPY . ./
RUN bundle exec rails assets:precompile

EXPOSE 3001

