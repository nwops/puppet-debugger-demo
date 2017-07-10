#!/usr/bin/bash

script_file="./demo_scripts/repl_scripts/repl_as_a_debugger.pp"
docker run --rm -v ${PWD}:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-repl-demo:latest puppet debugger -q -p $script_file

