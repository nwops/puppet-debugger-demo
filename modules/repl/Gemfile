source "https://rubygems.org"

group :test do
    gem "rake"
    gem "puppet", ENV['PUPPET_VERSION'] || '~> 3.8.5'
    gem "rspec-puppet"
    gem "puppetlabs_spec_helper"
    gem "metadata-json-lint"
    gem 'puppet-syntax'
    gem 'puppet-lint'
end

group :development do
    gem "travis"
    gem "travis-lint"
    gem "puppet-blacksmith"
    gem "guard-rake"
    gem 'puppet-repl', '>= 0.1'
end
