FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /chore-calendar
WORKDIR /chore-calendar
ADD Gemfile /chore-calendar/Gemfile
RUN bundle install
ADD . /chore-calendar