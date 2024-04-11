test:
	@ bundle exec rspec

install: clear
	@ gem build
	@ gem install --local lean_redux
	@ make clear

uninstall:
	@ yes | gem uninstall lean_redux

clear:
	@ rm -rf ./*.gem
