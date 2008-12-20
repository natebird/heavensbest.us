#############################################################
#	Application
#############################################################

set :application, "heavensbest"
set :deploy_to, "/home/etandrib/public_html/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true
set :rails_env, "production" 

#############################################################
#	Servers
#############################################################

set :user, "etandrib"
set :password, "hbluc1d1u5"
set :ssh_options, { :forward_agent => true }
set :port, "29000"
set :domain, "www.heavensbest.us"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "master"
# set :scm_user, 'etandrib'
# set :scm_passphrase, "PASSWORD"
set :repository, "git@github.com:etandrib/heavensbest.us.git"
set :deploy_via, :remote_cache

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  desc "Create the database yaml file"
  task :after_update_code do
    db_config = <<-EOF
    production:    
      adapter: mysql
      encoding: utf8
      username: etandrib
      password: sqlluc1d1u5
      database: hb_production
      host: localhost
    EOF
    
    put db_config, "#{release_path}/config/database.yml"
    
    # desc "Symlink the upload directories"
    # task :before_symlink do
    #   run "mkdir -p #{shared_path}/uploads"
    #   run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
    # end
  
  end
    

#############################################################
#	Passenger
#############################################################
    
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  
end
