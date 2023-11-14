unified_mode true

provides :sysrc

property :name
property :value, [String], default: 'YES'

# property :jail, String, desired_state: false
# property :root, String, desired_state: false
# property :file, String, desired_state: false

action :add do
  command = [ "sysrc" ]
  # command += [ '-f', new_resource.file ] if new_resource.file
  # command += [ '-j', new_resource.jail ] if new_resource.jail
  # command += [ '-R', new_resource.root ] if new_resource.root
  command += "#{new_resource.name}=\"#{value}\""

  converge_if_changed :value do
    shell_out!(command)
  end
end

action :delete do
  command = [ "sysrc" ]
  # command += [ '-f', new_resource.file ] if new_resource.file
  # command += [ '-j', new_resource.jail ] if new_resource.jail
  # command += [ '-R', new_resource.root ] if new_resource.root
  command += "#{new_resource.name}="

  converge_if_changed :value do
    shell_out!(command)
  end
end

load_current_value do |_new_resource|
  command = [ 'sysrc' ]
  command += [ '-n' ] # value
  command += [ new_resource.name ]

  values = shell_out!(command)
  _new_resource.value = values.split
end
