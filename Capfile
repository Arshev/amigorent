require 'capistrano/setup'

require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rails/console'
require 'capistrano/sitemap_generator'
require 'whenever/capistrano'
# require 'capistrano/npm'
require 'capistrano/delayed_job'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

set :rbenv_type, :user
set :rbenv_ruby, '3.2.1'

# cap stage deploy BRANCH=New
