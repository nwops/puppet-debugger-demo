[![Build Status](https://travis-ci.org/nwops/puppet-repl-module.svg?branch=master)](https://travis-ci.org/nwops/puppet-repl-module)

# Puppet Repl
This module contains a function `start_repl` and is for use with the
[puppet-repl gem](https://github.com/nwops/puppet-repl).

The function is used for starting the puppet repl from inside the puppet code.

The function will inject the scope, node and environment data into the repl and will
allow you to poke around to see variables, functions, facts, classes, and resources defined in the current scope.

## Requirements
Ensure you have installed the puppet-repl gem `gem install puppet-repl`
or place this in your Gemfile `gem 'puppet-repl', '>= 0.3'` for your puppet module.

This also requires puppet 3.8+ with future parser enabled.

You will also want to include this module in your fixtures file if using for rspec-puppet
unit testing.

```
repl:
   repo: https://github.com/nwops/puppet-repl-module
```

## Usage
**DO NOT RUN THIS ON YOUR PUPPET SERVER OR IN PRODUCTION**

Planes will fall out of the sky, and kittens will die.  Do you really want that?
Although there is a safety mechanism to prevent the this function from being called
under a daemonized puppet run.  

In order to start the puppet-repl from within code just place the `start_repl()`
function inside your manifest code where you want the scope to be injected.
This will automatically call the repl `whereami` command and show where in the code
the `start_repl()` function was called from.  This makes it obvious where in the code
you are evaulating from.  This gives you the ability to step through your codce.  To goto 
the next iteration just use the `exit` command and the compiler will continue to compile where it previously left of. 

Example:

```puppet
class repl::repl_test(
  $var1 = 'value1',
  $var2 = ['value1', 'value2', 'value3']
)
{
  # dummy resources so we can show list of resources
  file{'/tmp/test.txt': ensure => present, mode => '0755'}
  service{'httpd': ensure => running}

  # how to find values with an empheral scope
  $var2.each | String $item | {
    file{"/tmp/${item}": ensure => present}
    start_repl({'run_once' => true})
  }
  start_repl({'run_once' => true})
  if $var1 == 'value1' {
    start_repl({'run_once' => true})
  }
}
```

Example Repl session when inside the each block.  Notice the item variable.

```ruby
Ruby Version: 2.3.1
Puppet Version: 4.7.0
Puppet Repl Version: 0.3.3
Created by: NWOps <corey@nwops.io>
Type "exit", "functions", "vars", "krt", "whereami", "facts", "resources", "classes",
     "play", "classification", "reset", or "help" for more information.

          8:   service{'httpd': ensure => running}
          9:
         10:   # how to find values with an empheral scope
         11:   $var2.each | String $item | {
         12:     file{"/tmp/${item}": ensure => present}
      => 13:     start_repl({'run_once' => false})
         14:   }
         15:   start_repl({'run_once' => false})
         16:   if $var1 == 'value1' {
         17:     start_repl({'run_once' => false})
         18:   }
1:>> $item
 => "value1"
>>
```

If using with rspec-puppet, only the facts you define in your test suite will be present in the repl.

For more information on how to use the puppet repl please refer to the [documentation](https://github.com/nwops/puppet-repl)
## Troubleshooting
This module and puppet-repl gem are very new, there will be bugs.  Please
file them at [puppet-repl gem](https://github.com/nwops/puppet-repl/issues).
