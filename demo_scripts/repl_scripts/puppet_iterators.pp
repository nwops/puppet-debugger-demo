$result1 = range(1,5).map |$num| {
  $filename = "/tmp/test${num}.txt"
  file{$filename: ensure => present}
}
$result2 = range(6,10).each |$num| {
  $filename = "/tmp/test${num}.txt"
  file{$filename: ensure => present}
}
resources