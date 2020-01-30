# scripts to rule them all
bootstrap:
	# assumptions:
	# - a ruby environment
	echo "2.4" > .ruby-version
	gem install bundler
	bundle install
setup: bootstrap
update: bootstrap
server:
	bundle exec middleman server
test: cibuild
cibuild:
	bundle exec middleman build
console: server
deploy: test
	bundle exec middleman deploy
	git add . --all 
	git ci -a 
	git push --all