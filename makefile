pub-get:
	@melos bootstrap

build-runner: 
	@melos build-domain
	@melos build-data
	@melos build-resources
	@melos gen-strings

run:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor)