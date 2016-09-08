:set loglevel debug
hiera('key3')
class foobar(
  $var1,
  $var2
){
  file{$var1: ensure => present }
}
include foobar
hiera('foobar::var2')
classes
resources