# Please install the Engine Yard Capistrano gem
# gem install eycap
require "eycap/recipes"

set :keep_releases, 5
set :application,   'rackapp'
set :repository,    'git://github.com/engineyard/rack-app.git'
set :deploy_to,     "/data/#{application}"
set :deploy_via,    :export
set :monit_group,   "#{application}"
set :scm,           :git
set :git_enable_submodules, 1
# This is the same database name for all environments
set :production_database,'rackapp_production'

set :environment_host, 'localhost'
set :deploy_via, :remote_cache

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:pty] = true # required for svn+ssh:// andf git:// sometimes

# This will execute the Git revision parsing on the *remote* server rather than locally
set :real_revision,                     lambda { source.query_revision(revision) { |cmd| capture(cmd) } }


task :foo do
  role :web, 'ec2-184-72-245-150.compute-1.amazonaws.com'
  role :app, 'ec2-184-72-245-150.compute-1.amazonaws.com'
  role :db,  'ec2-184-72-245-150.compute-1.amazonaws.com', :primary => true
  set :environment_database, Proc.new { production_database }
  set :dbuser,        'deploy'
  set :dbpass,        'krHlMEEa4w'
  set :user,          'deploy'
  set :password,      'krHlMEEa4w'
  set :runner,        'deploy'
  set :rails_env,     'production'
end


# TASKS
# Don't change unless you know what you are doing!

after "deploy", "deploy:cleanup"
