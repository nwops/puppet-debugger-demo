#!/usr/bin/env bash
cp ../Gemfile* ./
docker build --rm -t logicminds/puppet-repl-demo:latest .
docker push logicminds/puppet-repl-demo:latest
