#!/usr/bin/bash
docker-compose up -d
container=`docker ps |grep puppet/puppetserver |cut -f1 -d' '`
docker cp ./demo_scripts/repl_scripts/auth.conf ${container}:/etc/puppetlabs/puppetserver/conf.d/auth.conf
docker cp ./demo_scripts//repl_scripts/puppetserver.conf ${container}:/etc/puppetlabs/puppetserver/conf.d/puppetserver.conf
docker exec -ti ${container} /opt/puppetlabs/puppet/bin/gem install puppet-repl
docker-compose restart puppet
docker-compose exec puppet bash
docker-compose run repl_agent bash
