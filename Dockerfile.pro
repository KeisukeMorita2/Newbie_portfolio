FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    node.js \
    vim && \
    rm -rf /var/lib/apt/lists/*
ENV RAILS_ENV production
RUN npm install yarn -g
RUN mkdir /webapp
WORKDIR /webapp
COPY Gemfile /webapp/Gemfile
COPY Gemfile.lock /webapp/Gemfile.lock
RUN bundle install
COPY . /webapp
RUN mkdir -p tmp/sockets
