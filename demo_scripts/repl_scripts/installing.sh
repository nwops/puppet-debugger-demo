#!/usr/bin/env bash

# must be greater puppet greater >= 3.8
puppet_version='4.6'

# ruby version must be supported by puppet version
# Note: puppet < 4.0 does not support ruby > 2.1
#
ruby --version
echo "gem install puppet -v $puppet_version"
gem install puppet -v $puppet_version

# install the repl
echo "gem install puppet-repl"
gem install puppet-repl


# start the repl
echo "puppet debugger"
puppet debugger