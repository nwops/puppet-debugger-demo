#!/usr/bin/env bash

alias ruby22='docker run --rm -v ${HOME}/.ssh:/root/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=ruby225 -ti ruby:2.2.5 /bin/bash'

# must be greater puppet greater >= 3.8
puppet_version='4.6'

# ruby version must be supported by puppet version
# Note: puppet < 4.0 does not support ruby > 2.1
#
ruby --version
gem install puppet -v $puppet_version

# install the repl
gem install puppet-repl


# start the repl
prepl