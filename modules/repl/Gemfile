source "https://rubygems.org"

group :test do
    gem "rake"
    gem "puppet", ENV['PUPPET_VERSION'] || '~> 4.3'
    gem "rspec-puppet"
    gem "puppetlabs_spec_helper"
    gem "metadata-json-lint"
    gem 'puppet-syntax'
    gem 'puppet-lint'
    gem 'puppet-repl', :git => 'https://github.com/nwops/puppet-repl'
end

group :development do
    gem "travis"
    gem "travis-lint"
    gem "puppet-blacksmith"
    gem "guard-rake"
    gem "pry"
end
