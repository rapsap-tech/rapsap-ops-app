.PHONY: gen run run-staging build-web build-apk analyze test test-live

gen:
	flutter gen-l10n
	dart run build_runner build --delete-conflicting-outputs

run:
	flutter run --dart-define-from-file=env/env.json

run-staging:
	flutter run --dart-define-from-file=env/staging.json

build-web:
	flutter build web --release --dart-define-from-file=env/env.json

build-apk:
	flutter build apk --release --dart-define-from-file=env/env.json

analyze:
	dart format --set-exit-if-changed lib test
	flutter analyze

test:
	flutter test

test-live:
	flutter test test/live --dart-define-from-file=env/staging.json \
		--dart-define=STAGING_PHONE=$(STAGING_PHONE) \
		--dart-define=STAGING_OTP=$(STAGING_OTP)
