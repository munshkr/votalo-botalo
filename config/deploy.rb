require "bundler/capistrano"
require "rvm/capistrano"

set :application, "votalo-botalo"
set :deploy_to, "/home/mapa/#{application}"

require "capistrano-unicorn"

set :user, "mapa"
set :domain, "hhba.info"
set :environment, "production"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :normalize_asset_timestamps, false
set :rvm_ruby_string, '1.9.3-p194@votalo-botalo'
set :rvm_type, :user

set :scm, :git
set :repository, "git://github.com/munshkr/votalo-botalo.git"
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false
set :ssh_options, :forward_agent => true

set :keep_releases, 5

#set :config_files, %w{ }
#
#namespace :deploy do
#  desc "Create symlinks to shared config files"
#  task :create_symlink_shared do
#    config_files.each do |filename|
#      run "ln -nfs #{deploy_to}/shared/config/#{filename}.yml #{release_path}/config/#{filename}.yml"
#    end
#  end
#end
#
#after "deploy:update_code", "deploy:create_symlink_shared"

after "deploy:restart", "unicorn:reload"


def rake(task)
  run "cd #{current_path} && APP_ENV=production bundle exec rake #{task} --trace"
end
