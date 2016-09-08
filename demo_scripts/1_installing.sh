#!/usr/bin/env bash

docker run --rm -v ${HOME}/.ssh:/root/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=ruby225 -ti logicminds/repldemo bash ./demo_scripts/repl_scripts/installing.sh