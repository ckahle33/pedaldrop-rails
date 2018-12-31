set :chruby_ruby, 'ruby-2.6.0'
set :branch, :master
set :ssh_options, {
   keys: %w(~/.ssh/id_rsa),
   forward_agent: true,
   auth_methods: %w(publickey)
 }
#
# The server-based syntax can be used to override options:
# ------------------------------------
server "142.93.95.190", user: "pedaldrop", roles: %w{web app, db}
