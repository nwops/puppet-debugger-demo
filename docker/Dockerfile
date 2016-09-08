FROM ruby:2.2
COPY Gemfile* /module/
RUN gem update bundler
RUN cd /module/ && bundle install
RUN apt-get update && apt-get install -y vim
