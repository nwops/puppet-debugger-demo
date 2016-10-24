begin
  require 'puppet-repl'
  if ::PuppetRepl::VERSION >= '0.3.3'
    Puppet.err('You must install the puppet-repl gem version >= 0.3.3')
  end
rescue LoadError => e
  Puppet.err('You must install the puppet-repl: gem install puppet-repl')
end

Puppet::Functions.create_function(:start_repl, Puppet::Functions::InternalFunction) do
  # the function below is called by puppet and and must match
  # the name of the puppet function above.

  def initialize(scope, loader)
    super
    @repl_stack_count = 0
  end

  dispatch :start_repl do
    scope_param
    optional_param 'Hash', :options
  end

  def start_repl(scope, options = {})
    if $stdout.isatty
      options = options.merge({:scope => scope})
      # forking the process allows us to start a new repl shell
      # for each occurrence of the start_repl function
      pid = fork do

        # required in order to use convert puppet hash into ruby hash with symbols
        options = options.inject({}){|data,(k,v)| data[k.to_sym] = v; data}
        options[:source_file], options[:source_line] = stacktrace.last
        # suppress future repl help screens
        @repl_stack_count = @repl_stack_count + 1
        # suppress future repl help screens since we probably started from the repl
        @repl_stack_count = @repl_stack_count + 1 if options[:source_file] =~ /puppet_repl_input/
        options[:quiet] = true if @repl_stack_count > 1
        ::PuppetRepl::Cli.start_without_stdin(options)
      end
      Process.wait(pid)
      @repl_stack_count = @repl_stack_count + 1
    else
     Puppet.warning 'start_repl(): refusing to start the debugger on a daemonized master'
    end
  end

  # returns a stacktrace of called puppet code
  # @return [String] - file path to source code
  # @return [Integer] - line number of called function
  # This method originally came from the puppet 4.6 codebase and was backported here
  # for compatibility with older puppet versions
  # The basics behind this are to find the `.pp` file in the list of loaded code
  def stacktrace
    result = caller().reduce([]) do |memo, loc|
      if loc =~ /\A(.*\.pp)?:([0-9]+):in\s(.*)/
        # if the file is not found we set to code
        # and read from Puppet[:code]
        # $3 is reserved for the stacktrace type
        memo << [$1.nil? ? :code : $1, $2.to_i]
      end
      memo
    end.reverse
  end
end
