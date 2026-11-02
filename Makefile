.PHONY: gen run build-web build-apk analyze test

gen:
	flutter gen-l10n
	dart run build_runner build --delete-conflicting-outputs

run:
	flutter run --dart-define-from-file=env/env.json

build-web:
	flutter build web --release --dart-define-from-file=env/env.json

build-apk:
	flutter build apk --release --dart-define-from-file=env/env.json

analyze:
	dart format --set-exit-if-changed lib test
	flutter analyze

test:
	flutter test
