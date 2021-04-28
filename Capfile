require "capistrano/setup"

require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/rails"
require "capistrano/passenger"
require 'capistrano/rails/console'
require 'capistrano/sitemap_generator'
require "whenever/capistrano"
require 'capistrano/npm'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

set :rbenv_type, :user
set :rbenv_ruby, '2.6.6'
