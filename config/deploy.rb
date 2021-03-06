# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :stages, %w(production staging)
set :default_stage, "production"

#require 'capistrano/ext/multistage'
#require 'bundler/capistrano'

#set :application, "staging.slatejob.com"
set :repo_url, "https://github.com/helloamos/slatejob.git"

set :branch, "master"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# define multiple deployments



# Default deploy_to directory is /var/www/my_app_name

#set :deploy_to, "/home/deploy/rails_apps/staging.slatejob.com"


set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Config for nginx
set :nginx_config_name, 'slatejob.com'
set :nginx_server_name, 'slatejob.com'
set :puma_workers,1




# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :pty, true
set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: ["~/projects/rails/slatejob/slatejob.pem"]
}
#~/projects/rails/oisepro