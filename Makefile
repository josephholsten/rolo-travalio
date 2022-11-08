files = metadata.rb \
	Policyfile.rb \
	recipes/default.rb \
	recipes/utensiles.rb

Policyfile.lock.json: ${files}
	rm -f Policyfile.lock.json
	chef install

.DEFAULT: all
all: Policyfile.lock.json

push: Policyfile.lock.json
	chef push production Policyfile.lock.json
