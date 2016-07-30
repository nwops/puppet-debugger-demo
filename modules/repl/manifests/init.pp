class repl (
  $gem_provider = 'gem'

) {
  package{'puppet-repl':
    ensure   => present,
    provider => $gem_provider,
  }
}
