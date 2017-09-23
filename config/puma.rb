#!/usr/bin/env puma

directory '/home/rails/slatejob'
rackup "/home/rails/slatejob/config.ru"
environment 'production'

tag ''

pidfile "/home/rails/slatejob/shared/tmp/pids/puma.pid"
state_path "/home/rails/slatejob/shared/tmp/pids/puma.state"
stdout_redirect '/home/rails/slatejob/shared/log/puma_access.log', '/home/rails/slatejob/shared/log/puma_error.log', true


threads 0,16



bind 'unix:///home/rails/slatejob/shared/tmp/sockets/puma.sock'

workers 1





prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/rails/slatejob/current/Gemfile"
end


