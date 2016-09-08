#!/usr/bin/env bash
# run this file to run to execute the setup script in a container
# once inside the container you will need to run setup
which docker
if [[ $? -ne 0 ]]; then
  echo "You need docker installed, first"
  exit 1
fi
docker run --rm -v ${PWD}:/myapp --workdir /myapp --hostname=repldemo -ti logicminds/puppet-repl-demo /bin/bash /myapp/start_container.sh
