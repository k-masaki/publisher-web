# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'publisher'
set :repo_url, 'git@github.com:k-masaki/publisher-web.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/publisher'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/assets}

# Default value for default_env is {}
set :default_env, {
  rbenv_root: '/usr/local/rbenv',
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

namespace :bower do
  desc 'Install Bower'
  task :install do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bundle, 'exec', 'rake', 'bower:install'
      end
    end
  end
end

after 'bundler:install', 'bower:install'
after 'deploy', 'deploy:restart'
