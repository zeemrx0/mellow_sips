pub-get:
	@melos bootstrap

build-runner: 
	@melos build-domain
	@melos build-data
	@melos build-resources
	@melos gen-strings

upgrade:
	@melos upgrade-domain
	@melos upgrade-data
	@melos upgrade-resources

run:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) run $(device)

build-android-apk:
	@melos gen-env $(flavor)
	dart run scripts/build.dart $(flavor) build apk $(buildName) $(buildNumber)