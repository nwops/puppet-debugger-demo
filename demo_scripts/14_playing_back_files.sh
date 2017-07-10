#!/usr/bin/bash

docker run --rm -v ${HOME}/.ssh:/home/puppet/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-debugger-demo puppet debugger -p https://gist.github.com/logicminds/0af0673db342808530ee654fd5bcf6c9

