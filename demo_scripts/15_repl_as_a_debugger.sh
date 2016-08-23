bundle exec retrospec puppet new_module -n repl_test
cd repl_test
bundle install --without integration

bundle exec prepl repl_scripts/