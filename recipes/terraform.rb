yum_repository 'hashicorp' do
	description 'Hashicorp Stable - $basearch'
	baseurl 'https://rpm.releases.hashicorp.com/RHEL/$releasever/$basearch/stable'
	gpgkey 'https://rpm.releases.hashicorp.com/gpg'
	gpgcheck true
	enabled true
end

package 'terraform'