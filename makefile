denied:
	cd scripts && chmod +x pre-bootstrap.sh

pre-bootstrap:
	cd scripts && ./pre-bootstrap.sh
	fvm install 3.13.6
	fvm use 3.13.6 --force
	fvm flutter --version

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