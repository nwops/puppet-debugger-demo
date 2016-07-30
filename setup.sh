#!/usr/bin/bash
# Setups up the demo and local environment in order to use with the puppet repl
# Install dependencies
if [ `gem list -i puppet-repl -v '>=0.3.0'` == 'false' ]; then
   gem install puppet-repl --no-rdoc --no-ri # forces puppet install unless already present
fi
if [ `gem list -i librarian-puppet` == 'false' ]; then
   gem install librarian-puppet --no-rdoc --no-ri
fi

# Install puppet modules
# librarian-puppet install
#
# # configuration
this_directory=`ruby -e "puts File.expand_path(File.dirname(__FILE__))"`
module_path="${this_directory}/modules"
repl_demo_dir=$this_directory
hiera_data_dir="${repl_demo_dir}/hieradata/data"
hiera_config="${repl_demo_dir}/hieradata/hiera.yaml"
puppet_config_file=`puppet config print config`
config_base_dir=`dirname $puppet_config_file`
mkdir -p $config_base_dir
touch $puppet_config_file
# setup puppet configuration
echo "Configuring Puppet, please wait"
puppet config set environment production --section main
puppet config set environmentpath "${repl_demo_dir}/environments" --section main
puppet config set basemodulepath "${repl_demo_dir}/modules" --section main
puppet config set hiera_config "${hiera_config}" --section main
# # the cert is required for node_encrypt and other ssl type functions to work
puppet cert list --all |grep `facter fqdn` > /dev/null
if [ $? -ne 0 ]; then
  puppet cert generate `facter fqdn`
fi

# setup hiera config
ruby update_hiera_config.rb $hiera_data_dir $hiera_config
