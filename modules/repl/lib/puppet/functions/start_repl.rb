begin
  require '/Users/cosman/github/puppet-repl/lib/puppet-repl.rb'
rescue LoadError => e
    Puppet.err('you must install the puppet-repl gem')
end

Puppet::Functions.create_function(:start_repl, Puppet::Functions::InternalFunction) do
  # the function below is called by puppet and and must match
  # the name of the puppet function above.
  dispatch :start_repl do
    scope_param
  end

  def start_repl(scope)
    ::PuppetRepl::Cli.start(scope: scope)
  end
end
