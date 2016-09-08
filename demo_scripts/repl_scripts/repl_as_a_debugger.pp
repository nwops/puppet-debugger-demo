$result1 = range(1,5).map |$num| {
  $filename = "/tmp/test${num}.txt"
  start_repl()
  file{$filename: ensure => present}
}