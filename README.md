# Rapsap Ops

Store operations app for Rapsap: daily checklist with photo proof, store-manager review, section reports, DSR upload, chat and notifications. Ships first as a PWA (Flutter Web), then Android and iOS from the same code.

## Setup

```bash
flutter pub get
cp env/example.json env/env.json   # real env files are git-ignored
make gen                            # l10n + build_runner (freezed, json, injectable, flutter_gen)
```

`env/env.json` keys: `BASE_URL`, `WS_URL`, `SENTRY_DSN`, `FCM_VAPID_KEY`, `USE_FAKE_API`.
With `USE_FAKE_API: true` the app runs entirely on fake data sources (no backend needed).

## Run

```bash
flutter run -d chrome --dart-define-from-file=env/env.json
```

Fake logins (see `docs/api_pending.md` for every fake rule):

| Number | Signs in as |
| --- | --- |
| `99…` (e.g. 9900000001) | Store manager |
| any other valid number (e.g. 9876543210) | Staff |
| `91…` | "No login found" |

Any 6-digit OTP works except `000000` (wrong code; 5 tries lock the number).

## Build

```bash
make build-web    # build/web; host it with all routes rewritten to index.html
make build-apk
```

Camera and "Add to Home Screen" need HTTPS or `localhost`.

## Quality

```bash
make analyze      # dart format check + flutter analyze (very_good_analysis)
make test
```

## Layout

Clean architecture, feature-first (rules in `CLAUDE.md`):

- `lib/core` — config, DI, network (single `DioClient` + interceptors), errors, router, theme, l10n, services (camera, photo processing, permissions, socket, storage, files), shared widgets.
- `lib/features/<feature>/{data,domain,presentation}` — auth, home, checklist, chat, notifications, profile, settings, review, team, section_reports, dsr.

Docs: `docs/screens.md` (Figma frame → page map), `docs/api_pending.md` (assumed API + fake behaviour).
