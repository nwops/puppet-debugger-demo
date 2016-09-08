<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [puppet-repl-demo](#puppet-repl-demo)
  - [Adding new mdoules for this demo](#adding-new-mdoules-for-this-demo)
  - [Setup for the demo](#setup-for-the-demo)
    - [Isolated docker environment](#isolated-docker-environment)
    - [Automated Install on your system](#automated-install-on-your-system)
    - [Manual Install on your system](#manual-install-on-your-system)
      - [Install the required gems](#install-the-required-gems)
      - [Setup your puppet config](#setup-your-puppet-config)
  - [Additiional Puppet Setup (Optional)](#additiional-puppet-setup-optional)
    - [Create a site.pp](#create-a-sitepp)
    - [Setup hiera](#setup-hiera)
    - [Puppet Master command for cert setup](#puppet-master-command-for-cert-setup)
  - [Demo Sections](#demo-sections)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# puppet-repl-demo
A demo repo for showing off the puppet-repl

## Adding new mdoules for this demo
This demo project maintains a librarian-puppet Puppetfile.  If you want new modules just add them to the Puppetfile.

1. Install librarian-puppet `gem install 'librarian-puppet'`
2. install modules from the Puppetfile by running `librarian-puppet` 

## Setup for the demo
In order to run through this demo you need to setup a few things.

1. Download this repo `git clone https://github.com/nwops/puppet-repl-demo`
2. Install through one of the methods below (docker, automated or manual)

Note: unless you are using the docker method you will change your puppet.conf file and update some settings to use this
project directory as well as install some required gems.

### Isolated docker environment
If you just want to try this out without messing anything up.  Download docker
and then run the `docker_it.sh` script.  

Because the container links the project directory in the container you can write puppet
code, change hiera values or install new modules and the container will use the new files.

This is going to be the easiest thing to do without breaking your local environment.

### Automated Install on your system
`bash setup.sh` from this project directory

While this is pretty simple, the setup script will install a few gems, add a local puppet cert and change a few
puppet settings to work this this demo project.  See the manual steps below for a quick summary of what the script does.

### Manual Install on your system
#### Install the required gems
This can be done in a few ways.  
1. run `bundle install` from base project directory
2. Install the gems manually
  ```
  gem install 'puppet-repl'
  gem install 'librarian-puppet'
  ```

#### Setup your puppet config
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

## Additiional Puppet Setup (Optional)
Using the puppet-repl only requires installation of the gem.  However, to maximize the repl's 
capabilities you should setup your development environment further to work with puppet.

### Create a site.pp
If you want to set topscope variables for use in the repl you need to define them in
your site.pp file.  So just edit the following file and define whatever you like.  While this is for demo
purposes, ideally you already have a site.pp in your puppet source code.

`./puppet-repl-demo/environments/production/manifests/site.pp`


### Setup hiera
The data directory for hiera for this demo is hard coded so please update to match your system's
directory path. There is no manipulation of data going on so this could also point to
your real hiera data as well.  Please edit `./puppet-repl-demo/hieradata/hiera.yaml` to
match your path.

```yaml
:yaml:
  :datadir: '/Users/cosman/github/puppet-repl-demo/hieradata/data'
```

By default this will use the demo hiera data and config.  But there is nothing stopping you from
using your own hiera config.  Change the config in your puppet.conf file to use a different hiera config file and load up real data.

`hiera_config = /Users/cosman/github/puppet-repl-demo/hieradata/hiera.yaml`


### Puppet Master command for cert setup
If this is your development machine and you need a puppet signed cert you can run `puppet cert generate hostname` as a hack to quickly create  cert. There are only a few use cases for doing this.

Other option would be to run `puppet agent` and get a signed cert from your master.

None of this is required unless you are using a function like `node_encrypt` that uses
certs and private keys to encrypt data.


## Demo Sections
The demo scripts are used to auto run a demo in a container.  To use these scripts just run:

`bash ./demo_scripts/<name_of_script>.sh`
