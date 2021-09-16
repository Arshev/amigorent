# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

require "capistrano-db-tasks"

set :application, "amigorent"
set :repo_url, "git@github.com:Arshev/amigorent.git"
set :deploy_to, "/home/deployer/#{fetch :application}"

set :use_sudo, true #try fix Cleaning stale instance directory /tmp/passenger.fvb84h1 01     Warning: Operation not permitted @ rb_file_chown

# if you want to remove the local dump file after loading
set :db_local_clean, true

# if you want to remove the dump file from the server after downloading
set :db_remote_clean, false

# configure location where the dump file should be created
set :db_dump_dir, -> { File.join(current_path, "db") }

# if you prefer bzip2/unbzip2 instead of gzip
set :compressor, :bzip2
# set :npm_flags, '--production' # full log

require "whenever/capistrano"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads", "public/storage", "storage", "node_modules", "public/packs"

append :linked_files, "config/database.yml", "public/sitemap.xml"

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
          execute :rake, "db:seed"
        end
      end
    end
  end
end
