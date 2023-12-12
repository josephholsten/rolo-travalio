# travalio::1password

case node[:platform]
when 'redhat', 'centos', 'oracle'
  # https://developer.1password.com/docs/cli/get-started/
  yum_repository '1password' do
  	description '1Password Stable Channel - $basearch'
  	baseurl 'https://downloads.1password.com/linux/rpm/stable/$basearch'
  	gpgkey 'https://downloads.1password.com/linux/keys/1password.asc'
  	gpgcheck true
  	enabled true
  end
  package '1password-cli'
when 'debian'
  # https://developer.1password.com/docs/cli/get-started/
  # curl -sS https://downloads.1password.com/linux/keys/1password.asc | 
  #   gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
  # echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
  #   tee /etc/apt/sources.list.d/1password.list
  # mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  # curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
  #   tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
  # mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  # curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
  #   gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  # package_name '1password-cli'
when 'freebsd'
  package '1password-client2'
else
  # Not supported
end
