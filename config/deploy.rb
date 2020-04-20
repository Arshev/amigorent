# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "amigorent"
set :repo_url, "git@github.com:Arshev/amigorent.git"
set :deploy_to, "/home/deployer/#{fetch :application}"

require "whenever/capistrano"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'node_modules', "public/packs"

append :linked_files, "config/database.yml", "config/secrets.yml.key"

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
