FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential node.js vim
RUN mkdir /webapp
WORKDIR /webapp
COPY Gemfile /webapp/Gemfile
COPY Gemfile.lock /webapp/Gemfile.lock
RUN bundle install
COPY . /webapp
RUN mkdir -p tmp/sockets
