resources
classes
define repl::class_test(
  String $var1,
  String $file_name = $name,
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
repl::class_test{'/tmp/test2.txt':
  var1           => 'foobar',
  enable_feature => true,
  file_name      => '/tmp/test2.txt'
}
resources
krt