require 'capistrano/ext/multistage'
require 'bundler/capistrano'

default_run_options[:pty]   = true
ssh_options[:forward_agent] = true

set :application,   "renter_portal"
set :repository,    "git@github.com:primedia/renter_portal.git"

set :build_script,  lambda { "if [ -f Bowerfile ] ; then bundle exec rake bower:install; fi#{' && bundle exec rake assets:precompile' if lambda{stage} != :ci}" }
set :copy_cache,    false # "#{ENV['HOME']}/deploy/#{application}"
set :copy_exclude,  ['.git']
set :deploy_to,     "/var/www/#{application}"
set :deploy_via,    :copy
set :keep_releases, 5
set :scm,           "git"
set :git_enable_submodules, 1
set :stages,        %w(ci)
set :user,          "deploy"
set :use_sudo,      false
set :unicorn_conf, "/var/www/#{application}/shared/system/unicorn.rb"
set :unicorn_pid, "/var/www/#{application}/shared/pids/unicorn.pid"
set :unicorn_old_pid, "/var/www/#{application}/shared/pids/unicorn.pid.oldbin"
set :bundle_without, [:test, :automation, :cucumber, :deployment, :acceptance, :development]
set :ruby_version,  "2.1.1"
set :chruby_config, "/usr/share/chruby/chruby.sh"
set :set_ruby_cmd,  "if [ -f #{chruby_config} ] ; then source #{chruby_config}; chruby #{ruby_version}; fi"
set(:bundle_cmd) {
  "#{set_ruby_cmd} && exec bundle"
}
set :branch, "master"


after 'deploy:setup', :symlink_to_webapp

desc "Symlink application to webapp"
task :symlink_to_webapp, :roles => :web do
  run <<-CMD
    ln -s /var/www/#{application} /var/www/webapp
  CMD
end

namespace :deploy do

  desc "Perform a deploy:setup and deploy:cold"
  task :init do
    transaction do
      deploy.setup
      deploy.cold
    end
  end

  desc "Perform a code update, sanity_check, symlink and migration"
  task :full do
    transaction do
      deploy.update
      primedia.add_version_file
      primedia.symlink_to_env_rb
      primedia.symlink_sitemaps
      sleep(3)
      deploy.stop
      deploy.start
      deploy.cleanup
      primedia.purge_cache
    end
  end

  desc "Start Unicorn"
  task :start, :roles => :app do
    run("/usr/bin/sudo /sbin/service unicorn start")
  end

  desc "Stop Unicorn"
  task :stop, :roles => :app do
    run("/usr/bin/sudo /sbin/service unicorn stop")
  end

  desc "Restart Unicorn"
  task :restart, :roles => :app do
    run("/usr/bin/sudo /sbin/service unicorn restart")
  end
end

namespace :primedia do

  desc "Put the version that was deployed into Rails.root.to_s/VERSION"
  task :add_version_file, :roles => :web do
    run "cd #{current_path} && echo #{branch} > VERSION"
  end

  desc "Symlink env.rb"
  task :"symlink_to_env_rb", :roles => :app do
    run <<-CMD
      ln -fs #{deploy_to}/shared/system/#{rails_env}.rb #{current_path}/config/environments/#{rails_env}.rb
    CMD
  end

  desc "Symlink sitemaps"
  task :symlink_sitemaps, :roles => :app do
    run <<-CMD
      ln -s #{deploy_to}/shared/sitemap/sitemaps #{current_path}/public/sitemaps &&
      ln -s #{deploy_to}/shared/sitemap/sitemap.xml #{current_path}/public/sitemap.xml
    CMD
  end


end
