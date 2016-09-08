#!/usr/bin/bash

script_file="./demo_scripts/repl_scripts/displaying_resources.pp"
docker run --rm -v ${HOME}/.ssh:/home/puppet/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-repl-demo-talk prepl -p $script_file

