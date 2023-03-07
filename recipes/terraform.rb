yum_repository 'hashicorp' do
	baseurl 'https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo'
end

package 'terraform'