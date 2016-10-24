#!/usr/bin/env ruby
require 'yaml'
hiera_data_dir = ARGV[0]
hiera_config = ARGV[1]
data = YAML.load_file('hieradata/hiera.yaml')
data[:yaml][:datadir] = hiera_data_dir
File.write(hiera_config, data.to_yaml)
