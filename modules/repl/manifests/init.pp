class repl (
  String $var1 = 'value1'


) {
  file{'/tmp/test': ensure => present}
  start_repl()
  file{'/tmp/tes2t': ensure => present}

}
