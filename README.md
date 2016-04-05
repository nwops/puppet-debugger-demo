# puppet-repl-demo
A demo repo for showing off the puppet-repl

## Setup
In order to run through this demo you need to setup a few things.

### Install the required gems
This can be done in a few ways.  
1. run `bundle install` from base project directory
2. Install the gems manually
  ```
  gem install 'puppet-repl'
  gem install 'librarian-puppet'
  ```

### Setup your puppet config
Edit your puppet config file which can be located by running: `puppet config print config`

The settings below should point to the puppet-repl-demo directory.
You will need to Swap out the `/Users/cosman/github` for your path.
```
[main]
environment = production
environmentpath = /Users/cosman/github/puppet-repl-demo/environments
basemodulepath = /Users/cosman/github/puppet-repl-demo/modules
hiera_config = /Users/cosman/github/puppet-repl-demo/hieradata/hiera.yaml
```

### Install
### Create a site.pp
If you want to set topscope variables for use in the repl you need to define them in
your site.pp file.  So just edit the following file and define whatever you like.

`./puppet-repl-demo/environments/production/manifests/site.pp`

### Setup hiera
The data directory for hiera for this demo is hard coded so please update to match your system's
directory path. There is no manipulation of data going on so this could also point to
your real hiera data as well.  Please edit `/Users/cosman/github/puppet-repl-demo/hieradata/hiera.yaml` to
match your path.

```yaml
:yaml:
  :datadir: '/Users/cosman/github/puppet-repl-demo/hieradata/data'
```

By default this will use the demo hiera data and config.  But there is nothing stopping you from
using your own hiera config.  Change the config in your puppet.conf file to use a different hiera config file and load up real data.

`hiera_config = /Users/cosman/github/puppet-repl-demo/hieradata/hiera.yaml`


### Puppet Master command for cert setup
If this is your development machine and you need a puppet signed cert you can run `puppet master --no-daemonize` as a hack to quickly create a ca and cert. There are only a few use cases for doing this.

Other option would be to run `puppet agent` and get a signed cert from your master.

None of this is required unless you are using a function like `node_encrypt` that uses
certs and private keys to encrypt data.


## Demo Sections
### Debug Level
:set loglevel debug
### Scope
#### Topscope
You can set your topscope by define variables inside the site.pp file.

Edit `./puppet-repl-demo/environments/production/manifests/site.pp` to set new variables

### Facts
facts

### Regexes

$::hostname =~ /foo/

### Resource
file{'/tmp/test2.txt': ensure => present, mode => '0755'}

file{'/tmp/test': ensure => present, mode => 755}

### Maps
['/tmp/test3', '/tmp/test4'].map |String $path| { file{$path: ensure => present} }

### Each
['/tmp/test3', '/tmp/test4'].each |String $path| { file{$path: ensure => present} }

### Known Resource Types
include apache

krt
