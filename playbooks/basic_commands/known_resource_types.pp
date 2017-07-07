krt
include stdlib
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
define repl::class_test2(
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
krt