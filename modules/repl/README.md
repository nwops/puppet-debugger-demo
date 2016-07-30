# Puppet Repl
This module contains a function `start_repl` and is for use with the
[puppet-repl gem](https://github.com/nwops/puppet-repl).

The function is used for starting the puppet repl from inside the puppet code.

The function will inject the scope, node and environment data into the repl and will
allow you to poke around to see variables, functions, facts, classes, and resources defined in the current scope.

## Requirements
Ensure you have installed the puppet-repl gem `gem install puppet-repl`
or place this in your Gemfile `gem 'puppet-repl', '>= 0.1'`

This also requires puppet 3.8+ with future parser enabled.

## Usage
**DO NOT RUN THIS ON YOUR PUPPET SERVER OR IN PRODUCTION**

Planes will fall out of the sky, and kittens will die.  Do you really want that?

In order to start the puppet-repl from within code just place the `start_repl()`
function inside your manifest code where you want the scope to be injected.

Example:

```puppet
# dummy resources so we can show list of resources
file{'/tmp/test.txt': ensure => present, mode => '0755'}
service{'httpd': ensure => running}

# how to find values with an empheral scope
$var2.each | String $item | {
  file{"/tmp/${item}": ensure => present}
  start_repl()
}
```

Example Repl session when inside the each block.  Notice the item variable.
```ruby
>> vars
"Facts were removed for easier viewing"
{
 "caller_module_name" => "",
 "item"               => "value1",
 "module_name"        => "repl",
 "name"               => "repl::repl_test",
 "title"              => "repl::repl_test",
 "var1"               => "value1",
 "var2"               => [
  [0] "value1",
  [1] "value2",
  [2] "value3"
 ]
}
>>
```

If using with rspec-puppet, only the facts you define in your test suite will be present in the repl.

## Troubleshooting
This module and puppet-repl gem are very new, there will be bugs.  Please
file them at [puppet-repl gem](https://github.com/nwops/puppet-repl/issues).
