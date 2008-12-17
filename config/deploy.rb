set :application, "heavensbest"
set :domain,      "heavensbest.us"
set :use_sudo,    false
set :deploy_to,   "/home/etandrib/public_html/#{application}"

default_run_options[:pty] = true
set :scm,         "git"
# set :scm_passphrase, "luc1datr2yu3" #This is your custom users password
set :repository,  "git@github.com:etandrib/heavensbest.us.git"
set :branch,      "master"
set :deploy_via, :remote_cache
 
 
set :user,        "etandrib"
set :ssh_options, { :forward_agent => true }
set :port,        "29000"
 
role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :db do
  desc "Add seed data"
  task :seed, :roles => :environment do
    Rake::Task["db:seed"].invoke
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
 
end
