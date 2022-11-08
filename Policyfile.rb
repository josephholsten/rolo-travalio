name 'travalio'

default_source :supermarket

run_list 'travalio::default'

cookbook 'travalio', path: '.'
cookbook 'base', git: 'https://github.com/josephholsten/role-base.git'
cookbook 'chef_client_updater', '~> 3.12.3', :supermarket
