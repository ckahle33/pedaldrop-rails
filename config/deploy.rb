# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "pedaldrop"
set :repo_url, "git@github.com:ckahle33/pedaldrop.git"

set :deploy_to, "/home/pedaldrop"

# Default value for :linked_files is []
set :linked_files, %w{.env config/database.yml config/secrets.yml}
set :rails_env, -> { fetch(:stage) }

# Default value for linked_dirs is []
# set :linked_dirs, %w{config}
set :linked_dirs, %w{.bundle storage}
