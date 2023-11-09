# base system
include_recipe 'base::default'

# workstation configuration
include_recipe 'travalio::utensiles'
include_recipe 'travalio::terraform'
include_recipe 'travalio::bureau'
