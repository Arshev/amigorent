# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "amigorent"
set :repo_url, "git@github.com:Arshev/amigorent.git"
set :deploy_to, "/home/deployer/#{fetch :application}"
# set :npm_flags, '--production' # full log

require "whenever/capistrano"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'public/storage', 'storage', 'node_modules', "public/packs"

append :linked_files, 'config/database.yml', 'public/sitemap.xml'

set :keep_releases, 5

before "deploy:assets:precompile", "deploy:yarn_install"
namespace :deploy do
  desc "Run rake yarn install"
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install --silent --no-progress --no-audit --no-optional")
      end
    end
  end
end
namespace :deploy do
  task :seed do
    puts "\n=== Seeding Database ===\n"
    on primary :db do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :rake, 'db:seed'
        end
      end
    end
  end
end
