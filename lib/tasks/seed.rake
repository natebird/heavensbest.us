namespace :db do
  desc 'Load an initial set of data'
  task :seed => :environment do
    Rake::Task["db:seed"].invoke
  end
end