#!/usr/bin/env bash
# run this file to run to execute the setup script in a container
# once inside the container you will need to run setup
docker run --rm -v ${HOME}/.ssh:/root/.ssh -v ${PWD}:/myapp --workdir /myapp --hostname=ruby225 -ti ruby:2.2.5 /bin/bash /myapp/start_container.sh
