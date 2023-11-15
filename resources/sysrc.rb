unified_mode true

provides :sysrc

property :name
property :value, String, default: 'YES'

# property :jail, String, desired_state: false
# property :root, String, desired_state: false
# property :file, String, desired_state: false

action :add do
  command = [ "sysrc" ]
  # command += [ '-f', new_resource.file ] if new_resource.file
  # command += [ '-j', new_resource.jail ] if new_resource.jail
  # command += [ '-R', new_resource.root ] if new_resource.root
  command += [ "#{new_resource.name}=#{new_resource.value}" ]

  converge_if_changed :value do
    shell_out!(command)
  end
end

action :delete do
  command = [ "sysrc" ]
  # command += [ '-f', new_resource.file ] if new_resource.file
  # command += [ '-j', new_resource.jail ] if new_resource.jail
  # command += [ '-R', new_resource.root ] if new_resource.root
  command += [ '-x', new_resource.name ]

  if current_resource
    converge_by "delete #{current_resource.identity}" do
      shell_out!(command)
    end
  end
end

load_current_value do |_new_resource|
  command = [ 'sysrc' ]
  command += [ '-n' ] # value
  command += [ @name ]

  cmd = shell_out(command)
  if cmd.error?
    current_value_does_not_exist!
  else
    _new_resource.value = cmd.stdout
  end
end

## Test cases
## absent
## 
## empty
## other
## same
