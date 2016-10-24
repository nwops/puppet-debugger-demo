FROM ruby:2.2
RUN gem update bundler
RUN apt-get update && apt-get install -y vim tree
COPY Gemfile* /module/
RUN cd /module && bundle install
COPY update_hiera_config.rb ./myapp/update_hiera_config.rb
COPY hieradata/hiera.yaml /myapp/hieradata/hiera.yaml
COPY setup.sh /myapp/setup.sh
RUN cd /myapp && bash /myapp/setup.sh
