#!/usr/bin/env bash

docker-compose up -d
container=`docker ps |grep puppet/puppetserver |cut -f1 -d' '`
docker cp ./repl_scripts/auth.conf ${container}:/etc/puppetlabs/puppetserver/conf.d/auth.conf
docker cp ./repl_scripts/puppetserver.conf ${container}:/etc/puppetlabs/puppetserver/conf.d/puppetserver.conf
docker run -ti ${container} /opt/puppetlabs/puppet/bin/gem install puppet-repl
docker-compose restart puppet
docker-compose run puppet puppet debugger -n puppet_agent2.local
