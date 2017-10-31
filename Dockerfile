FROM ruby:2.3-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs imagemagick libmagickwand-dev

ENV RAILS_ROOT /usr/app
RUN mkdir -p $RAILS_ROOT/tmp/pids
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
ENV BUNDLE_PATH /gems
RUN gem install bundler
RUN bundle install

COPY . .
