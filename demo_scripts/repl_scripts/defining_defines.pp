resources
classes
class repl::class_test(
  String $var1,
  String $file_name,
  Boolean $enable_feature = true,
) {
  if $enable_feature {
    $content = 'enabled_feature'
  } else {
    $content = $var1
  }
  file{$file_name:
    ensure  => present,
    mode    => '0755',
    owner   => 'corey',
    content => $content,
  }
}
class{'repl::class_test':
  var1           => 'foobar',
  enable_feature => true,
  file_name      => '/tmp/test2.txt'
}
resources
classes