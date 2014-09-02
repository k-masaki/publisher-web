set :rails_env, :production
set :password, ask('Server password:', nil)

server 'singleton.live-on.net',
  user: 'k-masaki',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true,
    auth_methods: %w(password),
    password: fetch(:password)
  }
