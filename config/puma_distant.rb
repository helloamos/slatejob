#!/usr/bin/env puma

directory '/home/rails/rails_project/slatejob'
rackup "/home/rails/rails_project/slatejob/config.ru"
environment 'production'

tag ''

pidfile "/home/rails/rails_project/slatejob/shared/tmp/pids/puma.pid"
state_path "/home/rails/rails_project/slatejob/shared/tmp/pids/puma.state"
stdout_redirect '/home/rails/rails_project/slatejob/shared/log/puma_access.log', '/home/rails/rails_project/slatejob/shared/log/puma_error.log', true


threads 0,16



bind 'unix:///home/rails/rails_project/slatejob/shared/tmp/sockets/puma.sock'

workers 1





prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/root/rails_projects/slatejob/current/Gemfile"
end


