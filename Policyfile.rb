name 'travalio'

default_source :supermarket

run_list 'travalio::default'

cookbook 'travalio', path: '.'
cookbook 'base'
# cookbook 'base', github: 'josephholsten/role-base'
cookbook 'chef_client_updater', '~> 3.12.3', :supermarket
