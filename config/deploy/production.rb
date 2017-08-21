server '13.112.188.200', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/murai/.ssh/id_rsa'
