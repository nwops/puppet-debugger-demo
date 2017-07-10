#!/usr/bin/bash

docker run --rm -v ${HOME}/.ssh:/home/puppet/.ssh -v ${HOME}/github/puppetlabs-ntp:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-debugger-demo bash


