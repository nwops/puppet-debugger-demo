#!/usr/bin/bash

script_file="./demo_scripts/repl_scripts/repl_as_a_debugger.pp"
docker run --rm -v ${HOME}/.ssh:/home/puppet/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-repl-demo-talk prepl -q -p $script_file

