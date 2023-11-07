files = metadata.rb \
	Policyfile.rb \
	recipes/default.rb \
	recipes/utensiles.rb

Policyfile.lock.json: ${files}
	rm -f Policyfile.lock.json
	./bin/chef-cli install

.DEFAULT: all
all: Policyfile.lock.json

push: Policyfile.lock.json
	./bin/chef-cli push production Policyfile.lock.json

update:
	./bin/chef-cli update
